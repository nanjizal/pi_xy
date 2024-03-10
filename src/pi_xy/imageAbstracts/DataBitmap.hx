package pi_xy.imageAbstracts;
import pi_xy.pixel.Pixel32;
typedef FlashBitmapData = flash.display.BitmapData;

@:forward
@:transient
abstract DataBitmap( Pixelimage ) from Pixelimage to Pixelimage {

    inline
    public function new( w: Int, h: Int ){
       this = new Pixelimage( w, h );
    }
    #if ( nme || openfl )
    @:to
    public inline
    function to(): FlashBitmapData {
        #if ( openfl && !nme )
            return  pi_xy.formats.OpenFLbitmapData.toOpenflBitmapData_( this );
        #else
            return pi_xy.formats.NMEbitmapData.toNmeBitmapData_( this );
        #end
    }
    public static inline
    function createPixelImage( bm: FlashBitmapData ) {
        #if ( openfl && !nme )
            return pi_xy.formats.OpenFLbitmapData.fromOpenflBitmapData_( bm );
        #else
            return pi_xy.formats.NMEbitmapData.fromNmeBitmapData_( bm );
        #end
    }
    #end
}