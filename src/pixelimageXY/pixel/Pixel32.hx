package pixelimageXY.pixel;
import pixelimageXY.Endian;
import pixelimageXY.pixel.Pixel28;
import pixelimageXY.pixel.PixelChannel;
/**
    provides an abstract 32 bit color ARGB or ABGR
    can decompose channels c0,c1,c2,c3
    transferColor is used to flip R and B when drawing and reading from the canvas ( as required endian )
    channelBlend and alphaBlend are algorthms to blend a semi transparent pixel over another it does not transfer color channels
**/
@:forward
@:transient
abstract Pixel32( Int ) to Int from Int {
    inline
    public function new( v: Int )
        this = v;
    /**
        returns the 0x00 -> 0xFF number component
        in ARGB, 0 -> B, 1 -> G, 2 - R, 3 -> A  
    **/
    inline 
    public function hexChannel( i: Int ): PixelChannel {
        return switch( i ){
            case 0:
                ( cast this >> 24 & 0xFF: PixelChannel );
            case 1:
                ( cast this >> 16 & 0xFF: PixelChannel );
            case 2:
                ( cast this >> 8 & 0xFF : PixelChannel );
            case 3:
                ( cast this & 0xFF: PixelChannel );
            case _:
                ( 0x00: PixelChannel );
        }
    }
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
    inline 
    public function maskPixel( m: Pixel32 ): Pixel32 {
        return if( m*1 == 0 ){
            return new Pixel32( this );
        } else {
            var m0: Float = m.c0;
            var m1: Float = m.c1;
            var m2: Float = m.c2;
            var m3: Float = m.c3;
            // may need some extra logic for round error especially at 1, 0?
            var ch0 = Std.int( (1.-m0)*abstract.c0 );
            var ch1 = Std.int( (1.-m1)*abstract.c1 );
            var ch2 = Std.int( (1.-m2)*abstract.c2 );
            var ch3 = Std.int( (1.-m3)*abstract.c3 );
            Pixel32.from_argb( ch0, ch1, ch2, ch3 );
        }
    }
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