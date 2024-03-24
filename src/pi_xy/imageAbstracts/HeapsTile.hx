package pi_xy.imageAbstracts;

#if heaps
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
    function to(): h2d.Tile {
        return pi_xy.formats.HeapsTile.toLimeImage( this );
    }
    @:to
    public inline
    function toHeapsPixels(): hxd.Pixels {
        return pi_xy.formats.HeapsPixels.toHeapsPixels( this );
    }
    public static inline
    function createPixelImageHeapsPixels( pixels: hxd.Pixels ): Pixelimage {
        return pi_xy.formats.HeapsPixels.fromHeapsPixels( pixels );
    }
    public static inline
    function createPixelImage( tile: h2d.Tile ): Pixelimage {
        return pi_xy.formats.HeapsTile.fromHeapsTile( tile );
    }
}
#end