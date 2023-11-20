package pi_xy.imageAbstracts;
import pi_xy.Pixelimage;
import pi_xy.algo.HitTri;
import pi_xy.algo.HitQuad;
import pi_xy.algo.HitTriArray;
import pi_xy.algo.GeomPix;
import pi_xy.pixel.Pixel32;
import pi_xy.algo.QuadrantPixel;
import pi_xy.algo.RectanglePixel;
import pi_xy.algo.PolyPixel;
import pi_xy.algo.CirclePixel;
import pi_xy.algo.ArrowPixel;
import pi_xy.algo.QuintPixel;
import pi_xy.algo.QuadPixel;
import pi_xy.algo.LinePixel;
import pi_xy.algo.TriPixel;

@:transient
abstract SoftShape( Pixelimage ) from Pixelimage to Pixelimage {

    inline
    public function new( w: Int, h: Int ){
       this = new Pixelimage( w, h );
    }

    public inline
	function quint( ax: Float, ay: Float
						  , bx: Float, by: Float
						  , cx: Float, cy: Float
						  , dx: Float, dy: Float
						  , color: Int
						  , softC: Float
						  , hasHit: Bool = false ): HitQuad {
		// tri e - a b d
		// tri f - b c d
		return softFillQuintilateral( this
									, ax, ay
									, bx, by
									, cx, cy
									, dx, dy
									, color
									, softC
									, hasHit );
	}

	public inline
	function quad( ax: Float, ay: Float
		                 , bx: Float, by: Float
						 , cx: Float, cy: Float
						 , dx: Float, dy: Float
						 , color: Int
						 , soft: Float = 40
						 , softAB: Bool = true
						 , softBC: Bool = true
						 , softCD: Bool = true
						 , softDA: Bool = true
						 , hasHit: Bool = false ): HitQuad {
		// tri e - a b d
		// tri f - b c d
		return fillSoftQuadrilateral( this
									, ax, ay
									, bx, by
									, cx, cy
									, dx, dy
									, color
									, soft
									, softAB
									, softBC
									, softCD
									, softDA
									, hasHit );
	}

	public inline
	function quadFudge( ax: Float, ay: Float
							  , bx: Float, by: Float
							  , cx: Float, cy: Float
							  , dx: Float, dy: Float
							  , color: Int
							  , soft: Float = 40
							  , softAB: Bool = true
							  , softBC: Bool = true
							  , softCD: Bool = true
							  , softDA: Bool = true
							  , hasHit: Bool = false ): HitQuad {
		return fillSoftQuadrilateralFudge( this
										 , ax, ay
										 , bx, by
										 , cx, cy
										 , dx, dy
										 , color
										 , soft
										 , softAB
										 , softBC
										 , softCD
										 , softDA
										 , hasHit );
	}

	public inline
	function quadQuarter( ax: Float, ay: Float
		                        , bx: Float, by: Float
								, cx: Float, cy: Float
								, dx: Float, dy: Float
								, color: Int
								, soft: Float = 40
								, softAB: Bool = true
								, softBC: Bool = true
								, softCD: Bool = true
								, softDA: Bool = true
								, hasHit: Bool = false ): HitQuad {
		return fillSoftQuadrilateralQuarter( this
										   , ax, ay
										   , bx, by
										   , cx, cy
										   , dx, dy
										   , color
										   , soft
										   , softAB
										   , softBC
										   , softCD
										   , softDA
										   , hasHit );
	}

	public inline
	function line( px: Float, py: Float
						 , qx: Float, qy: Float
						 , thick: Float
						 , color: Int
						 , soft: Float = 40
						 , softAB: Bool = true
						 , softBC: Bool = true
						 , softCD: Bool = true
						 , softDA: Bool = true
						 , hasHit: Bool = true
						 , ?debugCorners = false ): Null<HitQuad> {
		var o = qy - py;
		var a = qx - px;
		var h = Math.pow( o * o + a * a, 0.5 );
		var theta = Math.atan2( o, a );
		return rotateSoftLine( this
							 , px, py
							 , thick
							 , h
							 , theta
							 , color
							 , soft
							 , softAB, softBC, softCD, softDA
							 , hasHit
							 , debugCorners );
	}

	public inline
	function lineLuxury( px: Float, py: Float
		                       , qx: Float, qy: Float
							   , thick: Float
							   , color: Int
							   , soft: Float = 40
							   , softAB: Bool = true
							   , softBC: Bool = true
							   , softCD: Bool = true
							   , softDA: Bool = true
							   , hasHit: Bool = true
							   , ?debugCorners = false ): Null<HitQuad> {
		var o = qy - py;
		var a = qx - px;
		var h = Math.pow( o * o + a * a, 0.5 );
		var theta = Math.atan2( o, a );
		return rotateSoftLineLuxury( this
								   , px, py
								   , thick
								   , h
								   , theta
								   , color
								   , soft
								   , softAB, softBC, softCD, softDA
								   , hasHit
								   , debugCorners );
	}

	public inline
	function triangle( ax: Float, ay: Float
							 , bx: Float, by: Float
							 , cx: Float, cy: Float
							 , color: Int
							 , soft3: Float
							 , softAB: Bool = true
							 , softBC: Bool = true
							 , softCA: Bool = true
							 , hasHit: Bool = false ): HitTri {
		/* debug
			this.fillSquare( ax, ay, 12, 0xFF0000ff );
			this.fillSquare( bx, by, 12, 0xFFF000F0 );
			this.fillSquare( cx, cy, 12, 0xFFF0F000 );
		 */
		return fillTriSoft3( this
						   , ax, ay
						   , bx, by
						   , cx, cy
						   , color
						   , soft3
						   , softAB, softBC, softCA
						   , hasHit );
	}
	// soft ones

	public inline
	function arrow( px: Float, py: Float
						  , qx: Float, qy: Float
						  , thick: Float
						  , color: Int
						  , flare: Bool = false
						  , reverseFlare: Bool = false
						  , soft: Float = 40.
						  , hasHit: Bool = true ): Null<HitTriArray>{
		return fillSoftLineArrow( this
								, px, py
								, qx, qy
								, thick
								, color
								, flare, reverseFlare
								, soft
								, hasHit );
	}

	public inline
	function arrowBoth( px: Float, py: Float
							  , qx: Float, qy: Float
							  , thick: Float, color: Int
							  , soft: Float = 40., hasHit: Bool = true ): Null<HitTriArray> {
		return fillSoftLineArrowBoth( this
			                        , px, py
									, qx, qy
									, thick
									, color
									, soft
									, hasHit );
	}

	public inline
	function fixArrow( px: Float, py: Float
		                     , qx: Float, qy: Float
							 , arrowWidth: Float, arrowHeight: Float
							 , thick: Float
							 , color: Int
							 , flare: Bool = false, reverseFlare: Bool = false
							 , soft: Float = 40., hasHit: Bool = true ): Null<HitTriArray> {
		return fillSoftLineFixedArrow( this
									 , px, py
									 , qx, qy
									 , arrowWidth, arrowHeight
									 , thick
									 , color
									 , flare, reverseFlare
									 , soft
									 , hasHit );
	}

	public inline
	function fixArrowBoth( px: Float, py: Float
								 , qx: Float, qy: Float
								 , arrowWidth: Float, arrowHeight: Float
								 , thick: Float
								 , color: Int
								 , soft: Float = 40.
								 , hasHit: Bool = true ): Null<HitTriArray> {
		return fillSoftLineFixedArrowBoth( this
										 , px, py
										 , qx, qy
										 , arrowWidth, arrowHeight
										 , thick
										 , color
										 , soft
										 , hasHit );
	}

	public inline
	function ellipseTri( cx: Float, cy: Float
							   , rx: Float, ry: Float
							   , color: Int
							   , phi: Float = 0
							   , softC: Float = 10
							   , printSides: Bool = false
							   , targetError: Float = 1.05 ) {
		var rSmall = ( rx > ry ) ? ry : rx;
		var noSides = circleError( rSmall, targetError );
		if( printSides ) trace( noSides );
		polyBuild( cx, cy
						 , rx, ry
						 , color
						 , phi
						 , noSides
						 , softC );
	}

	public inline
	function polyBuild( cx: Float, cy: Float
							  , rx: Float, ry: Float
							  , color: Int
							  , ?phi: Float = 0.
							  , ?sides: Int = 36
							  , softC: Float = 10.
							  , cornerUp: Bool = true ) {
		softFillPolygonBuild( this
							, cx, cy
							, rx, ry
							, color
							, phi
							, sides
							, softC
							, cornerUp );
	}
}