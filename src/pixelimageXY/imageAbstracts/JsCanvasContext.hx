package pixelimageXY.imageAbstracts;
import pixelimageXY.pixel.Pixel32;
@:forward
@:transient
abstract JsCanvasContext( Pixelimage ) from Pixelimage to Pixelimage {

    inline
    public function new( w: Int, h: Int ){
       this = new Pixelimage( w, h );
    }
    #if js
    @:access( pixelimageXY.Pixelimage )
    @:access( pixelimageXY.ImageStruct )
    public inline
    function to( ctx: js.html.CanvasRenderingContext2D, x: Int, y: Int, ?useAvaliableMask = true  ): Pixelimage {
        var here: Pixelimage = this;
        var base: ImageStruct = this;
        if( base.useMask && useAvaliableMask && base.mask != null ){
            var temp = new Pixelimage( here.width, here.height );
            for( i in 0...here.image.length ){
                var p0 =  new Pixel32( here.image[ i ] );
                var m1 =  new Pixel32( here.mask.image[ i ] );
                temp.image[ i ] = p0.maskPixel( m1 );
            }
            var data = new js.lib.Uint8ClampedArray( temp.view8().buffer );
            var imageData = new js.html.ImageData( data, here.width, here.height );
            ( base.useVirtualPos )? 
                ctx.putImageData( imageData, x - base.virtualX, y - base.virtualY ):
                ctx.putImageData( imageData, x, y );
        } else {
            var data = new js.lib.Uint8ClampedArray( here.view8().buffer );
            var imageData = new js.html.ImageData( data, here.width, here.height );
            ( base.useVirtualPos )? 
                ctx.putImageData( imageData, x - base.virtualX, y - base.virtualY ):
                ctx.putImageData( imageData, x, y);
        }
        return here;
    }
    @:access( pixelimageXY.Pixelimage )
    @:access( pixelimageXY.ImageStruct )
    public inline
    function from( ctx: js.html.CanvasRenderingContext2D, x: Int, y: Int ): Pixelimage {
        var here: Pixelimage = this;
        var base: ImageStruct = this;
        var imageData = ( base.useVirtualPos )?
            ctx.getImageData( x + base.virtualX, y + base.virtualY, here.width, here.height ):
            ctx.getImageData( x, y, here.width, here.height );
        var data = imageData.data;
        var temp = new js.lib.Uint32Array( data.buffer );
        for( i in 0...here.image.length ) here.image[ i ] = temp[ i ];
        return here;
        // if imageType == U32_ARR then could perhaps use a cast here for speed.
        // this.image = cast temp;
    }
    @:access( pixelimageXY.Pixelimage )
    @:access( pixelimageXY.ImageStruct )
    public static inline 
    function imageElementToPixels( img: js.html.ImageElement, transparent_ = false ): Pixelimage {
        var canvas        = js.Browser.document.createCanvasElement();
        canvas.width      = img.width;
        canvas.height     = img.height;
        canvas.getContext2d().drawImage( img, 0, 0, img.width, img.height );
        var pixelImage    = new Pixelimage( img.width, img.height );
        pixelImage.transparent = transparent_;
        pixelImage.jsCanvas.from( canvas.getContext2d(), 0, 0 );
        canvas            = null;
        return pixelImage; 
    }
    #end
}