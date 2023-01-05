package pixelimage.algo;

import pixelimage.iter.BoundIterator;
import pixelimage.iter.IteratorRange;
import pixelimage.algo.HitTri;

@:structInit
class HitQuad implements IhitObj {
    public var ax: Float;
    public var ay: Float;
    public var bx: Float;
    public var by: Float;
    public var cx: Float;
    public var cy: Float;
    public var dx: Float;
    public var dy: Float;

    public var triABD: HitTri;
    public var triBCD: HitTri;
    public var xIter4: IteratorRange;
    public var yIter4: IteratorRange;
    inline
    public function new( ax: Float, ay: Float
                       , bx: Float, by: Float
                       , cx: Float, cy: Float
                       , dx: Float, dy: Float ){
        this.ax = ax;
        this.ay = ay;
        this.bx = bx;
        this.by = by;
        this.cx = cx;
        this.cy = cy;
        this.dx = dx;
        this.dy = dy;
        triABD = { ax: ax, ay: ay, bx: bx, by: by, cx: dx, cy: dy };
        triBCD = { ax: bx, ay: by, bx: cx, by: cy, cx: dx, cy: dy };
        xIter4 = boundIterator4( ax, bx, cx, dx );
        yIter4 = boundIterator4( ay, by, cy, dy );
    }
    inline 
    public function hit( x: Float, y: Float ): Bool {
        return if( xIter4.containsF( x ) && yIter4.containsF( y ) ){
            if( triABD.hit( x, y ) ){
                true;
            } else if( triBCD.hit( x, y ) ){
                true;
            } else {
                false;
            }
        } else {
            false;
        }
    }
    inline 
    public function pushTriangles( arrTri: Array<HitTri> ){
        arrTri[ arrTri.length ] = triABD;
        arrTri[ arrTri.length ] = triBCD;
        return arrTri;
    }
}