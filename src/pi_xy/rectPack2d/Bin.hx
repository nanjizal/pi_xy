package pi_xy.rectPack2d;

class Bin {
    public var size: WH;
    public var rects = new Array<XYWHF>();
    public function new(){
        size = new WH( 0, 0 );
    }
}