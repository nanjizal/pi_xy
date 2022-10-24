package pixelimage;

import htmlHelper.canvas.CanvasSetup;
import htmlHelper.canvas.Surface;
import pixelimage.Pixelimage;
import vision.Vision;
import vision.ds.Kernal2D;
import pixelimage.aVision.ImageBytes;

function main() new DemoUse();
class DemoUse {

    public var canvasSetup = new CanvasSetup();
    
    public function new(){
        trace( 'Pixelimage example on Canvas' );
        var g   = canvasSetup.surface;
        var p = new Pixelshape( 1024*4, 768*4 );
        p.transparent = true;
        p.setRelativePosition( 0, 0 );
        drawGrid( p );
        drawAlphaTriangle( p );
        drawRadials( p );
        drawGridMask( ( p: Pixelimage ) );
        //simonSays( p );
        p.fillGrad4RoundRect( 1340, 280, 150, 280, 0xff8a7676, 0xff757567, 0xff545951, 0xff51515d );
        
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