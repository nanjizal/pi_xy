package pixelimage.algo;

import pixelimage.Pixelimage;
import pixelimage.pixel.Pixel32;
import pixelimage.algo.GeomPix;

inline
function rotateLine( pixelimage: Pixelimage
                   , px: Float, py: Float
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
        pixelimage.fillSquare( ax, ay, 12, 0xFFFF0000 );
        pixelimage.fillSquare( bx, by, 12, 0xFF00FF00 );
        pixelimage.fillSquare( cx, cy, 12, 0xFF0000ff );
        pixelimage.fillSquare( dx, dy, 12, 0xFFF000F0 );
    }
    pixelimage.fillQuad( ax, ay, bx, by, cx, cy, dx, dy, color );
    return { ax: ax, ay: ay, bx: bx, by: by, cx: cx, cy: cy, dx: dx, dy: dy };
}

inline
function rotateTileLine( pixelimage: Pixelimage
                   , px: Float, py: Float
                   , thick: Float, h: Float
                   , theta: Float, srcImage: Pixelimage
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
        pixelimage.fillSquare( ax, ay, 12, 0xFFFF0000 );
        pixelimage.fillSquare( bx, by, 12, 0xFF00FF00 );
        pixelimage.fillSquare( cx, cy, 12, 0xFF0000ff );
        pixelimage.fillSquare( dx, dy, 12, 0xFFF000F0 );
    }
    pixelimage.tileQuad( ax, ay, bx, by, cx, cy, dx, dy, srcImage );
    return { ax: ax, ay: ay, bx: bx, by: by, cx: cx, cy: cy, dx: dx, dy: dy };
}

inline
function rotateGradLine( pixelimage: Pixelimage
                       , px: Float, py: Float
                       , thick: Float, h: Float
                       , theta: Float
                       , colorA: Pixel32, colorB: Pixel32, colorC: Pixel32, colorD: Pixel32
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
        pixelimage.fillSquare( ax, ay, 12, colorA );
        pixelimage.fillSquare( bx, by, 12, colorB );
        pixelimage.fillSquare( cx, cy, 12, colorC );
        pixelimage.fillSquare( dx, dy, 12, colorD );
    }
    pixelimage.fillGradQuad( ax, ay, colorA, bx, by, colorB, cx, cy, colorC, dx, dy, colorD );
    return { ax: ax, ay: ay, bx: bx, by: by, cx: cx, cy: cy, dx: dx, dy: dy };

}