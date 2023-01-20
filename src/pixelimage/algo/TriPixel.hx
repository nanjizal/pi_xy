package pixelimage.algo;
import pixelimage.iter.BoundIterator;
import pixelimage.iter.IteratorRange;
import pixelimage.algo.GeomPix;
import pixelimage.pixel.Pixel32;
import pixelimage.pixel.PixelChannel;
import pixelimage.algo.HitTri;

// TriPixel module
    /**
        provides a filled triangle give a,b,c coordinates
        automagically rearranges coordinates so it always renders
    **/
    inline
    function fillTriangle( pixelImage: Pixelimage, ax: Float, ay: Float
                    , bx: Float, by: Float
                    , cx: Float, cy: Float
                    , color: Pixel32
                    , hasHit: Bool = false ){
        var adjustWinding = ( (ax * by - bx * ay) + (bx * cy - cx * by) + (cx * ay - ax * cy) )>0;
        if( !adjustWinding ){// TODO: this is inverse of cornerContour needs thought, but provides required protection
            // swap b and c
            // probably wrong way as y is down?
            var bx_ = bx;
            var by_ = by;
            bx = cx;
            by = cy;
            cx = bx_;
            cy = by_;
        }
        return fillTriUnsafe( pixelImage, ax, ay, bx, by, cx, cy, color, hasHit );
    }

    inline 
    function fillTriUnsafe( pixelImage: Pixelimage
                          , ax: Float, ay: Float
                          , bx: Float, by: Float
                          , cx: Float, cy: Float
                          , color: Pixel32
                          , hasHit: Bool = false ): Null<HitTri>{
        var s0 = ay*cx - ax*cy;
        var sx = cy - ay;
        var sy = ax - cx;
        var t0 = ax*by - ay*bx;
        var tx = ay - by;
        var ty = bx - ax;
        var A = -by*cx + ay*(-bx + cx) + ax*(by - cy) + bx*cy; 
        var yIter3: IteratorRange = boundIterator3( ay, by, cy );
        var foundY = false;
        var s = 0.;
        var t = 0.;
        var sxx = 0.;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
        var txx = 0.;
        for( x in boundIterator3( ax, bx, cx ) ){
            sxx = sx*x;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
            txx = tx*x;
            foundY = false;
            for( y in yIter3 ){
                s = s0 + sxx + sy*y;
                t = t0 + txx + ty*y;
                if( s <= 0 || t <= 0 ){
                    // after filling break
                    if( foundY ) break;
                } else {
                    if( (s + t) < A ) {
                        // store first hit
                        pixelImage.setARGB( x, y, color );
                        foundY = true;
                    } else {
                        // after filling break
                        if( foundY ) break;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
                    }
                }
            }                                                                                                                                                                                                                                                                                                                                                                                                                                
        }
        return if( hasHit == true ){
            var v: HitTri = { ax: ax, ay: ay, bx: bx, by: by, cx: cx, cy: cy };
            v;
        } else {
            null;
        }
    }

    inline
    function tileTriangle( pixelImage: Pixelimage
                    , ax: Float, ay: Float
                    , bx: Float, by: Float
                    , cx: Float, cy: Float
                    , tileImage: Pixelimage
                    , hasHit:    Bool = false ):Null<HitTri>{
        var adjustWinding = ( (ax * by - bx * ay) + (bx * cy - cx * by) + (cx * ay - ax * cy) )>0;
        if( !adjustWinding ){// TODO: this is inverse of cornerContour needs thought, but provides required protection
            // swap b and c
            // probably wrong way as y is down?
            var bx_ = bx;
            var by_ = by;
            bx = cx;
            by = cy;
            cx = bx_;
            cy = by_;
        }
        return tileTriUnsafe( pixelImage, ax, ay, bx, by, cx, cy, tileImage, hasHit );
    }

    inline 
    function tileTriUnsafe( pixelimage: Pixelimage
                          , ax: Float, ay: Float
                          , bx: Float, by: Float
                          , cx: Float, cy: Float
                          , tileImage: Pixelimage
                          , hasHit: Bool = false ): Null<HitTri>{
        var s0 = ay*cx - ax*cy;
        var sx = cy - ay;
        var sy = ax - cx;
        var t0 = ax*by - ay*bx;
        var tx = ay - by;
        var ty = bx - ax;
        var A = -by*cx + ay*(-bx + cx) + ax*(by - cy) + bx*cy; 
        var yIter3: IteratorRange = boundIterator3( ay, by, cy );
        var foundY = false;
        var s = 0.;
        var t = 0.;
        var sxx = 0.;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
        var txx = 0.;
        for( x in boundIterator3( ax, bx, cx ) ){
            sxx = sx*x;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
            txx = tx*x;
            foundY = false;
            for( y in yIter3 ){
                s = s0 + sxx + sy*y;
                t = t0 + txx + ty*y;
                if( s <= 0 || t <= 0 ){
                    // after filling break
                    if( foundY ) break;
                } else {
                    if( (s + t) < A ) {
                        // store first hit
                        var color = tileImage.getARGB( x % (tileImage.width), y % (tileImage.height) );
                        pixelimage.setARGB( x, y, color );
                        foundY = true;
                    } else {
                        // after filling break
                        if( foundY ) break;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
                    }
                }
            }                                                                                                                                                                                                                                                                                                                                                                                                                                
        }
        return if( hasHit == false ){
            var v: HitTri = { ax: ax, ay: ay, bx: bx, by: by, cx: cx, cy: cy };
            v;
        } else {
            null;
        }
    }

    inline
    function fillGradTriangle( pixelimage: Pixelimage
                        , ax: Float, ay: Float, colA: Pixel32
                        , bx: Float, by: Float, colB: Pixel32
                        , cx: Float, cy: Float, colC: Pixel32
                        , hasHit: Bool = false ): Null<HitTri>{
        var aA = ( colB >> 24 ) & 0xFF;
        var rA = ( colB >> 16 ) & 0xFF;
        var gA = ( colB >> 8 ) & 0xFF;
        var bA = colB & 0xFF;
        var aB = ( colA >> 24 ) & 0xFF;
        var rB = ( colA >> 16 ) & 0xFF;
        var gB = ( colA >> 8 ) & 0xFF;
        var bB = colA & 0xFF;
        var aC = ( colC >> 24 ) & 0xFF;
        var rC = ( colC >> 16 ) & 0xFF;
        var gC = ( colC >> 8 ) & 0xFF;
        var bC = colC & 0xFF;
        var bcx = bx - cx;
        var bcy = by - cy;
        var acx = ax - cx; 
        var acy = ay - cy;
        // Had to re-arrange algorithm to work so dot names may not quite make sense.
        var dot11 = dotSame( bcx, bcy );
        var dot12 = dot( bcx, bcy, acx, acy );
        var dot22 = dotSame( acx, acy );
        var denom1 = 1/( dot11 * dot22 - dot12 * dot12 );
        for( px in boundIterator3( cx, bx, ax ) ){
            var pcx = px - cx;
            for( py in boundIterator3( cy, by, ay ) ){
                var pcy = py - cy;
                var dot31 = dot( pcx, pcy, bcx, bcy );
                var dot32 = dot( pcx, pcy, acx, acy );
                var ratioA = (dot22 * dot31 - dot12 * dot32) * denom1;
                var ratioB = (dot11 * dot32 - dot12 * dot31) * denom1;
                var ratioC = 1.0 - ratioB - ratioA;
                if( ratioA >= 0 && ratioB >= 0 && ratioC >= 0 ){
                    var a = PixelChannel.boundChannel( aA*ratioA + aB*ratioB + aC*ratioC );
                    var r = PixelChannel.boundChannel( rA*ratioA + rB*ratioB + rC*ratioC );
                    var g = PixelChannel.boundChannel( gA*ratioA + gB*ratioB + gC*ratioC );
                    var b = PixelChannel.boundChannel( bA*ratioA + bB*ratioB + bC*ratioC );
                    pixelimage.set_argbPixel( a, r, g, b, pixelimage.position( px, py ) );
                }
            }
        }
        return if( hasHit == false ){
            var v: HitTri = { ax: ax, ay: ay, bx: bx, by: by, cx: cx, cy: cy };
            v;
        } else {
            null;
        }   
    }
    inline
    function topRightImgTri( pixelimage: Pixelimage, texture: Pixelimage, win: RectangleWindow
                            , ax: Float, ay: Float
                            , bx: Float, by: Float
                            , cx: Float, cy: Float
                            , hasHit: Bool = false ): Null<HitTri>{
        return uvTriangle( pixelimage, texture, win, ax, ay, 1., 0., bx, by, 0., 0., cx, cy, 1., 1. );                      
    }
    inline
    function bottomLeftImgTri( pixelimage: Pixelimage, texture: Pixelimage, win: RectangleWindow
                            , dx: Float, dy: Float
                            , cx: Float, cy: Float
                            , ax: Float, ay: Float
                            , hasHit: Bool = false ): Null<HitTri>{
        return uvTriangle( pixelimage, texture, win, dx, dy, 1., 1., cx, cy, 0., 1., ax, ay, 0., 0. );                     
    }
    inline
    function uvTriangle( pixelimage: Pixelimage, texture: Pixelimage, win: RectangleWindow
                        , ax: Float, ay: Float, au: Float, av: Float
                        , bx: Float, by: Float, bu: Float, bv: Float
                        , cx: Float, cy: Float, cu: Float, cv: Float
                        , hasHit: Bool = false ): Null<HitTri>{
        var bcx = bx - cx;
        var bcy = by - cy;
        var acx = ax - cx; 
        var acy = ay - cy;
        // Had to re-arrange algorithm to work so dot names may not quite make sense.
        var dot11 = dotSame( bcx, bcy );
        var dot12 = dot( bcx, bcy, acx, acy );
        var dot22 = dotSame( acx, acy );
        var denom1 = 1/( dot11 * dot22 - dot12 * dot12 );

        for( px in boundIterator3( cx, bx, ax ) ){
            var pcx = px - cx;
            for( py in boundIterator3( cy, by, ay ) ){
                var pcy = py - cy;
                var dot31  = dot( pcx, pcy, bcx, bcy );
                var dot32  = dot( pcx, pcy, acx, acy );
                var ratioA = (dot22 * dot31 - dot12 * dot32) * denom1;
                var ratioB = (dot11 * dot32 - dot12 * dot31) * denom1;
                var ratioC = 1.0 - ratioB - ratioA;
                if( ratioA >= 0 && ratioB >= 0 && ratioC >= 0 ){
                    var u = au*ratioA + bu*ratioB + cu*ratioC;
                    var v = av*ratioA + bv*ratioB + cv*ratioC;
                    var x = Std.int( u*win.width + win.x );
                    var y = Std.int( v*win.height + win.y );
                    var col = texture.getARGB( x, y );
                    pixelimage.setARGB( px, py, col );
                }
            }
        }
        return if( hasHit == false ){
            var v: HitTri = { ax: ax, ay: ay, bx: bx, by: by, cx: cx, cy: cy };
            v;
        } else {
            null;
        }   
    }

