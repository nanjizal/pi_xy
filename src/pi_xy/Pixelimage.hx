package pi_xy;

// import vision.ds.Image;
import haxe.io.UInt32Array;
import pi_xy.imageAbstracts.*;
import pi_xy.iter.BoundIterator;
import pi_xy.iter.IteratorRange;
import pi_xy.ImageStruct;
import pi_xy.pixel.Pixel32;
import pi_xy.pixel.Pixel28;
import pi_xy.algo.GeomPix;
import pi_xy.pixel.PixelChannel;
import iterMagic.IteratorRangeXY;
import pi_xy.algo.HitTri;
import pi_xy.algo.HitQuad;
import pi_xy.algo.HitTriArray;
/*
    import pi_xy.imageAbstracts.*;
    import pi_xy.imageData.*;
    import pi_xy.imageData.ByteImage;
    import pi_xy.imageData.ImageDefinition;
 */
import iterMagic.Img; // ImageType

typedef ImageType = iterMagic.Img.ImageType;

@:transient
abstract Pixelimage(ImageStruct) from ImageStruct to ImageStruct {
    /**
        defines the data type used for storing images

        BYTES_INT  - Bytes 
        ARRAY_INT  - Array<Int>
        U32_ARR    - UInt32Array
        VECTOR_INT - Vector<Int>

        saves to a static variable on ImageStruct 
        if not set it defaults to U32_ARR
    **/
    public var defaultType(get, set):ImageType;

    public inline function get_defaultType():ImageType {
        return ImageStruct.defaultType;
    }

    public inline function set_defaultType(v:ImageType):ImageType {
        ImageStruct.defaultType = v;
        return v;
    }

    public inline function new(width:Int, height:Int, imageType:Null<ImageType> = null) {
        this = new ImageStruct();
        if (imageType == null)
            imageType = ImageStruct.defaultType;
        this.image = cast ImgMulti.create(width, height, imageType);
        this.width = width;
        this.height = height;
        this.imageType = imageType;
    }

    /**
        provides the internal image structure used
        unfortunately this is Dynamic but usually resolved at compile 
        the dynamic nature makes it not viable to set without compiler complaints
        but direct setting is a bad idea.
    **/
    public var image(get, never):ImgMulti<Dynamic>;

    inline function get_image():ImgMulti<Dynamic>
        return this.image;

    /*
        inline function set_image( img: ImgMulti<Dynamic> ): ImgMulti<Dynamic>{
            this.image     = img;
            this.width     = img.width;
            this.height    = img.height;
            this.imageType = img.imageType;
        }
     */
    /**
        provides the ImageType being used
    **/
    public inline function imageTypeString() {
        return this.image.check();
    }

    /**
        provides the image width
    **/
    public var width(get, never):Int;

    inline function get_width():Int
        return this.width;

    /**
        provides the image height
    **/
    public var height(get, never):Int;

    inline function get_height():Int
        return this.height;

    /**
        setting relative position provide a drawing offset, it must be positive
        update is no currentl use yet
    **/
    public function setRelativePosition(x:Int, y:Int, ?update:Bool = false) {
        this.useVirtualPos = true;
        if (x < 0)
            x = 0;
        if (y < 0)
            y = 0;
        this.virtualX = x;
        this.virtualY = y;
        // TODO: update to implement
    }

    /**
        transparent to false will allow setARGB to overwrite pixels, true will alpha blend them when new pixel is semi transparent
    **/
    public var transparent(get, set):Bool;

    inline function get_transparent():Bool
        return this.transparent;

    inline function set_transparent(v:Bool):Bool {
        this.transparent = v;
        return v;
    }

    /**
        used as a mask
    **/
    public var mask(get, set):Pixelimage;

    inline function get_mask():Pixelimage
        return this.mask;

    inline function set_mask(v:Pixelimage):Pixelimage {
        this.useMask = true;
        this.mask = v;
        return v;
    }

    /**
        if an image has a mask
    **/
    public var hasMask(get, set):Bool;

    inline function set_hasMask(v:Bool):Bool {
        if (this.mask == null && v == true) {
            this.mask = new Pixelimage(this.width, this.height);
            this.mask.transparent = false;
            // set mask intially to let all images through
            this.mask.simpleRect(0, 0, this.width, this.height, 0x00000000);
        }
        this.useMask = v;
        return v;
    }

    inline function get_hasMask():Bool
        return this.useMask;

    /**
        provides a RectangleWindow defining the current image from 0, 0.
        setting it can resize the window, currently x and y are assumed 0.
    **/
    var rectWindow(get, set):RectangleWindow;

    inline function get_rectWindow():RectangleWindow {
        return {
            x: 0,
            y: 0,
            width: width,
            height: height
        };
    }

    @:access(pixelImage.ImageStruct)
    inline function set_rectWindow(r:RectangleWindow):RectangleWindow {
        if (r.x != 0.)
            throw 'rectangle window must have x = 0';
        if (r.y != 0.)
            throw 'rectangle window must have y = 0';
        if (r.width == width && r.height == height) {
            // do nothing!
        } else {
            var sx = Std.int(r.width / width);
            var sy = Std.int(r.height / height);
            var pixelImage = transform.scaleXY(sx, sy, transparent, false);
            this.image = pixelImage.image;
            this.width = pixelImage.width;
            this.height = pixelImage.height;
            if (mask != null)
                mask.rectWindow = r;
        }
        return r;
    }

    /**
        this provides a location for a UIn8 access of a color channel
    **/
    inline function pos4(x:Int, y:Int, ?off:Int = 0):Int
        return Std.int(position(x, y) * 4) + off;

    /**
        provides the location of the pixel after considering any relative internal x,y offset
    **/
    inline public function position(x:Int, y:Int) {
        return (this.useVirtualPos) ? /* allows off set position when drawing */ Std.int((y - this.virtualY) * this.width +
            x - this.virtualX) : Std.int(y * this.width
            + x);
    }

    /**
        Provides a view for single color channel access, not usually used
    **/
    #if js
    inline function view8():js.lib.Uint8Array {
        var temp = new haxe.io.UInt32Array(Std.int(this.width * this.height));
        for (i in 0...this.image.length)
            temp[i] = this.image[i];

        // var dataimg: js.lib.Uint32Array = cast this.image;
        var dataimg:js.lib.Uint32Array = cast temp;
        return new js.lib.Uint8Array(dataimg.buffer); // TODO make more generic
    }
    #elseif /*
        class Test {
          static function main() {
        var d32 = new haxe.io.UInt32Array( 1*2 );
        d32.set( 0, 0xFF00FC00 );
        d32.set( 1, 0xFF00FFFB );
        var d8 = haxe.io.UInt8Array.fromBytes( d32.view.buffer );
        for( i in 0...d8.length ){
                trace( '#' + StringTools.hex( d8[i], 2 ) ); // BGRA
        }
        Test.hx:8: #00
        Test.hx:8: #FC
        Test.hx:8: #00
        Test.hx:8: #FF
        Test.hx:8: #FB
        Test.hx:8: #FF
        Test.hx:8: #00
        Test.hx:8: #FF
          }
    }*/
    inline function view8():haxe.io.UInt8Array {
        var temp = new haxe.io.UInt32Array(Std.int(this.width * this.height));
        for (i in 0...this.image.length) {
            temp[i] = this.image[i];
        }
        var dataimg:haxe.io.Uint32Array = cast temp;

        return UInt8Array.fromBytes(this.image.view.buffer); // reverses order
    }
    #end

    /**
        setPixel is equivalent to setARGB, setting the colour of a pixel
        internal color order may differ.
    **/
    inline public function setPixel(x:Int, y:Int, color:Int):Int {
        return setARGB(x, y, color);
    }

    /**
        sets the pixel to 0 without any blend or mask applied
    **/
    inline public function zeroPixel(x:Int, y:Int) {
        this.image[position(x, y)] = 0;
    }

    /**
        The main way is set the pixel color at x, y
        applies an alpha blend if pixel is semi-transparent and if the pixelimage is transparent true
    **/
    inline public function setARGB(x:Int, y:Int, color:Int):Int {
        var c = new Pixel32(color);
        if (c.isTransparent() && this.transparent) {
            colorBlend(color, position(x, y));
        } else {
            this.image[position(x, y)] = c.transferColor();
        }
        return color;
    }

    inline public function getPixel(x:Int, y:Int):Int {
        return getARGB(x, y);
    }

    /**
        returns the current pixel colour, since canvas context is ABGR on little endian this will correct
        from the internal value
    **/
    inline public function getARGB(x:Int, y:Int):Pixel32 {
        var c:Pixel32 = cast this.image[position(x, y)];
        return c.transferColor();
    }

    /**
        allows setting all 4 colour channels with a location
        @:see position   to obtain the location
    **/
    public inline function set_argbPixel(a:Int, r:Int, g:Int, b:Int, location:Int) {
        (this.transparent && a < 0xFE) ? channelBlend(a, r, g, b, location) : argbToPixel(a, r, g, b, location);
    }

    /**
        used more internally to set colours from algorithms does not apply alpha blend
    **/
    public inline function argbToPixel(a:Int, r:Int, g:Int, b:Int, location:Int) {
        this.image[location] = (this.isLittle) ? Pixel32.fromChannels(a, b, g, r) : Pixel32.fromChannels(a, r, g, b);
    }

    /**
        used internally is set colours from algorithms only applies alpha blend
        @see setARGB
    **/
    public inline function channelBlend(a:PixelChannel, r:PixelChannel, g:PixelChannel, b:PixelChannel, location:Int) {
        var old = (new Pixel32(this.image[location])).transferColor();
        var blended = old + Pixel32.fromChannels(a, r, g, b);
        this.image[location] = blended.transferColor();
    }

    /**
        used internally to set colours from algorithms only applies 
        @see setARGB
    **/
    public inline function colorBlend(color:Pixel32, location:Int) {
        var blended = (new Pixel32(this.image[location])).transferColor() + color;
        this.image[location] = blended.transferColor();
    }

    /**
        mainly used for color debugging provides getARGB in hex string format
    **/
    inline public function getPixelString(x:Int, y:Int):String
        return (new Pixel32(getARGB(x, y))).stringHash();

    /**
        provides a simple filled Rectangle
    **/
    inline public function simpleRect(x:Float, y:Float, w:Float, h:Float, color:Int) {
        var range:IteratorRangeXY = {
            x: Std.int(x),
            y: Std.int(y),
            w: Std.int(w),
            h: Std.int(h)
        };
        for (i in range)
            setARGB(range.x, range.y, color);
        /*
            var p = Std.int( x );
            var xx = p;
            var q = Std.int( y );
            var maxX = Std.int( x + w );
            var maxY = Std.int( y + h );
            while( true ){
                setARGB( p++, q, color );
                if( p > maxX ){
                    p = xx;
                    q++;
                } 
                if( q > maxY ) break;
            }
         */
    }

    /**
        clears a rectangular section of the image ( setting to 0 )
    **/
    inline public function clearRectWindow(rectangle:RectangleWindow) {
        clearRect(rectangle.x, rectangle.y, rectangle.width, rectangle.height);
    }

    /**
        clears a rectangular section of the image.
    **/
    inline public function clearRect(x:Float, y:Float, w:Float, h:Float) {
        var range:IteratorRangeXY = {
            x: Std.int(x),
            y: Std.int(y),
            w: Std.int(w),
            h: Std.int(h)
        };
        for (i in range)
            this.image[position(range.x, range.y)] = 0;

        /*
            var p = Std.int( x );
            var xx = p;
            var q = Std.int( y );
            var maxX = Std.int( x + w );
            var maxY = Std.int( y + h );
            while( true ){
                this.image[ position( p++, q ) ] = 0;
                if( p > maxX ){
                    p = xx;
                    q++;
                } 
                if( q > maxY ) break;
            }
         */
    }

    /**
        used to draw one pixelimage on part of another, essentially it is a copy
        black transparent pixels are ignored.
        this is used also internally so that shapes can be composed with transparent false 
        useful for adding over and taking away parts of shapes before drawing on the main Pixelimage.
    **/
    inline public function putPixelImage(pixelImage:Pixelimage, x:Int, y:Int, ?useAvaliableMask = true, forceClear:Bool = false) {
        // ignore useVirtualPos for now.
        // ignore could use one loop for now.
        for (dy in 0...pixelImage.height) {
            for (dx in 0...pixelImage.width) {
                var col = pixelImage.getARGB(dx, dy);
                if (pixelImage.hasMask && useAvaliableMask && pixelImage.mask != null) {
                    var maskPixel = new Pixel32(pixelImage.mask.getARGB(dx, dy));
                    col = new Pixel32(col).maskPixel(maskPixel);
                }
                if (col != 0) {
                    setARGB(x + dx, y + dy, col);
                } else {
                    if (forceClear)
                        this.image[position(x + dx, y + dy)] = 0;
                }
            }
        }
    }

    inline public function putPixelImageRect(pixelImage:Pixelimage, x:Int, y:Int, rectLeft:Int, rectTop:Int, rectRight:Int, rectBottom:Int,
            ?useAvaliableMask = true, forceClear:Bool = false) {
        for (dy in rectTop...rectBottom) {
            for (dx in rectLeft...rectRight) {
                var col = pixelImage.getARGB(dx, dy);
                if (pixelImage.hasMask && useAvaliableMask && pixelImage.mask != null) {
                    var maskPixel = new Pixel32(pixelImage.mask.getARGB(dx, dy));
                    col = new Pixel32(col).maskPixel(maskPixel);
                }
                if (col != 0) {
                    setARGB(x + dx - rectLeft, y + dy - rectTop, col);
                } else {
                    if (forceClear)
                        this.image[position(x + dx - rectLeft, y + dy - rectTop)] = 0;
                }
            }
        }
    }

    inline public function transferClone():Pixelimage {
        var out = new Pixelimage(width, height);
        for (i in 0...image.length) {
            out.image[i] = (new Pixel32(image[i])).flip13();
        }
        return out;
    }

    inline public function transferIn(p:Pixelimage) {
        for (i in 0...p.image.length) {
            image[i] = (new Pixel32(p.image[i])).flip13();
        }
    }

    #if js
    inline public function getBytes() {
        return haxe.io.Bytes.ofData(view8().buffer);
    }
    #else
    @:access(iterMagic.Img.BytesImg)
    inline public function getBytes() {
        var imageBytes = ImgMulti.bytes(this.width, this.height);
        // transfer..
        var result:ByteAccessor = cast ImgMulti.fromTo(this.image, imageBytes);
        @:access(iterMagic.Img.BytesImg.data)
        var b:haxe.io.Bytes = result.data;
        return b;
        // return this.image.view.buffer;// not working..
    }
    #end
    @:access(iterMagic.Img.BytesImg)
    inline public function fromBytes( bytes: haxe.io.Bytes ){
        var imageBytes = ImgMulti.bytes(this.width, this.height);
        var accessorBytes: ByteAccessor = cast imageBytes;
        accessorBytes.data = bytes;
        for (i in 0...imageBytes.length) {
            trace( i );
            this.image[i] = (new Pixel32(imageBytes[i]));//.flip13();
        }
        return this;
    }
    /*
        abstract helpers    
     */
    public var raw(get, never):RawImage;

    inline function get_raw():RawImage {
        return (abstract:RawImage);
    }

    public var transform(get, never):TransformImage;

    inline function get_transform():TransformImage {
        return (abstract:TransformImage);
    }

    public var fillShape(get, never):FillShape;

    inline function get_fillShape():FillShape {
        return (abstract:FillShape);
    }

    public var softShape(get, never):SoftShape;

    inline function get_softShape():SoftShape {
        return (abstract:SoftShape);
    }

    public var lineShape(get, never):LineShape;

    inline function get_lineShape():LineShape {
        return (abstract:LineShape);
    }

    public var tileShape(get, never):TileShape;

    inline function get_tileShape():TileShape {
        return (abstract:TileShape);
    }

    public var imageShape(get, never):ImageShape;

    inline function get_imageShape():ImageShape {
        return ( abstract: ImageShape );
    }

    public var gradientShape( get, never ): GradientShape;

    inline function get_gradientShape(): GradientShape {
        return ( abstract: GradientShape );
    }

    public var pattern( get, never ): PatternShape;

    inline function get_pattern(): PatternShape {
        return ( abstract: PatternShape );
    }

    public var convolution( get, never ): Convolution;

    inline function get_convolution(): Convolution {
        return ( abstract: Convolution );
    }

    public var colorform( get, never ): ColorformImage;

    inline function get_colorform(): ColorformImage {
        return ( abstract: ColorformImage );
    }

    public var rectanglePad( get, never ): RectanglePad;

    inline function get_rectanglePad(): RectanglePad {
        return ( abstract: RectanglePad );
    }

    #if js
    public var jsCanvas( get, never ):JsCanvasContext;

    inline function get_jsCanvas(): JsCanvasContext {
        return ( abstract: JsCanvasContext );
    }
    #else
    public var png( get, never ): PNG;

    inline function get_png():PNG {
        return ( abstract: PNG );
    }
    #end
    #if kha
    public var khaImage( get, never ): KhaImage;

    inline function get_khaImage():KhaImage {
        return ( abstract: KhaImage );
    }
    #end
    /*
        inline
        public function fromBytes( bytes: haxe.io.Bytes, pos ){
            this.image = haxe.io.UInt32Array.fromBytes( bytes, pos );
        }

        inline
        public function fromBytesCameleon( bytes: pi_xy.formats.BytesCameleon ){
            fromBytes( ( cast bytes: haxe.io.Bytes ), 0 );
        }
     */
    // maybe remove
    /*
        inline public
        function getRGBString( x: Int, y: Int ): String
            return ( new Pixel28( getIrgb( x, y ) ) ).stringHash();
        inline
        public function setIalpha( x: Int, y: Int, alpha: Int )
            view8()[ pos4( x, y, 0 ) ] = alpha;    
        inline
        public function getIalpha( x: Int, y: Int ): Int
            return view8()[ pos4( x, y, 0 )];
        inline
        public function setIrgb( x: Int, y: Int, rgb: Int ){
            var a = getIalpha( x, y );
            // abgr
            this.image[ position( x, y ) ] = ( a << 24 | new Pixel32( rgb ) ).transferColor();   
        }
        inline
        public function getIrgb( x: Int, y: Int ): Int {
            var c = this.image[ position( x, y ) ];
            return new Pixel32( c ).rgbFromCanvas(); // rgb
        }
     */
}
interface ByteAccessor {
    var data: haxe.io.Bytes;
}
// references
// http://totologic.blogspot.com/2014/01/accurate-point-in-triangle-test.html
// https://codeplea.com/triangular-interpolation *
// https://gamedev.stackexchange.com/questions/23743/whats-the-most-efficient-way-to-find-barycentric-coordinates
// https://stackoverflow.com/questions/39213661/canvas-using-uint32array-wrong-colors-are-being-rendered
// https://stackoverflow.com/questions/26513712/algorithm-for-coloring-a-triangle-by-vertex-color
// https://iquilezles.org/articles/ibilinear/ - todo add MIT details if quad runs.
// https://www.shadertoy.com/view/lsBSDm
// https://math.stackexchange.com/questions/4132060/compute-number-of-regular-polgy-sides-to-approximate-circle-to-defined-precision
// //http://paulbourke.net/miscellaneous/composite/
