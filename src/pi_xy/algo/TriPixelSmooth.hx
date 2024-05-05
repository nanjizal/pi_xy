package pi_xy.algo;
import pi_xy.iter.BoundIterator;
import pi_xy.iter.IteratorRange;
import pi_xy.algo.GeomPix;
import pi_xy.pixel.Pixel32;
import pi_xy.pixel.PixelChannel;
import pi_xy.hit.HitTri;
import pi_xy.hit.HitQuad;

// This module is to move more complex algorithms for achieving smoother edges on triangles
// initially will commit new stuff here and move over some earlier code later
// ( since hassle to break class paths while still getting optimising solutions )
// There are currently several approaches
// 
// Two ways currently drawing a triangle
// 1) simpler cross product triangle hitTest, faster? 
// 2) barycentric coordinate hitTest, this is ideal for remapping UV and 3 color gradients.
//
// for hitTesting against triangle composed shapes can pre-calculate the simple hit test 
// so it can be called on a single pixel this ends up a separate returned Hit object.
//
// To achieve smooth edges I can use either drawing approach.
//
// Barycentric approach the coordinate ratios allow working out which side is closest.
// This is done by finding the min ratio to split the triangle into 3 smaller triangles regions
// or just using one ratio.  By ratio multipying the alpha channel and upper bounding
// it is posible to create an edge gradient concentrated along the edge.
// For multi sided polygons like circles and ellipses only the outer facing ratio needs smoothing.
// For large quad, I created the concept of Quints ( five sides using four triangles )
// A Quint only needs 1 outer triangle side softened, but requires more triangles.. so more loops.
// For complete control can pass an array that defines which triangle sides to soften
//
// So for curves made of chaining a quad and a line into a sequence ( made from triangle ), 
// only one triangle side is needed for the outer edges. Arrows need more sides.
//
// But for curves and lines using Barycentic ratios, it works ok if they are thick..
// most lines are not thick!
//
// So another solution is with the simpler hitTest using a multi-sample hit, 
// have gone for pentagon hit ( rotated slightly ). 
// Summing a fifth of these outer five points allows the edges to be smoothed.
// Unfortunately when joining triangles to make quads; amazingly has a clean join 
// between triangles when only using the direct hitTest point.
// To use the direct hitTest point greatly reduces the outer edge smoothing when combined.
//
// Next approach is to try Barycentric hitTest so Pentagon smoothing applied only on some sides.

inline
function quadPentagonBarycentric( pixelImage: Pixelimage
                        , ax: Float, ay: Float
                        , bx: Float, by: Float
                        , cx: Float, cy: Float
                        , dx: Float, dy: Float 
                        , color: Int
                        , hasHit: Bool = false ): Null<HitQuad>{
    // tri e - a b d
    // tri f - b c d
    triPentagonBarycentricBottom( pixelImage, ax, ay, bx, by, dx, dy, color, false );
    triPentagonBarycentricTop(    pixelImage, bx, by, cx, cy, dx, dy, color, false );
    // don't bother with hit as fillQuadrilateral in test will return.
    return null;
}
inline
function triPentagonBarycentricBottom( pixelImage: Pixelimage
                                    , ax: Float, ay: Float
                                    , bx: Float, by: Float
                                    , cx: Float, cy: Float
                                    , color: Pixel32
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
        // hardcoded as quads won't get to this so extreme color for debug as unsure soft correct.
        color = 0xffec0638;
        var softAB = true;
        var softBC = true;
        var softCA = false;
    }
    return triPentagonBarycentic( pixelImage, ax, ay, bx, by, cx, cy, color, softAB, softBC, softCA, hasHit, hasUndo );
} 
inline
function triPentagonBarycentricTop( pixelImage: Pixelimage
                                    , ax: Float, ay: Float
                                    , bx: Float, by: Float
                                    , cx: Float, cy: Float
                                    , color: Pixel32
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
        // hardcoded as quads won't get to this so extreme color for debug as unsure soft correct.
        color = 0xffdc2f04;
        var softAB = true;
        var softBC = false;
        var softCA = true;
    }
    return triPentagonBarycentic( pixelImage, ax, ay, bx, by, cx, cy, color, softAB, softBC, softCA, hasHit, hasUndo );
} 

