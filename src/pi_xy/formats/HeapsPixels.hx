package pi_xy.formats;

import hxd.Pixels; // PixelsARGB
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
    var pixs: PixelsARGB = ( hxd.Pixels.alloc( lw, lh, hxd.PixelFormat.ARGB ): PixelsARGB );
    for( y in 0...lh ) for( x in 0...lw ) pixs.setPixel( x, y, pixelImage.getARGB( x, y ) );
    return ( pixs: hxd.Pixels );
}
inline
function fromHeapsPixels( pixs: PixelsARGB ): Pixelimage {
    var lh = pixs.height; 
    var lw = pixs.width;
    var argb = ( pixs: PixelsARGB );
    var pixelImage = new Pixelimage( lw, lh );
    pixelImage.transparent = true;
    for( y in 0...lh ) for( x in 0...lw ) pixelImage.setARGB( x, y, argb.getPixel( x, y ) );
    return pixelImage;
}
//#end