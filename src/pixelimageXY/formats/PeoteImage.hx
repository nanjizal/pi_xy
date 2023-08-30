package pixelimageXY.formats;

import pixelimageXY.Pixelimage;
import pixelimageXY.pixel.Pixel32;

import peote.view.Texture;
import peote.view.TextureData;
import haxe.io.UInt8Array;

inline 
function toPeoteTextureData( pixelImage: Pixelimage ): TextureData {
    var lh = pixelImage.height; 
    var lw = pixelImage.width;
    var data = new UInt8Array( lh*lw*4 );
    var p = 0;
    // not optimal
    for( y in 0...lh ) {
        for( x in 0...lw ) {
            var col: Pixel32 = new Pixel32( pixelImage.getARGB( x, y ) );
            var a: Int = col.c0;
            var r: Int = col.c1;
            var g: Int = col.c2;
            var b: Int = col.c3;
            data.set( p++, r );
            data.set( p++, g );
            data.set( p++, b );
            data.set( p++, a );
        }
    }
    return new TextureData( lw, lh, TextureType.UINT, data );
}
inline
function fromPeoteTextureFrame( texture: Texture, transparent: Bool = true ): Pixelimage {
    var lh = texture.height; 
    var lw = texture.width;
    var pixelImage = new Pixelimage( lw, lh );
    pixelImage.transparent = transparent;
    var data = texture.readPixelsUInt8( 0, 0, lw, lh );
    var p = 0;
    for( y in 0...lh ) {
        for( x in 0...lw ) {
            var r = data.get( p++ );
            var g = data.get( p++ );
            var b = data.get( p++ );
            var a = data.get( p++ );
            pixelImage.set_argbPixel( a, r, g, b, pixelImage.position( x, y ) );
        }
    }
    return pixelImage;
}