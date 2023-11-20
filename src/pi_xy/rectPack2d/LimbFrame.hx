package pi_xy.rectPack2d;
import pi_xy.rectPack2d.TP;
class LimbFrame{
    public var name: String;
    public var x:    Float;
    public var y:    Float;
    public var w:    Float;
    public var h:    Float;
    public var flipped: Bool;
    public var realW: Float;
    public var realH: Float;
    public function new( frame_: Frame ){
        name = frame_.imageName;
        var frameContent = frame_.frameContent;
        var frame = frameContent.frame;
        x = frame.x;
        y = frame.y;
        flipped = frameContent.rotated;
        if( flipped ){
            w = frame.h;
            h = frame.w;
        } else {
            w = frame.w;
            h = frame.h;
        }
        realW = frame.w;
        realH = frame.h;
    }
}