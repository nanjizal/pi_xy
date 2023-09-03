package pixelimageXY;

import pixelimageXY.Pixelimage;
import pixelimageXY.pixel.Pixel32;
import pixelimageXY.algo.RoundRecPixel;
import pixelimageXY.algo.HitTri;
import pixelimageXY.algo.HitQuad;
import pixelimageXY.algo.HitTriArray;
import pixelimageXY.algo.GeomPix;
//import vision.ds.Image;
import haxe.io.UInt32Array;
import iterMagic.BoundIterator;
import iterMagic.IteratorRange;
import pixelimageXY.ImageStruct;
import pixelimageXY.pixel.Pixel32;
import pixelimageXY.pixel.Pixel28;
import pixelimageXY.algo.GeomPix;
import pixelimageXY.pixel.PixelChannel;
import pixelimageXY.algo.TriPixel;
import pixelimageXY.algo.LinePixel;
import pixelimageXY.algo.CirclePixel;
import pixelimageXY.algo.PolyPixel;
// import pixelimageXY.algo.QuadPixel;
import pixelimageXY.algo.QuadrantPixel;
import pixelimageXY.algo.RoundRecPixel;
import pixelimageXY.algo.RectanglePixel;
import pixelimageXY.algo.HitTri;
import pixelimageXY.algo.HitQuad;
import pixelimageXY.algo.HitTriArray;
import pixelimageXY.algo.QuadPixel;
import pixelimageXY.algo.QuintPixel;
import pixelimageXY.algo.ArrowPixel;

@:transient
@:forward
abstract Pixelshape( Pixelimage ) to Pixelimage {
	public inline 
	function new( w: Int, h: Int ) {
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


	/*
		public inline
		function fillDavidStar(x: Float, y: Float
								, d: Float
								, color: Int ) {
			fillSquare( x, y, d, color );
			fillRect( x, y, d*Math.pow(2,0.5), d*Math.pow(2,0.5), color, Math.PI/4 );
		}
	 */
}