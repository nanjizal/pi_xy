package pixelimageXY.algo;

import pixelimageXY.algo.TriPixel;
import pixelimageXY.Pixelimage;

    // phi controls rotation
    // cornerUp is to rotate the structure before phi so top is flat.
    inline
    function fillPolygonBuild( pixelimage: Pixelimage
                            , cx: Float,  cy: Float
                            , rx: Float,  ry: Float
                            , color: Int, ?phi: Float = 0.
                            , ?sides: Int = 36, cornerUp: Bool = true ){
        var theta = 2*Math.PI/sides;
        var omega = if( cornerUp ){
             0.;
        } else {
            // allow top the be flat
            if( Std.int( sides/2) == sides/2 ){
                Math.PI/sides;
            } else {
                var v = (sides/2-0.5);
                if( Std.int( v/2 ) == v/2 ){
                    0.5*Math.PI/sides - Math.PI;
                } else {
                    0.5*Math.PI/sides;
                }
                
            }
        }
        // can be solved by including edges .. not implemented yet
        var lastX: Float = 0.;
        var lastY: Float = 0.;
        if( phi != 0 ){
            lastX = rx * Math.cos( sides*theta  + omega) * Math.cos( phi ) - ry * Math.sin( sides*theta + omega ) * Math.sin( phi ) + cx;
            lastY = rx * Math.cos( sides*theta  + omega ) * Math.sin( phi ) + ry * Math.sin( sides*theta + omega ) * Math.cos( phi ) + cy;
        } else {
            lastX = cx + rx*Math.cos( sides*theta + omega );
            lastY = cy + ry*Math.sin( sides*theta + omega );
        }
        if( phi != 0 ){
            var cphi = Math.cos( phi );
            var sphi = Math.sin( phi );
            for( i in 0...sides + 1 ){
                var stheta = Math.sin( i*theta + omega + 0.01 );
                var ctheta = Math.cos( i*theta + omega + 0.01 );
                var nextX = rx * ctheta * cphi - ry * stheta * sphi + cx;
                var nextY = rx * ctheta * sphi + ry * stheta * cphi + cy;
                pixelimage.fillShape.triangle( cx, cy, lastX, lastY, nextX, nextY, color );
                
                lastX = nextX;
                lastY = nextY;
            }
        } else { 
            for( i in 0...sides + 1 ){
                var nextX = cx + rx*Math.cos( i*theta + omega +0.01 );
                var nextY = cy + ry*Math.sin( i*theta + omega +0.01 );
                pixelimage.fillShape.triangle( cx, cy, lastX, lastY, nextX, nextY, color );
                lastX = nextX;
                lastY = nextY;
            }
        }
    }

    // phi controls rotation
    // cornerUp is to rotate the structure before phi so top is flat.
    // provides a softer outline 
    inline
    function softFillPolygonBuild( pixelimage: Pixelimage
                            , cx: Float,  cy: Float
                            , rx: Float,  ry: Float
                            , color: Int, ?phi: Float = 0.
                            , ?sides: Int = 36, softC: Float = 10, cornerUp: Bool = true ){
        var theta = 2*Math.PI/sides;
        var omega = if( cornerUp ){
             0.;
        } else {
            // allow top the be flat
            if( Std.int( sides/2) == sides/2 ){
                Math.PI/sides;
            } else {
                var v = (sides/2-0.5);
                if( Std.int( v/2 ) == v/2 ){
                    0.5*Math.PI/sides - Math.PI;
                } else {
                    0.5*Math.PI/sides;
                }
                
            }
        }
        // can be solved by including edges .. not implemented yet
        var lastX: Float = 0.;
        var lastY: Float = 0.;
        if( phi != 0 ){
            lastX = rx * Math.cos( sides*theta  + omega) * Math.cos( phi ) - ry * Math.sin( sides*theta + omega ) * Math.sin( phi ) + cx;
            lastY = rx * Math.cos( sides*theta  + omega ) * Math.sin( phi ) + ry * Math.sin( sides*theta + omega ) * Math.cos( phi ) + cy;
        } else {
            lastX = cx + rx*Math.cos( sides*theta + omega );
            lastY = cy + ry*Math.sin( sides*theta + omega );
        }
        if( phi != 0 ){
            var cphi = Math.cos( phi );
            var sphi = Math.sin( phi );
            for( i in 0...sides + 1 ){
                var stheta = Math.sin( i*theta + omega + 0.01 );
                var ctheta = Math.cos( i*theta + omega + 0.01 );
                var nextX = rx * ctheta * cphi - ry * stheta * sphi + cx;
                var nextY = rx * ctheta * sphi + ry * stheta * cphi + cy;
                fillTriSoftC( pixelimage, cx, cy, lastX, lastY, nextX, nextY, color, softC );
                lastX = nextX;
                lastY = nextY;
            }
        } else { 
            for( i in 0...sides + 1 ){
                var nextX = cx + rx*Math.cos( i*theta + omega +0.01 );
                var nextY = cy + ry*Math.sin( i*theta + omega +0.01 );
                //pixelimage.fillTri( cx, cy, lastX, lastY, nextX, nextY, color );
                fillTriSoftC( pixelimage, cx, cy, lastX, lastY, nextX, nextY, color, softC );
                lastX = nextX;
                lastY = nextY;
            }
        }
    }

    // phi controls rotation
    // cornerUp is to rotate the structure before phi so top is flat.
    inline
    function tilePolygonBuild( pixelimage: Pixelimage
                            , cx: Float,  cy: Float
                            , rx: Float,  ry: Float
                            , tileImage: Pixelimage, ?phi: Float = 0.
                            , ?sides: Int = 36, cornerUp: Bool = true ){
        var theta = 2*Math.PI/sides;
        var omega = if( cornerUp ){
             0.;
        } else {
            // allow top the be flat
            if( Std.int( sides/2) == sides/2 ){
                Math.PI/sides;
            } else {
                var v = (sides/2-0.5);
                if( Std.int( v/2 ) == v/2 ){
                    0.5*Math.PI/sides - Math.PI;
                } else {
                    0.5*Math.PI/sides;
                }
                
            }
        }
        // can be solved by including edges .. not implemented yet
        var lastX: Float = 0.;
        var lastY: Float = 0.;
        if( phi != 0 ){
            lastX = rx * Math.cos( sides*theta  + omega) * Math.cos( phi ) - ry * Math.sin( sides*theta + omega ) * Math.sin( phi ) + cx;
            lastY = rx * Math.cos( sides*theta  + omega ) * Math.sin( phi ) + ry * Math.sin( sides*theta + omega ) * Math.cos( phi ) + cy;
        } else {
            lastX = cx + rx*Math.cos( sides*theta + omega );
            lastY = cy + ry*Math.sin( sides*theta + omega );
        }
        if( phi != 0 ){
            var cphi = Math.cos( phi );
            var sphi = Math.sin( phi );
            for( i in 0...sides + 1 ){
                var stheta = Math.sin( i*theta + omega + 0.01 );
                var ctheta = Math.cos( i*theta + omega + 0.01 );
                var nextX = rx * ctheta * cphi - ry * stheta * sphi + cx;
                var nextY = rx * ctheta * sphi + ry * stheta * cphi + cy;
                pixelimage.tileShape.triangle( cx, cy, lastX, lastY, nextX, nextY, tileImage );
                lastX = nextX;
                lastY = nextY;
            }
        } else { 
            for( i in 0...sides + 1 ){
                var nextX = cx + rx*Math.cos( i*theta + omega + 0.01 );
                var nextY = cy + ry*Math.sin( i*theta + omega + 0.01 );
                pixelimage.tileShape.triangle( cx, cy, lastX, lastY, nextX, nextY, tileImage );
                lastX = nextX;
                lastY = nextY;
            }
        }
    }

    // phi controls rotation
    // cornerUp is to rotate the structure before phi so top is flat.
    inline
    function fillRadialPolyBuild( pixelimage: Pixelimage
                                , cx: Float,  cy: Float
                                , rx: Float,  ry: Float
                                , colorIn: Int, colorOut: Int
                                , ?gx: Float = 0,  ?gy: Float = 0 // gradient centre
                                , ?phi: Float = 0.
                                , ?sides: Int = 36, cornerUp: Bool = true ){
        if( gx < -1. ) gx = -1;
        if( gx > 1. )  gx = 1;
        if( gy < -1. ) gy = -1.;
        if( gy > 1. )  gy = 1;
        // centre point + g * radius 
        var mx = cx + gx*rx;
        var my = cy + gy*ry;
        var theta = 2*Math.PI/sides;
        var omega = if( cornerUp ){
             0.;
        } else {
            // allow top the be flat
            if( Std.int( sides/2) == sides/2 ){
                Math.PI/sides;
            } else {
                var v = (sides/2-0.5);
                if( Std.int( v/2 ) == v/2 ){
                    0.5*Math.PI/sides - Math.PI;
                } else {
                    0.5*Math.PI/sides;
                }
                
            }
        }
        // can be solved by including edges .. not implemented yet
        var lastX: Float = 0.;
        var lastY: Float = 0.;
        if( phi != 0 ){
            lastX = rx * Math.cos( sides*theta  + omega) * Math.cos( phi ) - ry * Math.sin( sides*theta + omega ) * Math.sin( phi ) + cx;
            lastY = rx * Math.cos( sides*theta  + omega ) * Math.sin( phi ) + ry * Math.sin( sides*theta + omega ) * Math.cos( phi ) + cy;
        } else {
            lastX = cx + rx*Math.cos( sides*theta + omega );
            lastY = cy + ry*Math.sin( sides*theta + omega );
        }
        if( phi != 0 ){
            var cphi = Math.cos( phi );
            var sphi = Math.sin( phi );
            for( i in 0...sides + 1 ){
                var stheta = Math.sin( i*theta + omega );
                var ctheta = Math.cos( i*theta + omega );
                var nextX = rx * ctheta * cphi - ry * stheta * sphi + cx;
                var nextY = rx * ctheta * sphi + ry * stheta * cphi + cy;
                pixelimage.gradientShape.triangle( mx, my, colorIn, lastX, lastY, colorOut, nextX, nextY, colorOut );
                lastX = nextX;
                lastY = nextY;
            }
        } else { 
            for( i in 0...sides + 1 ){
                var nextX = cx + rx*Math.cos( i*theta + omega );
                var nextY = cy + ry*Math.sin( i*theta + omega );
                pixelimage.gradientShape.triangle( mx, my, colorIn, lastX, lastY, colorOut, nextX, nextY, colorOut );
                lastX = nextX;
                lastY = nextY;
            }
        }
    }

