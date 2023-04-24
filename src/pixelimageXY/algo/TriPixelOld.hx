package pixelimageXY.algo;
import pixelimageXY.iter.BoundIterator;
import pixelimageXY.iter.IteratorRange;
import pixelimageXY.algo.GeomPix;
import pixelimageXY.pixel.Pixel32;
import pixelimageXY.pixel.PixelChannel;
import pixelimageXY.algo.HitTri;

    //inline 
    function fillTriUnsafe5( pixelImage: Pixelimage
                          , ax: Float, ay: Float
                          , bx: Float, by: Float
                          , cx: Float, cy: Float
                          , color: Pixel32
                          , hasHit: Bool = false, hasUndo: Bool = false ): Null<HitTri>{
        var transparent = pixelImage.transparent;
        pixelImage.transparent = true;
        var a = ( color >> 24 ) & 0xFF;
        var r = ( color >> 16 ) & 0xFF;
        var g = ( color >> 8 ) & 0xFF;
        var b = color & 0xFF;                    
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
        var theta = 2*Math.PI/5;
        var omega = theta/3;
        var delta = 0.707;
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
        var s = 0.;
        var t = 0.;
        var sxx = 0.;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
        var txx = 0.;
        var sxx0 = 0.;
        var sxx1 = 0.;
        var sxx2 = 0.;
        var sxx3 = 0.;
        var sxx4 = 0.;
        var sxx5 = 0.;
        var sxx6 = 0.;
        var txx0 = 0.;
        var txx1 = 0.;
        var txx2 = 0.;
        var txx3 = 0.;
        var txx4 = 0.;
        var txx5 = 0.;
        var txx6 = 0.;
        for( x in xIter3 ){
            sxx0 = sx*(x + x0);
            sxx1 = sx*(x + x1);
            sxx2 = sx*(x + x2);
            sxx3 = sx*(x + x3);
            sxx4 = sx*(x + x4);
            sxx5 = sx*(x + 0);
            sxx6 = sx*(x + 0);

            txx0 = tx*(x + x0);
            txx1 = tx*(x + x1);
            txx2 = tx*(x + x2);
            txx3 = tx*(x + x3);
            txx4 = tx*(x + x4);
            txx5 = tx*(x + 0);
            txx6 = tx*(x + 0);
            for( y in yIter3 ){
                s = s0 + sxx0 + sy*(y+y0);
                t = t0 + txx0 + ty*(y+y0);
                if( s <= 0 || t <= 0 ){} else {
                    if( (s + t) < A ) {
                        var a5 = PixelChannel.boundChannel( a/14 );
                        pixelImage.set_argbPixel( a5, r, g, b, pixelImage.position( x, y ) );
                        pixelImage.set_argbPixel( a5, r, g, b, pixelImage.position( x, y ) );
                    }
                }
                s = s0 + sxx1 + sy*(y+y1);
                t = t0 + txx1 + ty*(y+y1);
                if( s <= 0 || t <= 0 ){} else {
                    if( (s + t) < A ) {
                        var a5 = PixelChannel.boundChannel( a/14 );
                        pixelImage.set_argbPixel( a5, r, g, b, pixelImage.position( x, y ) );
                        pixelImage.set_argbPixel( a5, r, g, b, pixelImage.position( x, y ) );
                    }
                }
                s = s0 + sxx2 + sy*(y+y2);
                t = t0 + txx2 + ty*(y+y2);
                if( s <= 0 || t <= 0 ){} else {
                    if( (s + t) < A ) {
                        var a5 = PixelChannel.boundChannel( a/14 );
                        pixelImage.set_argbPixel( a5, r, g, b, pixelImage.position( x, y ) );
                        pixelImage.set_argbPixel( a5, r, g, b, pixelImage.position( x, y ) );
                    }
                }
                s = s0 + sxx3 + sy*(y+y3);
                t = t0 + txx3 + ty*(y+y3);
                if( s <= 0 || t <= 0 ){} else {
                    if( (s + t) < A ) {
                        var a5 = PixelChannel.boundChannel( a/14 );
                        pixelImage.set_argbPixel( a5, r, g, b, pixelImage.position( x, y ) );
                        pixelImage.set_argbPixel( a5, r, g, b, pixelImage.position( x, y ) );
                    }
                }
                s = s0 + sxx4 + sy*(y+y4);
                t = t0 + txx4 + ty*(y+y4);
                if( s <= 0 || t <= 0 ){} else {
                    if( (s + t) < A ) {
                        var a5 = PixelChannel.boundChannel( a/14 );
                        pixelImage.set_argbPixel( a5, r, g, b, pixelImage.position( x, y ) );
                        pixelImage.set_argbPixel( a5, r, g, b, pixelImage.position( x, y ) );
                    }
                }
                s = s0 + sxx5 + sy*(y+0);
                t = t0 + txx5 + ty*(y+0);
                if( s <= 0 || t <= 0 ){} else {
                    if( (s + t) < A ) {
                        var a5 = PixelChannel.boundChannel( a/14 );
                        pixelImage.set_argbPixel( a5, r, g, b, pixelImage.position( x, y ) );
                        pixelImage.set_argbPixel( a5, r, g, b, pixelImage.position( x, y ) );
                    }
                }
                s = s0 + sxx6 + sy*(y+0);
                t = t0 + txx6 + ty*(y+0);
                if( s <= 0 || t <= 0 ){} else {
                    if( (s + t) < A ) {
                        var a5 = PixelChannel.boundChannel( a/14 );
                        pixelImage.set_argbPixel( a5, r, g, b, pixelImage.position( x, y ) );
                        pixelImage.set_argbPixel( a5, r, g, b, pixelImage.position( x, y ) );
                    }
                }   
            }                                                                                                                                                                                                                                                                                                                                                                                                                                
        }
        pixelImage.transparent = transparent;
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

    function fillTriUnsafe6( pixelImage: Pixelimage
                          , ax: Float, ay: Float
                          , bx: Float, by: Float
                          , cx: Float, cy: Float
                          , color: Pixel32
                          , hasHit: Bool = false, hasUndo: Bool = false ): Null<HitTri>{
        var transparent = pixelImage.transparent;
        pixelImage.transparent = true;
        var a = ( color >> 24 ) & 0xFF;
        var r = ( color >> 16 ) & 0xFF;
        var g = ( color >> 8 ) & 0xFF;
        var b = color & 0xFF;                    
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
        var s = 0.;
        var t = 0.;
        var sxx = 0.;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
        var txx = 0.;
        var sxx0 = 0.;
        var sxx1 = 0.;
        var sxx2 = 0.;
        var sxx3 = 0.;
        var sxx4 = 0.;
        var sxx5 = 0.;
        var sxx6 = 0.;
        var txx0 = 0.;
        var txx1 = 0.;
        var txx2 = 0.;
        var txx3 = 0.;
        var txx4 = 0.;
        var txx5 = 0.;
        var txx6 = 0.;
        var a7 = 0.;
        var found = false;
        var on = false;
        for( x in xIter3 ){
            sxx0 = sx*(x + x0);
            sxx1 = sx*(x + x1);
            sxx2 = sx*(x + x2);
            sxx3 = sx*(x + x3);
            sxx4 = sx*(x + x4);
            sxx5 = sx*(x + 0);
            sxx6 = sx*(x + 0);

            txx0 = tx*(x + x0);
            txx1 = tx*(x + x1);
            txx2 = tx*(x + x2);
            txx3 = tx*(x + x3);
            txx4 = tx*(x + x4);
            txx5 = tx*(x + 0);
            txx6 = tx*(x + 0);
            found = false;
            on = false;
            for( y in yIter3 ){
                a7 = 0.; // reset a7
                s = s0 + sxx0 + sy*(y+y0); // add up the pentagon hits
                t = t0 + txx0 + ty*(y+y0);
                if( !( s <= 0 || t <= 0 ) ) if( ( s + t ) < A ) a7 += 1/5;
                s = s0 + sxx1 + sy*(y+y1);
                t = t0 + txx1 + ty*(y+y1);
                if( !( s <= 0 || t <= 0 ) ) if( ( s + t ) < A ) a7 += 1/5;
                s = s0 + sxx2 + sy*(y+y2);
                t = t0 + txx2 + ty*(y+y2);
                if( !( s <= 0 || t <= 0 ) ) if( ( s + t ) < A ) a7 += 1/5;
                s = s0 + sxx3 + sy*(y+y3);
                t = t0 + txx3 + ty*(y+y3);
                if( !( s <= 0 || t <= 0 ) ) if( ( s + t ) < A ) a7 += 1/5;
                s = s0 + sxx4 + sy*(y+y4);
                t = t0 + txx4 + ty*(y+y4);
                if( !( s <= 0 || t <= 0 ) ) if( ( s + t ) < A ) a7 += 1/5;
                s = s0 + sxx5 + sy*(y+0);
                t = t0 + txx5 + ty*(y+0);
                if( ( s <= 0 || t <= 0 ) ) { 

                } else {
                    if( (s + t) < A ) {
                        a7 += 1/2;
                        if( found ){
                            //a7 = 1/2;
                        } else {
                            //
                            //a7 = 1.;
                        }
                        found = true;
                    }
                }
                /*
                s = s0 + sxx6 + sy*(y+0);
                t = t0 + txx6 + ty*(y+0);
                if( !( s <= 0 || t <= 0 ) ) if( (s + t) < A ) a7 = 1;
                */
                if( a7 != 0. ) {
                    pixelImage.set_argbPixel( 
                                            ( a7 > 0.9 )? a: PixelChannel.boundChannel( a*a7 )
                                            , r, g, b, pixelImage.position( x, y ) );  
                                            
                }
            }                                                                                                                                                                                                                                                                                                                                                                                                                                
        }
        pixelImage.transparent = transparent;
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