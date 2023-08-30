package pixelimageXY.algo;

import pixelimageXY.Pixelimage;
import pixelimageXY.pixel.Pixel32;

    /**
        x, y      - position
        hi, wid   - the outside dimensions
        dx, dy    - define the 9-slice distance in from x, y, dy can default to dx
        fat, tall - the inner dimensions of the 9-slice centre, optional
    **/
    inline
    function fillRoundRectangle( pixelimage: Pixelimage
                          , x:     Float,        y:     Float
                          , wid:    Float,       hi:   Float
                          , color: Int
                          , ?dx:   Float = -1.,  ?dy: Float = -1.
                          , ?fat:  Float = -1.,  ?tall:  Float = -1. 
                          ){ // phi not implemented
        // if no dx set
        // use smallest dimension and assume three parts
        // with the middle section the goldenRatio larger!
        if( dx < 0. ){
            var smallest = ( hi < wid )? hi: wid;
            var goldenRatio = 1.61803398875;
            dx = smallest / ( goldenRatio + 2 );
        }
        if( dy < 0. )   dy = dx;
        if( fat < 0. )  fat = wid - 2*dx;
        if( tall < 0. ) tall = hi - 2*dy;
        var rightRadius  = wid - fat - dx;
        var bottomRadius = hi - tall - dy;
        var farX = x + dx + fat;
        var lowerY = y + dy + tall;
        // top row
        pixelimage.fillShape.quadrantII( x + dx, y + dy, dx, dy, color );
        pixelimage.simpleRect(  x + dx, y, fat, dy, color );
        pixelimage.fillShape.quadrantI(  farX, y + dy, rightRadius, dy, color );
        // middle row  ( will need more splitting with gradient )
        pixelimage.simpleRect(  x, y + dy, wid, tall, color );
        // bottom row
        pixelimage.fillShape.quadrantIII( x + dx, lowerY, dx, bottomRadius, color );
        pixelimage.simpleRect(   x + dx, lowerY, fat, bottomRadius, color );
        pixelimage.fillShape.quadrantIV(  farX,   lowerY, rightRadius, bottomRadius, color );
    }
    /**
        x, y      - position
        hi, wid   - the outside dimensions
        dx, dy    - define the 9-slice distance in from x, y, dy can default to dx
        fat, tall - the inner dimensions of the 9-slice centre, optional
    **/
    inline
    function tileRoundRectangle( pixelimage: Pixelimage
                          , x:     Float,        y:     Float
                          , wid:    Float,       hi:   Float
                          , tileImage: Pixelimage
                          , ?dx:   Float = -1.,  ?dy: Float = -1.
                          , ?fat:  Float = -1.,  ?tall:  Float = -1. 
                          ){ // phi not implemented
        // if no dx set
        // use smallest dimension and assume three parts
        // with the middle section the goldenRatio larger!
        if( dx < 0. ){
            var smallest = ( hi < wid )? hi: wid;
            var goldenRatio = 1.61803398875;
            dx = smallest / ( goldenRatio + 2 );
        }
        if( dy < 0. )   dy = dx;
        if( fat < 0. )  fat = wid - 2*dx;
        if( tall < 0. ) tall = hi - 2*dy;
        var rightRadius  = wid - fat - dx;
        var bottomRadius = hi - tall - dy;
        var farX = x + dx + fat;
        var lowerY = y + dy + tall;
        // top row
        pixelimage.tileShape.quadrantII( x + dx, y + dy, dx, dy, tileImage );
        pixelimage.tileShape.rectangle(  x + dx, y, fat, dy, tileImage );
        pixelimage.tileShape.quadrantI(  farX, y + dy, rightRadius, dy, tileImage );
        // middle row  ( will need more splitting with gradient )
        pixelimage.tileShape.rectangle(  x, y + dy, wid, tall, tileImage );
        // bottom row
        pixelimage.tileShape.quadrantIII( x + dx, lowerY, dx, bottomRadius, tileImage );
        pixelimage.tileShape.rectangle(   x + dx, lowerY, fat, bottomRadius, tileImage );
        pixelimage.tileShape.quadrantIV(  farX,   lowerY, rightRadius, bottomRadius, tileImage );
    }
        /**
        x, y      - position
        hi, wid   - the outside dimensions
        dx, dy    - define the 9-slice distance in from x, y, dy can default to dx
        fat, tall - the inner dimensions of the 9-slice centre, optional
    **/
    inline
    function fillGrad4RoundRectangle( pixelimage: Pixelimage
                               , x:     Float,        y:     Float
                               , hi:    Float,        wid:   Float
                               , colorA: Pixel32, colorB: Pixel32, colorC: Pixel32, colorD: Pixel32
                               , ?dx:   Float = -1.,  ?dy: Float = -1.
                               , ?fat:  Float = -1.,  ?tall:  Float = -1. 
                               ){ // phi not implemented
        // if no dx set
        // use smallest dimension and assume three parts
        // with the middle section the goldenRatio larger!
        if( dx < 0. ){
            var smallest = ( hi < wid )? hi: wid;
            var goldenRatio = 1.61803398875;
            dx = smallest / ( goldenRatio + 2 );
        }
        if( dy < 0. )   dy = dx;
        if( fat < 0. )  fat = wid - 2*dx;
        if( tall < 0. ) tall = hi - 2*dy;
        var rightRadius  = wid - fat - dx;
        var bottomRadius = hi - tall - dy;
        var farX = x + dx + fat;
        var lowerY = y + dy + tall;
        // top row
        pixelimage.fillShape.quadrantII( x + dx, y + dy, dx, dy, colorA );
        pixelimage.gradientShape.rectangle(  x + dx, y, fat, dy, colorA, colorB, colorB, colorA );
        pixelimage.fillShape.quadrantI(  farX, y + dy, rightRadius, dy, colorB );
        // middle row  ( will need more splitting with gradient )
        pixelimage.gradientShape.rectangle(  x, y + dy, dx, tall, colorA, colorA, colorD, colorD );
        pixelimage.gradientShape.rectangle(  x + dx, y + dy, fat, tall, colorA, colorB, colorC, colorD );
        pixelimage.gradientShape.rectangle(  farX, y + dy, rightRadius, tall, colorB, colorB, colorC, colorC );
        // bottom row
        pixelimage.fillShape.quadrantIII( x + dx, lowerY, dx, bottomRadius, colorD );
        pixelimage.gradientShape.rectangle(   x + dx, lowerY, fat, bottomRadius, colorD, colorC, colorC, colorD );
        pixelimage.fillShape.quadrantIV(  farX,   lowerY, rightRadius, bottomRadius, colorC );
    }

