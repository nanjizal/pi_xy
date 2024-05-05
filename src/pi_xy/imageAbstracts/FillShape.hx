package pi_xy.imageAbstracts;
import pi_xy.Pixelimage;
import pi_xy.hit.HitTri;
import pi_xy.hit.HitQuad;
import pi_xy.hit.HitTriArray;
import pi_xy.algo.GeomPix;
import pi_xy.pixel.Pixel32;
import pi_xy.algo.QuadrantPixel;
import pi_xy.algo.RectanglePixel;
import pi_xy.algo.PolyPixel;
import pi_xy.algo.CirclePixel;
import pi_xy.algo.ArrowPixel;

@:transient
abstract FillShape( Pixelimage ) from Pixelimage to Pixelimage {

    inline
    public function new( w: Int, h: Int ){
       this = new Pixelimage( w, h );
    }
    /**
        provides a simple filled square a short cut 
        @see simpleRect
    **/
    public inline
    function square( x: Float, y: Float
                       , d: Float
                       , color: Int ) {
        this.simpleRect( x-d/2, y-d/2, d, d, color );
    }
    /**
        provides a filled triangle give a,b,c coordinates
        automagically rearranges coordinates so it always renders
    **/
    public inline
    function triangle( ax: Float, ay: Float
                    , bx: Float, by: Float
                    , cx: Float, cy: Float
                    , color: Pixel32
                    , hasHit: Bool = false
                    , hasUndo: Bool = false ): Null<HitTri> {
        return pi_xy.algo.TriPixel
            .fillTriangle( this
                         , ax, ay, bx, by, cx, cy, color, hasHit, hasUndo );
    }
    /**
        uses two triangles to create a filled quad using four coordinates a,b,c,d arranged clockwise 
    **/
    public inline
    function quad( ax: Float, ay: Float
                     , bx: Float, by: Float
                     , cx: Float, cy: Float
                     , dx: Float, dy: Float 
                     , color: Int
                     , hasHit: Bool = false ): HitQuad {
        // tri e - a b d
        // tri f - b c d
        return pi_xy.algo.QuadPixel
            .fillQuadrilateral( this
                              , ax, ay, bx, by, cx, cy, dx, dy, color, hasHit );
    }
    /**
        provides a thick line using two triangles vector p, q
        debug corners draws coloured squares on the corners for development
    **/
    public inline 
    function line( px: Float, py: Float, qx: Float, qy: Float
                     , thick: Float, color: Int, hasHit: Bool = true, ?debugCorners = false ): Null<HitQuad> {
        var o = qy-py;
        var a = qx-px;
        var h = Math.pow( o*o + a*a, 0.5 );
        var theta = Math.atan2( o, a );
        return pi_xy.algo.LinePixel
            .rotateLine( this
                       , px, py, thick, h, theta, color, hasHit, debugCorners );
    }
    /**
        x, y      - position
        hi, wid   - the outside dimensions
        dx, dy    - define the 9-slice distance in from x, y, dy can default to dx
        fat, tall - the inner dimensions of the 9-slice centre, optional
    **/
    public inline
    function roundRectangle( x: Float, y: Float
                          , hi: Float, wid: Float
                          , color: Int
                          , ?dx: Float = -1., ?dy:Float = -1.
                          , ?fat:Float = -1., ?tall:Float = -1. ){
        return pi_xy.algo.RoundRecPixel
            .fillRoundRectangle( this
                                , x, y
                                , wid, hi
                                , color
                                , dx, dy
                                , fat, tall );
    }
        /**
        fill Quadrant draws a quarter arc, for rounded rectangle there are I,II,III,IV defined ones in Pixelshape
    **/
    public inline
    function quadrant( cx: Float, cy: Float
                         , rx: Float, ry: Float
                         , startAngle: Float
                         , color: Int
                         , ?phi:Float
                         , ?targetError: Float = 1.05 ){
        solidQuadrant( this
                     , cx, cy
                     , rx, ry
                     , startAngle
                     , color
                     , phi
                     , targetError );
    }
    public inline
    function quadrantI( cx: Float, cy: Float
                          , rx: Float, ry: Float
                          , color: Int, ?phi: Float = 0. ){
        // positive positive plane I  + + , simon says RED
        return quadrant( cx, cy
                       , rx, ry
                       , 3 * Math.PI / 2
                       , color, phi );
    }
    public inline
    function quadrantII( cx: Float, cy: Float
                       , rx: Float, ry: Float
                       , color: Int
                       , ?phi:Float = 0. ){
        // plane II  - + , simon says GREEN
        return quadrant( cx, cy
                       , rx, ry
                       , Math.PI
                       , color
                       , phi );
    }

    public inline
    function quadrantIII( cx: Float, cy: Float
                            , rx: Float, ry: Float
                            , color: Int, ?phi: Float = 0. ){
        // negative negative plane III - - , simon says YELLOW
        return quadrant( cx, cy
                       , rx, ry
                       , Math.PI / 2
                       , color
                       , phi );
    }

    public inline
    function quadrantIV( cx: Float, cy: Float
                           , rx: Float, ry: Float
                           , color: Int
                           , ?phi: Float = 0. ){
        // plane IV  + - , simon says BLUE
        return quadrant( cx, cy
                       , rx, ry
                       , 0
                       , color
                       , phi );
    }

    public inline
    function simonSays( cx: Float, cy: Float, radius: Float ){
        quadrantI(   cx, cy, radius, radius, 0xffd8402f );
        quadrantII(  cx, cy, radius, radius, 0xff3bab5c );
        quadrantIII( cx, cy, radius, radius, 0xfff2ee64 );
        quadrantIV(  cx, cy, radius, radius, 0xff2d7fc2 );
    }

    public inline
    function circle( cx: Float, cy: Float
                       , r: Float
                       , color: Int
                       , ?phi: Float = 0. ){
        ellipseTri( cx, cy
                      , r, r
                      , color
                      , phi );
    }

    public inline
    function ellipse( cx: Float, cy: Float
                        , rx: Float, ry: Float
                        , color: Int
                        , ?phi: Float = 0. ){
        ellipseTri( cx, cy
                      , rx, ry
                      , color
                      , phi );
    }
    /**
        this provides building block for regular polygons,ellipses and circles
        cornerUp false will have polygon with flat edge on the top
        defined from centre cx,cy the radius allow stretching the regualar and phi controls rotation
        sides defines the sides required
        would be nice to add skew in future?
        cornerUp may need debugging
    **/
    public inline
    function polyBuild( cx: Float, cy: Float
                          , rx: Float, ry: Float
                          , color: Int
                          , ?phi: Float = 0.
                          , ?sides: Int = 36
                          , cornerUp: Bool = true ){
        fillPolygonBuild( this
                        , cx, cy
                        , rx, ry
                        , color
                        , phi
                        , sides
                        , cornerUp );
    }

    @:access(pixelimage.Pixelimage.fillEllipseTri)
    public inline
    function arrowHead( cx: Float, cy: Float
                          , rx: Float, ry: Float
                          , color: Int
                          , ?phi: Float = 0. ){
        polyBuild( cx, cy
                 , rx, ry
                 , color
                 , phi
                 , 3
                 , false);
    }

    public inline
    function pentagon( cx: Float, cy: Float
                         , rx: Float, ry: Float
                         , color: Int
                         , ?phi: Float = 0. ){
        polyBuild( cx, cy
                 , rx, ry
                 , color
                 , phi
                 , 5
                 , false );
    }

    public inline
    function hexagon( cx: Float, cy: Float
                        , rx: Float, ry: Float
                        , color: Int
                        , ?phi:Float = 0. ){
        polyBuild( cx, cy
                 , rx, ry
                 , color
                 , phi
                 , 6
                 , false );
    }

    public inline
    function heptagon( cx: Float, cy: Float
                         , rx: Float, ry: Float
                         , color: Int
                         , ?phi: Float = 0. ){
        polyBuild( cx, cy
                 , rx, ry
                 , color
                 , phi
                 , 7
                 , false );
    }

    public inline
    function septagon( cx: Float, cy: Float
                         , rx: Float, ry: Float
                         , color: Int
                         , ?phi: Float = 0. ){
        polyBuild( cx, cy
                 , rx, ry
                 , color
                 , phi
                 , 7
                 , false );
    }
 
    public inline
    function octagon( cx: Float, cy: Float
                        , rx: Float, ry: Float
                        , color: Int
                        , ?phi: Float = 0. ){
        polyBuild( cx, cy
                 , rx, ry
                 , color
                 , phi
                 , 8
                 , false );
    }

    public inline
    function nonagon( cx: Float, cy: Float
                        , rx: Float, ry: Float
                        , color: Int
                        , ?phi: Float = 0. ){
        polyBuild( cx, cy
                 , rx, ry
                 , color
                 , phi
                 , 9
                 , false );
    }

    public inline
    function enneagon( cx: Float, cy: Float
                         , rx: Float, ry: Float
                         , color: Int
                         , ?phi: Float = 0. ){
        polyBuild( cx, cy
                 , rx, ry
                 , color
                 , phi
                 , 9
                 , false );
    }

    public inline
    function decagon( cx: Float, cy: Float
                        , rx: Float, ry: Float
                        , color: Int
                        , ?phi: Float = 0. ){
        polyBuild( cx, cy
                 , rx, ry
                 , color
                 , phi
                 , 10
                 , false );
    }

    public inline
    function hendecagon( cx: Float, cy: Float
                           , rx: Float, ry: Float
                           , color: Int
                           , ?phi: Float = 0. ){
        polyBuild( cx, cy
                 , rx, ry
                 , color
                 , phi
                 , 11
                 , false );
    }

    public inline
    function undecagon( cx: Float, cy: Float
                          , rx: Float, ry: Float
                          , color: Int
                          , ?phi: Float = 0. ){
        polyBuild( cx, cy
                 , rx, ry
                 , color
                 , phi
                 , 11
                 , false );
    }
 
    public inline
    function dodecagon( cx: Float, cy: Float
                          , rx: Float, ry: Float
                          , color: Int
                          , ?phi: Float = 0. ) {
        polyBuild( cx, cy
                 , rx, ry
                 , color
                 , phi
                 , 12
                 , false );
    }

    public inline
    function pie( ax: Float, ay: Float
                , rx: Float, ry: Float
                , startRadian: Float, sweepRadian: Float
                , color: Pixel32
                , hasHit: Bool = false
                , ?targetError: Float = 1.05 ): Null<HitTriArray> {
        var rSmall = ( rx > ry ) ? ry : rx;
        var noSides = circleError( rSmall, targetError );
        var theta = 1.41213 * Math.PI / noSides; // 2* but make smaller
        var currAngle = startRadian;
        var tot = Math.floor( sweepRadian / theta );
        theta += ( sweepRadian / theta - tot ) / noSides;
        tot = Math.floor( sweepRadian / theta );
        var bx = rx * Math.cos( currAngle ) + ax;
        var by = ry * Math.sin( currAngle ) + ay;
        var cx = 0.;
        var cy = 0.;
        var arrTri:Array<HitTri> = [];
        for( i in 1...tot + 1 ){
            currAngle = startRadian + i * theta;
            cx = rx * Math.cos( currAngle ) + ax;
            cy = ry * Math.sin( currAngle ) + ay;
            var triHit = triangle( ax, ay, bx, by, cx, cy, color, hasHit );
            if( hasHit ) arrTri[ arrTri.length ] = triHit;
            bx = cx;
            by = cy;
        }
        // last pie
        currAngle = startRadian + sweepRadian;
        cx = rx * Math.cos( currAngle ) + ax;
        cy = ry * Math.sin( currAngle ) + ay;
        var triHit = triangle( ax, ay, bx, by, cx, cy, color, hasHit );
        if( hasHit ) arrTri[ arrTri.length ] = triHit;
        return if( hasHit ) {
            new HitTriArray( arrTri );
        } else {
            arrTri = null;
            null;
        }
    }

    public inline
    function sweepTri( ax: Float, ay: Float
                     , rx: Float, ry: Float
                     , startRadian: Float, sweepRadian: Float
                     , color: Pixel32, hasHit: Bool = false ): Null<HitTri> {
        var currAngle = startRadian;
        var bx = rx * Math.cos( currAngle ) + ax;
        var by = ry * Math.sin( currAngle ) + ay;
        // last pie
        currAngle = startRadian + sweepRadian;
        var cx = rx * Math.cos( currAngle ) + ax;
        var cy = ry * Math.sin( currAngle ) + ay;
        return triangle( ax, ay, bx, by, cx, cy, color, hasHit );
    }

    public inline
    function lineGrid( x: Float, y: Float
                     , w: Float, h: Float
                     , delta: Float, thick: Float
                     , color: Int ){
        var h_ = Math.floor( h / delta ) * delta;
        var w_ = Math.floor( w / delta ) * delta;
        for( i in 0...Math.floor( w / delta ) + 1 ){
            this.simpleRect( x + i * delta - thick / 2, y, thick, h_, color );
        }
        for( i in 0...Math.floor( h / delta ) + 1 ){
            this.simpleRect( x, y + i * delta - thick / 2, w_, thick, color );
        }
    }

    public inline
    function lineGridWH( x: Float, y: Float
                       , w: Float, h: Float
                       , deltaW: Float, deltaH: Float
                       , thick: Float,  color: Int ){
        var h_ = Math.floor( h / deltaH ) * deltaH;
        var w_ = Math.floor( w / deltaW ) * deltaW;
        for( i in 0...Math.floor( w / deltaW ) + 1){
            this.simpleRect( x + i * deltaW - thick / 2, y, thick, h_, color );
        }
        for( i in 0...Math.floor( h / deltaH ) + 1 ){
            this.simpleRect( x, y + i * deltaH - thick / 2, w_, thick, color );
        }
    }

    /**
        provides a thick arrow using two triangles vector p, q
    **/
    public inline
    function arrow( px: Float, py: Float
                      , qx: Float, qy: Float
                      , thick: Float, color: Int
                      , flare: Bool = false, reverseFlare: Bool = false
                      , hasHit: Bool = true ): Null<HitTriArray> {
        return fillLineArrow( this
                            , px, py
                            , qx, qy
                            , thick, color
                            , flare, reverseFlare
                            , hasHit );
    }

    public inline
    function arrowBoth( px: Float, py: Float
                          , qx: Float, qy: Float
                          , thick: Float, color: Int
                          , hasHit: Bool = true ): Null<HitTriArray> {
        return fillLineArrowBoth( this
                                , px, py
                                , qx, qy
                                , thick, color
                                , hasHit );
    }

    public inline
    function fixArrow( px: Float, py: Float
                         , qx: Float, qy: Float
                         , arrowWidth: Float, arrowHeight: Float
                         , thick: Float, color: Int
                         , flare: Bool = false, reverseFlare: Bool = false
                         , hasHit: Bool = true ): Null<HitTriArray> {
        //trace('pixelimage.fillArrow');
        return fillLineFixedArrow( this
                                 , px, py
                                 , qx, qy
                                 , arrowWidth, arrowHeight
                                 , thick, color
                                 , flare, reverseFlare
                                 , hasHit);
    }

    public inline
    function fixArrowBoth( px: Float, py: Float
                             , qx: Float, qy: Float
                             , arrowWidth: Float, arrowHeight: Float
                             , thick: Float
                             , color: Int
                             , hasHit: Bool = true ): Null<HitTriArray> {
        return fillLineFixedArrowBoth( this
                                     , px, py
                                     , qx, qy
                                     , arrowWidth, arrowHeight
                                     , thick
                                     , color
                                     , hasHit );
    }
    /**
        this is used for drawing a filled ellipse or circle ( using triangles ), it uses more sides when larger and can be tweaked with targetError
        drawn from the circles/ellipses centre, with rx and ry the radius, phi allows rotatation of ellipses
        setup so large ellipses automatically use more sides.
    **/
    public inline
    function ellipseTri( cx: Float, cy: Float
                           , rx: Float, ry: Float
                           , color: Int
                           , ?phi: Float = 0
                           , ?printSides: Bool = false
                           , ?targetError: Float = 1.05) {
        var rSmall = (rx > ry) ? ry : rx;
        var noSides = circleError( rSmall, targetError );
        if( printSides ) trace(noSides);
        polyBuild( cx, cy
                 , rx, ry
                 , color
                 , phi
                 , noSides );
    }
}