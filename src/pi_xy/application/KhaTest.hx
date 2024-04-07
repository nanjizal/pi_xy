package pi_xy.application;
import kha.Assets;
import kha.Framebuffer;
import kha.Scheduler;
import kha.System;
import pi_xy.imageAbstracts.KhaImage;
import pi_xy.application.KhaTest;
import pi_xy.Pixelimage;
import pi_xy.pixel.Pixel32;
import haxe.io.UInt8Array;
import iterMagic.Img;
class KhaTest {
    var image: kha.Image;
    var pixelImage: pi_xy.Pixelimage;
    public inline function new(){
        pixelImage = new Pixelimage( 800, 600 );
        pixelImage.transparent = true;
        pixelImage.simpleRect( 0, 0, pixelImage.width, pixelImage.height, 0xffc9c3c3 );

        pixelImage.transparent = true;
        var Violet      = 0xFF9400D3;
        var Indigo      = 0xFF4b0082;
        var Blue        = 0xFF0000FF;
        var Green       = 0xFF00ff00;
        var Yellow      = 0xFFFFFF00;
        var Orange      = 0xFFFF7F00;
        var Red         = 0xFFFF0000;
        var scale       = 10;
        var pixelTest = new pi_xy.Pixelimage( 80*scale, 80*scale );
        pixelTest.transparent = true;
        var colors = [ Violet, Indigo, Blue, Green, Yellow, Orange, Red ];
        var vertColor = colors[0]; 
        for( x in 0...70*scale ){
            vertColor = colors[ Math.floor( (x/scale) / 10 ) ];
            for( y in 0...768-70-45 ) pixelTest.setARGB( x, y, vertColor );
        }
        pixelTest.gradientShape.triangle( 100, 100, 0xf0ffcf00, 300, 220, 0xf000cfFF, 120, 300, 0xf0cF00FF );
        pixelTest.gradientShape.triangle( 100+120, 100+20, 0xccff0000, 300+120, 220+20, 0xcc0000FF, 120+120, 300+20, 0xcc00ff00 );
        
        pixelImage.putPixelImage( pixelTest, 45, 45 );
        image = pixelImage.khaImage;
        var pImage = KhaImage.createPixelImage( image );
        pImage.transform.flipY();
        image = pImage.khaImage;

    }

    public inline function update(): Void {

    }

    public inline function render( framebuffer: Framebuffer ): Void {
        var g2 = framebuffer.g2;
        var g1 = framebuffer.g1;
        trace( framebuffer.width );
        trace( framebuffer.height );
        g2.begin();
        g2.clear();
        g2.fillRect(10, 10, 50, 50);
        g2.end();
        /*g1.begin();
        g1.setPixel(100, 100, kha.Color.Green);
        g1.end();*/
        //g2.drawImage( image, 0, 0 );
        //g2.end();
        pixelImage.khaImage.drawG1_Image(0,0,framebuffer);
    }
}

