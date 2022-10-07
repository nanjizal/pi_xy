package;
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
    function alphaLast( argb: Int ): Int {
        // move two places left and add on alpha
        return ( argb << 8 ) | ( argb >> 24 & 0xFF );
    }
    inline
    function alphaFirst( rgba: Int ): Int {
       // use the end alpha and move to front and add on rgb 
       return ( ( rgba & 0xFF ) << 24 ) | ( rgba >> 8 );
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
        return Std.int( position( x, y ) * 4 ) + off;
    }     
    inline 
    function view8():js.lib.Uint8Array {
        var dataimg: js.lib.Uint32Array = cast this.image;
        return new js.lib.Uint8Array( dataimg.buffer ); // TODO make more generic
    }    
    inline
    public function setIalpha( x: Int, y: Int, alpha: Int ) {
        view8()[ pos4( x, y, 3 ) ] = alpha;    
    }
    inline
    public function getIalpha( x: Int, y: Int ): Int {
        return view8()[ pos4( x, y, 3 )];   
    }
    inline
    public function setIrgb( x: Int, y: Int, rgb: Int ) {
        var a = getIalpha( x, y );
        this.image[ position( x, y ) ] = rgb << 8 + a;    
    }
    inline
    public function getIrgb( x: Int, y: Int ): Int {
        return this.image[ position( x, y ) ] >> 8 & 0xFFFFFF;   
    }
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
