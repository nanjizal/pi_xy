package pi_xy.application;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.display.Graphics;
import openfl.display.BitmapData;

import pi_xy.Pixelimage;
import pi_xy.formats.Format;
import pi_xy.triangleGML.TriangleGML;

import pi_xy.formats.OpenFLbitmapData;

function main(): Void { openfl.Lib.current.addChild( new TestOpenFL() ); }
class TestOpenFL extends Sprite {
    public function new(){
        super();
        trace( ' testing Testopenfl ' );
        var current = openfl.Lib.current;
        var stage = current.stage;
        var viewSprite = new Sprite();
        var g = viewSprite.graphics;
        addChild( viewSprite );
        
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
        var bitmapDataTest = OpenFLbitmapData.toOpenflBitmapData_( pixelImage );
        var pixelImageTest = OpenFLbitmapData.fromOpenflBitmapData_( bitmapDataTest );
        var bitmapData = OpenFLbitmapData.toOpenflBitmapData_( pixelImageTest );
        var bitmap = new openfl.display.Bitmap( bitmapData );
        addChild( bitmap );
        
        current.graphics.beginFill(0xFFFFFFFF, 1. );
        current.graphics.drawRect( 0., 0., 70., 40. );
        current.graphics.endFill();
        current.addChild( new openfl.display.FPS() );
    }
        //var parser = new TriangleGML( pixelImage );
        //parser.addShape( backGround, 10, 10 );
        //parser.addShape( aGrid,      10,   10 );
    var backGround = 
    '<RectangleForm
        left = "-1"
        top = "-1"
        width = "3073"
        height = "2305"
        fill = "0xFF000203">
    </RectangleForm>';
    
    var aGrid = 
    '<LineGridShape
        left = "100"  top = "100"
        width = "500" height = "768"
        delta = "100" deltaH = "100"
        strokeColor="0x0cF003300" strokeWidth="3">
    </LineGridShape>';
}