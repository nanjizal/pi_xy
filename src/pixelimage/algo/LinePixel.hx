package pixelimage.algo;

import pixelimage.Pixelimage;
import pixelimage.pixel.Pixel32;
import pixelimage.algo.GeomPix;
import pixelimage.algo.QuadPixel;

inline
function rotateLine( pixelImage: Pixelimage
                   , px: Float, py: Float
                   , thick: Float, h: Float
                   , theta: Float, color: Int
                   , hasHit: Bool = false
                   , ?debugCorners: Bool = false ): Null<HitQuad> {
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
        pixelImage.fillSquare( ax, ay, 12, 0xFFFF0000 );
        pixelImage.fillSquare( bx, by, 12, 0xFF00FF00 );
        pixelImage.fillSquare( cx, cy, 12, 0xFF0000ff );
        pixelImage.fillSquare( dx, dy, 12, 0xFFF000F0 );
    }
    return fillQuadrilateral( pixelImage, ax, ay, bx, by, cx, cy, dx, dy, color, hasHit );
}

inline
function rotateLineFlare( pixelImage: Pixelimage
                   , px: Float, py: Float
                   , thick1: Float, thick2: Float, h: Float
                   , theta: Float, color: Int
                   , hasHit: Bool = false ): Null<HitQuad> {
    var sin = Math.sin( theta );
    var cos = Math.cos( theta );
    var radius1 = thick1/2;
    var radius2 = thick2/2;
    var dx = 0.1;
    var dy = radius1;
    var cx = h;
    var cy = radius2;
    var bx = h;
    var by = -radius2;
    var ax = 0.1;
    var ay = -radius1;
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
    return fillQuadrilateral( pixelImage, ax, ay, bx, by, cx, cy, dx, dy, color, hasHit );
}


inline
function rotateTileLine( pixelImage: Pixelimage
                   , px: Float, py: Float
                   , thick: Float, h: Float
                   , theta: Float, tileImage: Pixelimage
                   , hasHit: Bool = false
                   , ?debugCorners: Bool = false ): Null<HitQuad>{
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
        pixelImage.fillSquare( ax, ay, 12, 0xFFFF0000 );
        pixelImage.fillSquare( bx, by, 12, 0xFF00FF00 );
        pixelImage.fillSquare( cx, cy, 12, 0xFF0000ff );
        pixelImage.fillSquare( dx, dy, 12, 0xFFF000F0 );
    }
    return tileQuadrilateral( pixelImage, ax, ay, bx, by, cx, cy, dx, dy, tileImage, hasHit );
}

inline
function rotateTileLineFlare( pixelImage: Pixelimage
                   , px: Float, py: Float
                   , thick1: Float, thick2: Float, h: Float
                   , theta: Float, tileImage: Pixelimage
                   , hasHit: Bool = false
                   ): Null<HitQuad>{
    var sin = Math.sin( theta );
    var cos = Math.cos( theta );
    var radius1 = thick1/2;
    var radius2 = thick2/2;
    var dx = 0.1;
    var dy = radius1;
    var cx = h;
    var cy = radius2;
    var bx = h;
    var by = -radius2;
    var ax = 0.1;
    var ay = -radius1;
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
    return tileQuadrilateral( pixelImage, ax, ay, bx, by, cx, cy, dx, dy, tileImage, hasHit );
}

inline
function rotateGradLine( pixelImage: Pixelimage
                       , px: Float, py: Float
                       , thick: Float, h: Float
                       , theta: Float
                       , colorA: Pixel32, colorB: Pixel32, colorC: Pixel32, colorD: Pixel32
                       , hasHit: Bool = false
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
        pixelImage.fillSquare( ax, ay, 12, colorA );
        pixelImage.fillSquare( bx, by, 12, colorB );
        pixelImage.fillSquare( cx, cy, 12, colorC );
        pixelImage.fillSquare( dx, dy, 12, colorD );
    }
    return fillGradQuadrilateral( pixelImage, ax, ay, colorA, bx, by, colorB, cx, cy, colorC, dx, dy, colorD, hasHit );
}

inline
function rotateGradLineFlare( pixelImage: Pixelimage
                       , px: Float, py: Float
                       , thick1: Float, thick2: Float
                       , h: Float, theta: Float
                       , colorA: Pixel32, colorB: Pixel32, colorC: Pixel32, colorD: Pixel32
                       , hasHit: Bool = false
                       ){
    var sin = Math.sin( theta );
    var cos = Math.cos( theta );
    var radius1 = thick1/2;
    var radius2 = thick2/2;
    var dx = 0.1;
    var dy = radius1;
    var cx = h;
    var cy = radius2;
    var bx = h;
    var by = -radius2;
    var ax = 0.1;
    var ay = -radius1;
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

    return fillGradQuadrilateral( pixelImage, ax, ay, colorA, bx, by, colorB, cx, cy, colorC, dx, dy, colorD, hasHit );
}

class LinePixel {
    /**
       <font color="LightPink" font-weight:"Bold">rotateLine</font> module level field
       @param hasHit defaults false, since a HitTri has runtime overhead.
    **/
    public var _rotateLine:( pixelImage: Pixelimage
        , px: Float, py: Float
        , thick: Float, h: Float
        , theta: Float, color: Int
        , hasHit: Bool
        , debugCorners: Bool ) -> Null<HitQuad> = rotateLine;

    /**
       <font color="LightPink" font-weight:"Bold">rotateTileLine</font> module level field
       @param hasHit defaults false, since a HitTri has runtime overhead.
    **/
    public var _rotateTileLine:( pixelImage: Pixelimage
        , px: Float, py: Float
        , thick: Float, h: Float
        , theta: Float, tileImage: Pixelimage
        , hasHit: Bool
        , ?debugCorners: Bool ) -> Null<HitQuad> = rotateTileLine;

    /**
       <font color="LightPink" font-weight:"Bold">rotateGradLine</font> module level field
       @param hasHit defaults false, since a HitTri has runtime overhead.
    **/
    public var _rotateGradLine:( pixelImage: Pixelimage
        , px: Float, py: Float
        , thick: Float, h: Float
        , theta: Float
        , colorA: Pixel32, colorB: Pixel32, colorC: Pixel32, colorD: Pixel32
        , hasHit: Bool
        , ?debugCorners: Bool )->Null<HitQuad> = rotateGradLine;
}