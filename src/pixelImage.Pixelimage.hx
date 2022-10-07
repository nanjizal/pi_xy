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
        p.drawToContext( g.me, 0, 0 );
        p.drawFromContext( g.me, 0, 0 );
        trace( p.stringHashARGB( p.getARGB( 101, 101) ) );
   }
}

*/

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
    function canvasColor( c: Int ): Int {
        var a = c >> 24 & 0xFF;
        var r = c >> 16 & 0xFF;
        var g = c >> 8 & 0xFF;
        var b = c & 0xFF;
        // abgr
        return a << 24 | b << 16 | g << 8 | r;
    }
    
    inline
    function fromCanvasColor( c: Int ): Int {
        var a = c >> 24 & 0xFF;
        var b = c >> 16 & 0xFF;
        var g = c >> 8 & 0xFF;
        var r = c & 0xFF;
        // argb
        return a << 24 | r << 16 | g << 8 | b;
    }
    
    inline
    public function setARGB( x: Int, y: Int, color: Int ){
       this.image[ position( x, y ) ] = canvasColor( color );
    }
    
    inline
    public function getARGB( x: Int, y: Int ): Int {
       return fromCanvasColor( this.image[ position( x, y ) ] );
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
        var r = rgb >> 16 & 0xFF;
        var g = rgb >> 8 & 0xFF;
        var b = rgb & 0xFF;
        // abgr
        this.image[ position( x, y ) ] = a << 24 | b << 16 | g << 8 | r;   
    }
    inline
    public function getIrgb( x: Int, y: Int ): Int {
        var c = this.image[ position( x, y ) ];
        var b = c >> 16 & 0xFF;
        var g = c >> 8 & 0xFF;
        var r = c & 0xFF;
        // rgb
        return r << 16 | g << 8 | b << 0;
    }
    inline
    public function stringHashARGB( col: Int ): String
        return '#' + StringTools.hex( col, 8 );
    inline
    public function fillRect( x: Int, y: Int, w: Int, h: Int, color: Int ) {
       var p = x;
       var q = y;
       var maxX = x + w;
       var maxY = y + h;
       while( true ){
          setARGB( p++, q, color );
          if( p > maxX ){
            p = x;
            q++;
          } 
          if( q > maxY ) break;
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
