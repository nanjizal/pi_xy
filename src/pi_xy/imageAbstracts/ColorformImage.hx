package pi_xy.imageAbstracts;

import pi_xy.Pixelimage;
import pi_xy.pixel.Pixel32;
import pi_xy.pixel.Pixel28;
import pi_xy.pixel.ColorHelp;

@:transient
abstract ColorformImage( Pixelimage ) from Pixelimage to Pixelimage {
	inline public function new(w:Int, h:Int) {
		this = new Pixelimage(w, h);
	}

	public inline
    function greyScale( useAlpha: Bool = true ): Pixelimage {
		var p = 0;
		var xx = p;
		var q = 0;
		var out:Pixelimage = new Pixelimage(this.width, this.height);
		var here:Pixelimage = this;
		var wid = this.width -1;
		var hi  = this.height -1;
		while (true) {
			out.setARGB( p, q, luminosityGrey( here.getARGB( p, q ), useAlpha ) );
            p++;
			if( p > wid ){
				p = xx;
				q++;
			}
			if( q > hi )
				break;
		}
		return out;
	}

	public inline
    function towardsColor( color: Int, t: Float ){//, useAlpha: Bool = true ) {
        var p = 0;
		var xx = p;
		var q = 0;
		var out:Pixelimage = new Pixelimage( this.width, this.height );
		var here:Pixelimage = this;
		var wid = this.width -1;
		var hi  = this.height -1;
		while( true ){
			out.setARGB( p, q, argbIntBetween( here.getARGB( p, q ), color, t ) );
            p++;
			if( p > wid ){
				p = xx;
				q++;
			}
			if( q > hi )
				break;
		}
		return out;
    }
    public inline
    function towardsImage( img: Pixelimage, t: Float ){//, useAlpha: Bool = true ) {
        var p = 0;
		var xx = p;
		var q = 0;
        var here: Pixelimage = this;
		var out: Pixelimage = new Pixelimage( this.width, this.height );
        var imgTarget = img.transform.scaleMatch( here );
		var wid = this.width -1;
		var hi  = this.height -1;
		while( true ){
			out.setARGB( p, q
                       , argbIntBetween( here.getARGB( p, q )
                                       , imgTarget.getARGB( p, q )
                                       , t ) );
            p++;
			if (p > wid) {
				p = xx;
				q++;
			}
			if (q > hi)
				break;
		}
		return out;
    }
}
