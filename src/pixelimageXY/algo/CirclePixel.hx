package pixelimageXY.algo;

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

class CirclePixel{
    /**
       <font color="LightPink" font-weight:"Bold">circleError</font> module level field
       @param targetE defaults 1.05 adjust to change the quality of the circle
       @param minN defaults 12, minimum sides used
       @param maxN defaults 500, maximum sides used
    **/
    public var _circleError:( radius: Float
                           , ?targetE: Float
                           , ?minN: Int
                           , ?maxN: Int ) -> Int = circleError;
        /**
       <font color="LightPink" font-weight:"Bold">getSidesDivisible4</font> module level field
       @param targetE defaults 1.05 adjust to change the quality of the circle
       @return uses min dimension for target diameter returns nearest divisble by 4
    **/
    public var _getSidesDivisible4:( rx: Float, ry: Float, targetError: Float ) -> Int = getSidesDivisible4;
}