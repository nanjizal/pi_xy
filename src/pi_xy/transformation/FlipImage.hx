package pi_xy.transformation;
import pi_xy.Pixelimage;
import iterMagic.IteratorRangeXY;

    /**
        creates a new Pixelimage that is flipped horizonally.
        inPlace overwrites current.
    **/
    inline
    function imageflipX( thisImage: Pixelimage
                       , x: Float, y: Float
                       , w: Float, h: Float
                       , transparent: Bool = false
                       , inPlace: Bool = false, includeMask: Bool = false ): Pixelimage {
        var range: IteratorRangeXY = { x: x, y: y, w: w, h: h };
        var nextImage = new Pixelimage( Std.int( w ), Std.int( h ) );
        nextImage.transparent = transparent;
        for( i in range ) {
            // TODO: check
            nextImage.setARGB( range.x, range.y, thisImage.getARGB( range.xMax - range.x, range.y ) );
        }
        /*
        var p: Int = Std.int( x );
        var xx = p;
        var q = Std.int( y );
        var maxX = Std.int( x + w );
        var maxY = Std.int( y + h );
        var nextImage = new Pixelimage( Std.int( w ), Std.int( h ) );
        nextImage.transparent = thisImage.transparent;
        var color: Int = 0;
        while( true ){
            color = thisImage.getARGB( maxX - p, q ); // to do check if needs to be +1.
            nextImage.setARGB( p++, q, color );
            if( p > maxX ){
                p = xx;
                q++;
            } 
            if( q > maxY ) break;
        }
        */
        return if( inPlace ){
            thisImage.putPixelImage( nextImage, Std.int( x ), Std.int( y ) );
            if( thisImage.mask != null && includeMask ) thisImage.mask = thisImage.mask.transform.flippedX( x, y, thisImage.width, thisImage.height, thisImage.mask.transparent, inPlace, includeMask );
            nextImage = null;
            thisImage;
        } else {
            if( thisImage.mask != null && includeMask ) nextImage.mask = thisImage.mask.transform.flippedY( x, y, thisImage.width, thisImage.height, thisImage.mask.transparent, inPlace, includeMask );
            nextImage;
        }
    }

       /**
        creates a new Pixelimage that is flipped vertically.
        inPlace overwrites current.
    **/
    inline
    function imageflipY( thisImage: Pixelimage
                       , x: Float, y: Float
                       , w: Float, h: Float
                       , transparent: Bool = false
                       , inPlace: Bool = false, includeMask: Bool = false ): Pixelimage {
        var range: IteratorRangeXY = { x: x, y: y, w: w, h: h };
        var nextImage = new Pixelimage( Std.int( w ), Std.int( h ) );
        nextImage.transparent = transparent;
        for( i in range ) {
            // TODO: check if yMax - y is out by 1.
            nextImage.setARGB( range.x, range.y, thisImage.getARGB( range.x, range.yMax - range.y ) );
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
            color = thisImage.getARGB( p, maxY - q ); // to do check if needs to be +1.
            nextImage.setARGB( p++, q, color );
            if( p > maxX ){
                p = xx;
                q++;
            } 
            if( q > maxY ) break;
        }
        */
        return if( inPlace ){
            thisImage.putPixelImage( nextImage, Std.int( x ), Std.int( y ) );
            if( thisImage.mask != null && includeMask ) thisImage.mask = thisImage.mask.transform.flippedY( x, y, thisImage.width, thisImage.height, thisImage.mask.transparent, inPlace, includeMask );
            nextImage = null;
            thisImage;
        } else {
            if( thisImage.mask != null && includeMask ){
                nextImage.mask = thisImage.mask.transform.flippedY( x, y, thisImage.width, thisImage.height, thisImage.mask.transparent, inPlace, includeMask );
            }
            nextImage;
        }
    } 