// EXPERIMENTAL !!!  work in progress
inline
function uvTriangleTexture3( pixelimage: Pixelimage
                    , textureA: Pixelimage, winA: RectangleWindow
                    , textureB: Pixelimage, winB: RectangleWindow
                    , textureC: Pixelimage, winC: RectangleWindow
                    , ax: Float, ay: Float, au: Float, av: Float
                    , bx: Float, by: Float, bu: Float, bv: Float
                    , cx: Float, cy: Float, cu: Float, cv: Float
                    , hasHit: Bool = false ): Null<HitTri>{
    var bcx = bx - cx;
    var bcy = by - cy;
    var acx = ax - cx; 
    var acy = ay - cy;
    // Had to re-arrange algorithm to work so dot names may not quite make sense.
    var dot11 = dotSame( bcx, bcy );
    var dot12 = dot( bcx, bcy, acx, acy );
    var dot22 = dotSame( acx, acy );
    var denom1 = 1/( dot11 * dot22 - dot12 * dot12 );
    var colA: Float = 0.;
    var colB: Float = 0.;
    var colC: Float = 0.;
    var u: Int = 0;
    var v: Int = 0;
    var col: Int;
    for( px in boundIterator3( cx, bx, ax ) ){
        var pcx = px - cx;
        for( py in boundIterator3( cy, by, ay ) ){
            var pcy = py - cy;
            var dot31  = dot( pcx, pcy, bcx, bcy );
            var dot32  = dot( pcx, pcy, acx, acy );
            var ratioA = (dot22 * dot31 - dot12 * dot32) * denom1;
            var ratioB = (dot11 * dot32 - dot12 * dot31) * denom1;
            var ratioC = 1.0 - ratioB - ratioA;
            if( ratioA >= 0 && ratioB >= 0 && ratioC >= 0 ){
                u = au*ratioA + bu*ratioB + cu*ratioC;
                v = av*ratioA + bv*ratioB + cv*ratioC;
                x = Std.int( u*winA.width + winA.x );
                y = Std.int( v*winA.height + winA.y );
                colA = textureaA.getARGB( x, y );
                x = Std.int( u*winB.width + winB.x );
                y = Std.int( v*winB.height + winB.y );
                colB = textureaB.getARGB( x, y );
                x = Std.int( u*winC.width + winC.x );
                y = Std.int( v*winC.height + winC.y );
                colC = textureaC.getARGB( x, y );
                // need to check the right a, b, c setup
                var aA = ( colB >> 24 ) & 0xFF;
                var rA = ( colB >> 16 ) & 0xFF;
                var gA = ( colB >> 8 ) & 0xFF;
                var bA = colB & 0xFF;
                var aB = ( colA >> 24 ) & 0xFF;
                var rB = ( colA >> 16 ) & 0xFF;
                var gB = ( colA >> 8 ) & 0xFF;
                var bB = colA & 0xFF;
                var aC = ( colC >> 24 ) & 0xFF;
                var rC = ( colC >> 16 ) & 0xFF;
                var gC = ( colC >> 8 ) & 0xFF;
                var bC = colC & 0xFF;
                var a = PixelChannel.boundChannel( aA*ratioA + aB*ratioB + aC*ratioC );
                var r = PixelChannel.boundChannel( rA*ratioA + rB*ratioB + rC*ratioC );
                var g = PixelChannel.boundChannel( gA*ratioA + gB*ratioB + gC*ratioC );
                var b = PixelChannel.boundChannel( bA*ratioA + bB*ratioB + bC*ratioC );
                pixelimage.set_argbPixel( a, r, g, b, pixelimage.position( px, py ) );
            }
        }
    }
    return if( hasHit == false ){
        var v: HitTri = { ax: ax, ay: ay, bx: bx, by: by, cx: cx, cy: cy };
        v;
    } else {
        null;
    }   
}

