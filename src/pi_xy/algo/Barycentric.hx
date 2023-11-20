package pi_xy.algo;

import pi_xy.iter.BoundIterator;
import pi_xy.iter.IteratorRange;
import pi_xy.algo.GeomPix;

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
        dot12 = dot( bcx, bcy, acx, acy );  // <- for details see pi_xy.algo.GeomPix
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
        var pcx = x - cx;
        var pcy = y - cy;
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
    inline
    public function medianABx(): Float {
        return ( ax + bx ) / 2;
    }
    inline
    public function medianBCx(): Float {
        return ( bx + cx ) / 2;
    }
    inline
    public function medianCAx(): Float {
        return ( cx + ax ) / 2;
    }
    inline
    public function medianABy(): Float {
        return ( ay + by ) / 2;
    }
    inline
    public function medianBCy(): Float {
        return ( by + cy ) / 2;
    }
    inline
    public function medianCAy(): Float {
        return ( cy + ay ) / 2;
    }
    public inline
    function scaled( scaleA: Float, scaleB: Float, scaleC: Float ): Barycentric {
        var x0 = 0.;
        var y0 = 0.;
        var isScaledA = scaleA != 1.;
        var isScaledB = scaleB != 1.;
        var isScaledC = scaleC != 1.;
        switch( [ isScaledA, isScaledB, isScaledC ] ){
            case [ false, false, false ]:
                x0 = centroidX;
                y0 = centroidY;
            case [ false, false, true ]:
                x0 = medianABx();
                y0 = medianABy();
            case [ false, true, false ]:
                x0 = medianCAx();
                y0 = medianCAy();
            case [ false, true, true ]:
                x0 = this.ax;
                y0 = this.ay;
            case [ true, false, false ]:
                x0 = medianBCx();
                y0 = medianBCy(); 
            case [ true, false, true ]:
                x0 = this.bx;
                y0 = this.by;
            case [ true, true, false ]:
                x0 = this.cx;
                y0 = this.cy;
            case [ true, true, true ]:
                x0 = centroidX;
                y0 = centroidY;
        }
        
        var ax_ = ( isScaledA )? scalePoint( ax, scaleA, x0 ): ax;
        var ay_ = ( isScaledA )? scalePoint( ay, scaleA, y0 ): ay;
        var bx_ = ( isScaledB )? scalePoint( bx, scaleB, x0 ): bx;
        var by_ = ( isScaledB )? scalePoint( by, scaleB, y0 ): by;
        var cx_ = ( isScaledC )? scalePoint( cx, scaleC, x0 ): cx;
        var cy_ = ( isScaledC )? scalePoint( cy, scaleC, y0 ): cy;

        
        return ({ ax: ax_, ay: ay_
                , bx: bx_, by: by_
                , cx: cx_, cy: cy_ }: Barycentric    );
    }
    inline function scalePoint( point: Float, scale: Float, centre: Float ){
        point -= centre;
        point *= scale;
        point += centre;
        return point;
    }
}