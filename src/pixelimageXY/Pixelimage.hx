package pixelimageXY;

import vision.ds.Image;
import haxe.io.UInt32Array;

import pixelimageXY.iter.BoundIterator;
import pixelimageXY.iter.IteratorRange;
import pixelimageXY.ImageStruct;
import pixelimageXY.pixel.Pixel32;
import pixelimageXY.pixel.Pixel28;
import pixelimageXY.algo.GeomPix;
import pixelimageXY.pixel.PixelChannel;
import iterMagic.IteratorRangeXY;
//import pixelimageXY.algo.TriPixel;
//import pixelimageXY.algo.LinePixel;
//import pixelimageXY.algo.CirclePixel;

//import pixelimageXY.algo.PolyPixel;
//import pixelimageXY.algo.QuadPixel;
//import pixelimageXY.algo.QuadrantPixel;
//import pixelimageXY.algo.RoundRecPixel;
//import pixelimageXY.algo.RectanglePixel;

import pixelimageXY.algo.HitTri;
import pixelimageXY.algo.HitQuad;
import pixelimageXY.algo.HitTriArray;
//import pixelimageXY.algo.QuadPixel;
//import pixelimageXY.algo.ArrowPixel;

@:transient
abstract Pixelimage( ImageStruct ) from ImageStruct to ImageStruct {
    /**
        provides the width used by the UInt32Array
    **/
    public var width( get, never ): Int;
    inline function get_width(): Int
       return this.width;
    /**
        provides the height used by the UInt32Array
    **/
    public var height( get, never ): Int;
    inline function get_height(): Int
        return this.height;
    /**
        setting relative position provide a drawing offset, it must be positive
        update is no currentl use yet
    **/
    public function setRelativePosition( x: Int, y: Int, ?update: Bool = false ){
        this.useVirtualPos = true;
        if( x < 0 ) x = 0;
        if( y < 0 ) y = 0;
        this.virtualX = x;
        this.virtualY = y;
        // TODO: update to implement
    }
    /**
        transparent to false will allow setARGB to overwrite pixels, true will alpha blend them when new pixel is semi transparent
    **/
    public var transparent( get, set ): Bool;
    inline function get_transparent(): Bool
        return this.transparent;
    inline function set_transparent( v: Bool ): Bool {
        this.transparent = v;
        return v;
    }
    public var mask( get, set ): Pixelimage;
    inline function get_mask(): Pixelimage
        return this.mask;
    inline function set_mask( v: Pixelimage ): Pixelimage {
        this.useMask = true;
        this.mask = v;
        return v;
    }
    public var image( get, never ): UInt32Array;
    inline function get_image():  UInt32Array
        return this.image;
    /*
    inline function set_image( v:  UInt32Array ):  UInt32Array {
        this.image = v;
        return v;
    }
    */
    public var hasMask( get, set ): Bool;
    inline function set_hasMask( v: Bool ): Bool {
        if( this.mask == null && v == true ){
            this.mask = new Pixelimage( this.width, this.height );
            this.mask.transparent = false;
            // set mask intially to let all images through
            this.mask.simpleRect( 0, 0, this.width, this.height, 0x00000000 );
        }
        this.useMask = v;
        return v;
    }
    inline function get_hasMask(): Bool
        return this.useMask;
    var rectWindow( get, set ): RectangleWindow;
    inline function get_rectWindow(): RectangleWindow {
        return { x: 0, y: 0, width: width, height: height };
    }
    @:access( pixelImage.ImageStruct )
    inline function set_rectWindow( r: RectangleWindow ): RectangleWindow {
        if( r.x != 0. ) throw 'rectangle window must have x = 0';
        if( r.y != 0. ) throw 'rectangle window must have y = 0';
        if( r.width == width && r.height == height ){
            // do nothing!
        } else {
            var sx = Std.int( r.width/width );
            var sy = Std.int( r.height/height );
            var pixelImage = scaleXY( sx, sy, transparent, false );
            this.image = pixelImage.image;
            this.width = pixelImage.width;
            this.height = pixelImage.height;
            if( mask != null ) mask.rectWindow = r;
        }
        return r;
    }
    inline
    public function new( w: Int, h: Int ){
       this = ( 
        { width:  w, height: h
        , image:  new haxe.io.UInt32Array( Std.int( w * h  ) ) 
        }: ImageStruct
        );
    }

    /**
        this provides a location for a UIn8 access of a color channel
    **/
    inline
    function pos4( x: Int, y: Int, ?off: Int = 0 ): Int
        return Std.int( position( x, y ) * 4 ) + off; 
    /**
        provides the location of the pixel after considering any relative internal x,y offset
    **/
    inline 
    public function position( x: Int, y: Int ){
        return ( this.useVirtualPos )? /* allows off set position when drawing */
            Std.int( ( y - this.virtualY ) * this.width + x - this.virtualX ):
            Std.int( y * this.width + x );
    }
    /**
        Provides a view for single color channel access, not usually used
    **/
    #if js
    inline 
    function view8():js.lib.Uint8Array {
        var dataimg: js.lib.Uint32Array = cast this.image;
        return new js.lib.Uint8Array( dataimg.buffer ); // TODO make more generic
    }
    #elseif
    /*
    class Test {
  static function main() {
    var d32 = new haxe.io.UInt32Array( 1*2 );
    d32.set( 0, 0xFF00FC00 );
    d32.set( 1, 0xFF00FFFB );
    var d8 = haxe.io.UInt8Array.fromBytes( d32.view.buffer );
    for( i in 0...d8.length ){
			trace( '#' + StringTools.hex( d8[i], 2 ) ); // BGRA
    }
    Test.hx:8: #00
Test.hx:8: #FC
Test.hx:8: #00
Test.hx:8: #FF
Test.hx:8: #FB
Test.hx:8: #FF
Test.hx:8: #00
Test.hx:8: #FF
  }
}*/
    inline 
    function view8():haxe.io.UInt8Array {
        return UInt8Array.fromBytes( this.image.view.buffer );// reverses order
    }
    #end
    inline
    public function setPixel( x: Int, y: Int, color: Int ): Int {
        return setARGB( x, y, color );
    }
    inline
    public function zeroPixel( x: Int, y: Int ){
        this.image[ position( x, y ) ] = 0;
    }
    /**
        The main way is set the pixel color at x, y
        applies an alpha blend if pixel is semi-transparent and if the pixelimage is transparent true
    **/
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
    public function getPixel( x: Int, y: Int ): Int {
        return getARGB( x, y );
    }
    /**
        returns the current pixel colour, since canvas context is ABGR on little endian this will correct
        from the internal value
    **/
    inline
    public function getARGB( x: Int, y: Int ): Pixel32 {
        var c: Pixel32 = cast this.image[ position( x, y ) ];
        return c.transferColor();
    }
    /**
        allows setting all 4 colour channels with a location
        @:see position   to obtain the location
    **/
    public inline
    function set_argbPixel( a: Int, r: Int, g: Int, b: Int, location: Int ){
        ( this.transparent && a < 0xFE )? channelBlend( a, r, g, b, location ): 
                                          argbToPixel( a, r, g, b, location );
    }
    /**
        used more internally to set colours from algorithms does not apply alpha blend
    **/
    public inline 
    function argbToPixel( a: Int, r: Int, g: Int, b: Int, location: Int ){
        this.image[ location ] = ( this.isLittle )? 
            Pixel32.fromChannels( a, b, g, r ): Pixel32.fromChannels( a, r, g, b );
    }
    /**
        used internally is set colours from algorithms only applies alpha blend
        @see setARGB
    **/
    public inline
    function channelBlend( a: PixelChannel
                          , r: PixelChannel
                          , g: PixelChannel
                          , b: PixelChannel, location: Int ) {
        var old = ( new Pixel32( this.image[ location ] ) ).transferColor();
        var blended = old + Pixel32.fromChannels( a, r, g, b );
        this.image[ location ] = blended.transferColor();
    }
    /**
        used internally to set colours from algorithms only applies 
        @see setARGB
    **/
    public inline
    function colorBlend( color: Pixel32, location: Int ){
        var blended = ( new Pixel32( this.image[ location ] ) ).transferColor() + color;
        this.image[ location ] = blended.transferColor();
    }
    /**
        mainly used for color debugging provides getARGB in hex string format
    **/
    inline public
    function getPixelString( x: Int, y: Int ): String
        return ( new Pixel32( getARGB( x, y ) ) ).stringHash();
    /**
        provides a simple filled Rectangle
    **/
    inline public 
    function simpleRect( x: Float, y: Float
                       , w: Float, h: Float
                       , color: Int ){
        var range: IteratorRangeXY = { x: Std.int( x ), y: Std.int( y ), w: Std.int( w ), h: Std.int( h ) };
        for( i in range ) setARGB( range.x, range.y, color );
        /*
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
        */
    }
    inline public 
    function clearRect( x: Float, y: Float
                       , w: Float, h: Float ){
        var range: IteratorRangeXY = { x: Std.int( x ), y: Std.int( y ), w: Std.int( w ), h: Std.int( h ) };
        for( i in range ) this.image[ position( range.x, range.y ) ] = 0;
        /*
        var p = Std.int( x );
        var xx = p;
        var q = Std.int( y );
        var maxX = Std.int( x + w );
        var maxY = Std.int( y + h );
        while( true ){
            this.image[ position( p++, q ) ] = 0;
            if( p > maxX ){
                p = xx;
                q++;
            } 
            if( q > maxY ) break;
        }
        */
    }
    /**
        creates a new Pixelimage that is flipped horizonally.
        inPlace overwrites current.
    **/
    inline public
    function flippedX( x: Float, y: Float
                  , w: Float, h: Float
                  , transparent: Bool = false
                  , inPlace: Bool = false, includeMask: Bool = false ): Pixelimage {
        return pixelimageXY.transformation.FlipImage
            .imageflipX( abstract, x, y, w, h, transparent, inPlace, includeMask );
    }
    /**
        creates a new Pixelimage that is flipped vertically.
        inPlace overwrites current.
    **/
    inline public
    function flippedY( x: Float, y: Float, w: Float, h: Float
                     , transparent: Bool = false
                     , inPlace: Bool = false, includeMask: Bool = false ): Pixelimage {
        return pixelimageXY.transformation.FlipImage
            .imageflipY( abstract, x, y, w, h, transparent, inPlace, includeMask );
    }
    /**
        creates a new Pixelimage base on current image, rotated 90° clockwise
    **/
    inline public
    function spunClock90( x: Float, y: Float, w: Float, h: Float
                         , transparent: Bool = false, includeMask: Bool = false ): Pixelimage {
        return pixelimageXY.transformation.SpinImage
            .spinClock90( abstract, x, y, w, h, transparent, includeMask );
    }
    inline public
    function spunAntiClock90( x: Float, y: Float, w: Float, h: Float
                  , transparent: Bool = false, includeMask: Bool = false ): Pixelimage {
        return pixelimageXY.transformation.SpinImage
            .spinAntiClock90( abstract, x, y, w, h, transparent, includeMask );
    }
    inline public
    function spun180( x: Float, y: Float, w: Float, h: Float
                  , transparent: Bool = false, includeMask: Bool = false ): Pixelimage {
        return pixelimageXY.transformation.SpinImage
            .spin180( abstract, x, y, w, h, transparent, includeMask );
    }
    inline public
    function scaleXY( sx: Float, sy: Float
                    , transparent = false, includeMask: Bool = false ): Pixelimage {
        return pixelimageXY.transformation.ScaleImage
            .scalingXY( abstract, sx, sy, transparent, includeMask );
    }
    inline public
    function rotateClockwiseDegrees( angle: Float, centreX = 0., centreY = 0.
                                   , transparent: Bool = false, includeMask: Bool = false ){

        return pixelimageXY.transformation.SpinImage
            .rotatingClockwiseDegrees( abstract, angle, centreX, centreY, transparent, includeMask );
    }
    inline public
    function rotateClockwiseRadians( theta: Float, centreX = 0., centreY = 0.
                                   , transparent: Bool = false, includeMask: Bool = false ){
        return pixelimageXY.transformation.SpinImage
            .rotatingClockwiseRadians( abstract, theta, centreX, centreY, transparent, includeMask );
    }

    public inline
    function rotate( theta: Float, centreX = 0., centreY = 0.
                   , transparent: Bool = false, includeMask: Bool = false ){       
        return pixelimageXY.transformation.SpinImage
            .rotating( abstract, theta, centreX, centreY, transparent, includeMask );   
    }
    inline public
    function scaleUpInt( scaleW: Int = 2, scaleH: Int = 2
                       , transparent: Bool = false, includeMask: Bool = false ): Pixelimage {
        return pixelimageXY.transformation.ScaleImage
            .scaleUpInteger( abstract, scaleW, scaleH, transparent, includeMask );
    }
    inline public 
    function patternRect( x: Float, y: Float
                        , w: Float, h: Float
                        , foreColor: Int, backColor: Int
                        , patternFill: Array<Bool> ){
        return pixelimageXY.transformation.BinaryPatternFill
            .patternRectangle( abstract, x, y, w, h, foreColor, backColor, patternFill );
    }
    inline public 
    function patternRectDown( x: Float, y: Float
                            , w: Float, h: Float
                            , foreColor: Int, backColor: Int
                            , patternFill: Array<Bool> ){
        return pixelimageXY.transformation.BinaryPatternFill
            .patternRectangleDown( abstract, x, y, w, h, foreColor, backColor, patternFill );
    }
    /**
        provides a simple filled square a short cut 
        @see simpleRect
    **/
    public inline
    function fillSquare( x: Float, y: Float
                       , d: Float
                       , color: Int ) {
        simpleRect( x-d/2, y-d/2, d, d, color );
    }
    /**
        provides a filled triangle give a,b,c coordinates
        automagically rearranges coordinates so it always renders
    **/
    public inline
    function fillTri( ax: Float, ay: Float
                    , bx: Float, by: Float
                    , cx: Float, cy: Float
                    , color: Pixel32
                    , hasHit: Bool = false
                    , hasUndo: Bool = false ): Null<HitTri> {
        return pixelimageXY.algo.TriPixel
            .fillTriangle( this, ax, ay, bx, by, cx, cy, color, hasHit, hasUndo );
    }
    public inline
    function tileTri( ax: Float, ay: Float
                    , bx: Float, by: Float
                    , cx: Float, cy: Float
                    , tileImage: Pixelimage
                    , hasHit: Bool = false ): Null<HitTri> {
        return pixelimageXY.algo.TriPixel
            .tileTriangle( this, ax, ay, bx, by, cx, cy, tileImage, hasHit );
    }
    /**
        uses two triangles to create a filled quad using four coordinates a,b,c,d arranged clockwise 
    **/
    public inline
    function fillQuad( ax: Float, ay: Float
                     , bx: Float, by: Float
                     , cx: Float, cy: Float
                     , dx: Float, dy: Float 
                     , color: Int
                     , hasHit: Bool = false ): HitQuad {
        // tri e - a b d
        // tri f - b c d
        return pixelimageXY.algo.QuadPixel
            .fillQuadrilateral( this, ax, ay, bx, by, cx, cy, dx, dy, color, hasHit );
    }
    public inline
    function tileQuad( ax: Float, ay: Float
                     , bx: Float, by: Float
                     , cx: Float, cy: Float
                     , dx: Float, dy: Float 
                     , tileImage: Pixelimage
                     , hasHit: Bool = false ): HitQuad {
        // tri e - a b d
        // tri f - b c d
        return pixelimageXY.algo.QuadPixel
            .tileQuadrilateral( this, ax, ay, bx, by, cx, cy, dx, dy, tileImage, hasHit );
    }
    /**
        creates a filled gradient triangle in OpenGL 3 color style for coordinates a,b,c
        with respective colors after coordinate pairs
    **/
    public inline
    function fillGradTri( ax: Float, ay: Float, colA: Pixel32
                        , bx: Float, by: Float, colB: Pixel32
                        , cx: Float, cy: Float, colC: Pixel32
                        , hasHit: Bool = true ): Null<HitTri> {
        return pixelimageXY.algo.TriPixel
            .fillGradTriangle( this, ax, ay, colA, bx, by, colB, cx, cy, colC );
    }
    // Not so useful on own as uv are weird.
    public inline
    function imgTri( texture: Pixelimage, win: RectangleWindow, ax: Float, ay: Float, au: Float, av: Float
                      , bx: Float, by: Float, bu: Float, bv: Float
                      , cx: Float, cy: Float, cu: Float, cv: Float
                     , hasHit: Bool = true ): Null<HitTri> {
        return pixelimageXY.algo.TriPixel
            .uvTriangle( this, texture, win, ax, ay, au, av, bx, by, bu, bv, cx, cy, cu, cv );
    }
    public inline 
    function tileRect( x:   Float, y: Float
                     , wid: Float, hi: Float
                     , tileImage: Pixelimage
                     , hasHit: Bool = false ): HitQuad {
        var bx = x + wid;
        var cy = y + hi;
        return tileQuad( x,  y, bx, y, bx, cy, x,  cy, tileImage, hasHit );
    }
    /**
        uses two triangles to form rectangle x,y,width,height with a,b,c,d clockwise gradient colours
    **/
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
        return { ax: x, ay: y, bx: bx, y: y, cx: bx, cy: cy, x: x, dy: cy };
    }
    /**
        uses two triangle to form a quad with clockwise coordinates a,b,c,d
        with respective colours after each coordinate pair

        a better render maybe possible see commented out code in algo.QuadPixel and lerp code in algo.GeomPixel
        ( better render approach compiles but does not yet work, maybe easy? ). 
    **/
    public inline
    function fillGradQuad( ax: Float, ay: Float, colorA: Pixel32
                         , bx: Float, by: Float, colorB: Pixel32
                         , cx: Float, cy: Float, colorC: Pixel32 
                         , dx: Float, dy: Float, colorD: Pixel32
                         , hasHit: Bool = true ): Null<HitQuad> {
        // tri e - a b d
        // tri f - b c d
        return pixelimageXY.algo.QuadPixel
            .fillGradQuadrilateral( this, ax, ay, colorA, bx, by, colorB, cx, cy, colorC, dx, dy, colorD, hasHit );
    }
    public inline
    function imgQuad( texture: Pixelimage, win: RectangleWindow
                    , ax: Float, ay: Float
                    , bx: Float, by: Float
                    , cx: Float, cy: Float
                    , dx: Float, dy: Float
                    , hasHit: Bool = true ): Null<HitQuad> {
        return pixelimageXY.algo.QuadPixel
            .imgQuadrilateral( this, texture, win, ax, ay, bx, by, cx, cy, dx, dy, hasHit );
    }
    public inline
    function imgRect( texture: Pixelimage, win: RectangleWindow
                      , x: Float, y: Float, wid: Float, hi: Float
                      , theta: Float = 0., centreX: Float = 0., centreY: Float = 0.
                      , skewX: Float = 0., skewY: Float = 0.
                      , scaleX: Float = 1., scaleY: Float = 1.
                      , hasHit: Bool = true ): Null<HitQuad> {
        var ax = x;
        var ay = y;
        if( theta != 0. ){
            centreX = x + wid/2 + centreX;
            centreY = y + hi/2  + centreY;
            ax -= centreX;
            ay -= centreY;
        }
        var bx = ax + wid;
        var by = ay;
        var cx = bx;
        var cy = ay + hi;
        var dx = ax;
        var dy = cy;
        // skew does not really cope well with offx and offy changes?
        if( skewX != 0. ){
            ax += skewX;
            bx += skewX;
            cx -= skewX;
            dx -= skewX;
        }
        if( skewY != 0. ){
            ay -= skewY;
            dy -= skewY;
            by += skewY;
            cy += skewY;
        }
        if( scaleX != 1 ){
            ax *= scaleX;
            bx *= scaleX;
            cx *= scaleX;
            dx *= scaleX;
        }
        if( scaleY != 1. ){
            ay *= scaleY;
            bx *= scaleY;
            cx *= scaleY;
            dx *= scaleY;
        }
        if( theta != 0 ){
            var sin = Math.sin( theta );
            var cos = Math.cos( theta );
            var temp = ax;
            ax = rotX( temp, ay, sin, cos );
            ay = rotY( temp, ay, sin, cos );
            var temp = bx;
            bx = rotX( temp, by, sin, cos );
            by = rotY( temp, by, sin, cos );
            var temp = cx;
            cx = rotX( temp, cy, sin, cos );
            cy = rotY( temp, cy, sin, cos );
            var temp = dx;
            dx = rotX( temp, dy, sin, cos );
            dy = rotY( temp, dy, sin, cos );
            ax += centreX;
            ay += centreY;
            bx += centreX;
            by += centreY;
            cx += centreX;
            cy += centreY;
            dx += centreX;
            dy += centreY;
        }
        return imgQuad( texture, win, ax, ay, bx, by, cx, cy, dx, dy, hasHit );
    }
    
    public inline
    function imgNineSlice( texture:  Pixelimage, win:   RectangleWindow
                         , x:        Float,      y:     Float
                         , wid:      Float,      hi:    Float
                         , left:     Float,      top:   Float
                         , fat:      Float,      tall:  Float
                         , widNew:    Float,      hiNew:    Float
                         , leftNew:     Float,      topNew:   Float
                         , fatNew:      Float,      tallNew:  Float
                         , hasHit:   Bool = false ): Null<HitQuad>{
        var temp = new Pixelimage( Std.int( wid ), Std.int( hi ) );
        temp.transparent = false;
        var hit: Null<HitQuad> = pixelimageXY.algo.QuadPixel
            .imageNineSlice( temp, texture, win, 0, 0, wid, hi, left, top, fat, tall, widNew, hiNew, leftNew, topNew, fatNew, tallNew,  hasHit );
        putPixelImage( temp, Std.int( x ), Std.int( y ) );
        temp = null;
        if( hit != null ){
            hit.ax += x;
            hit.ay += y;
            hit.bx += x;
            hit.by += y;
            hit.cx += x;
            hit.cy += y;
            hit.dx += x;
            hit.dy += y;
        }
        return hit;
    }
    /**
        provides a thick line using two triangles vector p, q
        debug corners draws coloured squares on the corners for development
    **/
    public inline 
    function fillLine( px: Float, py: Float, qx: Float, qy: Float
                     , thick: Float, color: Int, hasHit: Bool = true, ?debugCorners = false ): Null<HitQuad> {
        var o = qy-py;
        var a = qx-px;
        var h = Math.pow( o*o + a*a, 0.5 );
        var theta = Math.atan2( o, a );
        return pixelimageXY.algo.LinePixel
            .rotateLine( this, px, py, thick, h, theta, color, hasHit, debugCorners );
    }

    /**
        tiles a thick line using two triangles vector p, q
        debug corners draws coloured squares on the corners for development
    **/
    public inline 
    function tileLine( px: Float, py: Float, qx: Float, qy: Float
                     , thick: Float, tileImage: Pixelimage
                     , hasHit: Bool = false, ?debugCorners = false ): Null<HitQuad>{
        var o = qy-py;
        var a = qx-px;
        var h = Math.pow( o*o + a*a, 0.5 );
        var theta = Math.atan2( o, a );
        return pixelimageXY.algo.LinePixel
            .rotateTileLine( this, px, py, thick, h, theta, tileImage, hasHit, debugCorners );
    }
    /**
        provides a thick line using two gradient triangle vector p,q
        the four colors are arranged clockwise a,b,c,d
        debug corners draws coloured squares on the corners for development
    **/
    public inline 
    function fillGradLine( px: Float, py: Float, qx: Float, qy: Float
                         , thick: Float
                         , colorA: Pixel32, colorB: Pixel32, colorC: Pixel32, colorD: Pixel32
                         , hasHit: Bool = false
                         , ?debugCorners = false ): Null<HitQuad>{
        var o = qy-py;
        var a = qx-px;
        var h = Math.pow( o*o + a*a, 0.5 );
        var theta = Math.atan2( o, a );
        return pixelimageXY.algo.LinePixel
            .rotateGradLine( this, px, py, thick, h, theta, colorA, colorB, colorC, colorD, hasHit, debugCorners );
    }

    /**
        used to draw one pixelimage on part of another, essentially it is a copy
        black transparent pixels are ignored.
        this is used also internally so that shapes can be composed with transparent false 
        useful for adding over and taking away parts of shapes before drawing on the main Pixelimage.
    **/
    inline public
    function putPixelImage( pixelImage: Pixelimage, x: Int, y: Int, ?useAvaliableMask = true, forceClear: Bool = false ){
        // ignore useVirtualPos for now.
        // ignore could use one loop for now.
        for( dy in 0...pixelImage.height ){
            for( dx in 0...pixelImage.width ){
                var col = pixelImage.getARGB( dx, dy );
                if( pixelImage.hasMask && useAvaliableMask && pixelImage.mask != null ){
                    var maskPixel = new Pixel32( pixelImage.mask.getARGB( dx, dy ) );
                    col = new Pixel32( col ).maskPixel( maskPixel );
                }
                if( col != 0 ) {
                    setARGB( x + dx, y + dy, col );
                } else {
                    if( forceClear ) this.image[ position( x + dx, y + dy ) ] = 0;
                }
            }
        }
    }
    inline public
    function putPixelImageRect( pixelImage: Pixelimage, x: Int, y: Int, rectLeft: Int, rectTop: Int, rectRight: Int, rectBottom: Int, ?useAvaliableMask = true, forceClear: Bool = false ){
        for( dy in rectTop...rectBottom ){
            for( dx in rectLeft...rectRight ){
                var col = pixelImage.getARGB( dx, dy );
                if( pixelImage.hasMask && useAvaliableMask && pixelImage.mask != null ){
                    var maskPixel = new Pixel32( pixelImage.mask.getARGB( dx, dy ) );
                    col = new Pixel32( col ).maskPixel( maskPixel );
                }
                if( col != 0 ){
                    setARGB( x + dx - rectLeft, y + dy - rectTop, col );
                } else {
                    if( forceClear ) this.image[ position( x + dx - rectLeft, y + dy - rectTop ) ] = 0;
                }
            }
        }
    }
    /**
        Currently library only supports Javascript target and puts the UInt32Array on the canvas context
        hope to add c++ and some toolkits later.
    **/
    #if js
    inline
    public function drawToContext( ctx: js.html.CanvasRenderingContext2D, x: Int, y: Int, ?useAvaliableMask = true  ){
        if( this.useMask && useAvaliableMask && this.mask != null ){
            var temp = new Pixelimage( width, height );
            for( i in 0...this.image.length ){
                var p0 =  new Pixel32( image[ i ] );
                var m1 =  new Pixel32( mask.image[ i ] );
                temp.image[ i ] = p0.maskPixel( m1 );
            }
            var data = new js.lib.Uint8ClampedArray( temp.view8().buffer );
            var imageData = new js.html.ImageData( data, this.width, this.height );
            ( this.useVirtualPos )? 
                ctx.putImageData( imageData, x - this.virtualX, y - this.virtualY ):
                ctx.putImageData( imageData, x, y);
        } else {
            var data = new js.lib.Uint8ClampedArray( view8().buffer );
            var imageData = new js.html.ImageData( data, this.width, this.height );
            ( this.useVirtualPos )? 
                ctx.putImageData( imageData, x - this.virtualX, y - this.virtualY ):
                ctx.putImageData( imageData, x, y);
        }
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
    inline 
    public static function imageElementToPixels( img: js.html.ImageElement, transparent_ = false ): Pixelimage {
        var canvas        = js.Browser.document.createCanvasElement();
        canvas.width      = img.width;
        canvas.height     = img.height;
        canvas.getContext2d().drawImage( img, 0, 0, img.width, img.height );
        var pixelImage    = new Pixelimage( img.width, img.height );
        pixelImage.transparent = transparent_;
        pixelImage.drawFromContext( canvas.getContext2d(), 0, 0 );
        canvas            = null;
        return pixelImage; 
    }
    #end
    inline
    public function transferClone(): Pixelimage {
        var out = new Pixelimage( width, height );
        for( i in 0...image.length ){
            out.image[ i ] = (new Pixel32( image[i] )).flip13();
        }
        return out;
    }
    inline 
    public function transferIn( p: Pixelimage ){
        for( i in 0...p.image.length ){
            image[ i ] = ( new Pixel32( p.image[ i ] ) ).flip13();
        }
    }
    #if js
    inline
    public function getBytes(){
        return haxe.io.Bytes.ofData( view8().buffer );
    }
    #else
    inline
    public function getBytes(){
        return this.image.view.buffer;// not working..
    }
    #end
    inline
    public function fromBytes( bytes: haxe.io.Bytes, pos ){
        this.image = haxe.io.UInt32Array.fromBytes( bytes, pos );
    }
    inline
    public function fromBytesCameleon( bytes: pixelimageXY.formats.BytesCameleon ){
        fromBytes( ( cast bytes: haxe.io.Bytes ), 0 );
    }
    
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
