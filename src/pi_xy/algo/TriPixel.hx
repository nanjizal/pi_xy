package pi_xy.algo;
import pi_xy.iter.BoundIterator;
import pi_xy.iter.IteratorRange;
import pi_xy.algo.GeomPix;
import pi_xy.pixel.Pixel32;
import pi_xy.pixel.PixelChannel;
import pi_xy.hit.HitTri;

    /**
        provides a filled triangle give a,b,c coordinates
        automagically rearranges coordinates so it always renders
    **/
    inline
    function fillTriangle( pixelImage: Pixelimage, ax: Float, ay: Float
                    , bx: Float, by: Float
                    , cx: Float, cy: Float
                    , color: Pixel32
                    , hasHit: Bool = false, hasUndo: Bool = false ){
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
        return fillTriUnsafe( pixelImage, ax, ay, bx, by, cx, cy, color, hasHit, hasUndo );
    }

    inline 
    function fillTriUnsafe( pixelImage: Pixelimage
                          , ax: Float, ay: Float
                          , bx: Float, by: Float
                          , cx: Float, cy: Float
                          , color: Pixel32
                          , hasHit: Bool = false, hasUndo: Bool = false ): Null<HitTri>{
        var s0 = ay*cx - ax*cy;
        var sx = cy - ay;
        var sy = ax - cx;
        var t0 = ax*by - ay*bx;
        var tx = ay - by;
        var ty = bx - ax;
        var A = -by*cx + ay*(-bx + cx) + ax*(by - cy) + bx*cy; 
        var xIter3: IteratorRange = boundIterator3( ax, bx, cx );
        var yIter3: IteratorRange = boundIterator3( ay, by, cy );
        var undoImage: Pixelimage = null;
        if( hasUndo ){
            undoImage = new Pixelimage( xIter3.length, yIter3.length );
            undoImage.putPixelImageRect( pixelImage, 0, 0, xIter3.start, yIter3.start, xIter3.max, yIter3.max );
        }
        var found = false;
        var s = 0.;
        var t = 0.;
        var sxx = 0.;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
        var txx = 0.;
        for( x in xIter3 ){
            sxx = sx*x;
            txx = tx*x;
            found = false;
            for( y in yIter3 ){
                s = s0 + sxx + sy*y;
                t = t0 + txx + ty*y;
                if( s <= 0 || t <= 0 ){
                    // after filling break
                    if( found ) break;
                } else {
                    if( (s + t) < A ) {
                        // store first hit
                        pixelImage.setARGB( x, y, color );
                        found = true;
                    } else {
                        // after filling break
                        if( found ) break;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                    }
                }
            }                                                                                                                                                                                                                                                                                                                                                                                                                                
        }
        return if( hasHit == true ){
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
    inline
    function fillTriangle2( pixelImage: Pixelimage, ax: Float, ay: Float
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
        return fillTriUnsafe2( pixelImage, ax, ay, bx, by, cx, cy, color, hasHit );
    }

    inline 
    function fillTriUnsafe2( pixelImage: Pixelimage
                          , ax: Float, ay: Float
                          , bx: Float, by: Float
                          , cx: Float, cy: Float
                          , color: Pixel32
                          , hasHit: Bool = false, hasUndo: Bool = false ): Null<HitTri>{
        var s0 = ay*cx - ax*cy;
        var sx = cy - ay;
        var sy = ax - cx;
        var t0 = ax*by - ay*bx;
        var tx = ay - by;
        var ty = bx - ax;
        var A = -by*cx + ay*(-bx + cx) + ax*(by - cy) + bx*cy; 
        var xIter3: IteratorRange = boundIterator3( ax, bx, cx );
        var yIter3: IteratorRange = boundIterator3( ay, by, cy );
        var undoImage: Pixelimage = null;
        if( hasUndo ){
            undoImage = new Pixelimage( xIter3.length, yIter3.length );
            undoImage.putPixelImageRect( pixelImage, 0, 0, xIter3.start, yIter3.start, xIter3.max, yIter3.max );
        }
        var found = false;
        var s = 0.;
        var t = 0.;
        var syy = 0.;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
        var tyy = 0.;
        for( y in yIter3 ){
            syy = sy*y;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
            tyy = ty*y;
            found = false;
            for( x in xIter3 ){
                s = s0 + sx*x + syy;
                t = t0 + tx*x + tyy;
                if( s <= 0 || t <= 0 ){
                    // after filling break
                    if( found ) break;
                } else {
                    if( (s + t) < A ) {
                        // store first hit
                        pixelImage.setARGB( x, y, color );
                        found = true;
                    } else {
                        // after filling break
                        if( found ) break;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
                    }
                }
            }                                                                                                                                                                                                                                                                                                                                                                                                                                
        }
        return if( hasHit == true ){
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
    function tileTriUnsafe( pixelImage: Pixelimage
                          , ax: Float, ay: Float
                          , bx: Float, by: Float
                          , cx: Float, cy: Float
                          , tileImage: Pixelimage
                          , hasHit: Bool = false, hasUndo: Bool = false ): Null<HitTri>{
        var s0 = ay*cx - ax*cy;
        var sx = cy - ay;
        var sy = ax - cx;
        var t0 = ax*by - ay*bx;
        var tx = ay - by;
        var ty = bx - ax;
        var A = -by*cx + ay*(-bx + cx) + ax*(by - cy) + bx*cy; 
        var xIter3: IteratorRange = boundIterator3( ax, bx, cx );
        var yIter3: IteratorRange = boundIterator3( ay, by, cy );
        var undoImage: Pixelimage = null;
        if( hasUndo ){
            undoImage = new Pixelimage( xIter3.length, yIter3.length );
            undoImage.putPixelImageRect( pixelImage, 0, 0, xIter3.start, yIter3.start, xIter3.max, yIter3.max );
        }
        var foundY = false;
        var s = 0.;
        var t = 0.;
        var sxx = 0.;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
        var txx = 0.;
        for( x in xIter3 ){
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
                        pixelImage.setARGB( x, y, color );
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

    inline
    function fillGradTriangle( pixelImage: Pixelimage
                        , ax: Float, ay: Float, colA: Pixel32
                        , bx: Float, by: Float, colB: Pixel32
                        , cx: Float, cy: Float, colC: Pixel32
                        , hasHit: Bool = false, hasUndo: Bool = false ): Null<HitTri>{
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
        var xIter3: IteratorRange = boundIterator3( ax, bx, cx );
        var yIter3: IteratorRange = boundIterator3( ay, by, cy );
        var undoImage: Pixelimage = null;
        if( hasUndo ){
            undoImage = new Pixelimage( xIter3.length, yIter3.length );
            undoImage.putPixelImageRect( pixelImage, 0, 0, xIter3.start, yIter3.start, xIter3.max, yIter3.max );
        }
        for( px in xIter3 ){
            var pcx = px - cx;
            for( py in yIter3 ){
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
                    pixelImage.set_argbPixel( a, r, g, b, pixelImage.position( px, py ) );
                }
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
    inline
    function topRightImgTriFudge( pixelImage: Pixelimage, texture: Pixelimage, win: RectangleWindow
                            , ax: Float, ay: Float
                            , bx: Float, by: Float
                            , cx: Float, cy: Float
                            , hasHit: Bool = false, hasUndo: Bool = false ): Null<HitTri>{
        return uvTriangle( pixelImage, texture, win, ax, ay, 1., 0., bx, by, 0., 0., cx, cy, 1., 1., hasHit, hasUndo );                      
    }
    inline
    function bottomLeftImgTriFudge( pixelImage: Pixelimage, texture: Pixelimage, win: RectangleWindow
                            , dx: Float, dy: Float
                            , cx: Float, cy: Float
                            , ax: Float, ay: Float
                            , hasHit: Bool = false, hasUndo: Bool = false ): Null<HitTri>{
        return uvTriangle( pixelImage, texture, win, dx, dy, 1., 1., cx, cy, 0., 1., ax, ay, 0., 0., hasHit, hasUndo );                     
    }
    /**
        This is the first attempt at UV mapping it does not swap A B and so does not work properly, but can be used with fudged triangles above.
        Likely will remove in future but keeping incase it is useful for edge cases.
    **/
    inline
    function uvTriangleFudge( pixelImage: Pixelimage, texture: Pixelimage, win: RectangleWindow
                        , ax: Float, ay: Float, au: Float, av: Float
                        , bx: Float, by: Float, bu: Float, bv: Float
                        , cx: Float, cy: Float, cu: Float, cv: Float
                        , hasHit: Bool = false, hasUndo: Bool = false ): Null<HitTri>{
        var bcx = bx - cx;
        var bcy = by - cy;
        var acx = ax - cx; 
        var acy = ay - cy;
        // Had to re-arrange algorithm to work so dot names may not quite make sense.
        var dot11 = dotSame( bcx, bcy );
        var dot12 = dot( bcx, bcy, acx, acy );
        var dot22 = dotSame( acx, acy );
        var denom1 = 1/( dot11 * dot22 - dot12 * dot12 );
        var xIter3: IteratorRange = boundIterator3( ax, bx, cx );
        var yIter3: IteratorRange = boundIterator3( ay, by, cy );
        var undoImage: Pixelimage = null;
        if( hasUndo ){
            undoImage = new Pixelimage( xIter3.length, yIter3.length );
            undoImage.putPixelImageRect( pixelImage, 0, 0, xIter3.start, yIter3.start, xIter3.max, yIter3.max );
        }
        for( px in xIter3 ){
            var pcx = px - cx;
            for( py in yIter3 ){
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
                    pixelImage.setARGB( px, py, col );
                }
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
    inline
    function topLeftImgTri( pixelImage: Pixelimage, texture: Pixelimage, win: RectangleWindow
                            , ax: Float, ay: Float
                            , bx: Float, by: Float
                            , dx: Float, dy: Float
                            , hasHit: Bool = false, hasUndo: Bool = false ): Null<HitTri>{
        // tri e - a b d
        // tri f - b c d                        
        return uvTriangle( pixelImage, texture, win, ax, ay, 0., 0., bx, by, 1, 0., dx, dy, 0., 1., hasHit, hasUndo );                      
    }
    inline
    function bottomRightImgTri( pixelImage: Pixelimage, texture: Pixelimage, win: RectangleWindow
                            , bx: Float, by: Float
                            , cx: Float, cy: Float
                            , dx: Float, dy: Float
                            , hasHit: Bool = false, hasUndo: Bool = false ): Null<HitTri>{
        // tri e - a b d
        // tri f - b c d                         
        return uvTriangle( pixelImage, texture, win, bx, by, 1., 0., cx, cy, 1., 1., dx, dy, 0., 1., hasHit, hasUndo );                     
    }
    inline
    function uvTriangle( pixelImage: Pixelimage, texture: Pixelimage, win: RectangleWindow
                        , ax: Float, ay: Float, au: Float, av: Float
                        , bx: Float, by: Float, bu: Float, bv: Float
                        , cx: Float, cy: Float, cu: Float, cv: Float
                        , hasHit: Bool = false, hasUndo: Bool = false ): Null<HitTri>{
    // switch A B as per gradient ( consider xor's )
        var temp = au;
        au = bu;
        bu = temp;
        temp = av;
        av = bv;
        bv = temp;
        //
        var bcx = bx - cx;
        var bcy = by - cy;
        var acx = ax - cx; 
        var acy = ay - cy;
        // Had to re-arrange algorithm to work so dot names may not quite make sense.
        var dot11 = dotSame( bcx, bcy );
        var dot12 = dot( bcx, bcy, acx, acy );
        var dot22 = dotSame( acx, acy );
        var denom1 = 1/( dot11 * dot22 - dot12 * dot12 );
        var xIter3: IteratorRange = boundIterator3( ax, bx, cx );
        var yIter3: IteratorRange = boundIterator3( ay, by, cy );
        var undoImage: Pixelimage = null;
        if( hasUndo ){
            undoImage = new Pixelimage( xIter3.length, yIter3.length );
            undoImage.putPixelImageRect( pixelImage, 0, 0, xIter3.start, yIter3.start, xIter3.max, yIter3.max );
        }
        for( px in xIter3 ){
            var pcx = px - cx;
            for( py in yIter3 ){
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
                    pixelImage.setARGB( px, py, col );
                }
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

    inline
    function uvTriangleSoft3( pixelImage: Pixelimage, texture: Pixelimage, win: RectangleWindow
                        , ax: Float, ay: Float, au: Float, av: Float
                        , bx: Float, by: Float, bu: Float, bv: Float
                        , cx: Float, cy: Float, cu: Float, cv: Float
                        , soft3: Float
                        , hasHit: Bool = false, hasUndo: Bool = true ): Null<HitTri>{
    // switch A B as per gradient ( consider xor's )
        var temp = au;
        au = bu;
        bu = temp;
        temp = av;
        av = bv;
        bv = temp;
        //
        var bcx = bx - cx;
        var bcy = by - cy;
        var acx = ax - cx; 
        var acy = ay - cy;
        // Had to re-arrange algorithm to work so dot names may not quite make sense.
        var dot11 = dotSame( bcx, bcy );
        var dot12 = dot( bcx, bcy, acx, acy );
        var dot22 = dotSame( acx, acy );
        var denom1 = 1/( dot11 * dot22 - dot12 * dot12 );
        var xIter3: IteratorRange = boundIterator3( ax, bx, cx );
        var yIter3: IteratorRange = boundIterator3( ay, by, cy );
        var undoImage: Pixelimage = null;
        if( hasUndo ){
            undoImage = new Pixelimage( xIter3.length, yIter3.length );
            undoImage.putPixelImageRect( pixelImage, 0, 0, xIter3.start, yIter3.start, xIter3.max, yIter3.max );
        }
        var a = 0;
        var r = 0;
        var g = 0;
        var b = 0;
        for( px in xIter3 ){
            var pcx = px - cx;
            for( py in yIter3 ){
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
                    
                    var color = texture.getARGB( x, y );
                    var aA = ( color >> 24 ) & 0xFF;
                    var rA = ( color >> 16 ) & 0xFF;
                    var gA = ( color >> 8 ) & 0xFF;
                    var bA = color & 0xFF;

                    var min = ( ratioA < ratioB )? ratioA: ratioB;
                    min = ( min < ratioC )? min: ratioC;
                    var max = ( ratioA > ratioB )? ratioA: ratioB;
                    max = ( max > ratioC )? max: ratioC;
                    max = ( 1 - max )/2; // not really max just the shaded out, not sure if 2.7 ideal but close.
                    var min = ( min < max )? min: (max+min)/2;

                    a = PixelChannel.boundChannel( aA*soft3*min );
                    r = PixelChannel.boundChannel( rA );
                    g = PixelChannel.boundChannel( gA );
                    b = PixelChannel.boundChannel( bA );

                    pixelImage.set_argbPixel( a, r, g, b, pixelImage.position( px, py ) );
                }
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
    // TODO: no undo here, it may disappear..
    inline
    function fillTriTwoSoft( pixelImage: Pixelimage
                            , ax: Float, ay: Float
                            , bx: Float, by: Float
                            , cx: Float, cy: Float
                            , color: Pixel32
                            , softC: Float = 10
                            , hasHit: Bool = false ): Null<HitTri>{
        // A is the inner one..
        // calculate centre as average
        var ex: Float = ( bx + cx )/2;
        var ey: Float = ( by + cy )/2;
        // order may need re-arrangling
        fillTriSoftC( pixelImage, ex, ey, ax, ay, bx, by, color, softC, false );
        fillTriSoftC( pixelImage, ex, ey, bx, by, cx, cy, color, softC, false );
        return if( hasHit == false ){
            var v: HitTri = { ax: ax, ay: ay, bx: bx, by: by, cx: cx, cy: cy };
            v;
        } else {
            null;
        } 
    }

    inline
    function fillTriSoftC( pixelImage: Pixelimage
                        , ax: Float, ay: Float
                        , bx: Float, by: Float
                        , cx: Float, cy: Float
                        , color: Pixel32
                        , softC: Float = 10
                        , hasHit: Bool = false, hasUndo: Bool = false ): Null<HitTri>{
        var aA = ( color >> 24 ) & 0xFF;
        var rA = ( color >> 16 ) & 0xFF;
        var gA = ( color >> 8 ) & 0xFF;
        var bA = color & 0xFF;
        var bcx = bx - cx;
        var bcy = by - cy;
        var acx = ax - cx; 
        var acy = ay - cy;
        // Had to re-arrange algorithm to work so dot names may not quite make sense.
        var dot11 = dotSame( bcx, bcy );
        var dot12 = dot( bcx, bcy, acx, acy );
        var dot22 = dotSame( acx, acy );
        var denom1 = 1/( dot11 * dot22 - dot12 * dot12 );
        var xIter3: IteratorRange = boundIterator3( ax, bx, cx );
        var yIter3: IteratorRange = boundIterator3( ay, by, cy );
        var undoImage: Pixelimage = null;
        if( hasUndo ){
            undoImage = new Pixelimage( xIter3.length, yIter3.length );
            undoImage.putPixelImageRect( pixelImage, 0, 0, xIter3.start, yIter3.start, xIter3.max, yIter3.max );
        }
        var a = 0;
        var r = 0;
        var g = 0;
        var b = 0;
        var found = false;
        for( px in xIter3 ){
            var pcx = px - cx;
            found = false;
            for( py in yIter3 ){
                var pcy = py - cy;
                var dot31  = dot( pcx, pcy, bcx, bcy );
                var dot32  = dot( pcx, pcy, acx, acy );
                var ratioA = (dot22 * dot31 - dot12 * dot32) * denom1;
                var ratioB = (dot11 * dot32 - dot12 * dot31) * denom1;
                var ratioC = 1.0 - ratioB - ratioA;
                if( ratioA >= 0 && ratioB >= 0 && ratioC >= 0 ){
                    var a = PixelChannel.boundChannel( aA*(softC*ratioB ) );
                    var r = PixelChannel.boundChannel( rA );
                    var g = PixelChannel.boundChannel( gA );
                    var b = PixelChannel.boundChannel( bA );
                    pixelImage.set_argbPixel( a, r, g, b, pixelImage.position( px, py ) );
                    found = true;
                } else if( found ){
                    // exit early
                    break;
                }
            }
            // TODO: need to consider
            // if( !found ) pixelImage.set_argbPixel( a, r, g, b, pixelImage.position( px, yIter3.max ) );// -1?
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

    inline
    function fillTriSoft3( pixelImage: Pixelimage
                        , ax: Float, ay: Float
                        , bx: Float, by: Float
                        , cx: Float, cy: Float
                        , color: Pixel32
                        , soft3: Float = 40
                        , softAB = true
                        , softBC = true
                        , softCA = true
                        , hasHit: Bool = false, hasUndo: Bool = true ): Null<HitTri>{
        var aA = ( color >> 24 ) & 0xFF;
        var rA = ( color >> 16 ) & 0xFF;
        var gA = ( color >> 8 ) & 0xFF;
        var bA = color & 0xFF;
        var bcx = bx - cx;
        var bcy = by - cy;
        var acx = ax - cx; 
        var acy = ay - cy;
        // Had to re-arrange algorithm to work so dot names may not quite make sense.
        var dot11 = dotSame( bcx, bcy );
        var dot12 = dot( bcx, bcy, acx, acy );
        var dot22 = dotSame( acx, acy );
        var denom1 = 1/( dot11 * dot22 - dot12 * dot12 );
        var xIter3: IteratorRange = boundIterator3( ax, bx, cx );
        var yIter3: IteratorRange = boundIterator3( ay, by, cy );
        var undoImage: Pixelimage = null;
        if( hasUndo ){
            undoImage = new Pixelimage( xIter3.length, yIter3.length );
            undoImage.putPixelImageRect( pixelImage, 0, 0, xIter3.start, yIter3.start, xIter3.max, yIter3.max );
        }
        var found = false;
        var min: Float = 0;
        var max: Float = 0;
        var a = 0;
        var r = 0;
        var g = 0;
        var b = 0;
        for( px in xIter3 ){
            var pcx = px - cx;
            found = false;
            for( py in yIter3 ){
                var pcy = py - cy;
                var dot31  = dot( pcx, pcy, bcx, bcy );
                var dot32  = dot( pcx, pcy, acx, acy );
                var ratioA = (dot22 * dot31 - dot12 * dot32) * denom1;
                var ratioB = (dot11 * dot32 - dot12 * dot31) * denom1;
                var ratioC = 1.0 - ratioB - ratioA;
                if( ratioA >= 0 && ratioB >= 0 && ratioC >= 0 ){
                    // Note slightly strange as A B sort of switched in implementation
                    a = switch( [ softAB, softBC, softCA ]){
                        case [ false, false, false ]:
                            PixelChannel.boundChannel( aA );
                        case [ false, false, true ]:
                            min = ratioA;
                            PixelChannel.boundChannel( aA*soft3*min );
                        case [ false, true, false ]:
                            min = ratioB;
                            PixelChannel.boundChannel( aA*soft3*min );
                        case [ false, true, true ]:
                            min = ( ratioA < ratioB )? ratioA: ratioB;
                            max = ( ratioA > ratioB )? ratioA: ratioB;
                            max = ( max > ratioC )? max: ratioC;
                            max = ( 1 - max )/2; // not really max just the shaded out, not sure if 2.7 ideal but close.
                            min = ( min < max )? min: (max+min)/2;
                            PixelChannel.boundChannel( aA*soft3*min );
                        case [ true, false, false ]:
                            min = ratioC; 
                            PixelChannel.boundChannel( aA*soft3*min );
                        case [ true, false, true ]:
                            min = ( ratioA < ratioC )? ratioA: ratioC;
                            max = ( ratioA > ratioB )? ratioA: ratioB;
                            max = ( max > ratioC )? max: ratioC;
                            max = ( 1 - max )/2; // not really max just the shaded out, not sure if 2.7 ideal but close.
                            min = ( min < max )? min: (max+min)/2;
                            PixelChannel.boundChannel( aA*soft3*min );
                        case [ true, true, false ]:
                            min = ( ratioB < ratioC )? ratioB: ratioC;
                            max = ( ratioA > ratioB )? ratioA: ratioB;
                            max = ( max > ratioC )? max: ratioC;
                            max = ( 1 - max )/2; // not really max just the shaded out, not sure if 2.7 ideal but close.
                            min = ( min < max )? min: (max+min)/2;
                            PixelChannel.boundChannel( aA*soft3*min );
                        case [ true, true, true ]:
                            var min = ( ratioA < ratioB )? ratioA: ratioB;
                            min = ( min < ratioC )? min: ratioC;
                            var max = ( ratioA > ratioB )? ratioA: ratioB;
                            max = ( max > ratioC )? max: ratioC;
                            max = ( 1 - max )/2; // not really max just the shaded out, not sure if 2.7 ideal but close.
                            var min = ( min < max )? min: (max+min)/2;
                            PixelChannel.boundChannel( aA*soft3*min );
                    }
                    r = PixelChannel.boundChannel( rA );
                    g = PixelChannel.boundChannel( gA );
                    b = PixelChannel.boundChannel( bA );
                    pixelImage.set_argbPixel( a, r, g, b, pixelImage.position( px, py ) );
                    found = true;
                } else if( found ){
                    // exit early
                    break;
                }
            }
            // TODO: need to consider
            // if( !found ) pixelImage.set_argbPixel( a, r, g, b, pixelImage.position( px, yIter3.max ) );// -1?
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
    inline
    function fillQuarterSoft( pixelImage: Pixelimage
                        , ax: Float, ay: Float
                        , bx: Float, by: Float
                        , cx: Float, cy: Float
                        , color: Pixel32
                        , soft3: Float = 40
                        , softAB = true
                        , softBC = true
                        , softCA = true
                        , hasHit: Bool = false, hasUndo: Bool = true ): Null<HitTri>{
        var aA = ( color >> 24 ) & 0xFF;
        var rA = ( color >> 16 ) & 0xFF;
        var gA = ( color >> 8 ) & 0xFF;
        var bA = color & 0xFF;
        var bcx = bx - cx;
        var bcy = by - cy;
        var acx = ax - cx; 
        var acy = ay - cy;
        // Had to re-arrange algorithm to work so dot names may not quite make sense.
        var dot11 = dotSame( bcx, bcy );
        var dot12 = dot( bcx, bcy, acx, acy );
        var dot22 = dotSame( acx, acy );
        var denom1 = 1/( dot11 * dot22 - dot12 * dot12 );
        var xIter3: IteratorRange = boundIterator3( ax, bx, cx );
        var yIter3: IteratorRange = boundIterator3( ay, by, cy );
        var undoImage: Pixelimage = null;
        if( hasUndo ){
            undoImage = new Pixelimage( xIter3.length, yIter3.length );
            undoImage.putPixelImageRect( pixelImage, 0, 0, xIter3.start, yIter3.start, xIter3.max, yIter3.max );
        }
        var found = false;
        var min: Float = 0;
        var max: Float = 0;
        var a = 0;
        var r = 0;
        var g = 0;
        var b = 0;
        for( px in xIter3 ){
            var pcx = px - cx;
            found = false;
            for( py in yIter3 ){
                var pcy = py - cy;
                var dot31  = dot( pcx, pcy, bcx, bcy );
                var dot32  = dot( pcx, pcy, acx, acy );
                var ratioA = (dot22 * dot31 - dot12 * dot32) * denom1;
                var ratioB = (dot11 * dot32 - dot12 * dot31) * denom1;
                var ratioC = 1.0 - ratioB - ratioA;
                if( ratioA >= 0 && ratioB >= 0 && ratioC >= 0 ){
                    r = PixelChannel.boundChannel( rA );
                    g = PixelChannel.boundChannel( gA );
                    b = PixelChannel.boundChannel( bA );
                    if( softAB == true && softBC == false && softCA == true ){
                        min = ( ratioA < ratioC )? ratioA: ratioC;
                        
                        max = ( ratioA > ratioB )? ratioA: ratioB;
                        max = ( max > ratioC )? max: ratioC;
                        max = ( 1 - max )/2; // not really max just the shaded out, not sure if 2.7 ideal but close.
                        min = ( min < max )? min: (max+min)/2;
                        
                        a = PixelChannel.boundChannel( aA*soft3*min );
                        //if( ratioB > 0.9 || ( ratioC < 0.9 && ratioA < 0.9 ) ){
                            pixelImage.set_argbPixel( a, r, g, b, pixelImage.position( px, py ) );
                        //}
                    }
                    if( softAB == true  && softBC == true && softCA == false ){    
                        min = ( ratioB < ratioC )? ratioB: ratioC;
                        
                        max = ( ratioA > ratioB )? ratioA: ratioB;
                        max = ( max > ratioC )? max: ratioC;
                        max = ( 1 - max )/2; // not really max just the shaded out, not sure if 2.7 ideal but close.
                        min = ( min < max )? min: (max+min)/2;
                        
                        a = PixelChannel.boundChannel( aA*soft3*min );
                        //if( ratioA > 0.9 || ( ratioB < 0.9 && ratioC < 0.9 ) ){
                            pixelImage.set_argbPixel( a, r, g, b, pixelImage.position( px, py ) );
                        //}
                    }
                    found = true;
                } else if( found ){
                    // exit early
                    break;
                }
            }
            // TODO: need to consider
            // if( !found ) pixelImage.set_argbPixel( a, r, g, b, pixelImage.position( px, yIter3.max ) );// -1?
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

    inline
    function fillTriExtra0( pixelImage: Pixelimage
                        , ax: Float, ay: Float
                        , bx: Float, by: Float
                        , cx: Float, cy: Float
                        , color: Pixel32
                        , hasHit: Bool = false, hasUndo: Bool = true ): Null<HitTri>{
        var aA = ( color >> 24 ) & 0xFF;
        var rA = ( color >> 16 ) & 0xFF;
        var gA = ( color >> 8 ) & 0xFF;
        var bA = color & 0xFF;
        var bcx = bx - cx;
        var bcy = by - cy;
        var acx = ax - cx; 
        var acy = ay - cy;
        // Had to re-arrange algorithm to work so dot names may not quite make sense.
        var dot11 = dotSame( bcx, bcy );
        var dot12 = dot( bcx, bcy, acx, acy );
        var dot22 = dotSame( acx, acy );
        var denom1 = 1/( dot11 * dot22 - dot12 * dot12 );
        var xIter3: IteratorRange = boundIterator3( ax, bx, cx );
        var yIter3: IteratorRange = boundIterator3( ay, by, cy );
        var undoImage: Pixelimage = null;
        if( hasUndo ){
            undoImage = new Pixelimage( xIter3.length, yIter3.length );
            undoImage.putPixelImageRect( pixelImage, 0, 0, xIter3.start, yIter3.start, xIter3.max, yIter3.max );
        }
        var a = 0;
        var r = 0;
        var g = 0;
        var b = 0;
        var found = false;
        for( px in xIter3 ){
            var pcx = px - cx;
            found = false;
            for( py in yIter3 ){
                var pcy = py - cy;
                var dot31  = dot( pcx, pcy, bcx, bcy );
                var dot32  = dot( pcx, pcy, acx, acy );
                var ratioA = (dot22 * dot31 - dot12 * dot32) * denom1;
                var ratioB = (dot11 * dot32 - dot12 * dot31) * denom1;
                var ratioC = 1.0 - ratioB - ratioA;
                if( ratioA >= 0 && ratioB >= 0 && ratioC >= 0 ){
                    a = PixelChannel.boundChannel( aA*(10*ratioB ) );
                    r = PixelChannel.boundChannel( rA );
                    g = PixelChannel.boundChannel( gA );
                    b = PixelChannel.boundChannel( bA );
                    pixelImage.set_argbPixel( a, r, g, b, pixelImage.position( px, py ) );
                    //pixelimage.setARGB( px, py, color );
                    found = true;
                } else if( found ){
                    // exit early
                    break;
                }
            }
            // TODO: need to consider
            //if( !found ) pixelImage.set_argbPixel( a, r, g, b, pixelImage.position( px, yIter3.max ) );// -1?
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

    inline
    function fillTriExtra1( pixelImage: Pixelimage
                        , ax: Float, ay: Float
                        , bx: Float, by: Float
                        , cx: Float, cy: Float
                        , color: Pixel32
                        , hasHit: Bool = false, hasUndo: Bool = false ): Null<HitTri>{
        var bcx = bx - cx;
        var bcy = by - cy;
        var acx = ax - cx; 
        var acy = ay - cy;
        // Had to re-arrange algorithm to work so dot names may not quite make sense.
        var dot11 = dotSame( bcx, bcy );
        var dot12 = dot( bcx, bcy, acx, acy );
        var dot22 = dotSame( acx, acy );
        var denom1 = 1/( dot11 * dot22 - dot12 * dot12 );
        var xIter3: IteratorRange = boundIterator3( ax, bx, cx );
        var yIter3: IteratorRange = boundIterator3( ay, by, cy );
        var undoImage: Pixelimage = null;
        if( hasUndo ){
            undoImage = new Pixelimage( xIter3.length, yIter3.length );
            undoImage.putPixelImageRect( pixelImage, 0, 0, xIter3.start, yIter3.start, xIter3.max, yIter3.max );
        }
        var found = false;
        for( py in yIter3 ){
            var pcy = py - cy;
            found = false;
            for( px in xIter3 ){
                var pcx = px - cx;
                var dot31  = dot( pcx, pcy, bcx, bcy );
                var dot32  = dot( pcx, pcy, acx, acy );
                var ratioA = (dot22 * dot31 - dot12 * dot32) * denom1;
                var ratioB = (dot11 * dot32 - dot12 * dot31) * denom1;
                var ratioC = 1.0 - ratioB - ratioA;
                if( ratioA >= 0 && ratioB >= 0 && ratioC >= 0 ){
                    pixelImage.setARGB( px, py, color );
                    found = true;
                } else if( found ){
                    // exit early
                    break;
                }
            }
            // TODO: need to consider
            //if( !found ) pixelImage.set_argbPixel( a, r, g, b, pixelImage.position( px, yIter3.max ) );// -1?
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

// EXPERIMENTAL !!!  work in progress
inline
function uvTriangleTexture3( pixelImage: Pixelimage
                    , textureA: Pixelimage, winA: RectangleWindow
                    , textureB: Pixelimage, winB: RectangleWindow
                    , textureC: Pixelimage, winC: RectangleWindow
                    , ax: Float, ay: Float, au: Float, av: Float
                    , bx: Float, by: Float, bu: Float, bv: Float
                    , cx: Float, cy: Float, cu: Float, cv: Float
                    , hasHit: Bool = false, hasUndo: Bool = false ): Null<HitTri>{
    // switch A B as per gradient ( consider xor's )
    var temp = au;
    au = bu;
    bu = temp;
    temp = av;
    av = bv;
    bv = temp;

    var bcx = bx - cx;
    var bcy = by - cy;
    var acx = ax - cx; 
    var acy = ay - cy;
    // Had to re-arrange algorithm to work so dot names may not quite make sense.
    var dot11 = dotSame( bcx, bcy );
    var dot12 = dot( bcx, bcy, acx, acy );
    var dot22 = dotSame( acx, acy );
    var denom1 = 1/( dot11 * dot22 - dot12 * dot12 );
    var colA: Int = 0;
    var colB: Int = 0;
    var colC: Int = 0;
    var u: Float = 0.;
    var v: Float = 0.;
    var x: Int = 0;
    var y: Int = 0;
    var col: Int;
    var a = 0;
    var r = 0;
    var g = 0;
    var b = 0;
    var xIter3: IteratorRange = boundIterator3( ax, bx, cx );
    var yIter3: IteratorRange = boundIterator3( ay, by, cy );
    var undoImage: Pixelimage = null;
    if( hasUndo ){
        undoImage = new Pixelimage( xIter3.length, yIter3.length );
        undoImage.putPixelImageRect( pixelImage, 0, 0, xIter3.start, yIter3.start, xIter3.max, yIter3.max );
    }
    for( px in xIter3 ){
        var pcx = px - cx;
        for( py in yIter3 ){
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
                colA = textureA.getARGB( x, y );
                x = Std.int( u*winB.width + winB.x );
                y = Std.int( v*winB.height + winB.y );
                colB = textureB.getARGB( x, y );
                x = Std.int( u*winC.width + winC.x );
                y = Std.int( v*winC.height + winC.y );
                colC = textureC.getARGB( x, y );
                // need to check the right a, b, c setup
                // unsure if this is correct
                var aA: Int = ( colB >> 24 ) & 0xFF;
                var rA: Int = ( colB >> 16 ) & 0xFF;
                var gA: Int = ( colB >> 8 ) & 0xFF;
                var bA: Int = colB & 0xFF;
                var aB: Int = ( colA >> 24 ) & 0xFF;
                var rB: Int = ( colA >> 16 ) & 0xFF;
                var gB: Int = ( colA >> 8 ) & 0xFF;
                var bB: Int = colA & 0xFF;
                var aC: Int = ( colC >> 24 ) & 0xFF;
                var rC: Int = ( colC >> 16 ) & 0xFF;
                var gC: Int = ( colC >> 8 ) & 0xFF;
                var bC: Int = colC & 0xFF;
                a = PixelChannel.boundChannel( aA*ratioA + aB*ratioB + aC*ratioC );
                r = PixelChannel.boundChannel( rA*ratioA + rB*ratioB + rC*ratioC );
                g = PixelChannel.boundChannel( gA*ratioA + gB*ratioB + gC*ratioC );
                b = PixelChannel.boundChannel( bA*ratioA + bB*ratioB + bC*ratioC );
                pixelImage.set_argbPixel( a, r, g, b, pixelImage.position( px, py ) );
            }
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

class TriPixel{
    /**
       <font color="LightPink" font-weight:"Bold">fillTriUnsafe</font> module level field
       @param hasHit defaults false, since a HitTri has runtime overhead.
    **/
    public var _fillTriUnsafe: ( pixelImage: Pixelimage
                        , ax: Float, ay: Float
                        , bx: Float, by: Float
                        , cx: Float, cy: Float
                        , color: Pixel32
                        , hasHit: Bool, hasUndo: Bool ) -> Null<HitTri> = fillTriUnsafe;
    /**
       <font color="LightPink" font-weight:"Bold">tileTriUnsafe</font> module level field
       @param hasHit defaults false, since a HitTri has runtime overhead.
    **/
    public var _tileTriUnsafe:(  pixelImage: Pixelimage
                        , ax: Float, ay: Float
                        , bx: Float, by: Float
                        , cx: Float, cy: Float
                        , tileImage: Pixelimage
                        , hasHit: Bool, hasUndo: Bool ) -> Null<HitTri> = tileTriUnsafe;
    /**
       <font color="LightPink" font-weight:"Bold">fillGradTriangle</font> module level field
       @param hasHit defaults false, since a HitTri has runtime overhead.
    **/          
    public var _fillGradTriangle:( pixelImage: Pixelimage
                        , ax: Float, ay: Float, colA: Pixel32
                        , bx: Float, by: Float, colB: Pixel32
                        , cx: Float, cy: Float, colC: Pixel32
                        , hasHit: Bool, hasUndo: Bool ) -> Null<HitTri> = fillGradTriangle;
}