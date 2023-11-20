package pi_xy.imageAbstracts;
import pi_xy.Pixelimage;
import pi_xy.algo.RoundRecPixel;
import pi_xy.algo.CirclePixel;
import pi_xy.algo.PolyPixel;

@:transient
abstract LineShape( Pixelimage ) from Pixelimage to Pixelimage {

    inline
    public function new( w: Int, h: Int ){
       this = new Pixelimage( w, h );
    }

	public inline
	function roundRectangle( x: Float, y: Float
						  , hi: Float, wid: Float
						  , thick: Float, color: Int
						  , ?dx: Float = -1., ?dy: Float = -1.
						  , ?fat: Float = -1., ?tall: Float = -1.) {
		var temp = new Pixelimage( Math.ceil( wid ), Math.ceil( hi ) );
		temp.transparent = false;

		fillRoundRectangle( temp
						  , 0, 0
						  , wid, hi
						  , color
						  , dx, dy
						  , fat, tall );

		fillRoundRectangle( temp
						  , thick, thick
						  , wid - 2 * thick, hi - 2 * hi
						  , 0x00000000
						  , dx, dy
						  , fat, tall );
		this.putPixelImage( temp, Std.int( x ), Std.int( y ) );
		temp = null;
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
	function ellipseTri( cx: Float, cy: Float
						   , rx: Float, ry: Float
						   , drx: Float, dry: Float
						   , color: Int
						   , ?phi: Float = 0.
						   , ?printSides: Bool = false
						   , ?targetError: Float = 1.05 ){
		var rSmall = ( rx > ry ) ? ry : rx;
		var rLarge = ( rx < ry ) ? ry : rx;
		var rDif = rLarge - rSmall;
		var noSides = circleError( rSmall, targetError );
		if( printSides ) trace(noSides);
		var temp = (phi == 0) ? new Pixelimage( Std.int( 2 * rx ), Std.int( 2 * ry ) ) : new Pixelimage( Std.int( 2 * rLarge + rDif ), Std.int( 2 * rLarge + rDif ) );
		temp.transparent = false;
		if( phi == 0 ) {
			temp.fillShape.polyBuild( rx, ry, rx, ry, color, phi, noSides );
		} else {
			temp.fillShape.polyBuild( rx + rDif, ry + rDif, rx, ry, color, phi, noSides );
		}
		// remove center
		var rx2 = rx - drx;
		var ry2 = ry - dry;
		rSmall = ( rx > ry ) ? ry : rx;
		// erase middle
		if (phi == 0) {
			temp.fillShape.polyBuild( rx, ry
				              , rx2, ry2
							  , 0x00000000
							  , phi
							  , noSides );
			this.putPixelImage( temp, Std.int(cx - rx), Std.int(cy - ry) );
		} else {
			temp.fillShape.polyBuild( rx + rDif, ry + rDif
							  , rx2, ry2
							  , 0x00000000
							  , phi
							  , noSides );
			this.putPixelImage(temp, Std.int(cx - rx - rDif), Std.int(cy - ry - rDif));
		}
		// temp.image = null;
		temp = null;
	}



	/**
		radial ellipse thick line 
		@see fillRadialEllipseTri
	**/
	public inline
	function radialEllipseTri( cx: Float, cy: Float
								 , rx: Float, ry: Float
								 , drx: Float, dry: Float
					 			 , colorIn: Int, colorOut: Int
								 , gx: Float = 0., gy: Float = 0.
								 , ?phi:Float = 0
								 , ?printSides:Bool = false
								 , ?targetError:Float = 1.05 ){
		var rSmall = ( rx > ry ) ? ry : rx;
		var rLarge = ( rx < ry ) ? ry : rx;
		var rDif = rLarge - rSmall;
		var noSides = circleError( rSmall, targetError );
		if( printSides ) trace( noSides );
		var temp = ( phi == 0 ) ? new Pixelimage( Std.int( 2 * rx ), Std.int( 2 * ry ) ) : new Pixelimage( Std.int( 2 * rLarge + rDif ), Std.int( 2 * rLarge + rDif ) );
		temp.transparent = false;
		if( phi == 0 ){
			fillRadialPolyBuild( temp
							   , rx, ry
							   , rx, ry
							   , colorIn, colorOut
							   , gx, gy
							   , phi
							   , noSides );
		} else {
			fillRadialPolyBuild( temp
							   , rx + rDif, ry + rDif
							   , rx, ry
							   , colorIn, colorOut
							   , gx, gy
							   , phi
							   , noSides );
		}
		// remove center
		var rx2 = rx - drx;
		var ry2 = ry - dry;
		rSmall = (rx > ry) ? ry : rx;
		// erase middle
		if (phi == 0) {
			temp.fillShape.polyBuild( rx, ry
							  , rx2, ry2
							  , 0x00000000
							  , phi
							  , noSides );
			this.putPixelImage( temp, Std.int( cx - rx ), Std.int( cy - ry ) );
		} else {
			temp.fillShape.polyBuild( rx + rDif, ry + rDif
				              , rx2, ry2
							  , 0x00000000
							  , phi
							  , noSides );
			this.putPixelImage(temp, Std.int(cx - rx - rDif), Std.int(cy - ry - rDif));
		}
		// temp.image = null;
		temp = null;
	}

}