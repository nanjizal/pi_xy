package pi_xy.formats;
// UNTESTED!!!
//#if !'doc-gen'
import ceramic.Texture;
import ceramic.UInt8Array;
import pi_xy.Pixelimage;
import pi_xy.pixel.Pixel32;
import haxe.io.UInt8Array;
import iterMagic.Img;

// module CeramicTexture
class CeramicTexture {
    @:keep
    public static var toCeramicTexture_ = toCeramicTexture;
    @:keep
    public static var fromCeramicTexture_ = fromCeramicTexture;
    public function new(){}
}
// untested!!
//@:dox(hide)
inline
function toCeramicTexture( pixelImage: Pixelimage ): Texture {
    var lh = pixelImage.height; 
    var lw = pixelImage.width;
    var buffer = new ceramic.UInt8Array( lw * lh * 4 );
    var p = 0;
    for( y in 0...lh ) {
        for( x in 0...lw ) {
            var col: Pixel32 = new Pixel32( pixelImage.getARGB( x, y ) );
            var a: Int = col.c0;
            var r: Int = col.c1;
            var g: Int = col.c2;
            var b: Int = col.c3;
            argb.set( p++, r );
            argb.set( p++, g );
            argb.set( p++, b );
            argb.set( p++, a );
        }
    }
    return ceramic.Texture.fromPixels( lw*1, lh*1, buffer );
}
inline
function fromCeramicTexture( texture: Texture ): Pixelimage {
    var lh = texture.height; 
    var lw = texture.width;
    var density = texture.density;
    var buffer = new ceramic.UInt8Array( lw * lh * 4 );
    texture.fetchPixels( buffer );
    var pixelImage = new Pixelimage( lw, lh );
    pixelImage.transparent = true;
    var p = 0;
    for( y in 0...lh ) {
        for( x in 0...lw ) {
            var r: Int = buffer.__get( p++ );
            var g: Int = buffer.__get( p++ );
            var b: Int = buffer.__get( p++ );
            var a: Int = buffer.__get( p++ );
            var col = Pixel32.fromChannels( a, r, g, b );
            pixelImage.setARGB( x, y, col );
        }
    }
    return pixelImage;
}
//#end