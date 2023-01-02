package pixelimage;
import pixelimage.Pixelimage;
import pixelimage.pixel.Pixel32;
import pixelimage.algo.RoundRecPixel;

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
        this.fillQuadrant( cx, cy, rx, ry, 3*Math.PI/2, color, phi );
    }
    public inline
    function tileQuadrantI( cx:    Float, cy:   Float
                          , rx:    Float, ry:   Float
                          , tileImage: Pixelimage,   ?phi: Float = 0.
                          ){
        // positive positive plane I  + + , simon says RED
        this.tileQuadrant( cx, cy, rx, ry, 3*Math.PI/2, tileImage, phi );
    }
    public inline 
    function fillQuadrantII( cx:    Float, cy:   Float
                           , rx:    Float, ry:   Float
                           , color: Int,   ?phi: Float = 0. ){
        // plane II  - + , simon says GREEN
        this.fillQuadrant( cx, cy, rx, ry, Math.PI, color, phi );
    }
    public inline 
    function tileQuadrantII( cx:    Float, cy:   Float
                           , rx:    Float, ry:   Float
                           , tileImage: Pixelimage,   ?phi: Float = 0. ){
        // plane II  - + , simon says GREEN
        this.tileQuadrant( cx, cy, rx, ry, Math.PI, tileImage, phi );
    }
    public inline
    function fillQuadrantIII( cx:    Float, cy:   Float
                            , rx:    Float, ry:   Float
                            , color: Int,   ?phi: Float = 0. ){
        // negative negative plane III - - , simon says YELLOW
        this.fillQuadrant( cx, cy, rx, ry, Math.PI/2, color, phi );
    }
    public inline
    function tileQuadrantIII( cx:    Float, cy:   Float
                            , rx:    Float, ry:   Float
                            , tileImage: Pixelimage,   ?phi: Float = 0. ){
        // negative negative plane III - - , simon says YELLOW
        this.tileQuadrant( cx, cy, rx, ry, Math.PI/2, tileImage, phi );
    }
    public inline
    function fillQuadrantIV( cx:    Float, cy:   Float
                           , rx:    Float, ry:   Float
                           , color: Int,   ?phi: Float = 0. ){
        // plane IV  + - , simon says BLUE
        this.fillQuadrant( cx, cy, rx, ry, 0, color, phi );
    }
    public inline
    function tileQuadrantIV( cx:    Float, cy:   Float
                           , rx:    Float, ry:   Float
                           , tileImage: Pixelimage,   ?phi: Float = 0. ){
        // plane IV  + - , simon says BLUE
        this.tileQuadrant( cx, cy, rx, ry, 0, tileImage, phi );
    }
    @:access( pixelimage.Pixelimage.fillEllipseTri )
    public inline
    function fillCircle( cx: Float, cy: Float, r: Float, color: Int, ?phi: Float = 0 ){
        this.fillEllipseTri( cx, cy, r, r, color, phi );
    }
    @:access( pixelimage.Pixelimage.fillEllipseTri )
    public inline
    function fillEllipse( cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        this.fillEllipseTri( cx, cy, rx, ry, color, phi );
    }
    public inline
    function fillArrowHead( cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        this.fillPolyBuild( cx, cy, rx,  ry, color, phi, 3, false );
    } 
    public inline
    function fillPentagon( cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        this.fillPolyBuild( cx, cy, rx,  ry, color, phi, 5, false );
    }
    public inline 
    function fillHexagon( cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        this.fillPolyBuild( cx, cy, rx,  ry, color, phi, 6, false );
    }
    public inline
    function fillHeptagon( cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        this.fillPolyBuild( cx, cy, rx,  ry, color, phi, 7, false );
    }
    public inline
    function fillSeptagon( cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        this.fillPolyBuild( cx, cy, rx,  ry, color, phi, 7, false );
    }
    public inline
    function fillOctagon( cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        this.fillPolyBuild( cx, cy, rx,  ry, color, phi, 8, false );
    }
    public inline
    function fillNonagon( cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        this.fillPolyBuild( cx, cy, rx,  ry, color, phi, 9, false );
    }
    public inline
    function fillEnneagon( cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        this.fillPolyBuild( cx, cy, rx,  ry, color, phi, 9, false );
    }
    public inline
    function fillDecagon( cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        this.fillPolyBuild( cx, cy, rx,  ry, color, phi, 10, false );
    }
    public inline
    function fillHendecagon( cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        this.fillPolyBuild( cx, cy, rx,  ry, color, phi, 11, false );
    }
    public inline
    function fillUndecagon( cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        this.fillPolyBuild( cx, cy, rx,  ry, color, phi, 11, false );
    }
    public inline
    function fillDodecagon(cx: Float, cy: Float, rx: Float, ry: Float, color: Int, ?phi: Float = 0 ){
        this.fillPolyBuild( cx, cy, rx,  ry, color, phi, 12, false );
    }


}
