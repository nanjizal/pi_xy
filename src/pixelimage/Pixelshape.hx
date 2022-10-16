package pixelImage;
import pixelimage.Pixelimage;
@:transient
@:forward
abstract Pixelshape( Pixelimage ){
    inline
    public function new( w: Int, h: Int ){
        this = new Pixelimage( w, h );
    }
    public inline
    function rotX( x: Float, y: Float, sin: Float, cos: Float ){
        return x * cos - y * sin;
    }
    public inline
    function rotY( x: Float, y: Float, sin: Float, cos: Float ){
        return y * cos + x * sin;
    }
    public inline 
    function fillLine( px: Float, py: Float, qx: Float, qy: Float
                     , thick: Float, color: Int, ?debugCorners = false ){
        var o = qy-py;
        var a = qx-py;
        var h = Math.pow( o*o + a*a, 0.5 );
        var theta = Math.atan2( o, a );
        rotateLine( px, py, thick, h, theta, color, debugCorners );
    }
    public inline
    function rotateLine( px: Float, py: Float
                       , thick: Float, h: Float
                       , theta: Float, color: Int
                       , ?debugCorners: Bool = false ){
        var sin = Math.sin( theta );
        var cos = Math.cos( theta );
        var radius = thick/2;
        var dx = 0.1;
        var dy = radius;
        var cx = h;
        var cy = radius;
        var bx = h;
        var by = -radius;
        var ax = 0.1;
        var ay = -radius;
        var temp = 0.;
        temp = px + rotX( ax, ay, sin, cos );
        ay = py + rotY( ax, ay, sin, cos );
        ax = temp;
                   
        temp = px + rotX( bx, by, sin, cos );
        by = py + rotY( bx, by, sin, cos );
        bx = temp;

        temp = px + rotX( cx, cy, sin, cos );
        cy = py + rotY( cx, cy, sin, cos );
        cx = temp;

        temp = px + rotX( dx, dy, sin, cos );
        dy = py + rotY( dx, dy, sin, cos ); 
        dx = temp;
        /*
        trace( ax + ' ' + ay );
        trace( bx + ' ' + by );
        trace( cx + ' ' + cy );
        trace( dx + ' ' + dy );
        */
        if( debugCorners ){
            fillSquare( ax, ay, 12, 0xFFFF0000 );
            fillSquare( bx, by, 12, 0xFF00FF00 );
            fillSquare( cx, cy, 12, 0xFF0000ff );
            fillSquare( dx, dy, 12, 0xFFF000F0 );
        }
        fillQuad( ax, ay, bx, by, cx, cy, dx, dy, color );
    }
    public inline 
    function fillGradLine( px: Float, py: Float, qx: Float, qy: Float
                         , thick: Float
                         , colorA: Int, colorB: Int, colorC: Int, colorD: Int
                         , ?debugCorners = false ){
        var o = qy-py;
        var a = qx-py;
        var h = Math.pow( o*o + a*a, 0.5 );
        var theta = Math.atan2( o, a );
        rotateGradLine( px, py, thick, h, theta, colorA, colorB, colorC, colorD, debugCorners );
    }
    public inline
    function rotateGradLine( px: Float, py: Float
                           , thick: Float, h: Float
                           , theta: Float
                           , colorA: Int, colorB: Int, colorC: Int, colorD: Int
                           , ?debugCorners: Bool = false ){
        var sin = Math.sin( theta );
        var cos = Math.cos( theta );
        var radius = thick/2;
        var dx = 0.1;
        var dy = radius;
        var cx = h;
        var cy = radius;
        var bx = h;
        var by = -radius;
        var ax = 0.1;
        var ay = -radius;
        var temp = 0.;
        temp = px + rotX( ax, ay, sin, cos );
        ay = py + rotY( ax, ay, sin, cos );
        ax = temp;
                   
        temp = px + rotX( bx, by, sin, cos );
        by = py + rotY( bx, by, sin, cos );
        bx = temp;

        temp = px + rotX( cx, cy, sin, cos );
        cy = py + rotY( cx, cy, sin, cos );
        cx = temp;

        temp = px + rotX( dx, dy, sin, cos );
        dy = py + rotY( dx, dy, sin, cos ); 
        dx = temp;
        /*
        trace( ax + ' ' + ay );
        trace( bx + ' ' + by );
        trace( cx + ' ' + cy );
        trace( dx + ' ' + dy );
        */
        if( debugCorners ){
            fillSquare( ax, ay, 12, colorA );
            fillSquare( bx, by, 12, colorB );
            fillSquare( cx, cy, 12, colorC );
            fillSquare( dx, dy, 12, colorD );
        }
        fillGradQuad( ax, ay, colorA, bx, by, colorB, cx, cy, colorC, dx, dy, colorD );
    }
    /*
    // TODO: may remove.
    public inline
    function fillRect( x: Float, y: Float
                     , w: Float, h: Float
                     , color: Int, ?phi: Float = 0.
                     , ?debugCorners: Bool = false ) { 
        if( phi != 0. ){
            // need to tweak to get accurate offset..
            var cx = x + w/2;
            var cy = y + h/2;
            this.fillPolyBuild( x, y, w, h, color, phi, 4, false );
            //rotateLine( x, y, w, h, Math.PI/4, color );
        } else {
            this.simpleRect( x, y, w, h, color );
        }
	}
    */
    public inline
    function lineGrid( x: Float, y: Float, w: Float, h: Float, delta: Float, thick: Float, color: Int ){
        var h_ = Math.floor( h/delta )*delta;
        var w_ = Math.floor( w/delta )*delta;
        for( i in 0...Math.floor( w/delta )+1 ){
            this.simpleRect( x + i*delta -thick/2, y, thick, h_, color );
        }
        for( i in 0...Math.floor( h/delta )+1 ){
            this.simpleRect( x, y + i* delta - thick/2, w_, thick, color );
        }
    }
    public inline
    function fillSquare( x: Float, y: Float
                       , d: Float
                       , color: Int ) {
        this.simpleRect( x-d/2, y-d/2, d, d, color );
        //fillRect( x-d/2, y-d/2, d, d, color, phi );
    }
    /*
    public inline
    function fillDavidStar(x: Float, y: Float
                            , d: Float
                            , color: Int ) {
        fillSquare( x, y, d, color );
        fillRect( x, y, d*Math.pow(2,0.5), d*Math.pow(2,0.5), color, Math.PI/4 );
    }
    */
    public inline
    function fillQuad( ax: Float, ay: Float
                     , bx: Float, by: Float
                     , cx: Float, cy: Float
                     , dx: Float, dy: Float 
                     , color: Int ){
        // tri e - a b d
        // tri f - b c d
        this.fillTri( ax, ay, bx, by, dx, dy, color );
        this.fillTri( bx, by, cx, cy, dx, dy, color );
    }
    public inline
    function fillGradQuad( ax: Float, ay: Float, colorA: Int
                         , bx: Float, by: Float, colorB: Int
                         , cx: Float, cy: Float, colorC: Int 
                         , dx: Float, dy: Float, colorD: Int ){
        // tri e - a b d
        // tri f - b c d
        this.fillGradTri( ax, ay, colorA, bx, by, colorB, dx, dy, colorD );
        this.fillGradTri( bx, by, colorB, cx, cy, colorC, dx, dy, colorD );
    }
    @:access( pixelimage.Pixelimage.fillEllipseTri )
    public inline
    function fillCircle( cx: Float, cy: Float, r: Float, color: Int, ?phi: Float = 0 ){
        this.fillEllipseTri( cx, cy, r, r, color, phi );
    }
    @:access( pixelimage.Pixelimage.fillEllipseTri )
    public inline
    function fillEllipse( cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        this.fillEllipseTri( cx, cy, rx, ry, color, phi );
    }
    public inline
    function fillArrowHead( cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        this.fillPolyBuild( cx, cy, rx,  ry, color, phi, 3, false );
    } 
    public inline
    function fillPentagon( cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        this.fillPolyBuild( cx, cy, rx,  ry, color, phi, 5, false );
    }
    public inline 
    function fillHexagon( cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        this.fillPolyBuild( cx, cy, rx,  ry, color, phi, 6, false );
    }
    public inline
    function fillHeptagon( cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        this.fillPolyBuild( cx, cy, rx,  ry, color, phi, 7, false );
    }
    public inline
    function fillSeptagon( cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        this.fillPolyBuild( cx, cy, rx,  ry, color, phi, 7, false );
    }
    public inline
    function fillOctagon( cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        this.fillPolyBuild( cx, cy, rx,  ry, color, phi, 8, false );
    }
    public inline
    function fillNonagon( cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        this.fillPolyBuild( cx, cy, rx,  ry, color, phi, 9, false );
    }
    public inline
    function fillEnneagon( cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        this.fillPolyBuild( cx, cy, rx,  ry, color, phi, 9, false );
    }
    public inline
    function fillDecagon( cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        this.fillPolyBuild( cx, cy, rx,  ry, color, phi, 10, false );
    }
    public inline
    function fillHendecagon( cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        this.fillPolyBuild( cx, cy, rx,  ry, color, phi, 11, false );
    }
    public inline
    function fillUndecagon( cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        this.fillPolyBuild( cx, cy, rx,  ry, color, phi, 11, false );
    }
    public inline
    function fillDodecagon(cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        this.fillPolyBuild( cx, cy, rx,  ry, color, phi, 12, false );
    }


}
