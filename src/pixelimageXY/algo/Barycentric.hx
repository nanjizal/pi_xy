package pixelimageXY.algo;

import pixelimageXY.iter.BoundIterator;
import pixelimageXY.iter.IteratorRange;
import pixelimageXY.algo.GeomPix;

@:structInit
class BarycentricCoordinates{
    public var ratioA: Float;
    public var ratioB: Float;
    public var ratioC: Float;
    public inline
    function new( ratioA: Float, ratioB: Float, ratioC: Float ){
        this.ratioA = ratioA;
        this.ratioB = ratioB;
        this.ratioC = ratioC;
    }
}
@:transient
@:forward
abstract BaryCoordinates( BarycentricCoordinates ) from BarycentricCoordinates{
    public inline
    function new( bary: BarycentricCoordinates ){
        this = bary;
    }
    public inline
    function inTriangle(){
        return this.ratioA >= 0 && this.ratioB >= 0 && this.ratioC >= 0;
    }
    public var min( get, never ): Float;
    inline
    function get_min(){
        var v = ( this.ratioA < this.ratioB )? this.ratioA: this.ratioB;
        return ( v < this.ratioC )? v: this.ratioC;
    }
    public var max( get, never ): Float;
    inline
    function get_max(){
        var v = ( this.ratioA > this.ratioB )? this.ratioA: this.ratioB;
        return ( v > this.ratioC )? v: this.ratioC;
    }
    public inline
    function isSoft( softAB: Bool, softBC: Bool, softCA: Bool ): Bool {
        var min_ = min;
        return switch( [ softAB, softBC, softCA ] ){
            case [ false, false, false ]:
                false;
            case [ false, false, true ]:
                min_ == this.ratioA;
            case [ false, true, false ]:
                min_ == this.ratioB;
            case [ false, true, true ]:
                min_ == this.ratioA || min == this.ratioB;
            case [ true, false, false ]:
                min_ == this.ratioC; 
            case [ true, false, true ]:
                min_ == this.ratioA || min == this.ratioC;
            case [ true, true, false ]:
                min_ == this.ratioB || min == this.ratioC;
            case [ true, true, true ]:
                true;
        }
    }
}
@:structInit
class Barycentric {
    public var ax: Float;
    public var ay: Float;
    public var bx: Float;
    public var by: Float;
    public var cx: Float;
    public var cy: Float;
    public var preCalculated: Bool;
    public var xIter3: IteratorRange;
    public var yIter3: IteratorRange;
    var bcx: Float;
    var bcy: Float;
    var acx: Float; 
    var acy: Float;
    var dot11: Float;
    var dot12: Float;
    var dot22: Float;
    var denom1: Float;

    public inline
    function new( ax: Float, ay: Float
                , bx: Float, by: Float
                , cx: Float, cy: Float, preCalculated: Bool = true ){
        this.ax = ax;
        this.ay = ay;
        this.bx = bx;
        this.by = by;
        this.cx = cx;
        this.cy = cy;
        this.preCalculated = preCalculated;
        if( preCalculated ){
            preCalculateValues();
        }
    }
    inline 
    public function preCalculateValues(){
        bcx = bx - cx;
        bcy = by - cy;
        acx = ax - cx; 
        acy = ay - cy;
        // Had to re-arrange algorithm to work so dot names may not quite make sense.
        dot11 = dotSame( bcx, bcy );
        dot12 = dot( bcx, bcy, acx, acy );  // <- for details see pixelimageXY.algo.GeomPix
        dot22 = dotSame( acx, acy );
        denom1 = 1/( dot11 * dot22 - dot12 * dot12 );
        xIter3 = boundIterator3( ax, bx, cx );
        yIter3 = boundIterator3( ay, by, cy );
    }
    public inline 
    function getInsideRatios( x: Float, y: Float ): BaryCoordinates {
        return if( xIter3.containsF( x ) && yIter3.containsF( y ) ){
                var bary = getRatios( x, y );
            if( bary.inTriangle() ){
                bary;
            } else {
                null;
            }
        } else {
            null;
        }
    }
    public inline
    function getRatios(x: Float, y: Float ): BaryCoordinates {
        var pcy = y - cy;
        var pcx = x - cx;
        var dot31  = dot( pcx, pcy, bcx, bcy );
        var dot32  = dot( pcx, pcy, acx, acy );
        var ratioA = (dot22 * dot31 - dot12 * dot32) * denom1;
        var ratioB = (dot11 * dot32 - dot12 * dot31) * denom1;
        var ratioC = 1.0 - ratioB - ratioA;
        return ( { ratioA: ratioA, ratioB: ratioB, ratioC: ratioC }: BaryCoordinates );
    }
    public var centroidX( get, never ): Float;
    inline function get_centroidX(): Float {
        return (ax+bx+cx)/3;
    } 
    public var centroidY( get, never ): Float;
    inline function get_centroidY(): Float {
        return (ay+by+cy)/3;
    }
}