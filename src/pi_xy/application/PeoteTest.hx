package pi_xy.application;

import haxe.CallStack;

import lime.app.Application;
import lime.ui.Window;

import peote.view.PeoteView;
import peote.view.Buffer;
import peote.view.Display;
import peote.view.Program;
import peote.view.Color;
import peote.view.*;
import peote.view.TextureFormat;

import pi_xy.Pixelimage;
import pi_xy.pixel.Pixel32;
import haxe.io.UInt8Array;
import iterMagic.Img;

/**
 project.xml requires atleast these haxelibs as dev from github
    <haxelib name="lime" />	
    <haxelib name="pi_xy" />
    <haxelib name="peote-view" />
    <haxelib name="justPath" />
    <haxelib name="iterMagic" />
    <haxelib name="format" />
 */

/**
// peote-view useage
package;
import pi_xy.imageAbstracts.PeoteTexture;
import haxe.CallStack;
import lime.app.Application;
import lime.ui.Window;
import peote.view.*;
class Main extends Application {
    override function onWindowCreate(): Void {
        switch( window.context.type ){
            case WEBGL, OPENGL, OPENGLES:
                try startSample( window )
                catch (_) trace(CallStack.toString(CallStack.exceptionStack()), _);
            default: throw("Sorry, only works with OpenGL.");
        }
    }
    public function startSample( window: lime.ui.Window ){
        new pi_xy.application.PeoteTest( window );
    }
    override function onPreloadComplete():Void {}
    override function update(deltaTime:Int):Void {}
} 
 */
class Elem implements Element {
    @posX public var x:Int;
    @posY public var y:Int;
    @sizeX public var w:Int;
    @sizeY public var h:Int;
    public function new( x: Int = 0, y: Int = 0, w: Int = 100, h: Int = 100 ){
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
    }
}

class PeoteTest{
    public function new( window: lime.ui.Window ){
        var peoteView = new PeoteView( window) ;
        var display = new Display( 10, 10, window.width - 20, window.height - 20, Color.WHITE);
        peoteView.addDisplay( display );
        var buffer  = new Buffer<Elem>( 10 );
        var program = new Program( buffer );
        var element = new Elem( 0, 0, 800, 600 );
        buffer.addElement( element );
        var pixelImage = createTest();
        var texture1 = pixelImage.peoteTexture.to();
        program.setTexture( texture1, "custom" );
        /* TODO: work out how to setup so can grab texture, use and re-render
        var pixelImageTemp = pi_xy.imageAbstracts.PeoteTexture.createPixelImage( texture1 );
        pixelImageTemp.transform.flipY();
        var texture2 = pixelImageTemp.peoteTexture.to();
        */
        display.addProgram(program);
    }
    inline
    function createTest(){
        var pixelImage = new Pixelimage( 800, 600 );
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
        return pixelImage;
    }
}