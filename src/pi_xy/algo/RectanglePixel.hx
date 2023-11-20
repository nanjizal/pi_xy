package pi_xy.algo;

import pi_xy.Pixelimage;
import pi_xy.pixel.Pixel32;
import pi_xy.algo.GeomPix;

// no rotation option yet
inline 
function fillRadialRect( pixelimage: Pixelimage
                       , x:   Float, y: Float
                       , wid: Float, hi: Float 
                       , colorIn: Pixel32, colorOut: Pixel32
                       , ?gx: Float = 0,  ?gy: Float = 0
                       , ?edgePoints: Int = 4 ){
    if( edgePoints < 4 ) edgePoints = 4;
    if( gx < -1. ) gx = -1;
    if( gx > 1. )  gx = 1;
    if( gy < -1. ) gy = -1.;
    if( gy > 1. )  gy = 1;
    // centre point + g * radius 
    var mx = x + wid/2 + gx*wid/2;
    var my = y + hi/2 + gy*hi/2;
    var bx = x + wid;
    var cy = y + hi;
    var l = edgePoints;
    // top
    var lastX = x;
    var lastY = y;
    var nextX: Float;
    var nextY: Float;
    var gap = wid/l;
                        
    //  top edge
    for( i in 1...l - 2 ){
        nextX = x + gap*i;
        nextY = y;
        pixelimage.gradientShape.triangle( mx, my, colorIn, lastX, lastY, colorOut, nextX, nextY, colorOut );
        lastX = nextX;
        lastY = nextY;
    }
    pixelimage.gradientShape.triangle( mx, my, colorIn, lastX, lastY, colorOut, bx, y, colorOut );
    // right edge
    lastX = bx;
    lastY = y;
    gap = hi/l;
    for( i in 1...l - 2 ){
        nextX = bx;
        nextY = y + gap*i;
        pixelimage.gradientShape.triangle( mx, my, colorIn, lastX, lastY, colorOut, nextX, nextY, colorOut );
        lastX = nextX;
        lastY = nextY;
    }
    pixelimage.gradientShape.triangle( mx, my, colorIn, lastX, lastY, colorOut, bx, cy, colorOut );
    // bottom edge
    lastX = bx;
    lastY = cy;
    gap = wid/l;
    for( i in 1...l - 2 ){
        nextX = bx - gap*i;
        nextY = cy;
        pixelimage.gradientShape.triangle( mx, my, colorIn, lastX, lastY, colorOut, nextX, nextY, colorOut );
        lastX = nextX;
        lastY = nextY;
    }
    pixelimage.gradientShape.triangle( mx, my, colorIn, lastX, lastY, colorOut, x, cy, colorOut );
    
    // left edge
    lastX = x;
    lastY = cy;
    gap = wid/l;
    for( i in 1...l - 2 ){
        nextX = x;
        nextY = cy - gap*i;
        pixelimage.gradientShape.triangle( mx, my, colorIn, lastX, lastY, colorOut, nextX, nextY, colorOut );
        lastX = nextX;
        lastY = nextY;
    }
    pixelimage.gradientShape.triangle( mx, my, colorIn, lastX, lastY, colorOut, x, y, colorOut );
    
}

class RectanglePixel{
    /**
       <font color="LightPink" font-weight:"Bold">fillRadialRect</font> module level field
    **/
    public var _fillRadialRect:( pixelimage: Pixelimage
        , x:   Float, y: Float
        , wid: Float, hi: Float 
        , colorIn: Pixel32, colorOut: Pixel32
        , ?gx: Float,  ?gy: Float
        , ?edgePoints: Int ) -> Void = fillRadialRect;
}