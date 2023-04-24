package pixelimageXY.transformation;

import pixelimageXY.Pixelimage;

inline
function patternRectangle( thisImage: Pixelimage
                    , x: Float, y: Float
                    , w: Float, h: Float
                    , foreColor: Int, backColor: Int
                    , patternFill: Array<Bool> ){
    var p = Std.int( x );
    var xx = p;
    var q = Std.int( y );
    var maxX = Std.int( x + w );
    var maxY = Std.int( y + h );
    var count = 0;
    var useFore = true;
    while( true ){
        // use pattern while in range and then repeat
        if( count < patternFill.length ){
            useFore = patternFill[ count ];
            count++;
        } else {
            count = 0;
            useFore = patternFill[ count ];
            count++;
        }
        var color = (useFore)?foreColor: backColor;
        thisImage.setARGB( p++, q, color );
        if( p > maxX ){
            p = xx;
            q++;
        } 
        if( q > maxY ) break;
    }
}
inline
function patternRectangleDown( thisImage: Pixelimage
                        , x: Float, y: Float
                        , w: Float, h: Float
                        , foreColor: Int, backColor: Int
                        , patternFill: Array<Bool> ){
    var p = Std.int( x );
    var q = Std.int( y );
    var yy = q;
    var maxX = Std.int( x + w );
    var maxY = Std.int( y + h );
    var count = 0;
    var useFore = true;
    while( true ){
        // use pattern while in range and then repeat
        if( count < patternFill.length ){
            useFore = patternFill[ count ];
            count++;
        } else {
            count = 0;
            useFore = patternFill[ count ];
            count++;
        }
        var color: Int = (useFore)?foreColor: backColor;
        thisImage.setARGB( p, q++, color );
        if( q > maxY ){
            q = yy;
            q++;
        } 
        if( p > maxX ) break;
    }
}