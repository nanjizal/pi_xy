package pixelimageXY.imageAbstracts;
import pixelimageXY.Pixelimage;
import pixelimageXY.algo.HitTri;
import pixelimageXY.algo.HitQuad;
import pixelimageXY.algo.HitTriArray;
import pixelimageXY.algo.GeomPix;
import pixelimageXY.pixel.Pixel32;
import pixelimageXY.algo.PolyPixel;
import pixelimageXY.algo.CirclePixel;
import pixelimageXY.algo.ArrowPixel;
import pixelimageXY.algo.RoundRecPixel;

@:transient
abstract GradientShape( Pixelimage ) from Pixelimage to Pixelimage {

    inline
    public function new( w: Int, h: Int ){
       this = new Pixelimage( w, h );
    }
    /**
        creates a filled gradient triangle in OpenGL 3 color style for coordinates a,b,c
        with respective colors after coordinate pairs
    **/
    public inline
    function triangle( ax: Float, ay: Float, colA: Pixel32
                     , bx: Float, by: Float, colB: Pixel32
                     , cx: Float, cy: Float, colC: Pixel32
                     , hasHit: Bool = true ): Null<HitTri> {
        return pixelimageXY.algo.TriPixel
            .fillGradTriangle( this, ax, ay, colA, bx, by, colB, cx, cy, colC );
    }
    /**
        uses two triangles to form rectangle x,y,width,height with a,b,c,d clockwise gradient colours
    **/
    public inline 
    function rectangle( x:   Float, y: Float
                         , wid: Float, hi: Float
                         , colorA: Pixel32, colorB: Pixel32, colorC: Pixel32, colorD: Pixel32 ){
        var bx = x + wid;
        var cy = y + hi;
        quad( x,  y,  colorA
            , bx, y,  colorB
            , bx, cy, colorC
            , x,  cy, colorD );
        return { ax: x, ay: y, bx: bx, y: y, cx: bx, cy: cy, x: x, dy: cy };
    }
    /**
        uses two triangle to form a quad with clockwise coordinates a,b,c,d
        with respective colours after each coordinate pair

        a better render maybe possible see commented out code in algo.QuadPixel and lerp code in algo.GeomPixel
        ( better render approach compiles but does not yet work, maybe easy? ). 
    **/
    public inline
    function quad( ax: Float, ay: Float, colorA: Pixel32
                         , bx: Float, by: Float, colorB: Pixel32
                         , cx: Float, cy: Float, colorC: Pixel32 
                         , dx: Float, dy: Float, colorD: Pixel32
                         , hasHit: Bool = true ): Null<HitQuad> {
        // tri e - a b d
        // tri f - b c d
        return pixelimageXY.algo.QuadPixel
            .fillGradQuadrilateral( this, ax, ay, colorA, bx, by, colorB, cx, cy, colorC, dx, dy, colorD, hasHit );
    }
    /**
        provides a thick line using two gradient triangle vector p,q
        the four colors are arranged clockwise a,b,c,d
        debug corners draws coloured squares on the corners for development
    **/
    public inline 
    function line( px: Float, py: Float, qx: Float, qy: Float
                         , thick: Float
                         , colorA: Pixel32, colorB: Pixel32, colorC: Pixel32, colorD: Pixel32
                         , hasHit: Bool = false
                         , ?debugCorners = false ): Null<HitQuad>{
        var o = qy-py;
        var a = qx-px;
        var h = Math.pow( o*o + a*a, 0.5 );
        var theta = Math.atan2( o, a );
        return pixelimageXY.algo.LinePixel
            .rotateGradLine( this, px, py, thick, h, theta, colorA, colorB, colorC, colorD, hasHit, debugCorners );
    }
    /**
		@see fillPolyBuild
		this is a version with radial gradient applied so the centre is one color, but only used gradient triangles so limited
	**/
	public inline
	function radialPolyon( cx: Float, cy: Float
		                     , rx: Float, ry: Float
							 , colorIn: Int, colorOut: Int
							 , gx: Float = 0., gy: Float = 0.
							 , ?phi: Float = 0., ?sides:Int = 36, cornerUp:Bool = true ){
		fillRadialPolyBuild( this
			               , cx, cy
						   , rx, ry
						   , colorIn, colorOut
						   , gx, gy
						   , phi, sides, cornerUp );
	}
    /**
		provides a filled ellipse/circle using triangles and more sides for large with a radial color gradient from the centre 
		colorIn is the internal colour and colorOut the external one, gx and gy -1 to 1 provide offset centre
		there are lots of limitations, gx and gy max and min obviously look bad and may need to scale them to 0.7 for rotated ellipse
	**/
	public inline
	function radialEllipseTri( cx: Float, cy: Float
								 , rx: Float, ry: Float
								 , colorIn: Int, colorOut: Int
								 , gx: Float = 0., gy: Float = 0.
								 , ?phi: Float = 0.
								 , ?printSides: Bool = false
								 , ?targetError: Float = 1.05 ){
		var rSmall = ( rx > ry ) ? ry : rx;
		var noSides = circleError( rSmall, targetError );
		if( printSides ) trace( noSides );
		fillRadialPolyBuild( this
			               , cx, cy
						   , rx, ry
						   , colorIn, colorOut
						   , gx, gy
						   , phi
						   , noSides );
	}

    public inline
	function sweepTri( ax: Float, ay: Float
						 , rx: Float, ry: Float
						 , startRadian: Float, sweepRadian: Float
						 , colA: Pixel32, colB: Pixel32, colC:Pixel32
						 , hasHit: Bool = false ): Null<HitTri> {
		var currAngle = startRadian;
		var bx = rx * Math.cos( currAngle ) + ax;
		var by = ry * Math.sin( currAngle ) + ay;
		// last pie
		currAngle = startRadian + sweepRadian;
		var cx = rx * Math.cos( currAngle ) + ax;
		var cy = ry * Math.sin( currAngle ) + ay;
		return triangle( ax, ay, colA, bx, by, colB, cx, cy, colC );
	}

    public inline
	function pie( ax: Float, ay: Float
				, rx: Float, ry: Float
				, startRadian: Float, sweepRadian: Float
				, centreColor: Pixel32
				, outerColor: Pixel32
				, hasHit: Bool = false
				, ?targetError:Float = 1.05 ): Null<HitTriArray> {
		var rSmall = ( rx > ry ) ? ry : rx;
		var noSides = circleError( rSmall, targetError );
		var theta = Math.PI / noSides; // *2 but make it smaller
		var currAngle = startRadian;
		var tot = Math.floor( sweepRadian / theta );
		theta += ( sweepRadian / theta - tot ) / noSides;
		var bx = rx * Math.cos( currAngle ) + ax;
		var by = ry * Math.sin( currAngle ) + ay;
		var cx = 0.;
		var cy = 0.;
		var arrTri: Array<HitTri> = [];
		for (i in 1...tot + 1) {
			currAngle = startRadian + i * theta;
			cx = rx * Math.cos( currAngle ) + ax;
			cy = ry * Math.sin( currAngle ) + ay;
			var triHit = triangle( ax, ay, centreColor, bx, by, outerColor, cx, cy, outerColor );
			if( hasHit ) arrTri[ arrTri.length ] = triHit;
			bx = cx;
			by = cy;
		}
		// last pie
		currAngle = startRadian + sweepRadian;
		cx = rx * Math.cos( currAngle ) + ax;
		cy = ry * Math.sin( currAngle ) + ay;
		var triHit = triangle( ax, ay, centreColor, bx, by, outerColor, cx, cy, outerColor );
		if( hasHit ) arrTri[ arrTri.length ] = triHit;
		return if( hasHit ){
			new HitTriArray( arrTri );
		} else {
			arrTri = null;
			null;
		}
	}

    	/**
		provides a radial colour gradient, it uses a temp pixelimage to draw a rectangle and then radial ellipse within.
		@:see fillRadialEllipseTri

	**/
	public inline
	function radialRectangle( x: Float, y: Float
								, wid: Float, hi: Float
								, colorIn: Pixel32, colorOut: Pixel32
								, ?gx: Float = 0, ?gy: Float = 0 ){
		var temp = new Pixelimage( Math.ceil( wid ), Math.ceil( hi ) );
		var rx = wid / 2;
		var ry = hi / 2;
		temp.transparent = false; // should be default anyway.
		// draw base color
		temp.simpleRect( 0, 0, wid, hi, colorOut );
		// should over write pixels
		temp.gradientShape.radialEllipseTri( rx, ry
								 , rx, ry
								 , colorIn, colorOut
								 , gx, gy );
		this.putPixelImage( temp, Std.int( x ), Std.int( y ) );
		temp = null;
	}

    	// gradient thick arrows

	public inline
	function thickArrow( px: Float, py: Float
						   , qx: Float, qy: Float
						   , thick: Float
						   , color1: Int
						   , color2: Int
						   , flare: Bool = false, reverseFlare: Bool = false
						   , hasHit:Bool = true): Null<HitTriArray> {
		return gradThickLineArrow( this
								 , px, py
								 , qx, qy
								 , thick
								 , color1
								 , color2
								 , flare
								 , reverseFlare
								 , hasHit );
	}

	public inline
	function thickArrowBoth( px: Float, py: Float
							   , qx: Float, qy: Float
							   , thick: Float
							   , color1: Int, color2: Int
							   , hasHit: Bool = true ): Null<HitTriArray> {
		return gradThickLineArrowBoth( this
									 , px, py
									 , qx, qy
									 , thick
									 , color1, color2
									 , hasHit );
	}

	public inline
	function thickFixArrow( px: Float, py: Float
							  , qx: Float, qy: Float
							  , arrowWidth: Float, arrowHeight: Float
					          , thick: Float
							  , color1: Int, color2: Int
							  , flare: Bool = false, reverseFlare: Bool = false
							  , hasHit: Bool = true ): Null<HitTriArray> {
		return gradThickLineFixedArrow( this
									  , px, py
									  , qx, qy
									  , arrowWidth, arrowHeight
									  , thick
									  , color1, color2
									  , flare, reverseFlare
									  , hasHit );
	}

	public inline
	function thickFixArrowBoth( px: Float, py: Float
								  , qx: Float, qy: Float
								  , arrowWidth: Float, arrowHeight: Float
								  , thick: Float
								  , color1: Int, color2: Int
								  , hasHit: Bool = true ): Null<HitTriArray> {
		return gradThickLineFixedArrowBoth( this
										  , px, py
										  , qx, qy
										  , arrowWidth, arrowHeight
										  , thick
										  , color1, color2
										  , hasHit );
	}

	/**
		x, y      - position
		hi, wid   - the outside dimensions
		dx, dy    - define the 9-slice distance in from x, y, dy can default to dx
		fat, tall - the inner dimensions of the 9-slice centre, optional
	**/
	public inline
	function RoundRectangle( x: Float, y: Float
						   , hi: Float, wid: Float
						   , colorA: Pixel32, colorB: Pixel32, colorC: Pixel32, colorD: Pixel32
						   , ?dx: Float = -1., ?dy: Float = -1.
						   , ?fat:Float = -1., ?tall:Float = -1. ){
		fillGrad4RoundRectangle( abstract
							   , x, y
							   , hi, wid
							   , colorA, colorC, colorB, colorD
							   , dx, dy
							   , fat, tall );
	}

	public inline
	function lineRoundRectangle( x: Float, y: Float
							   , hi: Float, wid: Float
							   , thick: Float
							   , colorA: Pixel32, colorB: Pixel32, colorC: Pixel32, colorD: Pixel32
							   , ?dx: Float = -1., ?dy: Float = -1.
							   , ?fat: Float = -1., ?tall: Float = -1. ){
		var temp = new Pixelimage( Math.ceil( hi ), Math.ceil( wid ) );
		temp.transparent = false;
		fillGrad4RoundRectangle( temp
							   , 0, 0
							   , hi, wid
							   , colorA, colorC, colorB, colorD
							   , dx, dy
							   , fat, tall);
		fillRoundRectangle( temp
						  , thick, thick
						  , wid - 2 * thick, hi - 2 * hi
						  , 0x00000000
						  , dx, dy
						  , fat, tall );
		this.putPixelImage( temp, Std.int( x ), Std.int( y ) );
		temp = null;
	}
}