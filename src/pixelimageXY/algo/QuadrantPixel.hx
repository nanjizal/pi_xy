package pixelimageXY.algo;

import pixelimageXY.Pixelimage;
import pixelimageXY.algo.CirclePixel;

    /**
     * fillQuadrant draws a quarter arc.
     * 
     **/
     inline
     function solidQuadrant( pixelimage: Pixelimage
                           , cx:    Float, cy: Float
                           , rx:    Float, ry: Float
                           , startAngle:   Float 
                           , color: Int, ?phi: Float, ?targetError: Float = 1.05 ){
         var sides = getSidesDivisible4( rx, ry, targetError );
         var theta = 2*Math.PI/sides;
         var omega = startAngle;
         var quarter = Std.int( sides/4 );
         var lastX: Float = 0.;
         var lastY: Float = 0.;
         if( phi != 0 ){
             lastX = rx * Math.cos( sides*theta + omega ) * Math.cos( phi ) - ry * Math.sin( sides*theta + omega ) * Math.sin( phi ) + cx;
             lastY = rx * Math.cos( sides*theta + omega ) * Math.sin( phi ) + ry * Math.sin( sides*theta + omega ) * Math.cos( phi ) + cy;
         } else {
             lastX = cx + rx*Math.cos( sides*theta + omega );
             lastY = cy + ry*Math.sin( sides*theta + omega );
         }
         if( phi != 0 ){
             var cphi = Math.cos( phi );
             var sphi = Math.sin( phi );
             for( i in 0...quarter+1){
                 var stheta = Math.sin( i*theta+0.0001 + omega );
                 var ctheta = Math.cos( i*theta+0.0001 + omega );
                 var nextX = rx * ctheta * cphi - ry * stheta * sphi + cx;
                 var nextY = rx * ctheta * sphi + ry * stheta * cphi + cy;
                 pixelimage.fillTri( cx, cy, lastX, lastY, nextX, nextY, color );
                 lastX = nextX;
                 lastY = nextY;
             }
         } else { 
             for( i in 0...quarter+1 ){
                 var nextX = cx + rx*Math.cos( i*theta + 0.0001 + omega );
                 var nextY = cy + ry*Math.sin( i*theta + 0.0001 + omega );
                 pixelimage.fillTri( cx, cy, lastX, lastY, nextX, nextY, color );
                 lastX = nextX;
                 lastY = nextY;
             }
         }
     }

    /**
     * fillQuadrant draws a quarter arc.
     * 
     **/
     inline
     function tileSolidQuadrant( pixelimage: Pixelimage
                           , cx:    Float, cy: Float
                           , rx:    Float, ry: Float
                           , startAngle:   Float 
                           , tileImage: Pixelimage, ?phi: Float
                           , ?targetError: Float = 1.05 ){
         var sides = getSidesDivisible4( rx, ry, targetError );
         var theta = 2*Math.PI/sides;
         var omega = startAngle;
         var quarter = Std.int( sides/4 );
         var lastX: Float = 0.;
         var lastY: Float = 0.;
         if( phi != 0 ){
             lastX = rx * Math.cos( sides*theta + omega ) * Math.cos( phi ) - ry * Math.sin( sides*theta + omega ) * Math.sin( phi ) + cx;
             lastY = rx * Math.cos( sides*theta + omega ) * Math.sin( phi ) + ry * Math.sin( sides*theta + omega ) * Math.cos( phi ) + cy;
         } else {
             lastX = cx + rx*Math.cos( sides*theta + omega );
             lastY = cy + ry*Math.sin( sides*theta + omega );
         }
         if( phi != 0 ){
             var cphi = Math.cos( phi );
             var sphi = Math.sin( phi );
             for( i in 0...quarter+1){
                 var stheta = Math.sin( i*theta+0.0001 + omega );
                 var ctheta = Math.cos( i*theta+0.0001 + omega );
                 var nextX = rx * ctheta * cphi - ry * stheta * sphi + cx;
                 var nextY = rx * ctheta * sphi + ry * stheta * cphi + cy;
                 pixelimage.tileTri( cx, cy, lastX, lastY, nextX, nextY, tileImage );
                 lastX = nextX;
                 lastY = nextY;
             }
         } else { 
             for( i in 0...quarter+1 ){
                 var nextX = cx + rx*Math.cos( i*theta + 0.0001 + omega );
                 var nextY = cy + ry*Math.sin( i*theta + 0.0001 + omega );
                 pixelimage.tileTri( cx, cy, lastX, lastY, nextX, nextY, tileImage );
                 lastX = nextX;
                 lastY = nextY;
             }
         }
     }