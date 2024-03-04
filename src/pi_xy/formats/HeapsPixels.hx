package pi_xy.formats;

import hxd.Pixel;
import pi_xy.Pixelimage;
import pi_xy.pixel.Pixel32;
import haxe.io.UInt8Array;
import iterMagic.Img;

// module HeapsPixel
class HeapsPixels {
    @:keep
    public static var toHeapsPixels_ = toHeapsPixels;
    @:keep
    public static var fromHeapsPixels_ = fromHeapsPixels;
    public function new(){}
}
// untested!!
//@:dox(hide)
inline
function toHeapsPixels( pixelImage: Pixelimage ): hxd.Pixels {
    var lh = pixelImage.height; 
    var lw = pixelImage.width;
    var pixs: PixelsARGB = hxd.Pixels.alloc( lw, lh, hxd.PixelFormat.ARGB );
    for( y in 0...lh ) for( x in 0...lw ) pix.setPixel( x, y, pixelImage.getARGB( x, y ) );
    return pixs;
}
inline
function fromHeapsPixels( pixs: hxd.Pixels ): Pixelimage {
    var lh = pixs.height; 
    var lw = pixs.width;
    var pixelImage = new Pixelimage( lw, lh );
    pixelImage.transparent = true;
    for( y in 0...lh ) for( x in 0...lw ) pixelImage.setARGB( x, y, pix.getARGB( x, y ) );
    return pixelImage;
}
//#end