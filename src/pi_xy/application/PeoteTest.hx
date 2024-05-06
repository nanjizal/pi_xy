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
        pixelTest.lineShape.svgPath( kiwi_d, .7, 0xF0cccccc, 0., 0., 1., 1. );
        pixelImage.putPixelImage( pixelTest, 45, 45 );
        return pixelImage;
    }
}

// kiwi bird
var kiwi_d = "M210.333,65.331C104.367,66.105-12.349,150.637,1.056,276.449c4.303,40.393,18.533,63.704,52.171,79.03c36.307,16.544,57.022,54.556,50.406,112.954c-9.935,4.88-17.405,11.031-19.132,20.015c7.531-0.17,14.943-0.312,22.59,4.341c20.333,12.375,31.296,27.363,42.979,51.72c1.714,3.572,8.192,2.849,8.312-3.078c0.17-8.467-1.856-17.454-5.226-26.933c-2.955-8.313,3.059-7.985,6.917-6.106c6.399,3.115,16.334,9.43,30.39,13.098c5.392,1.407,5.995-3.877,5.224-6.991c-1.864-7.522-11.009-10.862-24.519-19.229c-4.82-2.984-0.927-9.736,5.168-8.351l20.234,2.415c3.359,0.763,4.555-6.114,0.882-7.875c-14.198-6.804-28.897-10.098-53.864-7.799c-11.617-29.265-29.811-61.617-15.674-81.681c12.639-17.938,31.216-20.74,39.147,43.489c-5.002,3.107-11.215,5.031-11.332,13.024c7.201-2.845,11.207-1.399,14.791,0c17.912,6.998,35.462,21.826,52.982,37.309c3.739,3.303,8.413-1.718,6.991-6.034c-2.138-6.494-8.053-10.659-14.791-20.016c-3.239-4.495,5.03-7.045,10.886-6.876c13.849,0.396,22.886,8.268,35.177,11.218c4.483,1.076,9.741-1.964,6.917-6.917c-3.472-6.085-13.015-9.124-19.18-13.413c-4.357-3.029-3.025-7.132,2.697-6.602c3.905,0.361,8.478,2.271,13.908,1.767c9.946-0.925,7.717-7.169-0.883-9.566c-19.036-5.304-39.891-6.311-61.665-5.225c-43.837-8.358-31.554-84.887,0-90.363c29.571-5.132,62.966-13.339,99.928-32.156c32.668-5.429,64.835-12.446,92.939-33.85c48.106-14.469,111.903,16.113,204.241,149.695c3.926,5.681,15.819,9.94,9.524-6.351c-15.893-41.125-68.176-93.328-92.13-132.085c-24.581-39.774-14.34-61.243-39.957-91.247c-21.326-24.978-47.502-25.803-77.339-17.365c-23.461,6.634-39.234-7.117-52.98-31.273C318.42,87.525,265.838,64.927,210.333,65.331zM445.731,203.01c6.12,0,11.112,4.919,11.112,11.038c0,6.119-4.994,11.111-11.112,11.111s-11.038-4.994-11.038-11.111C434.693,207.929,439.613,203.01,445.731,203.01z";