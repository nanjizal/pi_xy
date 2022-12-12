package pixelimage.algo;
import pixelimage.iter.BoundIterator;
import pixelimage.iter.IteratorRange;
import pixelimage.algo.GeomPix;
import pixelimage.pixel.Pixel32;
import pixelimage.pixel.PixelChannel;

// TriPixel module

    inline 
    function fillTriUnsafe( pixelimage: Pixelimage
                          , ax: Float, ay: Float
                          , bx: Float, by: Float
                          , cx: Float, cy: Float
                          , color: Pixel32 ){
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
                        pixelimage.setARGB( x, y, color );
                        //pixelimage.setARGB( x+1, y, color );//
                        //pixelimage.setARGB( x-1, y, color );
                        //pixelimage.setARGB( x, y+1, color );//
                        //pixelimage.setARGB( x, y-1, color );
                        //pixelimage.setARGB( x-1, y-1, color );
                        //pixelimage.setARGB( x+1, y+1, color );//
                        //pixelimage.setARGB( x-1, y+1, color );
                        //pixelimage.setARGB( x+1, y-1, color );
                        foundY = true;
                    } else {
                        // after filling break
                        if( foundY ) break;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
                    }
                }
            }                                                                                                                                                                                                                                                                                                                                                                                                                                
        }
    }

    inline
    function fillGradTriangle( pixelimage: Pixelimage
                        , ax: Float, ay: Float, colA: Pixel32
                        , bx: Float, by: Float, colB: Pixel32
                        , cx: Float, cy: Float, colC: Pixel32 ){
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
    }