package pixelimage;

import htmlHelper.canvas.CanvasSetup;
import htmlHelper.canvas.Surface;
import pixelimage.Pixelimage;
import js.html.ImageElement;
import vision.Vision;
import vision.ds.Kernal2D;
import pixelimage.formats.VisionImage;
import pixelimage.triangleGML.*;
import pixelimage.triangleGML.pattern.*;
import pixelimage.triangleGML.coreShape.TriangleGML;
import pixelimage.triangleGML.coreShape.XMLshapeSamples;
import htmlHelper.tools.ImageLoader;
import pixelimage.fontImage.TestLem;
import pixelimage.fontImage.OneDfont;
import pixelimage.textureImage.TestTiger;
import pixelimage.textureImage.TestNineSlice;
import pixelimage.algo.GeomPix;


function main() new DemoUse();
class DemoUse {

    public var canvasSetup = new CanvasSetup();
    var imageLoader: ImageLoader;
    var img: ImageElement;
    // var tiger: ImageElement;
    var nineSliceImg: ImageElement;
    var p: Pixelimage;
    var g: Surface;
    public function new(){
        trace( 'Pixelimage example on Canvas' );
        g   = canvasSetup.surface;
        p = new Pixelshape( 1024*4, 768*4 );
        p.transparent = true;
        p.setRelativePosition( 0, 0 );
        imageLoader = new ImageLoader( [], setup );
        imageLoader.loadEncoded( [ lemBlue(), lemRed(), lemYellow(), lemCyan(), lemPurple(), lemOrange(), lemGreen(), testTiger(), testNineSliceButton() ]
                                , [ 'lemBlue', 'lemRed', 'lemYellow', 'lemCyan', 'lemPurple', 'lemOrange', 'lemGreen', 'testTiger', 'nineSliceButton' ] );
	}