class TriPixel{
    /**
       <font color="LightPink" font-weight:"Bold">fillTriUnsafe</font> module level field
       @param hasHit defaults false, since a HitTri has runtime overhead.
    **/
    public var _fillTriUnsafe: ( pixelimage: Pixelimage
                        , ax: Float, ay: Float
                        , bx: Float, by: Float
                        , cx: Float, cy: Float
                        , color: Pixel32
                        , hasHit: Bool ) -> Null<HitTri> = fillTriUnsafe;
    /**
       <font color="LightPink" font-weight:"Bold">tileTriUnsafe</font> module level field
       @param hasHit defaults false, since a HitTri has runtime overhead.
    **/
    public var _tileTriUnsafe:(  pixelimage: Pixelimage
                        , ax: Float, ay: Float
                        , bx: Float, by: Float
                        , cx: Float, cy: Float
                        , tileImage: Pixelimage
                        , hasHit: Bool ) -> Null<HitTri> = tileTriUnsafe;
    /**
       <font color="LightPink" font-weight:"Bold">fillGradTriangle</font> module level field
       @param hasHit defaults false, since a HitTri has runtime overhead.
    **/          
    public var _fillGradTriangle:( pixelimage: Pixelimage
                        , ax: Float, ay: Float, colA: Pixel32
                        , bx: Float, by: Float, colB: Pixel32
                        , cx: Float, cy: Float, colC: Pixel32
                        , hasHit: Bool ) -> Null<HitTri> = fillGradTriangle;
}