package pixelimageXY.pixel;
/**
    helper for working with colour channels
    so providing float ones for calculations and bounding for when converting back
**/
@:forward
@:transient
abstract PixelChannel( Int ) to Int from Int {
    inline
    public function new( v: Int )
        this = v;
    @:from
    public inline static function toHexInt( c: Float ): PixelChannel
        return ( cast Math.round( c * 255 ) : PixelChannel );
    @:to
    public inline function colIntToFloat(): Float
        return ( this == 0 )? 0.: this/255;
    @:to
    public inline function stringHash(): String 
        return '#' + StringTools.hex( this, 2 );
    inline
    public static function boundChannel( f: Float ): Int {
        var i = Std.int( f );
        if( i > 0xFF ) i = 0xFF;
        if( i < 0 ) i = 0;
        return new PixelChannel( i );
    }
}