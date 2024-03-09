package pi_xy.formats;
// UNTESTED!!!
//#if !'doc-gen'
import ceramic.Texture;
import ceramic.UInt8Array;
import pi_xy.Pixelimage;
import pi_xy.pixel.Pixel32;
import haxe.io.UInt8Array;
import iterMagic.Img;

class CeramicTexture {
    @:keep
    public static var toCeramicTexture_ = toCeramicTexture;
    @:keep
    public static var fromCeramicTexture_ = fromCeramicTexture;
    public function new(){}
}
@:forward
abstract UInt8ArrayAccess( ceramic.UInt8Array ) from ceramic.UInt8Array to ceramic.UInt8Array {

    public function new( len: Int ){
        this = new ceramic.UInt8Array( len );
    }
    #if js
    @:arrayAccess extern inline function __set(idx:Int, val:UInt) : Void this[idx] = val;
    @:arrayAccess extern inline function __get(idx:Int) : Int return this[idx];
    #end
    #if cpp
    @:arrayAccess extern
    public inline function __get(idx:Int) {
        return clay.buffers.ArrayBufferIO.getUint8(this.buffer, this.byteOffset+idx);
    }
    @:arrayAccess extern
    public inline function __set(idx:Int, val:UInt) : Void {
        clay.buffers.ArrayBufferIO.setUint8(this.buffer, this.byteOffset+idx, val);
    }
    #end
}

// untested!!
//@:dox(hide)
inline
function toCeramicTexture( pixelImage: Pixelimage ): Texture {
    var lh = pixelImage.height; 
    var lw = pixelImage.width;
    var buffer = ( new ceramic.UInt8Array( Std.int( lw * lh * 4 ) ) : UInt8ArrayAccess );
    var p = 0;
    for( y in 0...lh ) {
        for( x in 0...lw ) {
            var col: Pixel32 = new Pixel32( pixelImage.getARGB( x, y ) );
            var a: Int = col.c0;
            var r: Int = col.c1;
            var g: Int = col.c2;
            var b: Int = col.c3;
            buffer[ p++ ] = r;
            buffer[ p++ ] = g;
            buffer[ p++ ] = b;
            buffer[ p++ ] = a;
        }
    }
    return ceramic.Texture.fromPixels( lw*1, lh*1, buffer );
}
inline
function fromCeramicTexture( texture: Texture ): Pixelimage {
    var lh = Std.int( texture.height ); 
    var lw = Std.int( texture.width );
    var density = texture.density;
    var buffer = ( new ceramic.UInt8Array( Std.int( lw * lh * 4 ) ) : UInt8ArrayAccess );
    texture.fetchPixels( buffer );
    var pixelImage = new Pixelimage( lw, lh );
    pixelImage.transparent = true;
    var p = 0;
    for( y in 0...lh ) {
        for( x in 0...lw ) {
            var r: Int = buffer[ p++ ];
            var g: Int = buffer[ p++ ];
            var b: Int = buffer[ p++ ];
            var a: Int = buffer[ p++ ];
            var col = Pixel32.fromChannels( a, r, g, b );
            pixelImage.setARGB( x, y, col );
        }
    }
    return pixelImage;
}
//#end