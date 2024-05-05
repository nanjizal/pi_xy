package pi_xy.hit;

import pi_xy.hit.IhitObj;

@:structInit
class HitThinLine implements IhitObj {
    var epsilon: Float = 0.05;
    public var ax: Float;
    public var bx: Float;
    public var ay: Float;
    public var by: Float;
    var minX: Float;
    var maxX: Float;
    var minY: Float;
    var maxY: Float;
    public var undoImage: Null<Pixelimage> = null;
    public var undoX: Int;
    public var undoY: Int;
    inline
    public function new( ax: Float, ay: Float
                       , bx: Float, by: Float ){
        this.ax = ax;
        this.ay = ay;
        this.bx = bx;
        this.by = by;
        setMinMax();
    }
    inline 
    public function hit( x: Float, y: Float ): Bool {
        return if( isClose( minX, maxX ) ){
            equal( x, mean( ax, by ) );
        } else if( isClose( minY, maxY ) ){
            equal( y, mean( ay, by ) );
        } else {
            ( rectBoundsHit( x, y ) )? true: onDiagonal( x, y );
        }
    }
    inline
    function setMinMax(){
        if( ax < bx ){
            minX = ax;
            maxX = bx;
        } else {
            minX = bx;
            maxX = ax;
        }
        if( ay < by ){
            minY = ay;
            maxY = by;
        } else {
            minY = by;
            maxY = ay;
        }
    }
    inline 
    function equal( p: Float, q: Float ): Bool {
        var pq = p - q;
        pq =  pq < 0 ? pq * -1 : pq;
        return pq < epsilon;
    }
    inline
    function isClose( min: Float, max: Float ): Bool {
        return ( max - min ) < epsilon;
    }
    inline
    public function rectBoundsHit( x: Float, y: Float ): Bool {
        return( x > minX && x < maxX && y > minY && y < maxY );
    }
    inline
    function mean( p: Float, q: Float ): Float {
        return ( 0.5*( p + q ) );
    }
    inline
    function onDiagonal( x: Float, y: Float ): Bool {
        return ( ( y - ay ) * ( bx - ax ) - ( x - ax ) * ( by - ay ) ) < epsilon;
    }
}