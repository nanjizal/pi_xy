package pi_xy.rectPack2d;
import pi_xy.rectPack2d.LTRB;

@:structInit
class LTRB_{
    public var l: Int = 0;
    public var t: Int = 0;
    public var r: Int = 0;
    public var b: Int = 0;
    public inline
    function new( l: Int, t: Int, r: Int, b: Int ){
        this.l = l;
        this.t = t;
        this.r = r;
        this.b = b;
    }
}

@:forward
@:transient
abstract LTRB( LTRB_ ) from LTRB_ to LTRB_ {
    public inline function new( l:Int, t: Int, r: Int, b: Int ){
        this = {l:l,t:t,r:r,b:b};
    }
    public var w( get, set ): Int;
    inline
    function get_w(): Int {
        return ( this.r - this.l );
    }
    inline 
    function set_w( ww: Int ): Int {
        this.r = this.l + ww;
        return ww;
    }
    public var h( get, set ): Int;
    inline
    function get_h(): Int{
        return ( this.b - this.t );
    }
    public function set_h( hh: Int ): Int{
        this.b = this.t + hh;
        return hh;
    }
    public var area( get, never ): Int;
    inline
    public function get_area(): Int {
        return Std.int( w*h );
    }
    public var perimeter( get, never ): Int;
    public inline
    function get_perimeter(): Int {
        return Std.int( 2*w + 2*h );
    }
    @:to
    public inline
    function toXYWH(): XYWH {
        var rect = new XYWH( this.l, this.t, 0, 0 );
        rect.r = this.r;
        rect.b = this.b;
        return rect;
    }
    public inline
    function toString(){
        var l = this.l;
        var t = this.t;
        var r = this.r;
        var b = this.b;
        return '{ l: $l, t: $t, r: $r, b: $b }';
    }
}