package pi_xy.rectPack2d;
import pi_xy.rectPack2d.XYWH;

@:structInit
class XYWHF_ extends XYWH_ {
    public var flipped = false;
    public var id: Int;
    public function new( id: Int, x: Int, y: Int, w: Int, h: Int ){
        super( x, y, w, h );
        this.id = id;
    }
}
@:forward
@:transient
abstract XYWHF( XYWHF_ ) from XYWHF_ to XYWHF_ {
    public inline
    function new( id: Int, x: Int, y: Int, w: Int, h: Int ){
        this = { id:id, x:x, y:y, w:w, h:h };
    }
    public inline
    function flip(){
        this.flipped = !this.flipped;
        var temp = this.w;
        this.w = this.h;
        this.h = temp;
    }
    public inline
    function clone(){
        var res = new XYWHF( this.id, this.x, this.y, this.w, this.h );
        res.flipped = this.flipped;
        return res;
    }
    public static inline
    function sorts():Array< XYWHF->XYWHF->Int >{
        return Sorts.all();
    }
    public inline
    function toObject( name: String = '' ){
        return { id: this.id, name: name, x: this.x, y: this.y, width: this.w, height: this.h };
    }
    public inline
    function string( name: String ){
        return Std.string( toObject( name ) );
    }
    @:to
    public inline
    function toXYWH():XYWH {
        var _:XYWH = ( cast abstract: XYWH );
        return _;
    } 
    @:to
    public inline 
    function toWH():WH {
        return toXYWH().toWH();
    }
    public var area( get, never ): Int;
    inline
    public function get_area(){
        return toWH().area;
    }
    public var perimeter( get, never ): Int;
    inline
    public function get_perimeter(){
        return toWH().perimeter;
    }
    public inline
    function fits( r: WH ){
        return toWH().fits( r );
    }
}