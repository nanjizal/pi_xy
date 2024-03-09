package pi_xy.application;

import ceramic.Quad;
import ceramic.Scene;
import pi_xy.Pixelimage;
import pi_xy.pixel.Pixel32;
import haxe.io.UInt8Array;
import iterMagic.Img;
/*
Note for ceramic use this code as MainScene after initialising a project somewhere else.
If imports don't work tweek the sourcePath in the haxelib.json to be 'src/' rather than 'src'
*/
class CeramicTest extends Scene {

    var logo:Quad;

    override function preload() {

        // Add any asset you want to load here

        //assets.add(Images.CERAMIC);

    }

    override function create() {
        
        // Called when scene has finished preloading

        // Display logo
        logo = new Quad();
        var pixelImage = new Pixelimage( 1024, 768 );
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
        var scale       = 12;
        var pixelTest = new Pixelimage( 80*scale, 80*scale );
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
        logo.texture = pi_xy.formats.CeramicTexture.toCeramicTexture_( pixelImage );
        logo.size(logo.width/3, logo.height/3 ); // runnning linux but on mac pro so need to scale down.  
        add(logo);
        // Print some log
        log.success('Hello from ceramic :)');

    }

    override function update(delta:Float) {

        // Here, you can add code that will be executed at every frame

    }

    override function resize(width:Float, height:Float) {

        // Called everytime the scene size has changed

    }

    override function destroy() {

        // Perform any cleanup before final destroy

        super.destroy();

    }

}
