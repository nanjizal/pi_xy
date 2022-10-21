package pixelimage.pixel;
import pixelimage.Endian;
import pixelimage.pixel.Pixel28;

@:forward
@:transient
abstract Pixel32( Int ) to Int {
    inline
    public function new( v: Int )
        this = v;
    public var c0( get, set ): Int;
    inline
    function get_c0(): Int 
        return this >> 24 & 0xFF;
    inline
    function set_c0( v: Int ): Int {
        this = Pixel32.fromChannels( v, c1, c2, c3 );
        return v;
    }
    public var c1( get, set ): Int;
    inline
    function get_c1(): Int 
        return this >> 16 & 0xFF;
    inline
    function set_c1( v: Int ): Int {
        this = Pixel32.fromChannels( c0, v, c2, c3 );
        return v;
    }
    public var c2( get, set ): Int;
    inline
    function get_c2(): Int 
        return this >> 8 & 0xFF;
    inline
    function set_c2( v: Int ): Int {
        this = Pixel32.fromChannels( c0, c1, v, c3 );
        return v;
    }
    public var c3( get, set ): Int;
    inline
    function get_c3(): Int 
        return this & 0xFF;
    inline
    function set_c3( v: Int ): Int {
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
        return c0 < 0xFE;
    inline
    public static function fromPixel28Alpha( col: Pixel28, alpha: Int ): Pixel32
        return ( cast ( alpha << 24 | col ) : Pixel32 );
    inline
    public static function fromChannels( ch0: Int, ch1: Int, ch2: Int, ch3: Int ): Pixel32
        return ( cast ch0 << 24 | ch1 << 16 | ch2 << 8 | ch3 : Pixel32 );
}