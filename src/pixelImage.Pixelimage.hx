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
        p.fillRegPoly( 300, 300, 90, 200, 0xFF00Ffcc );// circles and ellipses
        p.drawToContext( g.me, 0, 0 );
        p.drawFromContext( g.me, 0, 0 );
        trace( p.getPixelString( 101, 101) );
   }
}

*/

import haxe.io.UInt32Array;
import haxe.io.UInt32Array;
@:structInit
class Pixelimage_ {
  public var width:  Int;
  public var height: Int;
  public var image:  UInt32Array;
  public function new( width: Int, height: Int, image: UInt32Array ){
    this.width = width;
    this.height = height;
    this.image = image;
  }
}
abstract Pixel32( Int ){
    inline public function new( v: Int ){
        this = v;
    }
    inline public function toCanvas():Int{
        var c = this;
        var a = c >> 24 & 0xFF;
        var r = c >> 16 & 0xFF;
        var g = c >> 8 & 0xFF;
        var b = c & 0xFF;
        // abgr
        return a << 24 | b << 16 | g << 8 | r;
    }
    inline public function fromCanvas():Int {
        var c = this;
        var a = c >> 24 & 0xFF;
        var b = c >> 16 & 0xFF;
        var g = c >> 8 & 0xFF;
        var r = c & 0xFF;
        // argb
        return a << 24 | r << 16 | g << 8 | b;
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
    inline public
    function new( w: Int, h: Int ){
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
    inline public
    function setARGB( x: Int, y: Int, color: Int ){
       this.image[ position( x, y ) ] = new Pixel32( color ).toCanvas();
    }
    inline public
    function getARGB( x: Int, y: Int ): Int {
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
    inline public
    function setIalpha( x: Int, y: Int, alpha: Int ) {
        view8()[ pos4( x, y, 0 ) ] = alpha;    
    }
    inline public
    function getIalpha( x: Int, y: Int ): Int {
        return view8()[ pos4( x, y, 0 )];   
    }
    inline public
    function setIrgb( x: Int, y: Int, rgb: Int ) {
        var a = getIalpha( x, y );
        // abgr
        this.image[ position( x, y ) ] = a << 24 | new Pixel32( rgb ).rgbToCanvas();   
    }
    inline public
    function getIrgb( x: Int, y: Int ): Int {
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
    inline public
    function fillTri( ax: Float, ay: Float
                    , bx: Float, by: Float
                    , cx: Float, cy: Float
                    , color: Int ){
        var maxX = Std.int( Math.max( Math.max( ax, bx ), cx ) );
        var minX = Std.int( Math.min( Math.min( ax, bx ), cx ) );
        var maxY = Std.int( Math.max( Math.max( ay, by ), cy ) );
        var minY = Std.int( Math.min( Math.min( ay, by ), cy ) );
        var s0 = ay*cx - ax*cy;
        var sx = cy - ay;
        var sy = ax - cx;
        var t0 = ax*by - ay*bx;
        var tx = ay - by;
        var ty = bx - ax;
        var A = -by*cx + ay*(-bx + cx) + ax*(by - cy) + bx*cy;
        for( x in minX...maxX ){
            for( y in minY...maxY ){
                if( triCalc( x, y, s0, t0, sx, sy, tx, ty, A ) ) setARGB( x, y, color );
            }
        }
    }
    // currently only suitable for circle/ellipse
    inline public
    function fillRegPoly( cx: Float, cy: Float
                     , rx: Float, ry: Float
                     , color: Int, ?sides: Int = 36 ){
        var theta = 2*Math.PI/36 +0.001; // slight offset to reduce overlap artifacts.
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
    inline
    function triCalc( x:    Float,  y:    Float
                    , s0:   Float,  t0:   Float
                    , sx:   Float,  sy:   Float
                    , tx:   Float,  ty:   Float
                    , A:    Float      ): Bool {
        var s = s0 + sx*x + sy*y;
        var t = t0 + tx*x + ty*y;
        return if (s <= 0 || t <= 0) {
            false;
        } else {
            (s + t) < A;
        }
    }
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
