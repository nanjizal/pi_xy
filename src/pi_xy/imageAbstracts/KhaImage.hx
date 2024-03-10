package pi_xy.imageAbstracts;
import pi_xy.pixel.Pixel32;
@:forward
@:transient
abstract KhaImage( Pixelimage ) from Pixelimage to Pixelimage {
    inline
    public function new( w: Int, h: Int ){
       this = new Pixelimage( w, h );
    }
    @:to
    public inline
    function to(): kha.Image {
        return pi_xy.formats.KhaPixels.toKhaImage_( this );
    }
    public static inline
    function createPixelImage( khaImage: kha.Image ): Pixelimage {
        return pi_xy.formats.KhaPixels.fromKhaImage( khaImage );
    }
}
