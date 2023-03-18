package pixelimageXY.rectPack2d;
import pixelimageXY.rectPack2d.WH;

@:structInit
class XYWH_ extends WH_ {
    public var x: Int = 0;
    public var y: Int = 0;
    public function new( x: Int, y: Int, w: Int, h: Int ){
        super( w, h );
        this.x = x;
        this.y = y;
    }
}
@:forward
@:transient
abstract XYWH( XYWH_ ) to XYWH_ from XYWH_ {
    public inline
    function new( x: Int, y: Int, w: Int, h: Int ){
        this = { x:x, y:y, w:w, h:h };
    }
    public var r( get, set ): Int;
    inline
    function get_r(): Int {
        return this.x + this.w;
    }
    inline
    function set_r( rr: Int ){
        this.w = ( rr - this.x );
        return rr;
    }
    public var b( get, set ): Int;
    inline
    function get_b(){
        return this.y + this.h;
    } 
    inline
    function set_b( bb: Int ): Int{
        this.h = ( bb - this.y );
        return bb;
    }
    @:to
    public inline
    function toWH():WH {
        var _:WH = ( cast abstract: WH );
        return _;
    } 
}