class PolyPixel {
    /**
       <font color="LightPink" font-weight:"Bold">fillPolygonBuild</font> module level field
    **/
    public var _fillPolygonBuild:( pixelimage: Pixelimage
        , cx: Float,  cy: Float
        , rx: Float,  ry: Float
        , color: Int, ?phi: Float
        , ?sides: Int, cornerUp: Bool )->Void = fillPolygonBuild;
    /**
       <font color="LightPink" font-weight:"Bold">tilePolygonBuild</font> module level field
    **/
    public var _tilePolygonBuild:( pixelimage: Pixelimage
        , cx: Float,  cy: Float
        , rx: Float,  ry: Float
        , tileImage: Pixelimage, ?phi: Float
        , ?sides: Int, cornerUp: Bool ) -> Void = tilePolygonBuild;
    /**
       <font color="LightPink" font-weight:"Bold">fillRadialPolyBuild</font> module level field
    **/
    public var _fillRadialPolyBuild:( pixelimage: Pixelimage
        , cx: Float,  cy: Float
        , rx: Float,  ry: Float
        , colorIn: Int, colorOut: Int
        , ?gx: Float,  ?gy: Float// gradient centre
        , ?phi: Float
        , ?sides: Int, cornerUp: Bool )-> Void = fillRadialPolyBuild;

}