package pi_xy.transformation;

import pi_xy.Pixelimage;
import pi_xy.algo.GeomPix;
import pi_xy.iter.BoundIterator;
import iterMagic.IteratorRangeXY;

    /**
        creates a new Pixelimage base on current image, rotated 90° clockwise
    **/
    inline
    function spinClock90( thisImage: Pixelimage
                        , x: Float, y: Float
                        , w: Float, h: Float 
                        , transparent: Bool = false, includeMask: Bool = false ): Pixelimage {
        var range: IteratorRangeXY = { x: x, y: y, w: w, h: h };
        var nextImage = new Pixelimage( Std.int( w ), Std.int( h ) );
        nextImage.transparent = transparent;
        for( i in range ) {
            // TODO: check
            nextImage.setARGB( range.yMax - range.y, range.x, thisImage.getARGB( range.x, range.y ) );
        }
        /*
        var p = Std.int( x );
        var xx = p;
        var q = Std.int( y );
        var maxX = Std.int( x + w );
        var maxY = Std.int( y + h );
        var nextImage = new Pixelimage( Std.int( h ), Std.int( w ) );
        nextImage.transparent = transparent;
        var color: Int = 0;
        while( true ){
            color = thisImage.getARGB( p, q ); // to do check if needs to be +1.
            nextImage.setARGB( maxY - q, p, color );
            p++;
            if( p > maxX ){
                p = xx;
                q++;
            } 
            if( q > maxY ) break;
        }
        */
        if( thisImage.mask != null && includeMask ) {
            nextImage.mask = thisImage.mask.transform.spunClock90( x, y, w, h, thisImage.mask.transparent, includeMask );
        }
        return nextImage;
    }
    inline
    function spinAntiClock90( thisImage: Pixelimage
                            , x: Float, y: Float
                            , w: Float, h: Float
                            , transparent: Bool = false, includeMask: Bool = false ): Pixelimage {
        var range: IteratorRangeXY = { x: x, y: y, w: w, h: h };
        var nextImage = new Pixelimage( Std.int( w ), Std.int( h ) );
        nextImage.transparent = transparent;
        for( i in range ) {
            // TODO: check
            nextImage.setARGB( range.y, range.xMax - range.x, thisImage.getARGB( range.y, range.x ) );
        }
        /*
        var p = Std.int( x );
        var xx = p;
        var q = Std.int( y );
        var maxX = Std.int( x + w );
        var maxY = Std.int( y + h );
        var nextImage = new Pixelimage( Std.int( h ), Std.int( w ) );
        nextImage.transparent = transparent;
        var color: Int = 0;
        while( true ){
            color = thisImage.getARGB( p, q ); // to do check if needs to be +1.
            nextImage.setARGB( q, maxX-p, color );
            p++;
            if( p > maxX ){
                p = xx;
                q++;
            } 
            if( q > maxY ) break;
        }
        */
        if( thisImage.mask != null && includeMask ) {
            nextImage.mask = thisImage.mask.transform.spunAntiClock90( x, y, w, h, thisImage.mask.transparent, includeMask );
        }
        return nextImage;
    }

    inline
    function spin180( thisImage: Pixelimage
                    , x: Float, y: Float
                    , w: Float, h: Float
                    , transparent: Bool = false, includeMask: Bool = false ): Pixelimage {
        var range: IteratorRangeXY = { x: x, y: y, w: w, h: h };
        var nextImage = new Pixelimage( Std.int( w ), Std.int( h ) );
        nextImage.transparent = transparent;
        for( i in range ) {
            // TODO: check
            nextImage.setARGB( range.xMax - range.x, range.yMax - range.y, thisImage.getARGB(  range.x, range.y ) );
        }
        /*
        var p = Std.int( x );
        var xx = p;
        var q = Std.int( y );
        var maxX = Std.int( x + w );
        var maxY = Std.int( y + h );
        var nextImage = new Pixelimage( Std.int( w ), Std.int( h ) );
        nextImage.transparent = transparent;
        var color: Int = 0;
        while( true ){
            color = thisImage.getARGB( p, q ); // to do check if needs to be +1.
            nextImage.setARGB( maxX - p, maxY - q, color );
            p++;
            if( p > maxX ){
                p = xx;
                q++;
            } 
            if( q > maxY ) break;
        }
        */
        if( thisImage.mask != null && includeMask ) {
            nextImage.mask = thisImage.mask.transform.spun180( x, y, w, h, thisImage.mask.transparent, includeMask );
        }
        return nextImage;
    }

    inline
    function rotatingClockwiseDegrees( thisImage: Pixelimage
                                     , angle: Float, centreX = 0., centreY = 0.
                                     , transparent: Bool = false, includeMask: Bool = false ){
        while( angle >= 360 ){
            angle -= 360;
        }
        while( angle <= -360 ){
            angle += 360;
        }
        return if( angle == 90. || angle == -270 ){
            thisImage.transform.spunClock90( 0, 0, thisImage.width, thisImage.height, transparent, includeMask );
        } else if( angle == -90 || angle == 270 ){
            thisImage.transform.spunAntiClock90( 0, 0, thisImage.width, thisImage.height, transparent, includeMask );
        } else if( angle == 180 || angle == -180 ){
            thisImage.transform.spun180( 0, 0, thisImage.width, thisImage.height, transparent, includeMask );
        } else {
            thisImage.transform.rotate( angle*Math.PI/180, centreX, centreY, transparent, includeMask );
        }
    }

    inline
    function rotatingClockwiseRadians( thisImage: Pixelimage
                                     , theta: Float, centreX = 0., centreY = 0.
                                     , transparent: Bool = false, includeMask: Bool = false ){
        while( theta >= 2*Math.PI ){
            theta -= 2*Math.PI;
        }
        while( theta <= -2*Math.PI ){
            theta += 2*Math.PI;
        }
        return if( theta == Math.PI/2 || theta == -3*Math.PI/2 ){
            thisImage.transform.spunClock90( 0, 0, thisImage.width, thisImage.height, transparent, includeMask );
        } else if( theta == -Math.PI/2 || theta == 3*Math.PI/2 ){
            thisImage.transform.spunAntiClock90( 0, 0, thisImage.width, thisImage.height, transparent, includeMask );
        } else if( theta == Math.PI || theta == -Math.PI ){
            thisImage.transform.spun180( 0, 0, thisImage.width, thisImage.height, transparent, includeMask );
        } else {
            thisImage.transform.rotate( theta, centreX, centreY, transparent, includeMask );
        }
    }
    @:access( pi_xy.Pixelimage.rectWindow )
    inline
    function rotating( thisImage: Pixelimage
                     , theta: Float, centreX = 0., centreY = 0.
                     , transparent: Bool = false, includeMask: Bool = false ){       
        var ax = 0.;
        var ay = 0.;
        if( centreX != 0. ){
            centreX = 0 + thisImage.width/2 + centreX;
            ax -= centreX;
        }
        if( centreY != 0. ){
            centreY = 0 + thisImage.height/2  + centreY;
            ay -= centreY;
        }
        var bx = ax + thisImage.width;
        var by = ay;
        var cx = bx;
        var cy = ay + thisImage.height;
        var dx = ax;
        var dy = cy;
        var sin = Math.sin( theta );
        var cos = Math.cos( theta );
        var temp = ax;
        ax = rotX( temp, ay, sin, cos );
        ay = rotY( temp, ay, sin, cos );
        var temp = bx;
        bx = rotX( temp, by, sin, cos );
        by = rotY( temp, by, sin, cos );
        var temp = cx;
        cx = rotX( temp, cy, sin, cos );
        cy = rotY( temp, cy, sin, cos );
        var temp = dx;
        dx = rotX( temp, dy, sin, cos );
        dy = rotY( temp, dy, sin, cos );
        if( centreX != 0. ){
            ax += centreX;
            bx += centreX;
            cx += centreX;
            dx += centreX;
        }
        if( centreY != 0. ){
            ay += centreY;
            by += centreY;
            cy += centreY;
            dy += centreY;
        }
        var boundX = boundIterator4( ax, bx, cx, dx );
        var boundY = boundIterator4( ay, by, cy, dy );
        var minX = boundX.start;
        var wid = boundX.length;
        var minY = boundY.start;
        var hi = boundY.length;
        var nextImage = new Pixelimage( wid, hi );
        nextImage.transparent = true;
        if( minX < 0. ){
            ax -= minX;
            bx -= minX;
            cx -= minX;
            dx -= minX;
        }
        if( minY < 0. ){
            ay -= minY;
            by -= minY;
            cy -= minY;
            dy -= minY;
        }
        nextImage.imageShape.quad( thisImage, thisImage.rectWindow, ax, ay, bx, by, cx, cy, dx, dy, false );
        if( nextImage.mask != null && includeMask ) {
            nextImage.mask = thisImage.mask.transform.rotate( theta, centreX, centreY, thisImage.mask.transparent, includeMask );
        }
        return nextImage;        
    }