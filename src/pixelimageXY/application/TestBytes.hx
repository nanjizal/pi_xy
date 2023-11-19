package pixelimageXY.application;

import htmlHelper.canvas.CanvasSetup;
import htmlHelper.canvas.Surface;
import pixelimageXY.Pixelimage;

function main() {
    new TestBytes();
}

class TestBytes {
    // htmlHelper requirements
    var canvasSetup = new CanvasSetup();
    var surface:   Surface; 
    
    // main pixelimage instance
    var pixelimage: Pixelimage;
    
    public
    function new(){
        surface = canvasSetup.surface;
        // create the buffered main image
        pixelimage = new Pixelimage( 1024*4, 768*4 );
        pixelimage.defaultType = VECTOR_INT;
        pixelimage.transparent = true;
        var Violet      = 0xFF9400D3;
        var Indigo      = 0xFF4b0082;
        var Blue        = 0xFF0000FF;
        var Green       = 0xFF00ff00;
        var Yellow      = 0xFFFFFF00;
        var Orange      = 0xFFFF7F00;
        var Red         = 0xFFFF0000;
        var scale       = 12;
        var pixelTest = new Pixelimage( 70*scale, 70*scale );
        var colors = [ Violet, Indigo, Blue, Green, Yellow, Orange, Red ];
        var vertColor = colors[0]; 
        for( x in 0...70*scale ){
            vertColor = colors[ Math.floor( (x/scale) / 10 ) ];
            for( y in 0...70*scale ) pixelTest.setARGB( x, y, vertColor );
        }
        pixelimage.putPixelImage( pixelTest, 100, 100 );
        pixelimage.jsCanvas.to( surface.me, 0, 0 );
    }
}