inline
function triPentagonBarycentic( pixelImage: Pixelimage
                    , ax: Float, ay: Float
                    , bx: Float, by: Float
                    , cx: Float, cy: Float
                    , color: Pixel32
                    , softAB = true
                    , softBC = true
                    , softCA = true
                    , hasHit: Bool = false, hasUndo: Bool = true ): Null<HitTri>{
    // decompose channels
    var a = ( color >> 24 ) & 0xFF;
    var r = ( color >> 16 ) & 0xFF;
    var g = ( color >> 8 ) & 0xFF;
    var b = color & 0xFF;
    
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
    // var max: Float = 0;
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
        sxx0 = sx*(px + x0);
        sxx1 = sx*(px + x1);
        sxx2 = sx*(px + x2);
        sxx3 = sx*(px + x3);
        sxx4 = sx*(px + x4);
        txx0 = tx*(px + x0);
        txx1 = tx*(px + x1);
        txx2 = tx*(px + x2);
        txx3 = tx*(px + x3);
        txx4 = tx*(px + x4);
        // for exit rectangle as soon as triangle drawn, removed for now as complex with pentagon sampling.
        // found = false;
        for( py in yIter3 ){
            // Barycentric calculations
            var pcy = py - cy;
            var dot31  = dot( pcx, pcy, bcx, bcy );
            var dot32  = dot( pcx, pcy, acx, acy );
            var ratioA = (dot22 * dot31 - dot12 * dot32) * denom1;
            var ratioB = (dot11 * dot32 - dot12 * dot31) * denom1;
            var ratioC = 1.0 - ratioB - ratioA;
            // calculate which side closest
            // not really optimum but cleaner than putting in switch for now.
            var min = ( ratioA < ratioB )? ratioA: ratioB;
            min = ( min < ratioC )? min: ratioC;
            /* // calculate which side furtherest not needed!
            var max = ( ratioA > ratioB )? ratioA: ratioB;
            max = ( max > ratioC )? max: ratioC;
            */
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
            // pentagon sampling cheaper to do on Simple hitTest for each
            if( pentagonSampling ){
                aSum = 0.; // reset 
                s = s0 + sxx0 + sy*(py+y0); // add up the pentagon hits
                t = t0 + txx0 + ty*(py+y0);
                if( !( s <= 0 || t <= 0 ) ) if( ( s + t ) < A ) aSum += 1/5;
                s = s0 + sxx1 + sy*(py+y1);
                t = t0 + txx1 + ty*(py+y1);
                if( !( s <= 0 || t <= 0 ) ) if( ( s + t ) < A ) aSum += 1/5;
                s = s0 + sxx2 + sy*(py+y2);
                t = t0 + txx2 + ty*(py+y2);
                if( !( s <= 0 || t <= 0 ) ) if( ( s + t ) < A ) aSum += 1/5;
                s = s0 + sxx3 + sy*(py+y3);
                t = t0 + txx3 + ty*(py+y3);
                if( !( s <= 0 || t <= 0 ) ) if( ( s + t ) < A ) aSum += 1/5;
                s = s0 + sxx4 + sy*(py+y4);
                t = t0 + txx4 + ty*(py+y4);
                if( !( s <= 0 || t <= 0 ) ) if( ( s + t ) < A ) aSum += 1/5;

                //
                if( aSum != 0. ) {
                    pixelImage.set_argbPixel( 
                                            ( aSum > 0.9 )? a: PixelChannel.boundChannel( a*aSum )
                                            , r, g, b, pixelImage.position( px, py ) ); 
                    // found = true; // escape early not really viable.                    
                } // else not found.
            } else { // use Barycentic hitTest when want clean edge as alreadt have ratios..
                // Don't bother with Simple hit calculation, keep incase integrates better?
                /*
                 s = s0 + sxx + sy*py;
                 t = t0 + txx + ty*py;
                 if( !( s <= 0 || t <= 0 ) ) if( ( s + t ) < A ) {
                    pixelImage.set_argbPixel( a, r, g, b, pixelImage.position( px, py ) );
                 }
                 */
                if( ratioA >= 0 && ratioB >= 0 && ratioC >= 0 ){
                    pixelImage.set_argbPixel( a, r, g, b, pixelImage.position( px, py ) );
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

