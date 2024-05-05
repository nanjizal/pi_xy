package pi_xy.hit;

import pi_xy.iter.BoundIterator;
import pi_xy.iter.IteratorRange;
import pi_xy.hit.HitTri;

@:structInit
class HitObjArray implements IhitObj {
    public var arr: Array<IhitObj>;
    var xRange: IteratorRange;
    var yRange: IteratorRange;
    public var undoImage: Null<Pixelimage> = null;
    public var undoX: Int;
    public var undoY: Int;
    public var boundsCalculated: Bool = false;
    inline
    public function new( arr: Array<IhitObj> ){
        this.arr = arr;
    }
    public function push( v: IhitObj ){
        return arr.push( v );
    }
    inline
    public function rectBoundsHit( x: Float, y: Float ): Bool {
        var within = true;
        for( i in 0...arr.length ){
            within = arr[i].rectBoundsHit( x, y );
            if( within != true ) break;
        }
        return within;
    }
    inline 
    public function hit( x: Float, y: Float ): Bool {
        return if( rectBoundsHit( x, y ) ){
            var within = true;
            for( i in 0...arr.length ){
                within = arr[i].hit( x, y );
                if( within != true ) break;
            }
            return within;
        } else {
            false;
        }
    }
}