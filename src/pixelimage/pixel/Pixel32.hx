package pixelimage.pixel;
import pixelimage.Endian;
import pixelimage.pixel.Pixel28;
import pixelimage.pixel.PixelChannel;

@:forward
@:transient
abstract Pixel32( Int ) to Int from Int {
    inline
    public function new( v: Int )
        this = v;
    public var c0( get, set ): PixelChannel;
    inline
    function get_c0(): PixelChannel 
        return ( cast this >> 24 & 0xFF: PixelChannel );
    inline
    function set_c0( v: PixelChannel ): PixelChannel {
        this = Pixel32.fromChannels( v, c1, c2, c3 );
        return v;
    }
    public var c1( get, set ): PixelChannel;
    inline
    function get_c1(): PixelChannel 
        return ( cast this >> 16 & 0xFF: PixelChannel );
    inline
    function set_c1( v: PixelChannel ): PixelChannel {
        this = Pixel32.fromChannels( c0, v, c2, c3 );
        return v;
    }
    public var c2( get, set ): PixelChannel;
    inline
    function get_c2(): PixelChannel 
        return ( cast this >> 8 & 0xFF : PixelChannel );
    inline
    function set_c2( v: PixelChannel ): PixelChannel {
        this = Pixel32.fromChannels( c0, c1, v, c3 );
        return v;
    }
    public var c3( get, set ): PixelChannel;
    inline
    function get_c3(): PixelChannel 
        return ( cast this & 0xFF: PixelChannel );
    inline
    function set_c3( v: PixelChannel ): PixelChannel {
        this = Pixel32.fromChannels( c0, c1, c2, v );
        return v;
    }
    inline 
    public function flip13(): Pixel32
        return ( cast c0 << 24 | c3 << 16 | c2 << 8 | c1 : Pixel32 );
    inline
    public function transferColor(): Pixel32
        return ( isLittleEndian )? flip13(): ( cast this: Pixel32 );
    inline
    public function stringHash(): String
        return '#' + StringTools.hex( this, 8 );
    inline 
    public function isTransparent(): Bool
        return ( cast c0: Int ) < 0xFE;
    inline
    public static function fromPixel28Alpha( col: Pixel28, alpha: Int ): Pixel32
        return ( cast ( alpha << 24 | col ) : Pixel32 );
    inline
    public static function fromChannels( ch0: Int, ch1: Int, ch2: Int, ch3: Int ): Pixel32
        return ( cast ch0 << 24 | ch1 << 16 | ch2 << 8 | ch3 : Pixel32 );
    inline  
    public static function from_argb( a: Float, r: Float, g: Float, b: Float ): Pixel32
        return ( cast 
               ( PixelChannel.toHexInt( a ) << 24 ) 
             | ( PixelChannel.toHexInt( r ) << 16 ) 
             | ( PixelChannel.toHexInt( g ) << 8 ) 
             |   PixelChannel.toHexInt( b ): Pixel32 );
    public inline
    function channelBlend( ch0: PixelChannel
                         , ch1: PixelChannel
                         , ch2: PixelChannel
                         , ch3: PixelChannel ){
        var a1: Float = c0; // abstract conversion
        var r1: Float = c1;
        var g1: Float = c2;
        var b1: Float = c3;
        var a2: Float = ch0;
        var r2: Float = ch1;
        var g2: Float = ch2;
        var b2: Float = ch3;
        var a3 = a1 * ( 1 - a2 );
        var r = colBlendFunc( r1, r2, a3, a2 );
        var g = colBlendFunc( g1, g2, a3, a2 );
        var b = colBlendFunc( b1, b2, a3, a2 );
        var a = alphaBlendFunc( a3, a2 );
        return fromChannels( a, r, g, b );
    }
    // does not flip colors
    @:op(A + B) public inline 
    function alphaBlend( rhs: Pixel32 ): Pixel32 {
        var a1: Float = c0; // abstract conversion
        var r1: Float = c1;
        var g1: Float = c2;
        var b1: Float = c3;
        var a2: Float = rhs.c0;
        var r2: Float = rhs.c1;
        var g2: Float = rhs.c2;
        var b2: Float = rhs.c3;
        var a3 = a1 * ( 1 - a2 );
        var r = colBlendFunc( r1, r2, a3, a2 );
        var g = colBlendFunc( g1, g2, a3, a2 );
        var b = colBlendFunc( b1, b2, a3, a2 );
        var a = alphaBlendFunc( a3, a2 );
        return fromChannels( a, r, g, b );
    }
    inline
    static function colBlendFunc( x1: Float, x2: Float, a3: Float, a2: Float ): Int
        return Std.int( 255 * ( x1 * a3 + x2 * a2 ) );
    inline
    static function alphaBlendFunc( a3: Float, a2: Float ): Int
        return Std.int( 255 * ( a3 + a2 ) );
}