package pi_xy.imageAbstracts;
#if ( peote_view )
import pi_xy.pixel.Pixel32;
@:forward
@:transient
abstract PeoteTexture( Pixelimage ) from Pixelimage to Pixelimage {
    inline
    public function new( w: Int, h: Int ){
       this = new Pixelimage( w, h );
    }
    @:to
    public inline
    function to(): peote.view.Texture {
        return pi_xy.formats.PeoteTexture.toPeoteTexture( this );
    }
    @:to
    public inline
    function toTextureData(): peote.view.TextureData {
        return pi_xy.formats.PeoteTexture.toPeoteTextureData( this );
    }
    // unsure when/how/if feasible to grab the texture.
    public static inline
    function createPixelImage( texture: peote.view.Texture ): Pixelimage {
        return pi_xy.formats.PeoteTexture.fromPeoteTexture( texture );
    }
}
#end
