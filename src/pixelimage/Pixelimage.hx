package pixelimage;

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

@:transient
abstract Pixelimage( ImageStruct ) from ImageStruct to ImageStruct {
    /**
        provides the width used by the UInt32Array
    **/
    public var width( get, never ): Int;
    inline function get_width(): Int
       return this.width;
    /**
        provides the height used by the UInt32Array
    **/
    public var height( get, never ): Int;
    inline function get_height(): Int
        return this.height;
    /**
        setting relative position provide a drawing offset, it must be positive
        update is no currentl use yet
    **/
    public function setRelativePosition( x: Int, y: Int, ?update: Bool = false ){
        this.useVirtualPos = true;
        if( x < 0 ) x = 0;
        if( y < 0 ) y = 0;
        this.virtualX = x;
        this.virtualY = y;
        // TODO: update to implement
    }
    /**
        transparent to false will allow setARGB to overwrite pixels, true will alpha blend them when new pixel is semi transparent
    **/
    public var transparent( get, set ): Bool;
    inline function get_transparent(): Bool
        return this.transparent;
    inline function set_transparent( v: Bool ): Bool {
        this.transparent = v;
        return v;
    }
    public var mask( get, set ): Pixelimage;
    inline function get_mask(): Pixelimage
        return this.mask;
    inline function set_mask( v: Pixelimage ): Pixelimage {
        this.useMask = true;
        this.mask = v;
        return v;
    }
    public var image( get, never ): UInt32Array;
    inline function get_image():  UInt32Array
        return this.image;
    /*
    inline function set_image( v:  UInt32Array ):  UInt32Array {
        this.image = v;
        return v;
    }
    */
    public var hasMask( get, set ): Bool;
    inline function set_hasMask( v: Bool ): Bool {
        if( this.mask == null && v == true ){
            this.mask = new Pixelimage( this.width, this.height );
            this.mask.transparent = false;
            // set mask intially to let all images through
            this.mask.simpleRect( 0, 0, this.width, this.height, 0x00000000 );
        }
        this.useMask = v;
        return v;
    }
    inline function get_hasMask(): Bool
        return this.useMask;
    inline
    public function new( w: Int, h: Int ){
       this = ( 
        { width:  w, height: h
        , image:  new haxe.io.UInt32Array( Std.int( w * h  ) ) 
        }: ImageStruct
        );
    }
    /**
        this provides a location for a UIn8 access of a color channel
    **/
    inline
    function pos4( x: Int, y: Int, ?off: Int = 0 ): Int
        return Std.int( position( x, y ) * 4 ) + off; 
    /**
        provides the location of the pixel after considering any relative internal x,y offset
    **/
    inline 
    public function position( x: Int, y: Int ){
        return ( this.useVirtualPos )? /* allows off set position when drawing */
            Std.int( ( y - this.virtualY ) * this.width + x - this.virtualX ):
            Std.int( y * this.width + x );
    }
    /**
        Provides a view for single color channel access, not usually used
    **/
    inline 
    function view8():js.lib.Uint8Array {
        var dataimg: js.lib.Uint32Array = cast this.image;
        return new js.lib.Uint8Array( dataimg.buffer ); // TODO make more generic
    }
    /**
        The main way is set the pixel color at x, y
        applies an alpha blend if pixel is semi-transparent and if the pixelimage is transparent true
    **/
    inline
    public function setARGB( x: Int, y: Int, color: Int ): Int {
        var c = new Pixel32( color );
        if( c.isTransparent() && this.transparent ){
            colorBlend( color, position( x, y ) );
        } else {
            this.image[ position( x, y ) ] = c.transferColor();
        }
        return color;
    }
    /**
        returns the current pixel colour, since canvas context is ABGR on little endian this will correct
        from the internal value
    **/
    inline
    public function getARGB( x: Int, y: Int ): Int {
        var c: Pixel32 = cast this.image[ position( x, y ) ];
        return c.transferColor();
    }
    /**
        allows setting all 4 colour channels with a location
        @:see position   to obtain the location
    **/
    public inline
    function set_argbPixel( a: Int, r: Int, g: Int, b: Int, location: Int ){
        ( this.transparent && a < 0xFE )? channelBlend( a, r, g, b, location ): 
                                          argbToPixel( a, r, g, b, location );
    }
    /**
        used more internally to set colours from algorithms does not apply alpha blend
    **/
    public inline 
    function argbToPixel( a: Int, r: Int, g: Int, b: Int, location: Int ){
        this.image[ location ] = ( this.isLittle )? 
            Pixel32.fromChannels( a, b, g, r ): Pixel32.fromChannels( a, r, g, b );
    }
    /**
        used internally is set colours from algorithms only applies alpha blend
        @see setARGB
    **/
    public inline
    function channelBlend( a: PixelChannel
                          , r: PixelChannel
                          , g: PixelChannel
                          , b: PixelChannel, location: Int ) {
        var old = ( new Pixel32( this.image[ location ] ) ).transferColor();
        var blended = old + Pixel32.fromChannels( a, r, g, b );
        this.image[ location ] = blended.transferColor();
    }
    /**
        used internally to set colours from algorithms only applies 
        @see setARGB
    **/
    public inline
    function colorBlend( color: Pixel32, location: Int ){
        var blended = ( new Pixel32( this.image[ location ] ) ).transferColor() + color;
        this.image[ location ] = blended.transferColor();
    }
    /**
        mainly used for color debugging provides getARGB in hex string format
    **/
    inline public
    function getPixelString( x: Int, y: Int ): String
        return ( new Pixel32( getARGB( x, y ) ) ).stringHash();
    /**
        provides a simple filled Rectangle
    **/
    inline public 
    function simpleRect( x: Float, y: Float
                       , w: Float, h: Float
                       , color: Int ){
        var p = Std.int( x );
        var xx = p;
        var q = Std.int( y );
        var maxX = Std.int( x + w );
        var maxY = Std.int( y + h );
        while( true ){
            setARGB( p++, q, color );
            if( p > maxX ){
                p = xx;
                q++;
            } 
            if( q > maxY ) break;
        }
    }
    inline public 
    function patternRect( x: Float, y: Float
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
            setARGB( p++, q, color );
            if( p > maxX ){
                p = xx;
                q++;
            } 
            if( q > maxY ) break;
        }
    }
    inline public 
    function patternRectDown(  x: Float, y: Float
                            , w: Float, h: Float
                            , foreColor: Int, backColor: Int, patternFill: Array<Bool> ){
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
            setARGB( p, q++, color );
            if( q > maxY ){
                q = yy;
                q++;
            } 
            if( p > maxX ) break;
        }
    }
    /**
        provides a simple filled square a short cut 
        @see simpleRect
    **/
    public inline
    function fillSquare( x: Float, y: Float
                       , d: Float
                       , color: Int ) {
        simpleRect( x-d/2, y-d/2, d, d, color );
    }
    /**
        provides a filled triangle give a,b,c coordinates
        automagically rearranges coordinates so it always renders
    **/
    public inline
    function fillTri( ax: Float, ay: Float
                    , bx: Float, by: Float
                    , cx: Float, cy: Float
                    , color: Pixel32 ){
        var adjustWinding = ( (ax * by - bx * ay) + (bx * cy - cx * by) + (cx * ay - ax * cy) )>0;
        if( !adjustWinding ){// TODO: this is inverse of cornerContour needs thought, but provides required protection
            // swap b and c
            // probably wrong way as y is down?
            var bx_ = bx;
            var by_ = by;
            bx = cx;
            by = cy;
            cx = bx_;
            cy = by_;
        }
        fillTriUnsafe( this, ax, ay, bx, by, cx, cy, color );
    }
    public inline
    function tileTri( ax: Float, ay: Float
                    , bx: Float, by: Float
                    , cx: Float, cy: Float
                    , srcImage: Pixelimage ){
        var adjustWinding = ( (ax * by - bx * ay) + (bx * cy - cx * by) + (cx * ay - ax * cy) )>0;
        if( !adjustWinding ){// TODO: this is inverse of cornerContour needs thought, but provides required protection
            // swap b and c
            // probably wrong way as y is down?
            var bx_ = bx;
            var by_ = by;
            bx = cx;
            by = cy;
            cx = bx_;
            cy = by_;
        }
        tileTriUnsafe( this, ax, ay, bx, by, cx, cy, srcImage );
    }
    public inline
    function sweepTri( ax: Float, ay: Float, rx: Float, ry: Float, startRadian: Float, sweepRadian: Float, color: Pixel32 ){
        var currAngle = startRadian;
        var bx = rx * Math.cos( currAngle ) + ax;
        var by = ry * Math.sin( currAngle ) + ay;
        // last pie
        currAngle = startRadian + sweepRadian;
        var cx = rx * Math.cos( currAngle ) + ax;
        var cy = ry * Math.sin( currAngle ) + ay;
        fillTri( ax, ay, bx, by, cx, cy, color );
    }
    public inline
    function tileSweepTri( ax: Float, ay: Float, rx: Float, ry: Float, startRadian: Float, sweepRadian: Float, srcImage: Pixelimage ){
        var currAngle = startRadian;
        var bx = rx * Math.cos( currAngle ) + ax;
        var by = ry * Math.sin( currAngle ) + ay;
        // last pie
        currAngle = startRadian + sweepRadian;
        var cx = rx * Math.cos( currAngle ) + ax;
        var cy = ry * Math.sin( currAngle ) + ay;
        tileTri( ax, ay, bx, by, cx, cy, srcImage );
    }
    public inline
    function fillPie( ax: Float, ay: Float, rx: Float, ry: Float, startRadian: Float, sweepRadian: Float, color: Pixel32, ?targetError: Float = 1.05 ){
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
        for( i in 1...tot+1){
            currAngle = startRadian + i*theta;
            cx = rx * Math.cos( currAngle ) + ax;
            cy = ry * Math.sin( currAngle ) + ay;
            fillTri( ax, ay, bx, by, cx, cy, color );
            bx = cx;
            by = cy;
        }
        // last pie
        currAngle = startRadian + sweepRadian;
        cx = rx * Math.cos( currAngle ) + ax;
        cy = ry * Math.sin( currAngle ) + ay;
        fillTri( ax, ay, bx, by, cx, cy, color );
    }
    public inline
    function tilePie( ax: Float, ay: Float, rx: Float, ry: Float, startRadian: Float, sweepRadian: Float, srcImage: Pixelimage, ?targetError: Float = 1.05 ){
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
        for( i in 1...tot+1){
            currAngle = startRadian + i*theta;
            cx = rx * Math.cos( currAngle ) + ax;
            cy = ry * Math.sin( currAngle ) + ay;
            tileTri( ax, ay, bx, by, cx, cy, srcImage );
            bx = cx;
            by = cy;
        }
        // last pie
        currAngle = startRadian + sweepRadian;
        cx = rx * Math.cos( currAngle ) + ax;
        cy = ry * Math.sin( currAngle ) + ay;
        tileTri( ax, ay, bx, by, cx, cy, srcImage );
    }
    /**
        uses two triangles to create a filled quad using four coordinates a,b,c,d arranged clockwise 
    **/
    public inline
    function fillQuad( ax: Float, ay: Float
                     , bx: Float, by: Float
                     , cx: Float, cy: Float
                     , dx: Float, dy: Float 
                     , color: Int ){
        // tri e - a b d
        // tri f - b c d
        fillTri( ax, ay, bx, by, dx, dy, color );
        fillTri( bx, by, cx, cy, dx, dy, color );
        return { ax: ax, ay: ay, bx: bx, by: by, cx: cx, cy: cy, dx: dx, dy: dy };
    }
    public inline
    function tileQuad( ax: Float, ay: Float
                     , bx: Float, by: Float
                     , cx: Float, cy: Float
                     , dx: Float, dy: Float 
                     , srcImage: Pixelimage ){
        // tri e - a b d
        // tri f - b c d
        tileTri( ax, ay, bx, by, dx, dy, srcImage );
        tileTri( bx, by, cx, cy, dx, dy, srcImage );
        return { ax: ax, ay: ay, bx: bx, by: by, cx: cx, cy: cy, dx: dx, dy: dy };
    }
    /**
        creates a filled gradient triangle in OpenGL 3 color style for coordinates a,b,c
        with respective colors after coordinate pairs
    **/
    public inline
    function fillGradTri( ax: Float, ay: Float, colA: Pixel32
                        , bx: Float, by: Float, colB: Pixel32
                        , cx: Float, cy: Float, colC: Pixel32 ){
        fillGradTriangle( this, ax, ay, colA, bx, by, colB, cx, cy, colC );
    }
    public inline
    function sweepGradTri( ax: Float, ay: Float, rx: Float, ry: Float
                        , startRadian: Float, sweepRadian: Float
                        , colA: Pixel32, colB: Pixel32, colC: Pixel32 ){
        var currAngle = startRadian;
        var bx = rx * Math.cos( currAngle ) + ax;
        var by = ry * Math.sin( currAngle ) + ay;
        // last pie
        currAngle = startRadian + sweepRadian;
        var cx = rx * Math.cos( currAngle ) + ax;
        var cy = ry * Math.sin( currAngle ) + ay;
        fillGradTriangle( this, ax, ay, colA, bx, by, colB, cx, cy, colC );
    }
    public inline
    function fillRadialPie( ax: Float, ay: Float
                          , rx: Float, ry: Float
                          , startRadian: Float, sweepRadian: Float
                          , centreColor: Pixel32, outerColor: Pixel32, ?targetError: Float = 1.05 ){
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
        for( i in 1...tot+1 ){
            currAngle = startRadian + i*theta;
            cx = rx * Math.cos( currAngle ) + ax;
            cy = ry * Math.sin( currAngle ) + ay;
            fillGradTri( ax, ay, centreColor, bx, by, outerColor, cx, cy, outerColor );
            bx = cx;
            by = cy;
        }
        // last pie
        currAngle = startRadian + sweepRadian;
        cx = rx * Math.cos( currAngle ) + ax;
        cy = ry * Math.sin( currAngle ) + ay;
        fillGradTri( ax, ay, centreColor, bx, by, outerColor, cx, cy, outerColor );
    }
    public inline 
    function tileRect( x:   Float, y: Float
                         , wid: Float, hi: Float
                         , srcImage: Pixelimage ){
        var bx = x + wid;
        var cy = y + hi;
        tileQuad( x,  y, bx, y, bx, cy, x,  cy, srcImage );
        return { ax: x, ay: y, bx: bx, by: y, cx: bx, cy: cy, dx: x, dy: cy };
    }
    /**
        uses two triangles to form rectangle x,y,width,height with a,b,c,d clockwise gradient colours
    **/
    public inline 
    function fillGradRect( x:   Float, y: Float
                         , wid: Float, hi: Float
                         , colorA: Pixel32, colorB: Pixel32, colorC: Pixel32, colorD: Pixel32 ){
        var bx = x + wid;
        var cy = y + hi;
        fillGradQuad( x,  y,  colorA
                    , bx, y,  colorB
                    , bx, cy, colorC
                    , x,  cy, colorD );
        return { ax: x, ay: y, bx: bx, by: y, cx: bx, cy: cy, dx: x, dy: cy };
    }
    /**
        uses two triangle to form a quad with clockwise coordinates a,b,c,d
        with respective colours after each coordinate pair

        a better render maybe possible see commented out code in algo.QuadPixel and lerp code in algo.GeomPixel
        ( better render approach compiles but does not yet work, maybe easy? ). 
    **/
    public inline
    function fillGradQuad( ax: Float, ay: Float, colorA: Pixel32
                         , bx: Float, by: Float, colorB: Pixel32
                         , cx: Float, cy: Float, colorC: Pixel32 
                         , dx: Float, dy: Float, colorD: Pixel32 ){
        // tri e - a b d
        // tri f - b c d
        fillGradTri( ax, ay, colorA, bx, by, colorB, dx, dy, colorD );
        fillGradTri( bx, by, colorB, cx, cy, colorC, dx, dy, colorD );
        return { ax: ax, ay: ay, bx: bx, by: by, cx: cx, cy: cy, dx: dx, dy: dy };
    }
    /**
        provides a thick line using two triangles vector p, q
        debug corners draws coloured squares on the corners for development
    **/
    public inline 
    function fillLine( px: Float, py: Float, qx: Float, qy: Float
                     , thick: Float, color: Int, ?debugCorners = false ){
        var o = qy-py;
        var a = qx-px;
        var h = Math.pow( o*o + a*a, 0.5 );
        var theta = Math.atan2( o, a );
        var info = rotateLine( this, px, py, thick, h, theta, color, debugCorners );
        return info;
    }
        /**
        tiles a thick line using two triangles vector p, q
        debug corners draws coloured squares on the corners for development
    **/
    public inline 
    function tileLine( px: Float, py: Float, qx: Float, qy: Float
                     , thick: Float, srcImage: Pixelimage, ?debugCorners = false ){
        var o = qy-py;
        var a = qx-px;
        var h = Math.pow( o*o + a*a, 0.5 );
        var theta = Math.atan2( o, a );
        var info = rotateTileLine( this, px, py, thick, h, theta, srcImage, debugCorners );
        return info;
    }
    /**
        provides a thick line using two gradient triangle vector p,q
        the four colors are arranged clockwise a,b,c,d
        debug corners draws coloured squares on the corners for development
    **/
    public inline 
    function fillGradLine( px: Float, py: Float, qx: Float, qy: Float
                         , thick: Float
                         , colorA: Pixel32, colorB: Pixel32, colorC: Pixel32, colorD: Pixel32
                         , ?debugCorners = false ){
        var o = qy-py;
        var a = qx-px;
        var h = Math.pow( o*o + a*a, 0.5 );
        var theta = Math.atan2( o, a );
        var info = rotateGradLine( this, px, py, thick, h, theta, colorA, colorB, colorC, colorD, debugCorners );
        return info;
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
        var temp = ( phi == 0 )? new Pixelimage( Std.int( 2*rx ), Std.int( 2*ry ) ):
                                 new Pixelimage( Std.int( 2*rLarge+rDif ), Std.int( 2*rLarge+rDif ) );
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
            putPixelImage( temp, Std.int( cx-rx ), Std.int( cy-ry ) );
        } else {
            temp.fillPolyBuild( rx + rDif, ry + rDif, rx2, ry2, 0x00000000, phi, noSides );
            putPixelImage( temp, Std.int( cx-rx-rDif ), Std.int( cy-ry-rDif ) );
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
        var temp = ( phi == 0 )? new Pixelimage( Std.int( 2*rx ), Std.int( 2*ry ) ):
                                 new Pixelimage( Std.int( 2*rLarge+rDif ), Std.int( 2*rLarge+rDif ) );
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
            putPixelImage( temp, Std.int( cx-rx ), Std.int( cy-ry ) );
        } else {
            temp.fillPolyBuild( rx+rDif, ry+rDif, rx2, ry2, 0x00000000, phi, noSides );
            putPixelImage( temp, Std.int( cx-rx-rDif ), Std.int( cy-ry-rDif ) ); 
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
        var temp = new Pixelimage( Math.ceil( wid ), Math.ceil( hi ) );
        var rx = wid/2;
        var ry = hi/2;
        temp.transparent = false; // should be default anyway.
        // draw base color
        temp.simpleRect( 0, 0, wid, hi, colorOut );
        // should over write pixels
        temp.fillRadialEllipseTri( rx, ry, rx, ry, colorIn, colorOut, gx, gy );
        putPixelImage( temp, Std.int( x ), Std.int( y ) );
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
                          , srcImage:  Pixelimage, ?phi:   Float, ?targetError: Float = 1.05 ){
        tileSolidQuadrant( this, cx, cy, rx, ry, startAngle, srcImage, phi, targetError );
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
                          , srcImage: Pixelimage, ?phi: Float = 0.
                          , ?sides: Int = 36, cornerUp: Bool = true ){
        tilePolygonBuild( this, cx, cy, rx, ry, srcImage, phi, sides, cornerUp );
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
    /**
        used to draw one pixelimage on part of another, essentially it is a copy
        black transparent pixels are ignored.
        this is used also internally so that shapes can be composed with transparent false 
        useful for adding over and taking away parts of shapes before drawing on the main Pixelimage.
    **/
    inline public
    function putPixelImage( pixelImage: Pixelimage, x: Int, y: Int, ?useAvaliableMask = true ){
        // ignore useVirtualPos for now.
        // ignore could use one loop for now.
        for( dy in 0...pixelImage.height ){
            for( dx in 0...pixelImage.width ){
                var col = pixelImage.getARGB( dx, dy );
                if( pixelImage.hasMask && useAvaliableMask && pixelImage.mask != null ){
                    var maskPixel = new Pixel32( pixelImage.mask.getARGB( dx, dy ) );
                    col = new Pixel32( col ).maskPixel( maskPixel );
                }
                if( col != 0 ) setARGB( x + dx, y + dy, col );
            }
        }
    }
    /**
        Currently library only supports Javascript target and puts the UInt32Array on the canvas context
        hope to add c++ and some toolkits later.
    **/
    #if js
    inline
    public function drawToContext( ctx: js.html.CanvasRenderingContext2D, x: Int, y: Int, ?useAvaliableMask = true  ){
        if( this.useMask && useAvaliableMask && this.mask != null ){
            var temp = new Pixelimage( width, height );
            for( i in 0...this.image.length ){
                var p0 =  new Pixel32( image[ i ] );
                var m1 =  new Pixel32( mask.image[ i ] );
                temp.image[ i ] = p0.maskPixel( m1 );
            }
            var data = new js.lib.Uint8ClampedArray( temp.view8().buffer );
            var imageData = new js.html.ImageData( data, this.width, this.height );
            ( this.useVirtualPos )? 
                ctx.putImageData( imageData, x - this.virtualX, y - this.virtualY ):
                ctx.putImageData( imageData, x, y);
        } else {
            var data = new js.lib.Uint8ClampedArray( view8().buffer );
            var imageData = new js.html.ImageData( data, this.width, this.height );
            ( this.useVirtualPos )? 
                ctx.putImageData( imageData, x - this.virtualX, y - this.virtualY ):
                ctx.putImageData( imageData, x, y);
        }
    }
    inline
    public function drawFromContext( ctx: js.html.CanvasRenderingContext2D, x: Int, y: Int ){
        var imageData = ( this.useVirtualPos )?
            ctx.getImageData( x + this.virtualX, y + this.virtualY, this.width, this.height):
            ctx.getImageData( x, y, this.width, this.height);
        var data = imageData.data;
        var temp = new js.lib.Uint32Array( data.buffer );
        this.image = cast temp;
    }
    #end
    inline
    public function transferClone(): Pixelimage {
        var out = new Pixelimage( width, height );
        for( i in 0...image.length ){
            out.image[ i ] = (new Pixel32( image[i] )).flip13();
        }
        return out;
    }
    inline 
    public function transferIn( p: Pixelimage ){
        for( i in 0...p.image.length ){
            image[ i ] = ( new Pixel32( p.image[ i ] ) ).flip13();
        }
    }
    inline
    public function getBytes(){
        return haxe.io.Bytes.ofData( view8().buffer );
    }
    inline
    public function fromBytes( bytes: haxe.io.Bytes, pos ){
        this.image = haxe.io.UInt32Array.fromBytes( bytes, pos );
    }
    
    // maybe remove
    /*
    inline public
    function getRGBString( x: Int, y: Int ): String
        return ( new Pixel28( getIrgb( x, y ) ) ).stringHash();
    inline
    public function setIalpha( x: Int, y: Int, alpha: Int )
        view8()[ pos4( x, y, 0 ) ] = alpha;    
    inline
    public function getIalpha( x: Int, y: Int ): Int
        return view8()[ pos4( x, y, 0 )];
    inline
    public function setIrgb( x: Int, y: Int, rgb: Int ){
        var a = getIalpha( x, y );
        // abgr
        this.image[ position( x, y ) ] = ( a << 24 | new Pixel32( rgb ) ).transferColor();   
    }
    inline
    public function getIrgb( x: Int, y: Int ): Int {
        var c = this.image[ position( x, y ) ];
        return new Pixel32( c ).rgbFromCanvas(); // rgb
    }
    */

}

// references
// http://totologic.blogspot.com/2014/01/accurate-point-in-triangle-test.html
// https://codeplea.com/triangular-interpolation *
// https://gamedev.stackexchange.com/questions/23743/whats-the-most-efficient-way-to-find-barycentric-coordinates    
// https://stackoverflow.com/questions/39213661/canvas-using-uint32array-wrong-colors-are-being-rendered
// https://stackoverflow.com/questions/26513712/algorithm-for-coloring-a-triangle-by-vertex-color
// https://iquilezles.org/articles/ibilinear/ - todo add MIT details if quad runs.
// https://www.shadertoy.com/view/lsBSDm
// https://math.stackexchange.com/questions/4132060/compute-number-of-regular-polgy-sides-to-approximate-circle-to-defined-precision
// //http://paulbourke.net/miscellaneous/composite/
