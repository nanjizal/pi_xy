package pi_xy.application;

import htmlHelper.canvas.CanvasSetup;
import htmlHelper.canvas.Surface;
import htmlHelper.tools.ImageLoader;
import pi_xy.textureImage.TestTiger;
import pi_xy.imageAbstracts.*;
import pi_xy.ImageStruct;
import js.html.ImageElement;
import pi_xy.imageAbstracts.JsCanvasContext;
import iterMagic.Img;

function main() {
    new ConvolutionApp();
}

class ConvolutionApp {
    // htmlHelper requirements
    var canvasSetup = new CanvasSetup();
    var surface:   Surface; 
    
    var imageLoader: ImageLoader;
    
    // main pixelimage instance
    var pixelimage: Pixelimage;
    
    public
    function new(){
        imageLoader = new ImageLoader( [], setup );
        imageLoader.loadEncoded( [ testTiger() ], [ 'tiger' ] );
    }
    function setup(){
        // find loaded images
        var images: haxe.ds.StringMap<ImageElement> = imageLoader.images;
        surface = canvasSetup.surface;
        /*
        BYTES_INT;
        ARRAY_INT;
        U32_ARR;
        VECTOR_INT;
        STACK_INT;
        */
        ImageStruct.defaultType = U32_ARR;
        // create the buffered main image
        pixelimage = new Pixelimage( 1024*4, 768*4 );
        pixelimage.transparent = true;
        
        // get tiger image
        var tiger = images.get( 'tiger' );
        // get tiger pixels
        var imgTiger = JsCanvasContext.imageElementToPixels( tiger );
        // increase size
        var pix0 = new Pixelimage( imgTiger.width*5, imgTiger.height*5 );
        pix0.imageShape.image( imgTiger, 0, 0, imgTiger.width*5, imgTiger.height*5 );
        // draw tiger on buffered image
        pixelimage.putPixelImage( pix0, 100, 100 );
        
        // box blur
        var blured = pix0.convolution.boxBlur0_3x3();
        
        var emboss = pix0.convolution.emboss0_3x3();
        var iterations = 10;
        var bluredN: Pixelimage = new Pixelimage(1,1);
        for( i in 0...iterations ){
            bluredN = blured.convolution.boxBlur0_3x3();
            blured = null;
            blured = bluredN;
        }
        // draw blured on buffered image
        var gap = 20;
        
        pixelimage.putPixelImage( blured, 100 + pix0.width + gap, 100 );
        pixelimage.putPixelImage( emboss, 100 + 2*(pix0.width + gap), 100 );
        var grey = pix0.colorform.greyScale();
        pixelimage.putPixelImage( grey, 100, 100 + pix0.height + gap );
        var rose = pix0.colorform.towardsColor( 0xFFFF0000, 0.8 );
        pixelimage.putPixelImage( rose, 100 + pix0.width + gap, 100 + pix0.height + gap );
        // draw on canvas context
        pixelimage.jsCanvas.to( surface.me, 0, 0 );
    }
}