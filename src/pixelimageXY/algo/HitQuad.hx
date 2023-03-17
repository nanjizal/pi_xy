package pixelimageXY.algo;

import pixelimageXY.iter.BoundIterator;
import pixelimageXY.iter.IteratorRange;
import pixelimageXY.algo.HitTri;
import pixelimageXY.algo.QuadPoints;

@:structInit
class HitQuad extends QuadPoints_ implements IhitObj {
    public var triABD: HitTri;
    public var triBCD: HitTri;
    public var xIter4: IteratorRange;
    public var yIter4: IteratorRange;
    public var undoImage: Null<Pixelimage> = null;
    public var undoX: Int;
    public var undoY: Int;
    inline
    public function new( ax: Float, ay: Float
                       , bx: Float, by: Float
                       , cx: Float, cy: Float
                       , dx: Float, dy: Float, preCalculated: Bool = true ){
        super( ax, ay, bx, by, cx, cy, dx, dy );
        if( preCalculated ){
            preCalculateValues();
        }
    }
    inline 
    public function preCalculateValues(){
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