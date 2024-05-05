package pi_xy.algo;
import pi_xy.algo.GeomPix;
import pi_xy.hit.HitQuad;

@:structInit
class LineInfo {
    public var px:    Float;
    public var py:    Float;
    public var thick: Float;
    public var long:  Float;
    public var theta: Float;
    public inline
    function new(   px: Float,   py: Float
                  , thick: Float, long: Float
                  , theta: Float ){
        this.px = px;
        this.py = py;
        this.thick = thick;
        this.long = long;
        this.theta = theta;
    }
}
@:structInit
class LineXYinfo {
    public var px: Float;
    public var py: Float;
    public var qx: Float;
    public var qy: Float;
    public var thick: Float;
    public inline
    function new( px: Float, py: Float, qx: Float, qy: Float, thick: Float ){
        this.px = px;
        this.py = py;
        this.qx = qx;
        this.qy = qy;
        this.thick = thick;
    }
}

@:structInit
class QuadPoints_{
    public var ax: Float;
    public var ay: Float;
    public var bx: Float;
    public var by: Float;
    public var cx: Float;
    public var cy: Float;
    public var dx: Float;
    public var dy: Float;
    public inline
    function new( ax: Float
                , ay: Float
                , bx: Float
                , by: Float
                , cx: Float
                , cy: Float
                , dx: Float
                , dy: Float ){
        this.ax = ax;
        this.ay = ay;
        this.bx = bx;
        this.by = by;
        this.cx = cx;
        this.cy = cy;
        this.dx = dx;
        this.dy = dy;
    }
}
@:forward
@:transitive
abstract QuadPoints( QuadPoints_ ) from QuadPoints_ to QuadPoints_ {
    public inline 
    function new( qp: QuadPoints_ ){
        this = qp;
    }
    @:from
    public static inline
    function fromLineXYinfo( lineXYinfo: LineXYinfo ): QuadPoints {
        var _ = lineXYinfo;
        var o = _.qy-_.py;
        var a = _.qx-_.px;
        var h = Math.pow( o*o + a*a, 0.5 );
        var theta = Math.atan2( o, a );
        return QuadPoints.fromLineInfo( new LineInfo( _.px, _.py, _.thick, h, theta ) );
    }
    @:from
    public static inline
    function fromLineInfo( lineInfo: LineInfo ): QuadPoints {
        var radius = lineInfo.thick/2;
        var dx = 0.1;
        var dy = radius;
        var cx = lineInfo.long;
        var cy = radius;
        var bx = lineInfo.long;
        var by = -radius;
        var ax = 0.1;
        var ay = -radius;
        var qp: QuadPoints = ( { ax: ax, ay: ay
                               , bx: bx, by: by
                               , cx: cx, cy: cy
                               , dx: dx, dy: dy }: QuadPoints_ );
        var sin = Math.sin( lineInfo.theta );
        var cos = Math.cos( lineInfo.theta );
        var centreX = lineInfo.px;
        var centreY = lineInfo.py;

        var temp = 0.;
        temp = centreX + rotX( qp.ax, qp.ay, sin, cos );
        qp.ay = centreY + rotY( qp.ax, qp.ay, sin, cos );
        qp.ax = temp;
                   
        temp = centreX + rotX( qp.bx, qp.by, sin, cos );
        qp.by = centreY + rotY( qp.bx, qp.by, sin, cos );
        qp.bx = temp;
    
        temp = centreX + rotX( qp.cx, qp.cy, sin, cos );
        qp.cy = centreY + rotY( qp.cx, qp.cy, sin, cos );
        qp.cx = temp;
    
        temp = centreX + rotX( qp.dx, qp.dy, sin, cos );
        qp.dy = centreY + rotY( qp.dx, qp.dy, sin, cos ); 
        qp.dx = temp;
        return qp;
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
        this.dx -= centreX;
        this.dy -= centreY;

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
    
        temp = centreX + rotX( this.dx, this.dy, sin, cos );
        this.dy = centreY + rotY( this.dx, this.dy, sin, cos ); 
        this.dx = temp;
    }
    public inline
    function getHit( preCalculated: Bool = true ): HitQuad {
        return new HitQuad( this.ax, this.ay
                          , this.bx, this.by
                          , this.cx, this.cy
                          , this.dx, this.dy
                          , preCalculated );
    }
}

