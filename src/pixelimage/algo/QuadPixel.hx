
package pixelimage.algo;
import pixelimage.pixel.Pixel32;
import pixelimage.algo.TriPixel;
import pixelimage.algo.HitTri;

inline
function fillQuadrilateral( pixelImage: Pixelimage, ax: Float, ay: Float
                 , bx: Float, by: Float
                 , cx: Float, cy: Float
                 , dx: Float, dy: Float 
                 , color: Int
                 , hasHit: Bool = false ): Null<HitQuad>{
    // tri e - a b d
    // tri f - b c d
    fillTriangle( pixelImage, ax, ay, bx, by, dx, dy, color, hasHit );
    fillTriangle( pixelImage, bx, by, cx, cy, dx, dy, color, hasHit );
    return if( hasHit == true ){
        var v: HitQuad = { ax: ax, ay: ay, bx: bx, by: by, cx: cx, cy: cy, dx: dx, dy: dy };
        v;
    } else {
        null;
    }
}

inline
function tileQuadrilateral( pixelImage: Pixelimage, ax: Float, ay: Float
                 , bx: Float, by: Float
                 , cx: Float, cy: Float
                 , dx: Float, dy: Float 
                 , tileImage: Pixelimage
                 , hasHit: Bool = false ): Null<HitQuad>{
    // tri e - a b d
    // tri f - b c d
    tileTriangle( pixelImage, ax, ay, bx, by, dx, dy, tileImage, hasHit );
    tileTriangle( pixelImage, bx, by, cx, cy, dx, dy, tileImage, hasHit );
    return if( hasHit == true ){
        var v: HitQuad = { ax: ax, ay: ay, bx: bx, by: by, cx: cx, cy: cy, dx: dx, dy: dy };
        v;
    } else {
        null;
    }
}

inline
function fillGradQuadrilateral( pixelImage: Pixelimage
                                , ax: Float, ay: Float, colorA: Pixel32
                                , bx: Float, by: Float, colorB: Pixel32
                                , cx: Float, cy: Float, colorC: Pixel32 
                                , dx: Float, dy: Float, colorD: Pixel32
                                , hasHit: Bool = false ): Null<HitQuad>{
    // tri e - a b d
    // tri f - b c d
    fillGradTriangle( pixelImage, ax, ay, colorA, bx, by, colorB, dx, dy, colorD, hasHit );
    fillGradTriangle( pixelImage, bx, by, colorB, cx, cy, colorC, dx, dy, colorD );
    return if( hasHit == true ){
        var v: HitQuad = { ax: ax, ay: ay, bx: bx, by: by, cx: cx, cy: cy, dx: dx, dy: dy };
        v;
    } else {
        null;
    }
}

class QuadPixel {
    /**
       <font color="LightPink" font-weight:"Bold">rotateGradLine</font> module level field
       @param hasHit defaults false, since a HitTri has runtime overhead.
    **/
    public var _fillQuadrilateral:( pixelImage: Pixelimage, ax: Float, ay: Float
        , bx: Float, by: Float
        , cx: Float, cy: Float
        , dx: Float, dy: Float 
        , color: Int
        , hasHit: Bool ) -> Null<HitQuad> = fillQuadrilateral;
    /**
       <font color="LightPink" font-weight:"Bold">rotateGradLine</font> module level field
       @param hasHit defaults false, since a HitTri has runtime overhead.
    **/
    public var _tileQuadrilateral:( pixelImage: Pixelimage, ax: Float, ay: Float
        , bx: Float, by: Float
        , cx: Float, cy: Float
        , dx: Float, dy: Float 
        , tileImage: Pixelimage
        , hasHit: Bool ) -> Null<HitQuad> = tileQuadrilateral;
    /**
       <font color="LightPink" font-weight:"Bold">rotateGradLine</font> module level field
       @param hasHit defaults false, since a HitTri has runtime overhead.
    **/
    public var _fillGradQuadrilateral:( pixelImage: Pixelimage
        , ax: Float, ay: Float, colorA: Pixel32
        , bx: Float, by: Float, colorB: Pixel32
        , cx: Float, cy: Float, colorC: Pixel32 
        , dx: Float, dy: Float, colorD: Pixel32
        , hasHit: Bool ) -> Null<HitQuad> = fillGradQuadrilateral;
}

/*
    // NOT WORKING YET!!
    // inverse bilinear interpolation
    public inline 
    function fillGradQuad( ax: Float, ay: Float, colA: Int
                         , bx: Float, by: Float, colB: Int
                         , cx: Float, cy: Float, colC: Int
                         , dx: Float, dy: Float, colD: Int 
                         ){
        var ex = bx - ax;
        var ey = by - ay;
        var fx = dx - ax;
        var fy = dy - ay;
        var gx = ax - bx + cx - dx;
        var gy = ay - by + cy - dy;
        var ratioX: Float = 0.;
        var ratioY: Float = 0.;
        for( px in boundIterator4( ax, bx, cx, dx ) ){
            var hx = px - ax;
            for( py in boundIterator4( ay, by, cy, dy ) ){
                var hy = py - ay;
                var k2 = cross2d( gx, gy, fx, fy );
                var k1 = cross2d( ex, ey, fx, fy ) + cross2d( hx, hy, gx, gy );
                var k0 = cross2d( hx, hy, ex, ey );
                // if edges are parallel, this is a linear equation
                if( Math.abs( k2 ) < 0.001 ){
                    ratioX = ( hx * k1 + fx * k0 ) / ( ex * k1 - gx * k0 );
                    ratioY = -k0 / k1;
                } else {
                    var w = k1*k1 - 4.0*k0*k2;
                    if( w < 0.0 ){
                        // unsure
                        // return vec2(-1.0);  ??
                    } else {
                        w = Math.sqrt( w );
                        var ik2 = 0.5/k2;
                        var v = ( -k1 - w )*ik2;
                        var u = ( hx - fx * v ) / ( ex + gx * v );
                        if( u < 0.0 || u > 1.0 || v < 0.0 || v > 1.0 ){
                            v = ( -k1 + w )*ik2;
                            u = ( hx - fx * v )/( ex + gx * v );
                        } 
                        ratioX = u;
                        ratioY = v;       
                    }

                }
                var rgba = lerp4Colors( colA, colB, colC, colD, ratioX, ratioY );
                setARGB( px, py, rgba );
            }
        }
    }
    */
