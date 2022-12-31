package pixelimage.formats;

/*
import pixelimage.Pixelimage;
import lime.graphics.ImageBuffer;
import lime.graphics.Image;
import lime.graphics.PixelFormat;
import openfl.graphics.BitmapData;
import flixel.graphics.FlxGraphic;
*/
@:dox(hide)
// hidden
/*
function toLimeImageBuffer( pixelimage: Pixelimage ): Image {//, premultiplied: Bool ){
    // may need to tweak the output order..
    var imgBuffer: ImageBuffer = new ImageBuffer( pixelimage.view8, pixelimage.width, pixelimage.height, 32, PixelFormat.RGBA32 );
    imgBuffer.transparent = pixelimage.transparent;
    return new Image( imgBuffer, 0, 0, pixelimage.width, pixelimage.height );
}


function toOpenFLbitmapData( pixelimage: Pixelimage ):BitmapData {
    return BitmapData.fromImage( toLimeImageBuffer( pixelimage ), pixelimage.transparent );
}


function toOpenFLbitmap( pixelimage: Pixelimage, pixelSnapping: PixelSnapping = null, smoothing: Bool = false ){
    return new Bitmap( toOpenFLbitmapData( pixelimage ), pixelSnapping, smoothing );
}


function toFlxGraphics( pixelimage: Pixelimage, Unique:Bool = false, ?Key:String, Cache:Bool = true ){
    FlxGraphic.fromBitmapData( toOpenFLbitmapData( pixelimage ), Unique, Key, Cache );
}
*/
