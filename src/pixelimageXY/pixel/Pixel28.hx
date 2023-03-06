package pixelimageXY.pixel;
import pixelimageXY.Endian;
import pixelimageXY.pixel.Pixel32;
/**
    This is an abstract RGB or BGR pixel 
    not used much
    @see Pixel32
**/
@:forward
@:transient
abstract Pixel28( Int ) to Int {
    inline
    public function new( v: Int )
        this = v;
    public var c1( get, set ): Int;
    inline
    function get_c1(): Int 
        return this >> 16 & 0xFF;
    inline
    function set_c1( v: Int ): Int {
        this = Pixel28.fromChannels( v, c2, c3 );
        return v;
    }
    public var c2( get, set ): Int;
    inline
    function get_c2(): Int 
        return this >> 8 & 0xFF;
    inline
    function set_c2( v: Int ): Int {
        this = Pixel28.fromChannels( c1, v, c3 );
        return v;
    }
    public var c3( get, set ): Int;
    inline
    function get_c3(): Int 
        return this & 0xFF;
    inline
    function set_c3( v: Int ): Int {
        this = Pixel28.fromChannels( c1, c2, v );
        return v;
    }
    inline 
    public function flip13(): Pixel28
        return ( cast c3 << 16 | c2 << 8 | c1 : Pixel28 );
    inline
    public function transferColor(): Pixel28
        return ( isLittleEndian )? flip13(): ( cast this: Pixel28 );
    inline
    public function stringHash(): String 
        return '#' + StringTools.hex( this, 6 );
    inline
    public static function fromChannels( ch1: Int, ch2: Int, ch3: Int ): Pixel28
        return ( cast ch1 << 16 | ch2 << 8 | ch3 : Pixel28 );
}