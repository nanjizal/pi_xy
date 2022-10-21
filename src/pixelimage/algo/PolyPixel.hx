package pixelimage.algo;

import pixelimage.Pixelimage;

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
                var stheta = Math.sin( i*theta + omega );
                var ctheta = Math.cos( i*theta + omega );
                var nextX = rx * ctheta * cphi - ry * stheta * sphi + cx;
                var nextY = rx * ctheta * sphi + ry * stheta * cphi + cy;
                pixelimage.fillTri( cx, cy, lastX, lastY, nextX, nextY, color );
                lastX = nextX;
                lastY = nextY;
            }
        } else { 
            for( i in 0...sides + 1 ){
                var nextX = cx + rx*Math.cos( i*theta + omega );
                var nextY = cy + ry*Math.sin( i*theta + omega );
                pixelimage.fillTri( cx, cy, lastX, lastY, nextX, nextY, color );
                lastX = nextX;
                lastY = nextY;
            }
        }
    }