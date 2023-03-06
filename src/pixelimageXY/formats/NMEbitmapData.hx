package pixelimageXY.formats;
import nme.display.BitmapData;
import pixelimageXY.Pixelshape;
import pixelimageXY.Pixelimage;
import pixelimageXY.pixel.Pixel32;
import haxe.io.UInt8Array;
// module NMEbitmapData

// untested!!

inline
function toNmeBitmapData( pixelShape: Pixelshape ): BitmapData {
    var lh = pixelShape.height; 
    var lw = pixelShape.width;
    var dataRGB = haxe.io.Bytes.alloc( lw * lh * 3 );
    var dataA = haxe.io.Bytes.alloc( lw * lh );
    var p0 = 0;
    var p1 = 0;
    // not optimal
    for( y in 0...lh ) {
        for( x in 0...lw ) {
            var col: Pixel32 = new Pixel32( pixelShape.getARGB( x, y ) );
            var a: Int = col.c0;
            var r: Int = col.c1;
            var g: Int = col.c2;
            var b: Int = col.c3;
            dataRGB.set( p0++, r );
            dataRGB.set( p0++, g );
            dataRGB.set( p0++, b );
            dataA.set( p1++, a );
        }
    }
    return BitmapData.loadFromHaxeBytes( dataRGB, dataA );
}