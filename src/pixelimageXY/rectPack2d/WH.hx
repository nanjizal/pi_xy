package pixelimageXY.rectPack2d;

@:structInit
class WH_ {
    public var w: Int;
    public var h: Int;
    public function new( w: Int = 0, h: Int = 0 ){
        this.w = w;
        this.h = h;
    }
}
@:forward
@:transient
abstract WH( WH_ ) from WH_ to WH_ {
    public inline
    function new( w: Int, h: Int ){
        this = { w:w, h:h };
    }
    public var area( get, never ): Int;
    inline
    public function get_area():Int {
        return Std.int( this.w*this.h );
    }
    public var perimeter( get, never ): Int;
    inline
    public function get_perimeter(): Int{
        return Std.int( 2*this.w + 2*this.h );
    }
    public function fits( r: WH ): Int {
        if( this.w == r.w && this.h == r.h ) return 3;
        if( this.h == r.w && this.w == r.h ) return 4;
        if( this.w <= r.w && this.h <= r.h ) return 1;
        if( this.h <= r.w && this.w <= r.h ) return 2;
        return 0;
    }
}