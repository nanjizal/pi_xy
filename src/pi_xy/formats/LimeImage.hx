package pi_xy.formats;
#if ( lime )
import lime.graphics.PixelFormat;
import lime.graphics.ImageBuffer;
import lime.graphics.Image;
import lime.utils.UInt8Array;
import pi_xy.Pixelimage;
import pi_xy.pixel.Pixel32;
import haxe.io.UInt8Array;
import iterMagic.Img;

// module LimeImage
class LimeImage {
    @:keep
    public static var toLimeImageBuffer_ = toLimeImageBuffer;
    @:keep
    public static var fromLimeImageBuffer_ = fromLimeImageBuffer;
    @:keep
    public static var toLimeImage_ = toLimeImage;
    @:keep
    public static var fromLimeImage_ = fromLimeImage;
    public function new(){}
}

inline
function toLimeImageBuffer( pixelImage: Pixelimage ): ImageBuffer {
    var lh = pixelImage.height; 
    var lw = pixelImage.width;
    var buffer = new haxe.io.UInt8Array( lw*lh*4 );
    var p = 0;
    for( y in 0...lh ) {
        for( x in 0...lw ) {
            var col: Pixel32 = new Pixel32( pixelImage.getARGB( x, y ) );
            var a: Int = col.c0;
            var r: Int = col.c1;
            var g: Int = col.c2;
            var b: Int = col.c3;
            buffer.set( p, r );
            buffer.set( p + 1, g );
            buffer.set( p + 2, b );
            buffer.set( p + 3, a );
            p += 4;
        }
    }
    return new ImageBuffer( cast buffer, lw, lh, 32, PixelFormat.RGBA32 );
}

inline
function fromLimeImageBuffer( buffer: ImageBuffer ): Null<Pixelimage> {
    return if( buffer.format != PixelFormat.RGBA32 ){
        trace( 'requires buffer in RGBA format!!');
        return null;
    } else {
        var lh = buffer.height; 
        var lw = buffer.width;
        var pixelImage = new Pixelimage( lw, lh );
        pixelImage.transparent = true;
        var data: haxe.io.UInt8Array = cast buffer.data;
        var p = 0;
        for( y in 0...lh ) {
            for( x in 0...lw ) {
                var r = data.get( p );
                var g = data.get( p + 1 );
                var b = data.get( p + 2 );
                var a = data.get( p + 3 );
                p += 4;
                var col = Pixel32.fromChannels( a, r, g, b );
                pixelImage.setARGB( x, y, col );
            }
        }
        return pixelImage;
    }
}

inline
function toLimeImage( pixelImage: Pixelimage ): Image {
    return new Image( toLimeImageBuffer( pixelImage ) );
}

inline
function fromLimeImage( image: Image ): Pixelimage {
    return fromLimeImageBuffer( image.buffer );
}
#end