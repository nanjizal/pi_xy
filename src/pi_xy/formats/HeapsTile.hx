package pi_xy.formats;

import hxd.Pixels;
import pi_xy.Pixelimage;
import pi_xy.pixel.Pixel32;
import haxe.io.UInt8Array;
import pi_xy.formats.HeapsPixels;
import iterMagic.Img;

// module HeapsTile
class HeapsTile {
    @:keep
    public static var toHeapsTile_ = toHeapsTile;
    @:keep
    public static var fromHeapsTile_ = fromHeapsTile;
    public function new(){}
}
// untested!!
//@:dox(hide)
inline
function toHeapsTile( pixelImage: Pixelimage ): h2d.Tile {
    return h2d.Tile.fromPixels( toHeapsPixels( pixelImage ) );
}
inline
function fromHeapsTile( tile: h2d.Tile ): Pixelimage {
    // slow
    var pix: PixelsARGB = tile.getTexture().capturePixels();
    return fromHeapsPixels( pix );
}
//#end