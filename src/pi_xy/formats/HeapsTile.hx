package pi_xy.formats;

import hxd.Pixels;
import pi_xy.Pixelimage;
import pi_xy.pixel.Pixel32;
import haxe.io.UInt8Array;
import pi_xy.formats.HeapsPixels;
import iterMagic.Img;

// module HeapsTile
abstract HeapsTile( h2d.Tile ) to h2d.Tile from h2d.Tile {
    public inline
    function new( ht: h2d.Tile ){
        this = ht;
    }
    @:from
    public static inline 
    function fromPixelimage( pixelImage: Pixelimage ): HeapsTile {
        var heapsPixels: pi_xy.formats.HeapsPixels = pixelImage;
        var p: hxd.Pixels = heapsPixels;
        return new HeapsTile( h2d.Tile.fromPixels( p ) );
    }
    @:to
    public inline
    function toPixelimage(): Pixelimage {
        var pixelImage: Pixelimage = captureHeapsPixels();
        return pixelImage;
    }
    public inline
    function captureHeapsPixels(): HeapsPixels {
        var heapsPixels: pi_xy.formats.HeapsPixels = this.getTexture().capturePixels();
        return heapsPixels;
    }
}

/*
inline
function toHeapsTile( pixelImage: Pixelimage ): h2d.Tile {
    return h2d.Tile.fromPixels( toHeapsPixels( pixelImage ) );
}
inline
function fromHeapsTile( tile: h2d.Tile ): Pixelimage {
    // slow
    //var pix: PixelsARGB = tile.getTexture().capturePixels();
    var heapsPixels: pi_xy.formats.HeapsPixels = tile.getTexture().capturePixels();
    var pixelImage: Pixelimage = heapsPixels;
    return pixelImage;//fromHeapsPixels( pix );
}
*/
//#end