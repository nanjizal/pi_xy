package pixelimage;
import haxe.io.UInt32Array;
@:structInit
class Pixelimage_ {
  public var width:  Int;
  public var height: Int;
  public var image:  UInt32Array;
  public function new( x: Int, y: Int, image: UInt32Array ){
    this.x = x;
    this.y = y;
    this.image = image;
  }
}
abstract Pixelimage( Pixelimage ) from Pixelimage_ {
    public var width( get, never ): Int;
    inline function get_width(): Float {
       return this.width;
    }
    public var height( get, never ): Int;
    inline function get_height(): Float {
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
    function getPosition( x: Int, y: Int ){
       return Std.int( y * this.width + x );
    }
    inline 
    function alphaLast( argb: Int ): Int {
        // move two places left and add on alpha
        return ( argb << 8 ) || ( argb >> 24 & 0xFF );
    }
    inline
    function alphaFrist( rgba: Int ): Int {
       // use the end alpha and move to front and add on rgb 
       return ( ( rgba & 0xFF ) << 24 ) || ( rgba >> 8 );
    }
    inline
    public function setARGB( x: Int, y: Int, color: Int ){
       this.image[ position( x, y ) ] = alphaLast( color );
    }
    inline
    public function getARGB( x: Int, y: Int ): Int {
       return alphaFirst( this.image[ position( x, y ) ] );
    }
    inline
    function pos4( x: Int, y: Int, ?off: Int = 0 ): Int {
        return Std.int( getPosition( x, y ) * 4 ) + off;
    }     
    inline 
    function view8():UintArray {
        new haxe.io.UInt8Array( this.image.data.buffer );
    }    
    inline
    public function setIalpha( x: Int, y: Int, alpha: Int ): Int {
        view8()[ pos4( x, y, 3 ) ] = alpha;    
    }
    inline
    public function getIalpha( x: Int, y: Int ): Int {
        return view8()[ pos4( x, y, 3 )];   
    }
    inline
    public function setIrgb( x: Int, y: Int, rgb: Int ): Int {
        var a = getIalph( x, y );
        this.image[ position( x, y ) ] = rgb << 8 + a;    
    }
    inline
    public function getIrgb( x: Int, y: Int ): Int {
        return this.image[ position( x, y ) ] >> 8 & 0xFFFFFF;   
    }
    inline
    public function fillRect( x: Int, y: Int, w: Int, h: Int, color: Color ) {
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
        var d: js.Lib.UInt8Array = cast view8();
        var data = new js.lib.Uint8ClampedArray( d.buffer );
        var imageData = new js.html.ImageData( data, this.width, this.height );
        ctx.putImageData( imageData, x, y);
    }
    inline
    public function drawFromContext( ctx: js.html.CanvasRenderingContext2D, x: Int, y: Int ){
        var imageData = ctx.getImageData( x, y, this.width, this.height);
        var data = imageData.data;
        this.image = new haxe.io.UInt32Array( data.buffer );
    }
    #end
}     
