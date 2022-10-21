package pixelimage;

import haxe.io.UInt32Array;
import pixelimage.iter.BoundIterator;
import pixelimage.iter.IteratorRange;
import pixelimage.ImageStruct;
import pixelimage.pixel.Pixel32;
import pixelimage.pixel.Pixel28;
import pixelimage.algo.GeomPix;
import pixelimage.pixel.PixelChannel;
import pixelimage.algo.TriPixel;
import pixelimage.algo.LinePixel;
import pixelimage.algo.CirclePixel;
import pixelimage.algo.PolyPixel;
//import pixelimage.algo.QuadPixel;
import pixelimage.algo.QuadrantPixel;
import pixelimage.algo.RoundRecPixel;

@:transient
abstract Pixelimage( ImageStruct ) from ImageStruct to ImageStruct {
    public var width( get, never ): Int;
    inline function get_width(): Int
       return this.width;
    public var height( get, never ): Int;
    inline function get_height(): Int
        return this.height;
    public function setRelativePosition( x: Int, y: Int, ?update: Bool = false ){
        this.useVirtualPos = true;
        if( x < 0 ) x = 0;
        if( y < 0 ) y = 0;
        this.virtualX = x;
        this.virtualY = y;
        // TODO: update to implement
    }
    public var transparent( get, set ): Bool;
    inline function get_transparent(): Bool
        return this.transparent;
    inline function set_transparent( v: Bool ): Bool {
        this.transparent = v;
        return v;
    }
    inline
    public function new( w: Int, h: Int ){
       this = ( 
        { width:  w, height: h
        , image:  new haxe.io.UInt32Array( Std.int( w * h  ) ) 
        }: ImageStruct
        );
    }
    inline
    function pos4( x: Int, y: Int, ?off: Int = 0 ): Int
        return Std.int( position( x, y ) * 4 ) + off; 
    inline 
    public function position( x: Int, y: Int ){
        return ( this.useVirtualPos )? /* allows off set position when drawing */
            Std.int( ( y - this.virtualY ) * this.width + x - this.virtualX ):
            Std.int( y * this.width + x );
    }
    inline 
    function view8():js.lib.Uint8Array {
        var dataimg: js.lib.Uint32Array = cast this.image;
        return new js.lib.Uint8Array( dataimg.buffer ); // TODO make more generic
    }
    inline
    public function setARGB( x: Int, y: Int, color: Int ): Int {
        var c = new Pixel32( color );
        if( c.isTransparent() && this.transparent ){
            colorBlend( color, position( x, y ) );
        } else {
            this.image[ position( x, y ) ] = c.transferColor();
        }
        return color;
    }
    inline
    public function getARGB( x: Int, y: Int ): Int {
        var c: Pixel32 = cast this.image[ position( x, y ) ];
        return c.transferColor();
    }
    public inline
    function set_argbPixel( a: Int, r: Int, g: Int, b: Int, location: Int ){
        ( this.transparent && a < 0xFE )? channelBlend( a, r, g, b, location ): 
                                          argbToPixel( a, r, g, b, location );
    }
    public inline 
    function argbToPixel( a: Int, r: Int, g: Int, b: Int, location: Int ){
        this.image[ location ] = ( this.isLittle )? 
            Pixel32.fromChannels( a, b, g, r ): Pixel32.fromChannels( a, r, g, b );
    }
    public inline
    function channelBlend( a: PixelChannel
                          , r: PixelChannel
                          , g: PixelChannel
                          , b: PixelChannel, location: Int ) {
        var old = ( new Pixel32( this.image[ location ] ) ).transferColor();
        var blended = old + Pixel32.fromChannels( a, r, g, b );
        this.image[ location ] = blended.transferColor();
    }
    public inline
    function colorBlend( color: Pixel32, location: Int ){
        var blended = ( new Pixel32( this.image[ location ] ) ).transferColor() + color;
        this.image[ location ] = blended.transferColor();
    }
    inline public
    function getPixelString( x: Int, y: Int ): String
        return ( new Pixel32( getARGB( x, y ) ) ).stringHash();

    inline public 
    function simpleRect( x: Float, y: Float
                       , w: Float, h: Float
                       , color: Int ){
        var p = Std.int( x );
        var xx = p;
        var q = Std.int( y );
        var maxX = Std.int( x + w );
        var maxY = Std.int( y + h );
        while( true ){
            setARGB( p++, q, color );
            if( p > maxX ){
                p = xx;
                q++;
            } 
            if( q > maxY ) break;
        }
    }
    public inline
    function fillSquare( x: Float, y: Float
                       , d: Float
                       , color: Int ) {
        simpleRect( x-d/2, y-d/2, d, d, color );
    }
    public inline
    function fillTri( ax: Float, ay: Float
                    , bx: Float, by: Float
                    , cx: Float, cy: Float
                    , color: Pixel32 ){
        var adjustWinding = ( (ax * by - bx * ay) + (bx * cy - cx * by) + (cx * ay - ax * cy) )>0;
        if( !adjustWinding ){// TODO: this is inverse of cornerContour needs thought, but provides required protection
            // swap b and c
            // probably wrong way as y is down?
            var bx_ = bx;
            var by_ = by;
            bx = cx;
            by = cy;
            cx = bx_;
            cy = by_;
        }
        fillTriUnsafe( this, ax, ay, bx, by, cx, cy, color );
    }
    public inline
    function fillQuad( ax: Float, ay: Float
                     , bx: Float, by: Float
                     , cx: Float, cy: Float
                     , dx: Float, dy: Float 
                     , color: Int ){
        // tri e - a b d
        // tri f - b c d
        fillTri( ax, ay, bx, by, dx, dy, color );
        fillTri( bx, by, cx, cy, dx, dy, color );
    }
    public inline
    function fillGradTri( ax: Float, ay: Float, colA: Pixel32
                            , bx: Float, by: Float, colB: Pixel32
                            , cx: Float, cy: Float, colC: Pixel32 ){
        fillGradTriangle( this, ax, ay, colA, bx, by, colB, cx, cy, colC );
    }
    public inline 
    function fillGradRect( x:   Float, y: Float
                         , wid: Float, hi: Float
                         , colorA: Pixel32, colorB: Pixel32, colorC: Pixel32, colorD: Pixel32 ){
        var bx = x + wid;
        var cy = y + hi;
        fillGradQuad( x,  y,  colorA
                    , bx, y,  colorB
                    , bx, cy, colorC
                    , x,  cy, colorD );
    }
    public inline
    function fillGradQuad( ax: Float, ay: Float, colorA: Pixel32
                         , bx: Float, by: Float, colorB: Pixel32
                         , cx: Float, cy: Float, colorC: Pixel32 
                         , dx: Float, dy: Float, colorD: Pixel32 ){
        // tri e - a b d
        // tri f - b c d
        fillGradTri( ax, ay, colorA, bx, by, colorB, dx, dy, colorD );
        fillGradTri( bx, by, colorB, cx, cy, colorC, dx, dy, colorD );
    }
    public inline 
    function fillLine( px: Float, py: Float, qx: Float, qy: Float
                     , thick: Float, color: Int, ?debugCorners = false ){
        var o = qy-py;
        var a = qx-py;
        var h = Math.pow( o*o + a*a, 0.5 );
        var theta = Math.atan2( o, a );
        rotateLine( this, px, py, thick, h, theta, color, debugCorners );
    }
    public inline 
    function fillGradLine( px: Float, py: Float, qx: Float, qy: Float
                         , thick: Float
                         , colorA: Pixel32, colorB: Pixel32, colorC: Pixel32, colorD: Pixel32
                         , ?debugCorners = false ){
        var o = qy-py;
        var a = qx-py;
        var h = Math.pow( o*o + a*a, 0.5 );
        var theta = Math.atan2( o, a );
        rotateGradLine( this, px, py, thick, h, theta, colorA, colorB, colorC, colorD, debugCorners );
    }
    // setup so large ellipses automatically use more sides.
    public inline
    function fillEllipseTri( cx: Float, cy: Float
                           , rx: Float, ry: Float
                           , color: Int, ?phi: Float = 0, ?printSides: Bool = false, ?targetError: Float = 1.05 ){
        var rSmall = ( rx > ry )? ry: rx;
        var noSides = circleError( rSmall, targetError );
        if( printSides ) trace( noSides );
        fillPolyBuild( cx, cy, rx, ry, color, phi, noSides );
    }
    
    /**
     * fillQuadrant draws a quarter arc.
     * 
     **/
    inline public
    function fillQuadrant( cx: Float, cy: Float
                         , rx: Float, ry: Float
                         , startAngle: Float 
                         , color:  Int, ?phi:   Float, ?targetError: Float = 1.05 ){
        solidQuadrant( this, cx, cy, rx, ry, startAngle, color, phi, targetError );
    }
    // phi controls rotation
    // cornerUp is to rotate the structure before phi so top is flat.
    inline public
    function fillPolyBuild( cx: Float,  cy: Float
                          , rx: Float,  ry: Float
                          , color: Int, ?phi: Float = 0.
                          , ?sides: Int = 36, cornerUp: Bool = true ){
        fillPolygonBuild( this, cx, cy, rx, ry, color, phi, sides, cornerUp );
    }

    #if js
    inline
    public function drawToContext( ctx: js.html.CanvasRenderingContext2D, x: Int, y: Int  ){
        var data = new js.lib.Uint8ClampedArray( view8().buffer );
        var imageData = new js.html.ImageData( data, this.width, this.height );
        ( this.useVirtualPos )? 
            ctx.putImageData( imageData, x - this.virtualX, y - this.virtualY ):
            ctx.putImageData( imageData, x, y);
    }
    inline
    public function drawFromContext( ctx: js.html.CanvasRenderingContext2D, x: Int, y: Int ){
        var imageData = ( this.useVirtualPos )?
            ctx.getImageData( x + this.virtualX, y + this.virtualY, this.width, this.height):
            ctx.getImageData( x, y, this.width, this.height);
        var data = imageData.data;
        var temp = new js.lib.Uint32Array( data.buffer );
        this.image = cast temp;
    }
    #end

    // maybe remove
    /*
    inline public
    function getRGBString( x: Int, y: Int ): String
        return ( new Pixel28( getIrgb( x, y ) ) ).stringHash();
    inline
    public function setIalpha( x: Int, y: Int, alpha: Int )
        view8()[ pos4( x, y, 0 ) ] = alpha;    
    inline
    public function getIalpha( x: Int, y: Int ): Int
        return view8()[ pos4( x, y, 0 )];
    inline
    public function setIrgb( x: Int, y: Int, rgb: Int ){
        var a = getIalpha( x, y );
        // abgr
        this.image[ position( x, y ) ] = ( a << 24 | new Pixel32( rgb ) ).transferColor();   
    }
    inline
    public function getIrgb( x: Int, y: Int ): Int {
        var c = this.image[ position( x, y ) ];
        return new Pixel32( c ).rgbFromCanvas(); // rgb
    }
    */

}
// references
// http://totologic.blogspot.com/2014/01/accurate-point-in-triangle-test.html
// https://codeplea.com/triangular-interpolation *
// https://gamedev.stackexchange.com/questions/23743/whats-the-most-efficient-way-to-find-barycentric-coordinates    
// https://stackoverflow.com/questions/39213661/canvas-using-uint32array-wrong-colors-are-being-rendered
// https://stackoverflow.com/questions/26513712/algorithm-for-coloring-a-triangle-by-vertex-color
// https://iquilezles.org/articles/ibilinear/ - todo add MIT details if quad runs.
// https://www.shadertoy.com/view/lsBSDm
// https://math.stackexchange.com/questions/4132060/compute-number-of-regular-polgy-sides-to-approximate-circle-to-defined-precision
// //http://paulbourke.net/miscellaneous/composite/
