package pi_xy.formats;

//#if !'doc-gen'
import nme.display.BitmapData;
import pi_xy.Pixelimage;
import pi_xy.pixel.Pixel32;
import haxe.io.UInt8Array;
import iterMagic.Img;

// module NMEbitmapData
class NMEbitmapData {
    @:keep
    public static var toNmeBitmapData_ = toNmeBitmapData;
    public function new(){}
}
// untested!!
//@:dox(hide)
inline
function toNmeBitmapData( pixelImage: Pixelimage ): BitmapData {
    var lh = pixelImage.height; 
    var lw = pixelImage.width;
    //return BitmapData.loadFromHaxeBytes( dataRGB, dataA );
    var rect = new nme.geom.Rectangle( 0, 0, lw, lh );
    var bitmapData = new nme.display.BitmapData( lw, lh, true, 0xFFFFFFFF, nme.image.PixelFormat.pfBGRA );
    var argb = haxe.io.Bytes.alloc( lw * lh * 4 );
    var p = 0;
    for( y in 0...lh ) {
        for( x in 0...lw ) {
            var col: Pixel32 = new Pixel32( pixelImage.getARGB( x, y ) );
            var a: Int = col.c0;
            var r: Int = col.c1;
            var g: Int = col.c2;
            var b: Int = col.c3;
            argb.set( p++, a );
            argb.set( p++, r );
            argb.set( p++, g );
            argb.set( p++, b );
        }
    }
    bitmapData.setPixels( rect, nme.utils.ByteArray.fromBytes( argb ) );
    return bitmapData;
}
//#end