	private function setup():Void {
        trace( 'loaded in base64 1 D font images lemColors ' );
	    var images: haxe.ds.StringMap<ImageElement> = imageLoader.images;
         nineSliceImg = images.get( 'nineSliceButton' );
         var nineSliceTex = Pixelimage.imageElementToPixels( nineSliceImg );
         var win = new RectangleWindow( 0, 0, nineSliceTex.width, nineSliceTex.height );
         // see https://github.com/TrilateralX/HyperKitGLsamples/blob/main/src/hyperkitGLsamples/nineSlice/Main.hx#L119
         // 1024, 1024, 200, 200, 600, 600
         //var temp = new Pixelimage( 400, 400 );
         p.imgNineSlice( nineSliceTex, win, 400, 400, 512, 512, 100, 100, 300, 300, 512, 512, 150, 150, 250, 250 );
         /*
         var theta = -25*Math.PI/180;
         win = new RectangleWindow( 0, 0, 512, 512 );
         p.imgRect( temp, win, 400, 400, 512, 512, theta, 0, 0 );
      /*
        tiger = images.get( 'testTiger' );
        var pixelImageTex = Pixelimage.imageElementToPixels( tiger );
        //p.tileTri( 500., 0., 1000., 0., 500., 500., pixelImageTex );
        var win = new RectangleWindow( 0, 0, pixelImageTex.width, pixelImageTex.height );
        var theta = -25*Math.PI/180;
        p.imgRect( pixelImageTex, win, 400, 400, 500, 500, theta, 0, 0, 40, 2, 2 );
     */
        /*
        img   = images.get( 'lemRed' );
        var canvasFont        = js.Browser.document.createCanvasElement();
        canvasFont.width      = img.width;
        canvasFont.height     = img.height;
        canvasFont.getContext2d().drawImage( img, 0, 0, img.width, img.height );
        var piFontSrc = new Pixelimage( img.width, img.height );
        piFontSrc.transparent = false;
        piFontSrc.drawFromContext( canvasFont.getContext2d(), 0, 0 );
        var piFont = new OneDfont( piFontSrc );
        var fy = function( x: Int ): Int {
          return Std.int( 4*Math.sin( x/10 ) );
        }
        var charPos = piFont.createPlacement( 'Hello pixelimage' );
        var helloPixel = piFont.drawCurveY( charPos, fy );
        //var helloPixel = piFont.drawString( 'Hello pixelimage!' ); 
        var scaled = helloPixel.scaleUpInt(10,10);
        p.putPixelImage( scaled, 100, 100 );
        */
          //var count = 0;
        /*
        var px = 400.;
        var py = 400.;
        var qx = px;
        var qy = py;
        var len = 200.;
        var strokeWidth = 10;
        var strokeColor = 0xFFff0000;
        for( i in 0...36 ){
            var theta = 10*i*Math.PI/180;
            qx = len*Math.cos( theta ) + px;
            qy = len*Math.sin( theta ) + py;
            p.fillLine( qx, qy, px, py, strokeWidth, strokeColor );
        }
        */
        
        //for( aShape in shapeTestArr() ){
            //if( count > 3 ) break;
            // var aShape = shapeTestArr()[0];
            /*
            var data = aShape.split('\n');
            for( i in 0...data.length ) data[ i ] = StringTools.trim(data[ i ]);
            var str = data.join(' ');
            TriangleGML.withString( p, str );*/
            // TriangleGML.withString( p, aShape );
            // count++;
        //}
        
        /*
        var str = circleTest;
        trace( 'circleTest ' + str );
        //TriangleGML.withString( p, circleTest );
        trace( 'test2');
        var str =  lineShapeTest;
        //TriangleGML.withString( p, str );
        //TriangleGML.withString( p, ellipseTest );
        var str = triangleGradientTest;
        trace( str );
        TriangleGML.withString( p, str );
        */
        /*
        drawGrid( p );
        drawAlphaTriangle( p );
        drawRadials( p );
        drawGridMask( ( p: Pixelimage ) );
        //simonSays( p );
        p.fillGrad4RoundRect( 1340, 280, 150, 280, 0xff8a7676, 0xff757567, 0xff545951, 0xff51515d );
        */


        // applying Vision test 
        
        // p == Pixelshape or Pixelimage
        // transfer flips channel 1 and 3 around as I store ABGR for canvas.
        // this is lightly a bit heavy as 1024*4 x 768*4 pixelimage at the moment.
        //
        /*
        var img = new vision.ds.Image( p.width, p.height );
        //p.transferClone()
        injectBytesInImage( p.getBytes(), img );
        Vision.grayscale(img);
        //Vision.convolve( img, BoxBlur);
        //Vision.convolve(img, UnsharpMasking);
        var pTemp = new Pixelimage( p.width, p.height );
        //p.transferIn( pTemp );
        pTemp.fromBytes( extractBytesFromImage( img ), 0 );
        pTemp.drawToContext( g.me, 0, 0 );
*/
        p.drawToContext( g.me, 0, 0 );
        //p.drawFromContext( g.me, 0, 0 );
        //trace( p.getPixelString( 101, 101) );
     }

     public function drawRadials( p: Pixelshape ){
          p.fillRadialRectangle( 150, 150, 500, 300, 0xFFc0FF00, 0xFF00c0FF, -0.25, -0.25 );
          p.lineRadialEllipseTri( 600, 650, 290, 200, 100, 100,0xffe100ff, 0xff3a20af, -0.75, -0.75, Math.PI/6 );
     }

     public function simonSays( p: Pixelshape ){
          p.testFillSimonSaysQuadrant( 300, 300, 100 );
     }

     public function drawGridMask( p: Pixelimage ){
          p.hasMask = true;
          var pimage =  p.mask;
          var pixelShape: Pixelshape = cast pimage;
          pixelShape.lineGrid( 150, 150, 1024*3, 768*3, 100, 2.5, 0x0cFFFFFF );
     }

     public function drawGrid( p: Pixelshape ){
          p.lineGrid( 100, 100, 1024*3, 768*3, 100, 2.5, 0xfF003300 );
     }

     public function drawAlphaTriangle( p: Pixelshape ){
        var a = [ 0x33F000c0
                , 0x99F000c0
                , 0xaaF000c0
                , 0xccF000c0
                , 0xeeF000c0];
        var gap = 200;
        for( i in 0...5 ){
            p.fillTri( 100 + i*gap, 900
                     , 300 + i*gap, 1200
                     , 500 + i*gap, 1000
                     , a[i] );
        }
   }
}