package pi_xy.algo;
import pi_xy.iter.BoundIterator;
import pi_xy.iter.IteratorRange;
import pi_xy.algo.GeomPix;
import pi_xy.pixel.Pixel32;
import pi_xy.pixel.PixelChannel;
import pi_xy.algo.HitTri;
import pi_xy.algo.PentagonSampler;

inline
function quadGradPentBary( pixelImage: Pixelimage
                        , ax: Float, ay: Float
                        , bx: Float, by: Float
                        , cx: Float, cy: Float
                        , dx: Float, dy: Float 
                        , color: Int
                        , hasHit: Bool = false ): Null<HitQuad>{
    // tri e - a b d
    // tri f - b c d
    var colorA: Pixel32 =0xffe100ff;
    var colorB: Pixel32 =0xffe7970d;
    var colorC: Pixel32 =0xffade505;
    var colorD: Pixel32 =0xff00d5ff;

    triGradPentBaryBottom( pixelImage, ax, ay, colorA, bx-1, by-1, colorB, dx-1, dy-1, colorD, false );                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    triGradPentBaryTop(    pixelImage, bx+1, by+1, colorB, cx, cy, colorC, dx+1, dy+1   , colorD, false );
    // don't bother with hit as fillQuadrilateral in test will return.
    return null;
}
inline
function triGradPentBaryBottom( pixelImage: Pixelimage
                                    , ax: Float, ay: Float, colorA: Pixel32
                                    , bx: Float, by: Float, colorB: Pixel32
                                    , cx: Float, cy: Float, colorC: Pixel32
                                    , hasHit: Bool = false, hasUndo: Bool = true ): Null<HitTri>{
    // tri e - a b d
    // don't smooth diagonal
    var softAB = true;
    var softBC = false;
    var softCA = true;
    var adjustWinding = ( (ax * by - bx * ay) + (bx * cy - cx * by) + (cx * ay - ax * cy) )>0;
    if( !adjustWinding ){
        var bx_ = bx;
        var by_ = by;
        bx = cx;
        by = cy;
        cx = bx_;
        cy = by_;
        var softAB = true;
        var softBC = true;
        var softCA = false;
    }
    return triGradPentBary( pixelImage, ax, ay, colorA, bx, by, colorB, cx, cy, colorC, softAB, softBC, softCA, hasHit, hasUndo );
} 
inline
function triGradPentBaryTop( pixelImage: Pixelimage
                                    , ax: Float, ay: Float, colorA: Pixel32
                                    , bx: Float, by: Float, colorB: Pixel32
                                    , cx: Float, cy: Float, colorC: Pixel32
                                    , hasHit: Bool = false, hasUndo: Bool = true ): Null<HitTri>{
    // tri f - b c d   
    // don't smooth diagonal
    var softAB = true;
    var softBC = true;
    var softCA = false;
    var adjustWinding = ( (ax * by - bx * ay) + (bx * cy - cx * by) + (cx * ay - ax * cy) )>0;
    if( !adjustWinding ){
        var bx_ = bx;
        var by_ = by;
        bx = cx;
        by = cy;
        cx = bx_;
        cy = by_;
        var softAB = true;
        var softBC = false;
        var softCA = true;
    }
    return triGradPentBary( pixelImage, ax, ay, colorA, bx, by, colorB, cx, cy, colorC, softAB, softBC, softCA, hasHit, hasUndo );
} 
inline
function triGradPentBary( pixelImage: Pixelimage
                    , ax: Float, ay: Float, colA: Pixel32
                    , bx: Float, by: Float, colB: Pixel32
                    , cx: Float, cy: Float, colC: Pixel32
                    , softAB = true
                    , softBC = true
                    , softCA = true
                    , hasHit: Bool = false, hasUndo: Bool = true ): Null<HitTri>{
    // decompose channels
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
    
    var a = 0;
    var r = 0;
    var g = 0;
    var b = 0;  

    // barycentic pre-calculations.
    var bcx = bx - cx;
    var bcy = by - cy;
    var acx = ax - cx; 
    var acy = ay - cy;
    // Had to re-arrange algorithm to work so dot names may not quite make sense.
    var dot11 = dotSame( bcx, bcy );
    var dot12 = dot( bcx, bcy, acx, acy );  // <- for details see pi_xy.algo.GeomPix
    var dot22 = dotSame( acx, acy );
    var denom1 = 1/( dot11 * dot22 - dot12 * dot12 );
    // within loop calculate smallest ratio
    var min: Float = 0;
    var max: Float = 0;
    //

    // calculate iteration ranges using min...max of x and y coordinates
    var xIter3: IteratorRange = boundIterator3( ax, bx, cx );
    var yIter3: IteratorRange = boundIterator3( ay, by, cy );  // <- for details see pi_xy.iter.*

    // undo save image, probably overkill code.. irrelevant to this specific test.
    var undoImage: Pixelimage = null;
    if( hasUndo ){
        undoImage = new Pixelimage( xIter3.length, yIter3.length );
        undoImage.putPixelImageRect( pixelImage, 0, 0, xIter3.start, yIter3.start, xIter3.max, yIter3.max );
    }
    
    // Simple hitTest parameters pre-calculate
    var s0 = ay*cx - ax*cy;
    var sx = cy - ay;
    var sy = ax - cx;
    var t0 = ax*by - ay*bx;
    var tx = ay - by;
    var ty = bx - ax;
    var A = -by*cx + ay*(-bx + cx) + ax*(by - cy) + bx*cy; 
    // and related loop calculation parameters
    var s = 0.;
    var t = 0.;
    var sxx = 0.;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    var txx = 0.;
    //

    // used to exit draw rectangle early after triangle shape hit. removed for now.
    // var found = false;

    // temp colors
    //var a = 0;
    //var r = 0;
    //var g = 0;
    //var b = 0;

    // pentagam sampling..
    /*
    var theta = 2*Math.PI/5; // pentagon angle
    var omega = theta/3;     // offset so the pentagon sampling is off centre
    var delta = 0.7071;      // arbitary seems reasonable
    var x0 = delta*Math.cos( theta + omega );
    var y0 = delta*Math.sin( theta + omega );
    omega += theta;
    var x1 = delta*Math.cos( theta + omega );
    var y1 = delta*Math.sin( theta + omega );
    omega += theta;
    var x2 = delta*Math.cos( theta + omega );
    var y2 = delta*Math.sin( theta + omega );
    omega += theta;
    var x3 = delta*Math.cos( theta + omega );
    var y3 = delta*Math.sin( theta + omega );
    omega += theta;
    var x4 = delta*Math.cos( theta + omega );
    var y4 = delta*Math.sin( theta + omega );
    */
    var x0 = PentagonSampler.x0;
    var y0 = PentagonSampler.y0;
    var x1 = PentagonSampler.x1;
    var y1 = PentagonSampler.y1;
    var x2 = PentagonSampler.x2;
    var y2 = PentagonSampler.y2;
    var x3 = PentagonSampler.x3;
    var y3 = PentagonSampler.y3;
    var x4 = PentagonSampler.x4;
    var y4 = PentagonSampler.y4;
    // simple hit loop calculation parameters
    var sxx = 0.;
    var txx = 0.;
    //
    var sxx0 = 0.;
    var sxx1 = 0.;
    var sxx2 = 0.;
    var sxx3 = 0.;
    var sxx4 = 0.;
    var txx0 = 0.;
    var txx1 = 0.;
    var txx2 = 0.;
    var txx3 = 0.;
    var txx4 = 0.;
    var aSum = 0.;   
    //

    for( px in xIter3 ){
        var pcx = px - cx;
        // pentagon sampling
        sxx = sx*px;
        txx = tx*px;
        //
        sxx0 = sx*( px + x0 );
        sxx1 = sx*( px + x1 );
        sxx2 = sx*( px + x2 );
        sxx3 = sx*( px + x3 );
        sxx4 = sx*( px + x4 );
        txx0 = tx*( px + x0 );
        txx1 = tx*( px + x1 );
        txx2 = tx*( px + x2 );
        txx3 = tx*( px + x3 );
        txx4 = tx*( px + x4 );
        // for exit rectangle as soon as triangle drawn, removed for now as complex with pentagon sampling.
        // found = false;
        for( py in yIter3 ){
            // Barycentric calculations
            var pcy = py - cy;
            var dot31  = dot( pcx, pcy, bcx, bcy );
            var dot32  = dot( pcx, pcy, acx, acy );
            var ratioA = ( dot22 * dot31 - dot12 * dot32 ) * denom1;
            var ratioB = ( dot11 * dot32 - dot12 * dot31 ) * denom1;
            var ratioC = 1.0 - ratioB - ratioA;
            // calculate which side closest
            // not really optimum but cleaner than putting in switch for now.
            var min = ( ratioA < ratioB )? ratioA: ratioB;
            min = ( min < ratioC )? min: ratioC;
            // calculate which side furtherest not needed!
            var max = ( ratioA > ratioB )? ratioA: ratioB;
            max = ( max > ratioC )? max: ratioC;
            
            // approximate does not accurately deal with cross over boundaries
            // hopefully close enough
            var pentagonSampling = switch( [ softAB, softBC, softCA ]){
                case [ false, false, false ]:
                    false;
                case [ false, false, true ]:
                    min == ratioA;
                case [ false, true, false ]:
                    min == ratioB;
                case [ false, true, true ]:
                    min == ratioA || min == ratioB;
                case [ true, false, false ]:
                    min == ratioC; 
                case [ true, false, true ]:
                    min == ratioA || min == ratioC;
                case [ true, true, false ]:
                    min == ratioB || min == ratioC;
                case [ true, true, true ]:
                    true;
            }
            //    b ____ c
            //     |\   /|    
            //     | \ /_|
            //     | /|  |
            //     |/_|__|
            //    a      d
            //
             pentagonSampling = true;
            if( pentagonSampling ){
                aSum = 0.; // reset 
                
                a = 0;
                r = 0;
                g = 0;
                b = 0;
                sxx = sx*px;
                txx = tx*px;
                s = s0 + sxx + sy*py;
                t = t0 + txx + ty*py;
                //var aSum2 = 5*((s+t)/A);
                s = s0 + sxx0 + sy*(py+y0); // add up the pentagon hits
                t = t0 + txx0 + ty*(py+y0);
                var sumX: Float = 0;
                var sumY: Float = 0;
                var noHit = 0;
                if( !( s <= 0 || t <= 0 ) ) if( ( s + t ) < A ) {
                    aSum += 1/5;
                    noHit += 1;
                    sumX += x0;
                    sumY += y0;
                }
                s = s0 + sxx1 + sy*(py+y1);
                t = t0 + txx1 + ty*(py+y1);
                if( !( s <= 0 || t <= 0 ) ) if( ( s + t ) < A ){
                    aSum += 1/5;
                    noHit += 1;
                    sumX += x1;
                    sumY += y1;
                } 
                s = s0 + sxx2 + sy*(py+y2);
                t = t0 + txx2 + ty*(py+y2);
                if( !( s <= 0 || t <= 0 ) ) if( ( s + t ) < A ){
                    aSum += 1/5;
                    noHit += 1;
                    sumX += x2;
                    sumY += y2;
                } 
                s = s0 + sxx3 + sy*(py+y3);
                t = t0 + txx3 + ty*(py+y3);
                if( !( s <= 0 || t <= 0 ) ) if( ( s + t ) < A ){
                    aSum += 1/5;
                    noHit += 1;
                    sumX += x3;
                    sumY += y3;
                } 
                s = s0 + sxx4 + sy*(py+y4);
                t = t0 + txx4 + ty*(py+y4);
                if( !( s <= 0 || t <= 0 ) ) if( ( s + t ) < A ){
                    aSum += 1/5;
                    noHit += 1;
                    sumX += x4;
                    sumY += y4;
                } 
                //if( aSum < 0.9 ) aSum *= 2.;
                if( noHit != 0 ){
                    // found
                        var py_ = py + sumY/noHit;
                        var px_ = px + sumX/noHit;
                        var pcy_ = py_ - cy;
                        var pcx_ = px_ - cx;
                        var dot31  = dot( pcx_, pcy_, bcx, bcy );
                        var dot32  = dot( pcx_, pcy_, acx, acy );
                        var ratioA = (dot22 * dot31 - dot12 * dot32) * denom1;
                        var ratioB = (dot11 * dot32 - dot12 * dot31) * denom1;
                        var ratioC = 1.0 - ratioB - ratioA;
                    //if( ( ratioA > 0.5 || ratioB > 0.5 || ratioC > 0.5 ) )
                    //{
                        a = PixelChannel.boundChannel( ( aA*ratioA + aB*ratioB + aC*ratioC ) );
                        r = PixelChannel.boundChannel( ( rA*ratioA + rB*ratioB + rC*ratioC ) );
                        g = PixelChannel.boundChannel( ( gA*ratioA + gB*ratioB + gC*ratioC ) );
                        b = PixelChannel.boundChannel( ( bA*ratioA + bB*ratioB + bC*ratioC ) );
                        pixelImage.set_argbPixel( 
                            ( aSum > 0.9 )? a: PixelChannel.boundChannel( a*aSum )
                            , r, g, b, pixelImage.position( px, py ) ); 
                    //} else {
                        /*
                        a = PixelChannel.boundChannel( aA*ratioA + aB*ratioB + aC*ratioC );
                        r = PixelChannel.boundChannel( rA*ratioA + rB*ratioB + rC*ratioC );
                        g = PixelChannel.boundChannel( gA*ratioA + gB*ratioB + gC*ratioC );
                        b = PixelChannel.boundChannel( bA*ratioA + bB*ratioB + bC*ratioC );
                        if( !( ratioA >= 0 && ratioB >= 0 && ratioC >= 0  ) ){
                            pixelImage.set_argbPixel( ( aSum > 0.9 )? a: PixelChannel.boundChannel( a*aSum )
                            , r, g, b, pixelImage.position( px, py ) );
                        }
                        */
                    //}
                }
            } else { 
                
                a = PixelChannel.boundChannel( ( aA*ratioA + aB*ratioB + aC*ratioC ) );
                r = PixelChannel.boundChannel( rA*ratioA + rB*ratioB + rC*ratioC );
                g = PixelChannel.boundChannel( gA*ratioA + gB*ratioB + gC*ratioC );
                b = PixelChannel.boundChannel( bA*ratioA + bB*ratioB + bC*ratioC );
                if( ratioA >= 0 && ratioB >= 0 && ratioC >= 0 ){
                    //pixelImage.set_argbPixel( a, r, g, b, pixelImage.position( px, py ) );
                }
                
                // found = true;
            } // escape early not really viable. 
        }
    }
    return if( hasHit == false ){
        var v: HitTri = { ax: ax, ay: ay, bx: bx, by: by, cx: cx, cy: cy };
        if( hasUndo ){
            v.undoImage = undoImage;
            v.undoX = xIter3.start;
            v.undoY = yIter3.start;
        }
        v;
    } else {
        null;
    }   
}