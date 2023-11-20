package pi_xy.algo;

import pi_xy.iter.BoundIterator;
import pi_xy.iter.IteratorRange;
import pi_xy.algo.PentagonSampler;
import pi_xy.algo.Barycentric;

@:structInit
class SampleData {
    public var fractionTotal: Float;
    public var averageX:      Float;
    public var averageY:      Float;
    public var notHit:         Bool;
    public inline
    function new( fractionTotal: Float, averageX: Float, averageY: Float ){
        this.fractionTotal = fractionTotal;
        this.averageX      = averageX;
        this.averageY      = averageY;
        notHit = (fractionTotal == 0.);
    }
}
@:transient
@:forward
abstract HitTriScalar ( HitTri ) from HitTri {

    public var centroidX( get, never ): Float;
    inline function get_centroidX(): Float {
        return ( this.ax + this.bx + this.cx ) / 3;
    } 
    public var centroidY( get, never ): Float;
    inline function get_centroidY(): Float {
        return ( this.ay + this.by + this.cy ) / 3;
    } 
    public function medianABx(): Float {
        return ( this.ax + this.bx ) / 2;
    }
    public function medianBCx(): Float {
        return ( this.bx + this.cx ) / 2;
    }
    public function medianCAx(): Float {
        return ( this.cx + this.ax ) / 2;
    }
    public function medianABy(): Float {
        return ( this.ay + this.by ) / 2;
    }
    public function medianBCy(): Float {
        return ( this.by + this.cy ) / 2;
    }
    public function medianCAy(): Float {
        return ( this.cy + this.ay ) / 2;
    }
    public inline
    function scaled( scaleA: Float, scaleB: Float, scaleC: Float ): HitTriScalar {
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
        
        var ax_ = ( isScaledA )? scalePoint( this.ax, scaleA, x0 ): this.ax;
        var ay_ = ( isScaledA )? scalePoint( this.ay, scaleA, y0 ): this.ay;
        var bx_ = ( isScaledB )? scalePoint( this.bx, scaleB, x0 ): this.bx;
        var by_ = ( isScaledB )? scalePoint( this.by, scaleB, y0 ): this.by;
        var cx_ = ( isScaledC )? scalePoint( this.cx, scaleC, x0 ): this.cx;
        var cy_ = ( isScaledC )? scalePoint( this.cy, scaleC, y0 ): this.cy;

        
        return ({ ax: ax_, ay: ay_
                , bx: bx_, by: by_
                , cx: cx_, cy: cy_ }: HitTriScalar );
    }
    inline function scalePoint( point: Float, scale: Float, centre: Float ){
        point -= centre;
        point *= scale;
        point += centre;
        return point;
    }
    public inline
    function triangleSample( x: Float, y: Float ): SampleData {
        var x0 = TriangleSampler.x0;
        var y0 = TriangleSampler.y0;
        var x1 = TriangleSampler.x1;
        var y1 = TriangleSampler.y1;
        var x2 = TriangleSampler.x2;
        var y2 = TriangleSampler.y2;
        var averageX = 0.;
        var averageY = 0.;
        var hits = 0;
        var fractionTotal = 0.;
        var step = (1/3);
        if( this.hit( x + x0, y + y0 ) ){
            hits++;
            averageX += x0;
            averageY += y0;
            fractionTotal += step;
        }
        if( this.hit( x + x1, y + y1 ) ){
            hits++;
            averageX += x1;
            averageY += y1;
            fractionTotal += step;
        }
        if( this.hit( x + x2, y + y2 ) ){
            hits++;
            averageX += x2;
            averageY += y2;
            fractionTotal += step;
        }
        if( hits != 0 ){
            averageX = x + averageX/hits;
            averageY = y + averageY/hits;
        } else {
            averageX = x;
            averageY = y;
        }
        return ( { fractionTotal: fractionTotal
                 , averageX:      averageX
                 , averageY:      averageY
                 }: SampleData );
    }
    public inline
    function squareSample( x: Float, y: Float ): SampleData {
        var x0 = SquareSampler.x0;
        var y0 = SquareSampler.y0;
        var x1 = SquareSampler.x1;
        var y1 = SquareSampler.y1;
        var x2 = SquareSampler.x2;
        var y2 = SquareSampler.y2;
        var x3 = SquareSampler.x3;
        var y3 = SquareSampler.y3;
        var averageX = 0.;
        var averageY = 0.;
        var hits = 0;
        var fractionTotal = 0.;
        if( this.hit( x + x0, y + y0 ) ){
            hits++;
            averageX += x0;
            averageY += y0;
            fractionTotal += 0.25;
        }
        if( this.hit( x + x1, y + y1 ) ){
            hits++;
            averageX += x1;
            averageY += y1;
            fractionTotal += 0.25;
        }
        if( this.hit( x + x2, y + y2 ) ){
            hits++;
            averageX += x2;
            averageY += y2;
            fractionTotal += 0.25;
        }
        if( this.hit( x + x3, y + y3 ) ){
            hits++;
            averageX += x3;
            averageY += y3;
            fractionTotal += 0.25;
        }
        if( hits != 0 ){
            averageX = x + averageX/hits;
            averageY = y + averageY/hits;
        } else {
            averageX = x;
            averageY = y;
        }
        return ( { fractionTotal: fractionTotal
                 , averageX:      averageX
                 , averageY:      averageY 
                 }: SampleData );
    }
    public inline
    function pentagonSample( x: Float, y: Float ): SampleData {
        var x0 = PentagonSampler.x0;
        var y0 = PentagonSampler.y0;
        var x1 = PentagonSampler.x1;
        var y1 = PentagonSampler.y1;
        var x2 = PentagonSampler.x2;
        var y2 = PentagonSampler.y2;
        var x3 = PentagonSampler.x3;
        var y3 = PentagonSampler.y3;
        var x4 = PentagonSampler.x4;
        var y4 = PentagonSampler.y4;
        var averageX = 0.;
        var averageY = 0.;
        var hits = 0;
        var fractionTotal = 0.;
        if( this.hit( x + x0, y + y0 ) ){
            hits++;
            averageX += x0;
            averageY += y0;
            fractionTotal += 0.2;
        }
        if( this.hit( x + x1, y + y1 ) ){
            hits++;
            averageX += x1;
            averageY += y1;
            fractionTotal += 0.2;
        }
        if( this.hit( x + x2, y + y2 ) ){
            hits++;
            averageX += x2;
            averageY += y2;
            fractionTotal += 0.2;
        }
        if( this.hit( x + x3, y + y3 ) ){
            hits++;
            averageX += x3;
            averageY += y3;
            fractionTotal += 0.2;
        }
        if( this.hit( x + x4, y + y4 ) ){
            hits++;
            averageX += x4;
            averageY += y4;
            fractionTotal += 0.2;
        }
        if( hits != 0 ){
            averageX = x + averageX/hits;
            averageY = y + averageY/hits;
        } else {
            averageX = x;
            averageY = y;
        }
        return ( { fractionTotal: fractionTotal
                 , averageX:      averageX
                 , averageY:      averageY
                 }: SampleData );
    }
    public var barycentric( get, never ): Barycentric;
    inline 
    function get_barycentric(): Barycentric {
        return ( { ax: this.ax, ay: this.ay
                 , bx: this.bx, by: this.by
                 , cx: this.cx, cy: this.cy }: Barycentric );
    }
}