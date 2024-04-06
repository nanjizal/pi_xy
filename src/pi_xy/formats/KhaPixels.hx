package pi_xy.formats;
#if kha
import kha.Image;
import kha.Color;
import kha.graphics1.Graphics;
import pi_xy.Pixelimage;
import pi_xy.pixel.Pixel32;
import haxe.io.UInt8Array;
import iterMagic.Img;

typedef KPixels = haxe.io.Bytes;
// module KhaImage

// untested!!
//@:dox(hide)
inline
function toKPixels( pixelImage: Pixelimage, ?kPixels: Null<KPixels> ): KPixels {
    var lh = pixelImage.height; 
    var lw = pixelImage.width;
    if( kPixels == null ) kPixels = haxe.io.Bytes.alloc( lw * lh * 4 );
    var w = 0;
    for( y in 0...lh ) {
        for( x in 0...lw ) {
            var i: Int = pixelImage.getARGB( x, y );
            var col: kha.Color = i;
            #if (kha_html5 || kha_krom)
            kPixels.set(w++,col.Rb); // r
            kPixels.set(w++,col.Gb); // g
            kPixels.set(w++,col.Bb); // b
            kPixels.set(w++,col.Ab); // a
            #else
            // ??
            kPixels.set(w++,col.Ab); // a
            kPixels.set(w++,col.Rb); // r
            kPixels.set(w++,col.Gb); // g
            kPixels.set(w++,col.Bb); // b
            #end
        }
    }
    return ( kPixels: KPixels );
}
inline
function fromKPixels( kPixels: KPixels, width: Int, height: Int ): Pixelimage {
    var lh = height; 
    var lw = width;
    var pixelImage = new Pixelimage( lw, lh );
    pixelImage.transparent = true;
    var p = 0;
    for( y in 0...lh ) {
        for( x in 0...lw ) {
            var a: Int;
            var r: Int;
            var g: Int;
            var b: Int;
            #if (kha_html5 || kha_krom)
            r = kPixels.get( p++ );
            g = kPixels.get( p++ );
            b = kPixels.get( p++ );
            a = kPixels.get( p++ );
            #else
            // ??
            a = kPixels.get( p++ ); 
            r = kPixels.get( p++ );
            g = kPixels.get( p++ ); 
            b = kPixels.get( p++ ); 
            #end
            var col = Pixel32.fromChannels( a, r, g, b );
            pixelImage.setARGB( x, y, col );
        }
    }
    return pixelImage;
}
inline
function toKhaImage( pixelImage: Pixelimage ): kha.Image {
    var bk = toKPixels( pixelImage );
    return kha.Image.fromBytes( bk, pixelImage.width, pixelImage.height );
}
inline
function fromKhaImage( khaImage: kha.Image, canvas: Null<kha.Image> = null, clear = true ): Pixelimage {
    if( canvas == null ){
        canvas = kha.Image.createRenderTarget( khaImage.width, khaImage.height );
    }
    canvas.g2.begin();
    if( clear ) canvas.g2.clear();
    canvas.g2.drawImage( khaImage, 0, 0 );
    canvas.g2.end();
    var kPixels = canvas.getPixels();
    return fromKPixels( kPixels, canvas.width, canvas.height );
}
inline
function toG1( x:Int, y: Int, pixelImage: Pixelimage, frameBuffer: kha.FrameBuffer ){
    var g1 = frameBuffer.g1;
    g1.start();
    var xx = 0;
    var maxX = x + p.width;
    var maxY = y + p.height;
    while( true ){
        g1.setPixel(x, y, p.image[ position( x++, y ) ] );
        if( x > maxX ){
            x = xx;
            y++;
        } 
        if( y > maxY ) break;
    }
    g1.end();
}

class KhaPixels {
    @:keep
    public static var toKhaImage_ = toKhaImage;
    @:keep
    public static var fromKhaImage_ = fromKhaImage;
    @:keep
    public static var toKPixels_ = toKPixels;
    @:keep
    public static var fromKPixels_ = fromKPixels;
    @:keep
    public static var toG1_ = toG1;
    public function new(){}
}

#end