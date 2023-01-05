package pixelimage.algo;

import pixelimage.iter.BoundIterator;
import pixelimage.iter.IteratorRange;
import pixelimage.algo.HitTri;

@:structInit
class HitTriArray implements IhitObj {
    public var triArr: Array<HitTri>;
    var xRange: IteratorRange;
    var yRange: IteratorRange;
    public var boundsCalculated: Bool = false;
    inline
    public function new( triArr: Array<HitTri> ){
        this.triArr = triArr;
    }
    inline function calculateBounds(){
        var pxMin: Array<Float> = [];
        var pxMax: Array<Float> = [];
        var pyMin: Array<Float> = [];
        var pyMax: Array<Float> = []; 
        var count = 0;
        var iterBound: IteratorRange;
        for( tri in triArr ){
            iterBound = tri.xIter3;
            pxMin[ count ] = iterBound.start;
            pxMax[ count ] = iterBound.max;
            iterBound = tri.yIter3;
            pxMin[ count ] = iterBound.start;
            pxMax[ count ] = iterBound.max;
            count++;
        }
        xRange = boundIteratorX( pxMin, pxMax );
        yRange = boundIteratorX( pyMin, pyMax );
        boundsCalculated = true;
    }
    inline 
    public function hit( x: Float, y: Float ): Bool {
        if( !boundsCalculated ) calculateBounds();
        return if( xRange.containsF( x ) && yRange.containsF( y ) ){
            var out = false;
            for( tri in triArr ){
                if( tri.hit( x, y ) ){
                    out = true;
                    break;
                }
            }
            out;
        } else {
            false;
        }
    }
}