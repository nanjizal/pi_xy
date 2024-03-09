package pi_xy.formats;

//#if !'doc-gen'
import haxe.io.BytesData;
import haxe.io.BytesBuffer;
import openfl.display.BitmapData;
import pi_xy.Pixelimage;
import pi_xy.pixel.Pixel32;
import haxe.io.UInt8Array;
import iterMagic.Img;

// module NMEbitmapData
class OpenFLbitmapData {
    @:keep
    public static var toOpenflBitmapData_ = toOpenflBitmapData;
    @:keep
    public static var fromOpenflBitmapData_ = fromOpenflBitmapData;
    public function new(){}
}
//@:dox(hide)
inline
function toOpenflBitmapData( pixelImage: Pixelimage ): BitmapData {
    var lh = pixelImage.height; 
    var lw = pixelImage.width;
    //return BitmapData.loadFromHaxeBytes( dataRGB, dataA );
    var rect = new openfl.geom.Rectangle( 0, 0, lw, lh );
    var bitmapData = new openfl.display.BitmapData( lw, lh, true, 0xFFFFFFFF );
    var argb = haxe.io.Bytes.alloc( lw * lh * 4 );
    var p = 0;
    for( y in 0...lh ) {
        for( x in 0...lw ) {
            var col: Pixel32 = new Pixel32( pixelImage.getARGB( x, y ) );
            var a: Int = col.c0;
            var r: Int = col.c1;
            var g: Int = col.c2;
            var b: Int = col.c3;
            argb.set( p++, b );
            argb.set( p++, g );
            argb.set( p++, r );
            argb.set( p++, a );
        }
    }
    bitmapData.setPixels( rect, openfl.utils.ByteArray.fromBytes( argb ) );
    return bitmapData;
}
inline
function fromOpenflBitmapData( bitmapData: BitmapData ): Pixelimage {
    var lh = bitmapData.height; 
    var lw = bitmapData.width;
    var rect = new lime.math.Rectangle( 0, 0, lw, lh );
    var image = lime.graphics.Image.fromBitmapData( bitmapData );
    var pixelImage = new Pixelimage( lw, lh );
    pixelImage.transparent = true;
    var rgba: haxe.io.Bytes = image.getPixels( rect );
    var p = 0;
    for( y in 0...lh ) {
        for( x in 0...lw ) {
            var r: Int = rgba.get( p++ );
            var g: Int = rgba.get( p++ );
            var b: Int = rgba.get( p++ );
            var a: Int = rgba.get( p++ );
            var col = Pixel32.fromChannels( a, r, g, b );
            pixelImage.setARGB( x, y, col );
        }
    }
    return pixelImage;
}
//#end