class RoundRecPixel {
    /**
       <font color="LightPink" font-weight:"Bold">fillRoundRectangle</font> module level field
    **/
    public var _fillRoundRectangle:( pixelimage: Pixelimage
        , x:     Float,        y:     Float
        , wid:    Float,       hi:   Float
        , color: Int
        , ?dx:   Float,  ?dy: Float
        , ?fat:  Float,  ?tall:  Float 
        ) -> Void = fillRoundRectangle;

    /**
       <font color="LightPink" font-weight:"Bold">tileRoundRectangle</font> module level field
    **/
    public var _tileRoundRectangle:( pixelimage: Pixelimage
        , x:     Float,        y:     Float
        , wid:    Float,       hi:   Float
        , tileImage: Pixelimage
        , ?dx:   Float,  ?dy: Float
        , ?fat:  Float,  ?tall:  Float 
        ) -> Void = tileRoundRectangle;

    /**
       <font color="LightPink" font-weight:"Bold">fillGrad4RoundRectangle</font> module level field
    **/
    public var _fillGrad4RoundRectangle:( pixelimage: Pixelimage
        , x:     Float,        y:     Float
        , hi:    Float,        wid:   Float
        , colorA: Pixel32, colorB: Pixel32, colorC: Pixel32, colorD: Pixel32
        , ?dx:   Float,  ?dy: Float
        , ?fat:  Float,  ?tall:  Float 
        ) -> Void = fillGrad4RoundRectangle;
}