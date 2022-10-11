package pixelimage;
/*
// Example use.. currently set only for canvas.

-js bin/test.js
-lib htmlHelper
-lib pixelimage
-main Main
-D js-flatten 
-dce full
#--no-traces
--next
-cmd echo '<!DOCTYPE html><meta charset="UTF-8"><html><body><script src="test.js"></script></body></html>' >bin/index.html
# open html on linux.
-cmd cd bin/
-cmd firefox "./index.html"

import htmlHelper.canvas.CanvasSetup;
import htmlHelper.canvas.Surface;
import pixelimage.Pixelimage;
function main() new Main();
class Main {
    public var canvasSetup = new CanvasSetup();
    public function new(){
        trace( 'Pixelimage example on Canvas' );
        var g   = canvasSetup.surface;
        var p = new Pixelimage( 1024, 768 );
        p.fillRect( 100, 100, 300, 200, 0xff4211bc );
        p.fillTri( 100, 100, 200, 120, 150, 300, 0xffF000c0 );
        p.fillGradTri( 100, 100, 0xFFFF0000
                     , 500, 300, 0xFF1ECB24
                     , 300, 500, 0xFFE9D604 );
        p.fillRegPoly( 300, 300, 90, 200, 0xFF00Ffcc );// circles and ellipses
        p.drawToContext( g.me, 0, 0 );
        p.drawFromContext( g.me, 0, 0 );
        trace( p.getPixelString( 101, 101) );
   }
}

*/
import haxe.io.UInt32Array;
final isLittleEndian = (() -> {
    final a8 = new js.lib.Uint8Array(4);
    final a32 = (new js.lib.Uint32Array(a8.buffer)[0]=0xFFcc0011);
    return !(a8[0]==0xff);
})();
@:structInit
class Pixelimage_ {
  public var width:  Int;
  public var height: Int;
  public var image:  UInt32Array;
  public var isLittle: Bool;
  public function new( width: Int, height: Int, image: UInt32Array ){
    this.width = width;
    this.height = height;
    this.image = image;
    this.isLittle = isLittleEndian;
  }
}
abstract Pixel32( Int ){
    inline public function new( v: Int ){
        this = v;
    }
    inline public function toCanvas():Int{
        var c = this;
        // abgr
        return if( isLittleEndian ){
            var a = c >> 24 & 0xFF;
            var r = c >> 16 & 0xFF;
            var g = c >> 8 & 0xFF;
            var b = c & 0xFF;
            a << 24 | b << 16 | g << 8 | r;
        } else { 
            c;
        }
    }
    inline public function fromCanvas():Int {
        var c = this;
        return if( isLittleEndian ){
            var a = c >> 24 & 0xFF;
            var b = c >> 16 & 0xFF;
            var g = c >> 8 & 0xFF;
            var r = c & 0xFF;
            // argb
            a << 24 | r << 16 | g << 8 | b;
        } else {
            c;
        }
    }
    inline public function rgbToCanvas():Int {
        var rgb = this;
        var r = rgb >> 16 & 0xFF;
        var g = rgb >> 8 & 0xFF;
        var b = rgb & 0xFF;
        // abgr
        return b << 16 | g << 8 | r; 
    }
    inline public function rgbFromCanvas():Int {
        var c = this;
        var b = c >> 16 & 0xFF;
        var g = c >> 8 & 0xFF;
        var r = c & 0xFF;
        // rgb
        return r << 16 | g << 8 | b << 0;
    }
}
abstract Pixelimage( Pixelimage_ ) from Pixelimage_ {
    public var width( get, never ): Int;
    inline function get_width(): Int {
       return this.width;
    }
    public var height( get, never ): Int;
    inline function get_height(): Int {
        return this.height;
    }
    inline
    public function new( w: Int, h: Int ){
       this = ( 
        { width:  w
        , height: h
        , image:  new haxe.io.UInt32Array( Std.int( w * h  ) ) 
        }: Pixelimage_ 
        );
    }
    inline 
    function position( x: Int, y: Int ){
       return Std.int( y * this.width + x );
    }
    inline
    public function setARGB( x: Int, y: Int, color: Int ){
       this.image[ position( x, y ) ] = new Pixel32( color ).toCanvas();
    }
    inline
    public function getARGB( x: Int, y: Int ): Int {
       return new Pixel32( this.image[ position( x, y ) ] ).fromCanvas();
    }
    inline
    function pos4( x: Int, y: Int, ?off: Int = 0 ): Int {
        return Std.int( position( x, y ) * 4 ) + off;
    }     
    inline 
    function view8():js.lib.Uint8Array {
        var dataimg: js.lib.Uint32Array = cast this.image;
        return new js.lib.Uint8Array( dataimg.buffer ); // TODO make more generic
    }  
    inline
    public function setIalpha( x: Int, y: Int, alpha: Int ) {
        view8()[ pos4( x, y, 0 ) ] = alpha;    
    }
    inline
    public function getIalpha( x: Int, y: Int ): Int {
        return view8()[ pos4( x, y, 0 )];   
    }
    inline
    public function setIrgb( x: Int, y: Int, rgb: Int ) {
        var a = getIalpha( x, y );
        // abgr
        this.image[ position( x, y ) ] = a << 24 | new Pixel32( rgb ).rgbToCanvas();   
    }
    inline
    public function getIrgb( x: Int, y: Int ): Int {
        var c = this.image[ position( x, y ) ];
        // rgb
        return new Pixel32(c).rgbFromCanvas();
    }
    inline public
    function stringHash8( col: Int ): String
        return '#' + StringTools.hex( col, 8 );
    inline public
    function stringHash6( col: Int ): String 
        return '#' + StringTools.hex( col, 6 );
    inline public
    function getPixelString( x: Int, y: Int )
        return stringHash8( getARGB( x, y ) );
    inline public
    function getRGBString( x: Int, y: Int )
        return stringHash6( getIrgb( x, y ) );
    inline public
    function fillRect( x: Float, y: Float
                     , w: Float, h: Float
                     , color: Int ) {
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
    /*
        Used for bounding box iteration, calculates lo...hi iterator from 3 values. 
    */
    inline 
    function boundIterator3( a: Float, b: Float, c: Float ): Iterator<Int> {
        return if( a > b ){
            if( a > c ){ // a,b a,c
                (( b > c )? Std.int( c ): Std.int( b ))...Std.int( a );
            } else { // c,a,b
                Std.int( b )...Std.int( c );
            }
        } else {
            if( b > c ){ // b,a, b,c 
                (( a > c )? Std.int( c ): Std.int( a ))...Std.int( b );
            } else { // c,b,a
                Std.int( a )...Std.int( c );
            }
        }
    }
    inline public
    function fillTri( ax: Float, ay: Float
                    , bx: Float, by: Float
                    , cx: Float, cy: Float
                    , color: Int ){

        var s0 = ay*cx - ax*cy;
        var sx = cy - ay;
        var sy = ax - cx;
        var t0 = ax*by - ay*bx;
        var tx = ay - by;
        var ty = bx - ax;
        var A = -by*cx + ay*(-bx + cx) + ax*(by - cy) + bx*cy;
        for( x in boundIterator3( ax, bx, cx ) ){
            var sxx = sx*x;
            var txx = tx*x;
            for( y in boundIterator3( ay, by, cx ) ){
                if( triCalc( x, y, s0, t0, sxx, sy, txx, ty, A ) ) setARGB( x, y, color );
            }
        }
    }
    inline
    function triCalc( x:    Float,  y:    Float
                    , s0:   Float,  t0:   Float
                    , sxx:  Float,  sy:   Float
                    , txx:  Float,  ty:   Float
                    , A:    Float      ): Bool {
        var s = s0 + sxx + sy*y;
        var t = t0 + txx + ty*y;
        return ( s <= 0 || t <= 0 )? false: (s + t) < A;
    }
    inline public
    function fillGradTri( ax: Float, ay: Float, colA: Int
                        , bx: Float, by: Float, colB: Int
                        , cx: Float, cy: Float, colC: Int ){
        var aA = ( colA >> 24 ) & 0xFF;
        var rA = ( colA >> 16 ) & 0xFF;
        var gA = ( colA >> 8 ) & 0xFF;
        var bA = colA & 0xFF;

        var aB = ( colB >> 24 ) & 0xFF;
        var rB = ( colB >> 16 ) & 0xFF;
        var gB = ( colB >> 8 ) & 0xFF;
        var bB = colB & 0xFF;
    
        var aC = ( colC >> 24 ) & 0xFF;
        var rC = ( colC >> 16 ) & 0xFF;
        var gC = ( colC >> 8 ) & 0xFF;
        var bC = colC & 0xFF;

        var v0x = bx - ax;                    
        var v0y = by - ay;
        var v1x = cx - ax;
        var v1y = cy - ay;
        var d00 = dot( v0x, v0y, v0x, v0y );
        var d01 = dot( v0x, v0y, v1x, v1y );
        var d11 = dot( v1x, v1y, v1x, v1y );
        for( x in boundIterator3( ax, bx, cx ) ){
            var v2x = x-ax;// does not change every y.
            for( y in boundIterator3( ay, by, cy) ){
                barycentricWeightColor( x, y
                                      , ax, ay
                                      , v0x, v0y, v1x, v1y, v2x, d00, d01, d11
                                      , aA, rA, gA, bA
                                      , aB, rB, gB, gB
                                      , aC, rC, gC, gC );
            }
        }
    }
    // second attempt
    public inline
    function barycentricGradient( ax: Float, ay: Float, colA: Int
                                , bx: Float, by: Float, colB: Int
                                , cx: Float, cy: Float, colC: Int ){
        var aA = ( colA >> 24 ) & 0xFF;
        var rA = ( colA >> 16 ) & 0xFF;
        var gA = ( colA >> 8 ) & 0xFF;
        var bA = colA & 0xFF;

        var aB = ( colB >> 24 ) & 0xFF;
        var rB = ( colB >> 16 ) & 0xFF;
        var gB = ( colB >> 8 ) & 0xFF;
        var bB = colB & 0xFF;
    
        var aC = ( colC >> 24 ) & 0xFF;
        var rC = ( colC >> 16 ) & 0xFF;
        var gC = ( colC >> 8 ) & 0xFF;
        var bC = colC & 0xFF;

        // a = V1, b = V2, c = V3 
        // before loop calculate
        var bax = bx - ax; //sideVec1 = V2 - V1
        var bay = by - ay;
        var cax = cx - ax; //sideVec2 = V3 - V1  
        var cay = cy - ay;
 
        // before loop calculate
        var dot11 = dotSame( bax, bay );
        var dot12 = dot( bax, bay, cax, cay );
        var dot22 = dotSame( cax, cay );
        var denom1 = 1/( dot11 * dot22 - dot12 * dot12 );

        for( px in boundIterator3( ax, bx, cx ) ){
            var pax = px - ax; //sideVec3 = P - V1;  can be done in x loop
            for( py in boundIterator3( bx, by, cy ) ){
                var pay = py - ay; // has to be done in y loop
                var dot31 = dot( pax, pay, bax, bay );
                var dot32 = dot( pax, pay, cax, cay );
                var ratioA = (dot22 * dot31 - dot12 * dot32) * denom1;
                var ratioB = (dot11 * dot32 - dot12 * dot31) * denom1;
                var ratioC = 1.0 - ratioB - ratioA;
                if( ratioA >= 0 && ratioB >= 0 && ratioC >= 0 ){
                    var a = boundChannel( aA*ratioA + aB*ratioB + aC*ratioC );
                    var r = boundChannel( rA*ratioA + rB*ratioB + rC*ratioC );
                    var g = boundChannel( gA*ratioA + gB*ratioB + gC*ratioC );
                    var b = boundChannel( bA*ratioA + bB*ratioB + bC*ratioC );
                    // re-ordered for canvas abgr
                    this.image[ position( px, py ) ] = a << 24 | b << 16 | g << 8 | r;
                }
            }
        }
    }
    inline
    function barycentricWeightColor( x: Int, y: Int
                              , ax: Float, ay: Float
                              , v0x: Float, v0y: Float, v1x: Float, v1y: Float, v2x: Float, d00: Float, d01: Float, d11: Float
                              , aA: Int, rA: Int, gA: Int, bA: Int
                              , aB: Int, rB: Int, gB: Int, bB: Int
                              , aC: Int, rC: Int, gC: Int, bC: Int ): Null<Int> {
        var v2y = y-ay;
        var d20 = dot( v2x, v2y, v0x, v0y );
        var d21 = dot( v2x, v2y, v1x, v1y );
        var invDenom = 1.0 / (d00 * d11 - d01 * d01);
        var wa = (d11 * d20 - d01 * d21) * invDenom;
        var wb = (d00 * d21 - d01 * d20) * invDenom;
        var wc = 1.0 - wa - wb;                                      
        return if( wa >= 0 && wb >= 0 && wc >= 0 ){
            var a = boundChannel( aA*wa + aB*wb + aC*wc );
            var r = boundChannel( rA*wa + rB*wb + rC*wc );
            var g = boundChannel( gA*wa + gB*wb + gC*wc );
            var b = boundChannel( bA*wa + bB*wb + bC*wc );
            // output as canvas color, so order changed to abgr
            var col: Int = a << 24 | b << 16 | g << 8 | r;
            // direct set.. not ideal..
            // set to red for now!
            this.image[ position( x, y ) ] = col;
            col;
        } else {
            null;
        }
    }
    inline function boundChannel( f: Float ): Int {
        var i = Std.int( f );
        if( i > 0xFF ) i = 0xFF;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
        if( i < 0 ) i = 0;
        return i;
    }
    inline public
    function fillPoly( cx: Float, cy: Float
                     , rx: Float, ry: Float
                     , color: Int, ?sides: Int = 36 ){
        var theta = 2*Math.PI/36 +0.001; // slight offset to reduce overlap artifacts.
        // can be solved by including edges .. not implemented yet
        var lastX = cx + rx*Math.cos( sides*theta );
        var lastY = cy + ry*Math.sin( sides*theta );
        for( i in 0...sides+1 ){
            var nextX = cx + rx*Math.cos( i*theta );
            var nextY = cy + ry*Math.sin( i*theta );
            fillTri( cx, cy, lastX, lastY, nextX, nextY, color );
            lastX = nextX;
            lastY = nextY;
        }
    }
    inline public
    function distanceSquarePointToSegment( x:  Float, y: Float
                                                , x1: Float, y1:Float
                                                , x2: Float, y2:Float
                                                ): Float
    {
        var p1_p2_squareLength = (x2 - x1)*(x2 - x1) + (y2 - y1)*(y2 - y1);
        var dotProduct = ((x - x1)*(x2 - x1) + (y - y1)*(y2 - y1)) / p1_p2_squareLength;
        return if ( dotProduct < 0 ){
            return (x - x1)*(x - x1) + (y - y1)*(y - y1);
        } else if ( dotProduct <= 1 ){
            var p_p1_squareLength = (x1 - x)*(x1 - x) + (y1 - y)*(y1 - y);
            return p_p1_squareLength - dotProduct * dotProduct * p1_p2_squareLength;
        } else {
            return (x - x2)*(x - x2) + (y - y2)*(y - y2);
        }
    }
    inline function dot( ax: Float, ay: Float, bx: Float, by: Float ): Float
        return ax * bx + ay * by;
    inline function dotSame( ax: Float, ay: Float ): Float
        return dot( ax, ay, ax, ay );
    #if js
    inline
    public function drawToContext( ctx: js.html.CanvasRenderingContext2D, x: Int, y: Int  ){
        var data = new js.lib.Uint8ClampedArray( view8().buffer );
        var imageData = new js.html.ImageData( data, this.width, this.height );
        ctx.putImageData( imageData, x, y);
    }
    inline
    public function drawFromContext( ctx: js.html.CanvasRenderingContext2D, x: Int, y: Int ){
        var imageData = ctx.getImageData( x, y, this.width, this.height);
        var data = imageData.data;
        var temp = new js.lib.Uint32Array( data.buffer );
        this.image = cast temp;
    }
    #end
}
// references
// http://totologic.blogspot.com/2014/01/accurate-point-in-triangle-test.html
// https://codeplea.com/triangular-interpolation *
// https://gamedev.stackexchange.com/questions/23743/whats-the-most-efficient-way-to-find-barycentric-coordinates    
// https://stackoverflow.com/questions/39213661/canvas-using-uint32array-wrong-colors-are-being-rendered
// https://stackoverflow.com/questions/26513712/algorithm-for-coloring-a-triangle-by-vertex-color

          
