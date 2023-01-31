package pixelimage;
import pixelimage.Pixelimage;
import pixelimage.pixel.Pixel32;
import pixelimage.algo.RoundRecPixel;
import pixelimage.algo.HitTri;
import pixelimage.algo.HitQuad;
import pixelimage.algo.HitTriArray;
import pixelimage.algo.GeomPix;

import vision.ds.Image;
import haxe.io.UInt32Array;
import pixelimage.iter.BoundIterator;
import pixelimage.iter.IteratorRange;
import pixelimage.ImageStruct;
import pixelimage.pixel.Pixel32;
import pixelimage.pixel.Pixel28;
import pixelimage.algo.GeomPix;
import pixelimage.pixel.PixelChannel;
import pixelimage.algo.TriPixel;
import pixelimage.algo.LinePixel;
import pixelimage.algo.CirclePixel;
import pixelimage.algo.PolyPixel;
//import pixelimage.algo.QuadPixel;
import pixelimage.algo.QuadrantPixel;
import pixelimage.algo.RoundRecPixel;
import pixelimage.algo.RectanglePixel;
import pixelimage.algo.HitTri;
import pixelimage.algo.HitQuad;
import pixelimage.algo.HitTriArray;
import pixelimage.algo.QuadPixel;
import pixelimage.algo.QuintPixel;
import pixelimage.algo.ArrowPixel;

