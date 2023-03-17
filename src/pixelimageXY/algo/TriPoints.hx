package pixelimageXY.algo;
import pixelimageXY.algo.GeomPix;
import pixelimageXY.algo.HitTri;

@:structInit
class TriPoints_{
    public var ax: Float;
    public var ay: Float;
    public var bx: Float;
    public var by: Float;
    public var cx: Float;
    public var cy: Float;
    public inline
    function new( ax: Float
                , ay: Float
                , bx: Float
                , by: Float
                , cx: Float
                , cy: Float ){
        var adjustWinding = ( (ax * by - bx * ay) + (bx * cy - cx * by) + (cx * ay - ax * cy) )>0;
        if( !adjustWinding ){
            var bx_ = bx;
            var by_ = by;
            bx = cx;
            by = cy;
            cx = bx_;
            cy = by_;
        }
        this.ax = ax;
        this.ay = ay;
        this.bx = bx;
        this.by = by;
        this.cx = cx;
        this.cy = cy;
    }
}
@:forward
@:transitive
abstract TriPoints( TriPoints_ ) from TriPoints_ to TriPoints_ {
    public inline 
    function new( tp: TriPoints_ ){
        this = tp;
    }
    public inline
    function rotate( theta: Float, centreX: Float, centreY: Float ){
        var sin = Math.sin( theta );
        var cos = Math.cos( theta );
        
        this.ax -= centreX;
        this.ay -= centreY;
        this.bx -= centreX;
        this.by -= centreY;
        this.cx -= centreX;
        this.cy -= centreY;

        var temp = 0.;
        temp = centreX + rotX( this.ax, this.ay, sin, cos );
        this.ay = centreY + rotY( this.ax, this.ay, sin, cos );
        this.ax = temp;
                   
        temp = centreX + rotX( this.bx, this.by, sin, cos );
        this.by = centreY + rotY( this.bx, this.by, sin, cos );
        this.bx = temp;
    
        temp = centreX + rotX( this.cx, this.cy, sin, cos );
        this.cy = centreY + rotY( this.cx, this.cy, sin, cos );
        this.cx = temp;
    }
    public inline
    function getHit( preCalculated: Bool = true ): HitTri {
        // need to adjust this so does not recalculate adjustWinding... 
        return new HitTri( this.ax, this.ay, this.bx, this.by, this.cx, this.cy, preCalculated );
    }
}