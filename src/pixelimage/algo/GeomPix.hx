package pixelimage.algo;

import pixelimage.pixel.Pixel32;
import pixelimage.pixel.PixelChannel;

// Module GeomPix

    // Ken Perlin smoothStep 
    inline 
    function smootherStep( t: Float ): Float {
        return t * t * t * (t * (t * 6.0 - 15.0) + 10.0);
    }
    inline 
    function lerp( a: Float, b: Float, t: Float ): Float
        return b + ( b - a ) * t;
    inline
    function lerp4Colors( colorhiA, colorhiB
                        , colorloC, colorloD
                        , u: Float, v: Float
                        , smooth: Bool = true ):Int {
        var hiColor = lerp2Colors( colorhiA, colorhiB, u, smooth );
        var loColor = lerp2Colors( colorloC, colorloD, u, smooth );
        return lerp2Colors( hiColor, loColor, v, smooth );
    }
    // HSL better, but this for initial test.
    inline
    function lerp2Colors( colA: Int, colB: Int, t: Float, smooth: Bool = true ): Int {
        var aA = ( colB >> 24 ) & 0xFF;
        var rA = ( colB >> 16 ) & 0xFF;
        var gA = ( colB >> 8 ) & 0xFF;
        var bA = colB & 0xFF;
        var aB = ( colA >> 24 ) & 0xFF;
        var rB = ( colA >> 16 ) & 0xFF;
        var gB = ( colA >> 8 ) & 0xFF;
        var bB = colA & 0xFF;
        var v = ( smooth )? smootherStep( t ): t;
        // check if values same.
        var af = lerp( aA/255, aB/255, v );
        var rf = lerp( rA/255, rB/255, v );
        var gf = lerp( gA/255, gB/255, v );
        var bf = lerp( bA/255, bB/255, v );
        return Pixel32.from_argb( af, rf, gf, bf );
    }

    inline
    function cross2d( ax: Float, ay: Float, bx: Float, by: Float ): Float
        return ax * by - ay * bx;
    inline
    function dot( ax: Float, ay: Float, bx: Float, by: Float ): Float
        return ax * bx + ay * by;
    inline
    function dotSame( ax: Float, ay: Float ): Float
        return dot( ax, ay, ax, ay );
    inline
    function distanceSquarePointToSegment( x:  Float, y: Float
                                         , x1: Float, y1:Float
                                         , x2: Float, y2:Float
                                         ): Float
    {
        var p1_p2_squareLength = (x2 - x1)*(x2 - x1) + (y2 - y1)*(y2 - y1);
        var dotProduct = ((x - x1)*(x2 - x1) + (y - y1)*(y2 - y1)) / p1_p2_squareLength;
        return if ( dotProduct < 0 ){
            return (x - x1)*(x - x1) + (y - y1)*(y - y1);
        } else if ( dotProduct <= 1 ){
            var p_p1_squareLength = (x1 - x)*(x1 - x) + (y1 - y)*(y1 - y);
            return p_p1_squareLength - dotProduct * dotProduct * p1_p2_squareLength;
        } else {
            return (x - x2)*(x - x2) + (y - y2)*(y - y2);
        }
    }
    inline
    function rotX( x: Float, y: Float, sin: Float, cos: Float ){
        return x * cos - y * sin;
    }
    inline
    function rotY( x: Float, y: Float, sin: Float, cos: Float ){
        return y * cos + x * sin;
    }