@:transient
@:forward
abstract Pixelshape( Pixelimage ) to Pixelimage {
    inline
    public function new( w: Int, h: Int ){
        this = new Pixelimage( w, h );
    }
    /*
    // TODO: may remove.
    public inline
    function fillRect( x: Float, y: Float
                     , w: Float, h: Float
                     , color: Int, ?phi: Float = 0.
                     , ?debugCorners: Bool = false ) { 
        if( phi != 0. ){
            // need to tweak to get accurate offset..
            var cx = x + w/2;
            var cy = y + h/2;
            this.fillPolyBuild( x, y, w, h, color, phi, 4, false );
            //rotateLine( x, y, w, h, Math.PI/4, color );
        } else {
            this.simpleRect( x, y, w, h, color );
        }
	}
    */
    public inline
    function lineGrid( x: Float, y: Float, w: Float, h: Float, delta: Float, thick: Float, color: Int ){
        var h_ = Math.floor( h/delta )*delta;
        var w_ = Math.floor( w/delta )*delta;
        for( i in 0...Math.floor( w/delta )+1 ){
            this.simpleRect( x + i*delta -thick/2, y, thick, h_, color );
        }
        for( i in 0...Math.floor( h/delta )+1 ){
            this.simpleRect( x, y + i* delta - thick/2, w_, thick, color );
        }
    }
    public inline
    function lineGridWH( x: Float, y: Float, w: Float, h: Float, deltaW: Float, deltaH:Float, thick: Float, color: Int ){
        var h_ = Math.floor( h/deltaH )*deltaH;
        var w_ = Math.floor( w/deltaW )*deltaW;
        for( i in 0...Math.floor( w/deltaW )+1 ){
            this.simpleRect( x + i*deltaW -thick/2, y, thick, h_, color );
        }
        for( i in 0...Math.floor( h/deltaH )+1 ){
            this.simpleRect( x, y + i* deltaH - thick/2, w_, thick, color );
        }
    }
    /*
    public inline
    function fillDavidStar(x: Float, y: Float
                            , d: Float
                            , color: Int ) {
        fillSquare( x, y, d, color );
        fillRect( x, y, d*Math.pow(2,0.5), d*Math.pow(2,0.5), color, Math.PI/4 );
    }
    */
    /**
        x, y      - position
        hi, wid   - the outside dimensions
        dx, dy    - define the 9-slice distance in from x, y, dy can default to dx
        fat, tall - the inner dimensions of the 9-slice centre, optional
    **/
    public inline
    function fillRoundRect( x:     Float,        y:     Float
                          , hi:    Float,        wid:   Float
                          , color: Int
                          , ?dx:   Float = -1.,  ?dy: Float = -1.
                          , ?fat:  Float = -1.,  ?tall:  Float = -1. 
                          ){ 
        fillRoundRectangle( abstract, x, y, wid, hi, color, dx, dy, fat, tall );
    }
    public inline
    function lineRoundRect( x:     Float,        y:     Float
                          , hi:    Float,        wid:   Float
                          , thick: Float
                          , color: Int
                          , ?dx:   Float = -1.,  ?dy: Float = -1.
                          , ?fat:  Float = -1.,  ?tall:  Float = -1. 
                          ){ 
        var temp = new Pixelshape( Math.ceil( wid ), Math.ceil( hi ) );
        temp.transparent = false;
        fillRoundRectangle( temp, 0, 0, wid, hi, color, dx, dy, fat, tall );
        fillRoundRectangle( temp, thick, thick, wid-2*thick, hi-2*hi, 0x00000000, dx, dy, fat, tall );
        this.putPixelImage( temp, Std.int( x ), Std.int( y ) );
        temp = null;
    }
    /**
        x, y      - position
        hi, wid   - the outside dimensions
        dx, dy    - define the 9-slice distance in from x, y, dy can default to dx
        fat, tall - the inner dimensions of the 9-slice centre, optional
    **/
    public inline
    function fillGrad4RoundRect( x:     Float,        y:     Float
                               , hi:    Float,        wid:   Float
                               , colorA: Pixel32, colorB: Pixel32, colorC: Pixel32, colorD: Pixel32
                               , ?dx:   Float = -1.,  ?dy: Float = -1.
                               , ?fat:  Float = -1.,  ?tall:  Float = -1. 
                               ){ 
        fillGrad4RoundRectangle( abstract, x, y, hi, wid, colorA, colorC, colorB, colorD, dx, dy, fat, tall );
    }
    public inline
    function lineGrad4RoundRect( x:     Float,        y:     Float
                               , hi:    Float,        wid:   Float
                               , thick: Float
                               , colorA: Pixel32, colorB: Pixel32, colorC: Pixel32, colorD: Pixel32
                               , ?dx:   Float = -1.,  ?dy: Float = -1.
                               , ?fat:  Float = -1.,  ?tall:  Float = -1. 
                               ){ 
        var temp = new Pixelshape( Math.ceil( hi ), Math.ceil( wid ) );
        temp.transparent = false;
        fillGrad4RoundRectangle( temp, 0, 0, hi, wid, colorA, colorC, colorB, colorD, dx, dy, fat, tall );
        fillRoundRectangle( temp, thick, thick, wid-2*thick, hi-2*hi, 0x00000000, dx, dy, fat, tall );
        this.putPixelImage( temp, Std.int( x ), Std.int( y ) );
        temp = null;

    }
    public inline
    function testFillSimonSaysQuadrant( cx: Float, cy: Float, radius: Float ){
        fillQuadrantI(   cx, cy, radius, radius, 0xffd8402f );
        fillQuadrantII(  cx, cy, radius, radius, 0xff3bab5c );
        fillQuadrantIII( cx, cy, radius, radius, 0xfff2ee64 );
        fillQuadrantIV(  cx, cy, radius, radius, 0xff2d7fc2 );
    }
    public inline
    function fillQuadrantI( cx:    Float, cy:   Float
                          , rx:    Float, ry:   Float
                          , color: Int,   ?phi: Float = 0.
                          ){
        // positive positive plane I  + + , simon says RED
        fillQuadrant( cx, cy, rx, ry, 3*Math.PI/2, color, phi );
    }
    public inline
    function tileQuadrantI( cx:    Float, cy:   Float
                          , rx:    Float, ry:   Float
                          , tileImage: Pixelimage,   ?phi: Float = 0.
                          ){
        // positive positive plane I  + + , simon says RED
        tileQuadrant( cx, cy, rx, ry, 3*Math.PI/2, tileImage, phi );
    }
    public inline 
    function fillQuadrantII( cx:    Float, cy:   Float
                           , rx:    Float, ry:   Float
                           , color: Int,   ?phi: Float = 0. ){
        // plane II  - + , simon says GREEN
        fillQuadrant( cx, cy, rx, ry, Math.PI, color, phi );
    }
    public inline 
    function tileQuadrantII( cx:    Float, cy:   Float
                           , rx:    Float, ry:   Float
                           , tileImage: Pixelimage,   ?phi: Float = 0. ){
        // plane II  - + , simon says GREEN
        tileQuadrant( cx, cy, rx, ry, Math.PI, tileImage, phi );
    }
    public inline
    function fillQuadrantIII( cx:    Float, cy:   Float
                            , rx:    Float, ry:   Float
                            , color: Int,   ?phi: Float = 0. ){
        // negative negative plane III - - , simon says YELLOW
        fillQuadrant( cx, cy, rx, ry, Math.PI/2, color, phi );
    }
    public inline
    function tileQuadrantIII( cx:    Float, cy:   Float
                            , rx:    Float, ry:   Float
                            , tileImage: Pixelimage,   ?phi: Float = 0. ){
        // negative negative plane III - - , simon says YELLOW
        tileQuadrant( cx, cy, rx, ry, Math.PI/2, tileImage, phi );
    }
    public inline
    function fillQuadrantIV( cx:    Float, cy:   Float
                           , rx:    Float, ry:   Float
                           , color: Int,   ?phi: Float = 0. ){
        // plane IV  + - , simon says BLUE
        fillQuadrant( cx, cy, rx, ry, 0, color, phi );
    }
    public inline
    function tileQuadrantIV( cx:    Float, cy:   Float
                           , rx:    Float, ry:   Float
                           , tileImage: Pixelimage,   ?phi: Float = 0. ){
        // plane IV  + - , simon says BLUE
        tileQuadrant( cx, cy, rx, ry, 0, tileImage, phi );
    }
    @:access( pixelimage.Pixelimage.fillEllipseTri )
    public inline
    function fillCircle( cx: Float, cy: Float, r: Float, color: Int, ?phi: Float = 0 ){
        fillEllipseTri( cx, cy, r, r, color, phi );
    }
    @:access( pixelimage.Pixelimage.fillEllipseTri )
    public inline
    function fillEllipse( cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        fillEllipseTri( cx, cy, rx, ry, color, phi );
    }
    public inline
    function fillArrowHead( cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        fillPolyBuild( cx, cy, rx,  ry, color, phi, 3, false );
    } 
    public inline
    function fillPentagon( cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        fillPolyBuild( cx, cy, rx,  ry, color, phi, 5, false );
    }
    public inline 
    function fillHexagon( cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        fillPolyBuild( cx, cy, rx,  ry, color, phi, 6, false );
    }
    public inline
    function fillHeptagon( cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        fillPolyBuild( cx, cy, rx,  ry, color, phi, 7, false );
    }
    public inline
    function fillSeptagon( cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        fillPolyBuild( cx, cy, rx,  ry, color, phi, 7, false );
    }
    public inline
    function fillOctagon( cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        fillPolyBuild( cx, cy, rx,  ry, color, phi, 8, false );
    }
    public inline
    function fillNonagon( cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        fillPolyBuild( cx, cy, rx,  ry, color, phi, 9, false );
    }
    public inline
    function fillEnneagon( cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        fillPolyBuild( cx, cy, rx,  ry, color, phi, 9, false );
    }
    public inline
    function fillDecagon( cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        fillPolyBuild( cx, cy, rx,  ry, color, phi, 10, false );
    }
    public inline
    function fillHendecagon( cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        fillPolyBuild( cx, cy, rx,  ry, color, phi, 11, false );
    }
    public inline
    function fillUndecagon( cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        fillPolyBuild( cx, cy, rx,  ry, color, phi, 11, false );
    }
    public inline
    function fillDodecagon(cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        fillPolyBuild( cx, cy, rx,  ry, color, phi, 12, false );
    }
    
    public inline
    function softFillQuint( ax: Float, ay: Float
                     , bx: Float, by: Float
                     , cx: Float, cy: Float
                     , dx: Float, dy: Float 
                     , color: Int
                     , softC: Float
                     , hasHit: Bool = false ): HitQuad {
        // tri e - a b d
        // tri f - b c d
        return softFillQuintilateral( this, ax, ay, bx, by, cx, cy, dx, dy, color, softC, hasHit );
    }
    
    public inline
    function sweepTri( ax: Float, ay: Float
                     , rx: Float, ry: Float
                     , startRadian: Float, sweepRadian: Float
                     , color: Pixel32
                     , hasHit: Bool = false ): Null<HitTri> {
        var currAngle = startRadian;
        var bx = rx * Math.cos( currAngle ) + ax;
        var by = ry * Math.sin( currAngle ) + ay;
        // last pie
        currAngle = startRadian + sweepRadian;
        var cx = rx * Math.cos( currAngle ) + ax;
        var cy = ry * Math.sin( currAngle ) + ay;
        return this.fillTri( ax, ay, bx, by, cx, cy, color, hasHit );
    }
    public inline
    function tileSweepTri( ax: Float, ay: Float
                         , rx: Float, ry: Float
                         , startRadian: Float, sweepRadian: Float
                         , tileImage: Pixelimage
                         , hasHit: Bool = false ): HitTri {
        var currAngle = startRadian;
        var bx = rx * Math.cos( currAngle ) + ax;
        var by = ry * Math.sin( currAngle ) + ay;
        // last pie
        currAngle = startRadian + sweepRadian;
        var cx = rx * Math.cos( currAngle ) + ax;
        var cy = ry * Math.sin( currAngle ) + ay;
        return this.tileTri( ax, ay, bx, by, cx, cy, tileImage, hasHit );
    }
    public inline
    function fillPie( ax: Float, ay: Float
                    , rx: Float, ry: Float
                    , startRadian: Float, sweepRadian: Float
                    , color: Pixel32
                    , hasHit: Bool = false
                    , ?targetError: Float = 1.05 ): Null<HitTriArray> {
        var rSmall = ( rx > ry )? ry: rx;
        var noSides = circleError( rSmall, targetError );
        var theta = 1.41213*Math.PI/noSides;// 2* but make smaller
        var currAngle = startRadian;
        var tot = Math.floor( sweepRadian/theta );
        theta += (sweepRadian/theta - tot)/noSides;
        tot = Math.floor( sweepRadian/theta );
        var bx = rx * Math.cos( currAngle ) + ax;
        var by = ry * Math.sin( currAngle ) + ay;
        var cx = 0.;
        var cy = 0.;
        var arrTri: Array<HitTri> = [];
        for( i in 1...tot+1){
            currAngle = startRadian + i*theta;
            cx = rx * Math.cos( currAngle ) + ax;
            cy = ry * Math.sin( currAngle ) + ay;
            var triHit = this.fillTri( ax, ay, bx, by, cx, cy, color, hasHit );
            if( hasHit ) arrTri[ arrTri.length ] = triHit; 
            bx = cx;
            by = cy;
        }
        // last pie
        currAngle = startRadian + sweepRadian;
        cx = rx * Math.cos( currAngle ) + ax;
        cy = ry * Math.sin( currAngle ) + ay;
        var triHit = this.fillTri( ax, ay, bx, by, cx, cy, color, hasHit );
        if( hasHit ) arrTri[ arrTri.length ] = triHit; 
        return if( hasHit ){
            return new HitTriArray( arrTri );
        } else {
            arrTri = null;
            null;
        }
    }
    public inline
    function tilePie( ax: Float, ay: Float
                    , rx: Float, ry: Float
                    , startRadian: Float, sweepRadian: Float
                    , tileImage: Pixelimage
                    , hasHit: Bool = false
                    , ?targetError: Float = 1.05 ): Null<HitTriArray> {
        var rSmall = ( rx > ry )? ry: rx;
        var noSides = circleError( rSmall, targetError );
        var theta = 1.41213*Math.PI/noSides;// 2* but make smaller
        var currAngle = startRadian;
        var tot = Math.floor( sweepRadian/theta );
        theta += (sweepRadian/theta - tot)/noSides;
        tot = Math.floor( sweepRadian/theta );
        var bx = rx * Math.cos( currAngle ) + ax;
        var by = ry * Math.sin( currAngle ) + ay;
        var cx = 0.;
        var cy = 0.;
        var arrTri: Array<HitTri> = [];
        for( i in 1...tot+1){
            currAngle = startRadian + i*theta;
            cx = rx * Math.cos( currAngle ) + ax;
            cy = ry * Math.sin( currAngle ) + ay;
            var triHit = this.tileTri( ax, ay, bx, by, cx, cy, tileImage, hasHit );
            if( hasHit ) arrTri[ arrTri.length ] = triHit; 
            bx = cx;
            by = cy;
        }
        // last pie
        currAngle = startRadian + sweepRadian;
        cx = rx * Math.cos( currAngle ) + ax;
        cy = ry * Math.sin( currAngle ) + ay;
        var triHit = this.tileTri( ax, ay, bx, by, cx, cy, tileImage, hasHit );
        if( hasHit ) arrTri[ arrTri.length ] = triHit; 
        return if( hasHit ){
            return new HitTriArray( arrTri );
        } else {
            arrTri = null;
            null;
        }
    }
    public inline
    function sweepGradTri( ax: Float, ay: Float, rx: Float, ry: Float
                        , startRadian: Float, sweepRadian: Float
                        , colA: Pixel32, colB: Pixel32, colC: Pixel32
                        , hasHit: Bool = false ): Null<HitTri>{
        var currAngle = startRadian;
        var bx = rx * Math.cos( currAngle ) + ax;
        var by = ry * Math.sin( currAngle ) + ay;
        // last pie
        currAngle = startRadian + sweepRadian;
        var cx = rx * Math.cos( currAngle ) + ax;
        var cy = ry * Math.sin( currAngle ) + ay;
        return fillGradTriangle( this, ax, ay, colA, bx, by, colB, cx, cy, colC );
    }
    public inline
    function fillRadialPie( ax: Float, ay: Float
                          , rx: Float, ry: Float
                          , startRadian: Float, sweepRadian: Float
                          , centreColor: Pixel32, outerColor: Pixel32
                          , hasHit: Bool = false, ?targetError: Float = 1.05 ): Null<HitTriArray> {
        var rSmall = ( rx > ry )? ry: rx;
        var noSides = circleError( rSmall, targetError );
        var theta = Math.PI/noSides; // *2 but make it smaller
        var currAngle = startRadian;
        var tot = Math.floor( sweepRadian/theta );
        theta += (sweepRadian/theta - tot)/noSides;
        var bx = rx * Math.cos( currAngle ) + ax;
        var by = ry * Math.sin( currAngle ) + ay;
        var cx = 0.;
        var cy = 0.;
        var arrTri: Array<HitTri> = [];
        for( i in 1...tot+1 ){
            currAngle = startRadian + i*theta;
            cx = rx * Math.cos( currAngle ) + ax;
            cy = ry * Math.sin( currAngle ) + ay;
            var triHit = this.fillGradTri( ax, ay, centreColor, bx, by, outerColor, cx, cy, outerColor );
            if( hasHit ) arrTri[ arrTri.length ] = triHit; 
            bx = cx;
            by = cy;
        }
        // last pie
        currAngle = startRadian + sweepRadian;
        cx = rx * Math.cos( currAngle ) + ax;
        cy = ry * Math.sin( currAngle ) + ay;
        var triHit = this.fillGradTri( ax, ay, centreColor, bx, by, outerColor, cx, cy, outerColor );
        if( hasHit ) arrTri[ arrTri.length ] = triHit; 
        return if( hasHit ){
            return new HitTriArray( arrTri );
        } else {
            arrTri = null;
            null;
        }
    }
    /**
        works with image Fudge of UV values, deprediated unless turns out useful in edge cases.
     **/
    public inline
    function imgQuadFudge( texture: Pixelimage, win: RectangleWindow
                     , ax: Float, ay: Float
                     , bx: Float, by: Float
                     , cx: Float, cy: Float
                     , dx: Float, dy: Float
                     , hasHit: Bool = true ): Null<HitQuad> {
        return imgQuadrilateralFudge( this, texture, win, ax, ay, bx, by, cx, cy, dx, dy, hasHit );
    }
    public inline
    function imgRectFudge( texture: Pixelimage, win: RectangleWindow
                      , x: Float, y: Float, wid: Float, hi: Float
                      , theta: Float = 0., centreX: Float = 0., centreY: Float = 0.
                      , skewX: Float = 0., skewY: Float = 0.
                      , hasHit: Bool = true ): Null<HitQuad> {
        var ax = x;
        var ay = y;
        if( theta != 0. ){
            centreX = x + wid/2 + centreX;
            centreY = y + hi/2  + centreY;
            ax -= centreX;
            ay -= centreY;
        }
        var bx = ax + wid;
        var by = ay;
        var cx = bx;
        var cy = ay + hi;
        var dx = ax;
        var dy = cy;
        // skew does not really cope well with offx and offy changes?
        if( skewX != 0. ){
            ax += skewX;
            bx += skewX;
            cx -= skewX;
            dx -= skewX;
        }
        if( skewY != 0. ){
            ay -= skewY;
            dy -= skewY;
            by += skewY;
            cy += skewY;
        }
        if( theta != 0 ){
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
            ax += centreX;
            ay += centreY;
            bx += centreX;
            by += centreY;
            cx += centreX;
            cy += centreY;
            dx += centreX;
            dy += centreY;
        }
        return imgQuadFudge( texture, win, ax, ay, bx, by, cx, cy, dx, dy, hasHit );
    }
    /**
        provides a thick arrow using two triangles vector p, q
    **/
    public inline
    function fillArrow( px: Float, py: Float, qx: Float, qy: Float
        , thick: Float, color: Int, flare: Bool = false, reverseFlare: Bool = false, hasHit: Bool = true ): Null<HitTriArray> {
        trace( 'pixelimage.fillArrow');
        return fillLineArrow( this, px, py, qx, qy, thick, color, flare, reverseFlare, hasHit );
    }
    public inline
    function fillArrowBoth( px: Float, py: Float, qx: Float, qy: Float
        , thick: Float, color: Int, hasHit: Bool = true ): Null<HitTriArray> {
        return fillLineArrowBoth( this, px, py, qx, qy, thick, color, hasHit );
    }
    public inline
    function fillFixArrow( px: Float, py: Float, qx: Float, qy: Float, arrowWidth: Float, arrowHeight: Float
        , thick: Float, color: Int, flare: Bool = false, reverseFlare: Bool = false, hasHit: Bool = true ): Null<HitTriArray> {
        trace( 'pixelimage.fillArrow');
        return fillLineFixedArrow( this, px, py, qx, qy, arrowWidth, arrowHeight, thick, color, flare, reverseFlare, hasHit );
    }
    public inline
    function fillFixArrowBoth( px: Float, py: Float, qx: Float, qy: Float, arrowWidth: Float, arrowHeight: Float
        , thick: Float, color: Int, hasHit: Bool = true ): Null<HitTriArray> {
        return fillLineFixedArrowBoth( this, px, py, qx, qy, arrowWidth, arrowHeight, thick, color, hasHit );
    }

    // gradient thick arrows
    public inline
    function gradThickArrow( px: Float, py: Float, qx: Float, qy: Float
        , thick: Float, color1: Int, color2: Int, flare: Bool = false, reverseFlare: Bool, hasHit: Bool = true ): Null<HitTriArray> {
        return gradThickLineArrow( this, px, py, qx, qy, thick, color1, color2, flare, reverseFlare, hasHit );
    }
    public inline
    function gradThickArrowBoth( px: Float, py: Float, qx: Float, qy: Float
        , thick: Float, color1: Int, color2: Int, hasHit: Bool = true ): Null<HitTriArray> {
        return gradThickLineArrowBoth( this, px, py, qx, qy, thick, color1, color2, hasHit );
    }
    public inline
    function gradThickFixArrow( px: Float, py: Float, qx: Float, qy: Float, arrowWidth: Float, arrowHeight: Float
        , thick: Float, color1: Int, color2: Int, flare: Bool = false, reverseFlare: Bool = false, hasHit: Bool = true ): Null<HitTriArray> {
        return gradThickLineFixedArrow( this, px, py, qx, qy, arrowWidth, arrowHeight, thick, color1, color2, flare, reverseFlare, hasHit );
    }
    public inline
    function gradThickFixArrowBoth( px: Float, py: Float, qx: Float, qy: Float, arrowWidth: Float, arrowHeight: Float
        , thick: Float, color1: Int, color2: Int, hasHit: Bool = true ): Null<HitTriArray> {
        return gradThickLineFixedArrowBoth( this, px, py, qx, qy, arrowWidth, arrowHeight, thick, color1, color2, hasHit );
    }   
    /**
        this is used for drawing a filled ellipse or circle ( using triangles ), it uses more sides when larger and can be tweaked with targetError
        drawn from the circles/ellipses centre, with rx and ry the radius, phi allows rotatation of ellipses
        setup so large ellipses automatically use more sides.
    **/
    public inline
    function fillEllipseTri( cx: Float, cy: Float
                           , rx: Float, ry: Float
                           , color: Int, ?phi: Float = 0, ?printSides: Bool = false, ?targetError: Float = 1.05 ){
        var rSmall = ( rx > ry )? ry: rx;
        var noSides = circleError( rSmall, targetError );
        if( printSides ) trace( noSides );
        fillPolyBuild( cx, cy, rx, ry, color, phi, noSides );
    }
    public inline
    function softFillEllipseTri( cx: Float, cy: Float
                           , rx: Float, ry: Float
                           , color: Int, phi: Float = 0, softC: Float = 10, printSides: Bool = false, targetError: Float = 1.05 ){
        var rSmall = ( rx > ry )? ry: rx;
        var noSides = circleError( rSmall, targetError );
        if( printSides ) trace( noSides );
        softFillPolyBuild( cx, cy, rx, ry, color, phi, noSides, softC );
    }
    public inline
    function tileEllipseTri( cx: Float, cy: Float
                           , rx: Float, ry: Float
                           , tileImage: Pixelimage, ?phi: Float = 0, ?printSides: Bool = false, ?targetError: Float = 1.05 ){
        var rSmall = ( rx > ry )? ry: rx;
        var noSides = circleError( rSmall, targetError );
        if( printSides ) trace( noSides );
        tilePolyBuild( cx, cy, rx, ry, tileImage, phi, noSides );
    }
    /**
        this is provides a thick outline ellipse or circle ( using triangles ), large ones have more sides.
        @:see fillEllipseTri
        it uses a temp pixelimage with transparent false,
        and a second ellipse to remove the centre before copying over pixels
        setup so large ellipses automatically use more sides.
        for phi rotated ellipses it over estimates the temp pixelimage to be safe
    **/
    public inline
    function lineEllipseTri( cx: Float, cy: Float
                           , rx: Float, ry: Float
                           , drx: Float, dry: Float                               
                           , color: Int, ?phi: Float = 0, ?printSides: Bool = false, ?targetError: Float = 1.05 ){
        var rSmall = ( rx > ry )? ry: rx;
        var rLarge = ( rx < ry )? ry: rx;
        var rDif = rLarge - rSmall;
        var noSides = circleError( rSmall, targetError );
        if( printSides ) trace( noSides );
        var temp = ( phi == 0 )? new Pixelshape( Std.int( 2*rx ), Std.int( 2*ry ) ):
                                 new Pixelshape( Std.int( 2*rLarge+rDif ), Std.int( 2*rLarge+rDif ) );
        temp.transparent = false;
        if( phi == 0 ){
            temp.fillPolyBuild( rx, ry, rx, ry, color, phi, noSides );
        } else {
            temp.fillPolyBuild( rx+rDif, ry+rDif, rx, ry, color, phi, noSides );
        }
        // remove center
        var rx2 = rx - drx;
        var ry2 = ry - dry;
        rSmall = ( rx > ry )? ry: rx;
        // erase middle
        if( phi == 0 ){
            temp.fillPolyBuild( rx, ry, rx2, ry2, 0x00000000, phi, noSides );
            this.putPixelImage( temp, Std.int( cx-rx ), Std.int( cy-ry ) );
        } else {
            temp.fillPolyBuild( rx + rDif, ry + rDif, rx2, ry2, 0x00000000, phi, noSides );
            this.putPixelImage( temp, Std.int( cx-rx-rDif ), Std.int( cy-ry-rDif ) );
        }
        // temp.image = null;
        temp = null;
    }
    /**
        provides a filled ellipse/circle using triangles and more sides for large with a radial color gradient from the centre 
        colorIn is the internal colour and colorOut the external one, gx and gy -1 to 1 provide offset centre
        there are lots of limitations, gx and gy max and min obviously look bad and may need to scale them to 0.7 for rotated ellipse
    **/
    public inline
    function fillRadialEllipseTri( cx: Float, cy: Float
                                 , rx: Float, ry: Float
                                 , colorIn: Int, colorOut: Int
                                 , gx: Float = 0., gy: Float = 0.
                                 , ?phi: Float = 0, ?printSides: Bool = false, ?targetError: Float = 1.05 ){
        var rSmall = ( rx > ry )? ry: rx;
        var noSides = circleError( rSmall, targetError );
        if( printSides ) trace( noSides );
        fillRadialPolyBuild( this, cx, cy, rx, ry, colorIn, colorOut, gx, gy, phi, noSides );
    }
    /**
        radial ellipse thick line 
        @see fillRadialEllipseTri
    **/
    public inline
    function lineRadialEllipseTri( cx: Float, cy: Float
                                 , rx: Float, ry: Float
                                 , drx: Float, dry: Float
                                 , colorIn: Int, colorOut: Int
                                 , gx: Float = 0., gy: Float = 0.
                                 , ?phi: Float = 0, ?printSides: Bool = false, ?targetError: Float = 1.05 ){
        var rSmall = ( rx > ry )? ry: rx;
        var rLarge = ( rx < ry )? ry: rx;
        var rDif = rLarge - rSmall;
        var noSides = circleError( rSmall, targetError );
        if( printSides ) trace( noSides );
        var temp = ( phi == 0 )? new Pixelshape( Std.int( 2*rx ), Std.int( 2*ry ) ):
                                 new Pixelshape( Std.int( 2*rLarge+rDif ), Std.int( 2*rLarge+rDif ) );
        temp.transparent = false;
        if( phi == 0 ){
            fillRadialPolyBuild( temp, rx, ry, rx, ry, colorIn, colorOut, gx, gy, phi, noSides );
        } else {
            fillRadialPolyBuild( temp, rx+rDif, ry+rDif, rx, ry, colorIn, colorOut, gx, gy, phi, noSides );
        }
        // remove center
        var rx2 = rx - drx;
        var ry2 = ry - dry;
        rSmall = ( rx > ry )? ry: rx;
        // erase middle
        if( phi == 0 ){
            temp.fillPolyBuild( rx, ry, rx2, ry2, 0x00000000, phi, noSides );
            this.putPixelImage( temp, Std.int( cx-rx ), Std.int( cy-ry ) );
        } else {
            temp.fillPolyBuild( rx+rDif, ry+rDif, rx2, ry2, 0x00000000, phi, noSides );
            this.putPixelImage( temp, Std.int( cx-rx-rDif ), Std.int( cy-ry-rDif ) ); 
        }
        // temp.image = null;
        temp = null;
    }
    /**
        provides a radial colour gradient, it uses a temp pixelimage to draw a rectangle and then radial ellipse within.
        @:see fillRadialEllipseTri

    **/
    public inline
    function fillRadialRectangle( x:   Float, y: Float
                                , wid: Float, hi: Float 
                                , colorIn: Pixel32, colorOut: Pixel32
                                , ?gx: Float = 0,  ?gy: Float = 0
                                ){
        var temp = new Pixelshape( Math.ceil( wid ), Math.ceil( hi ) );
        var rx = wid/2;
        var ry = hi/2;
        temp.transparent = false; // should be default anyway.
        // draw base color
        temp.simpleRect( 0, 0, wid, hi, colorOut );
        // should over write pixels
        temp.fillRadialEllipseTri( rx, ry, rx, ry, colorIn, colorOut, gx, gy );
        this.putPixelImage( temp, Std.int( x ), Std.int( y ) );
        temp = null;
    }  
    /**
        fill Quadrant draws a quarter arc, for rounded rectangle there are I,II,III,IV defined ones in Pixelshape
    **/
    inline public
    function fillQuadrant( cx: Float, cy: Float
                         , rx: Float, ry: Float
                         , startAngle: Float 
                         , color:  Int, ?phi:   Float, ?targetError: Float = 1.05 ){
        solidQuadrant( this, cx, cy, rx, ry, startAngle, color, phi, targetError );
    }
    /**
        tiles Quadrant draws a quarter arc, for rounded rectangle there are I,II,III,IV defined ones in Pixelshape
    **/
    inline public
    function tileQuadrant( cx: Float, cy: Float
                          , rx: Float, ry: Float
                          , startAngle: Float 
                          , tileImage:  Pixelimage, ?phi:   Float, ?targetError: Float = 1.05 ){
        tileSolidQuadrant( this, cx, cy, rx, ry, startAngle, tileImage, phi, targetError );
    } 
    /**
        this provides building block for regular polygons,ellipses and circles
        cornerUp false will have polygon with flat edge on the top
        defined from centre cx,cy the radius allow stretching the regualar and phi controls rotation
        sides defines the sides required
        would be nice to add skew in future?
        cornerUp may need debugging
    **/
    inline public
    function fillPolyBuild( cx: Float,  cy: Float
                          , rx: Float,  ry: Float
                          , color: Int, ?phi: Float = 0.
                          , ?sides: Int = 36, cornerUp: Bool = true ){
        fillPolygonBuild( this, cx, cy, rx, ry, color, phi, sides, cornerUp );
    }
    inline public
    function softFillPolyBuild( cx: Float,  cy: Float
                          , rx: Float,  ry: Float
                          , color: Int, ?phi: Float = 0.
                          , ?sides: Int = 36, softC: Float = 10., cornerUp: Bool = true ){
        softFillPolygonBuild( this, cx, cy, rx, ry, color, phi, sides, softC, cornerUp );
    }
    /**
        this provides building block for image tiled regular polygons,ellipses and circles
        cornerUp false will have polygon with flat edge on the top
        defined from centre cx,cy the radius allow stretching the regualar and phi controls rotation
        sides defines the sides required
        would be nice to add skew in future?
        cornerUp may need debugging
    **/
    inline public
    function tilePolyBuild( cx: Float,  cy: Float
                          , rx: Float,  ry: Float
                          , tileImage: Pixelimage, ?phi: Float = 0.
                          , ?sides: Int = 36, cornerUp: Bool = true ){
        tilePolygonBuild( this, cx, cy, rx, ry, tileImage, phi, sides, cornerUp );
    }
    /**
        @see fillPolyBuild
        this is a version with radial gradient applied so the centre is one color, but only used gradient triangles so limited
    **/
    inline public
    function fillRadialPolyon( cx: Float,  cy: Float
                             , rx: Float,  ry: Float
                             , colorIn: Int, colorOut: Int
                             , gx: Float = 0.,  gy: Float = 0.
                             , ?phi: Float = 0., ?sides: Int = 36
                             , cornerUp: Bool = true ){
        fillRadialPolyBuild( this, cx, cy, rx, ry, colorIn, colorOut, gx, gy , phi, sides, cornerUp );
    }

}
