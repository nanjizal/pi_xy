package pi_xy.formats;

/*
import pi_xy.Pixelimage;
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

// kha notes.
well pixelimage has no GPU acceleration so it is probably better to mix with cornerContour and look to add TriGML to that if you really need speed. 
But it should be viable currently with some changes.. will have to modify 'view8' method ( used js.html.UInt8 for simplicity and easy view ) and a few other details for c++, but essentially.
```Haxe
var p = new PixelShape(1024, 1024 );
p.transparent = true;
var arcPie = 
    '<ArcShape 
        left="100"  top="100" 
        width="500" height="480" 
        strokeColor="0xFFFF0000" strokeWidth="12" 
        fill="0xFF00FF00" 
        startAngle="0" sweepAngle="240"
        arcType="pie">
    </ArcShape>';
 TriangleGML.withString( p, arcPie, 10, 10 );
Image.fromBytes( p.byteImage.getBytes(), p.width, p.height, TextureFormat.RGBA32 );
var g2 = framebuffer.g2;
g2.begin();
g2.clear(Color.fromValue(0xff000000));
g2.drawImage( image, 0, 0 );
g2.end();
```
I don't know much about g1 it is for lower end hardware I think, you would just loop though the pixelimage, maybe the internal RGBA format currently would be ok so direct access rather than getARGB, may need private access to image allowed.
```Haxe
var g1 = frameBuffer.g1;
g1.begin();
// g1 clear??
var p = new PixelShape(1024, 1024 );
p.transparent = true;
var arcPie = 
    '<ArcShape 
        left="100"  top="100" 
        width="500" height="480" 
        strokeColor="0xFFFF0000" strokeWidth="12" 
        fill="0xFF00FF00" 
        startAngle="0" sweepAngle="240"
        arcType="pie">
    </ArcShape>';
TriangleGML.withString( p, arcPie, 10, 10 );
var x = 0;
var y = 0;
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
```

wx split
https://github.com/haxeui/hxWidgets/blob/master/src/hx/widgets/Image.hx#L154-L162

        var rawPointerData = imageRef.ptr.getData();
        var data = Pointer.fromRaw(rawPointerData);
        var rawPointerAlpha = imageRef.ptr.getAlpha();
        var alpha = null;
        if (rawPointerAlpha != null) {
            alpha = Pointer.fromRaw(rawPointerAlpha);
        }
        var wrapper = new ImageData(this, data, alpha);
        return wrapper;
*/
