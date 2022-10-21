package pixelimage.algo;

// Module CirclePixel

    // equation from math.stackexchange from TeM
    inline
    function circleError( radius: Float, ?targetE: Float = 1.05, ?minN: Int = 12, ?maxN: Int = 500 ): Int {
        var result = Math.ceil( Math.PI/( Math.acos( 1 - targetE/radius ) ) );
        return if( result < minN ){
            minN;
        } else if( result > maxN ){
            maxN;
        } else {
            result;
        }
    }
    inline
    function getSidesDivisible4( rx: Float, ry: Float, targetError: Float = 1.05 ): Int {
        var rSmall = ( rx > ry )? ry: rx;
        var noSides = circleError( rSmall, targetError );
        return Math.ceil( noSides / 4 ) *4;
    }