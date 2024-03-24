package pi_xy.imageAbstracts;
#if ( lime )
import lime.graphics.Image;
import lime.graphics.ImageBuffer;
import pi_xy.Pixelimage;

@:forward
@:transient
abstract ImageLime( Pixelimage ) from Pixelimage to Pixelimage {
    inline
    public function new( w: Int, h: Int ){
       this = new Pixelimage( w, h );
    }
    @:to
    public inline
    function to(): lime.graphics.Image {
        return pi_xy.formats.LimeImage.toLimeImage( this );
    }
    @:to
    public inline
    function toImageBuffer(): lime.graphics.ImageBuffer {
        return pi_xy.formats.LimeImage.toLimeImageBuffer( this );
    }
    public static inline
    function createPixelImage( Image: lime.graphics.Image ): Pixelimage {
        return pi_xy.formats.LimeImage.fromLimeImage( Image );
    }
}
#end