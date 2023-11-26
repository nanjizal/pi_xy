package pi_xy.application;

import htmlHelper.canvas.CanvasSetup;
import htmlHelper.canvas.Surface;
import pi_xy.Pixelimage;

import js.html.ImageElement;
import pi_xy.triangleGML.*;
import htmlHelper.tools.ImageLoader;
import pi_xy.fontImage.TestLem;
import pi_xy.fontImage.OneDfont;
import pi_xy.textureImage.TestTiger;
import pi_xy.textureImage.TestNineSlice;
import pi_xy.algo.GeomPix;

function main() new Arrows();
class Arrows {

    // htmlHelper requirements
    var canvasSetup = new CanvasSetup();
    var surface :   Surface; 

    // main pixelimage instance
    var pixelImage: Pixelimage;

    public function new(){
        begin();
        // see xml definitions below
        draw([
              lineGridShape
            , arrowShapeTest
            , arrowShapeReverseFlareTest
            , arrowShapeFlareTest
            
        ]);//, arrowThickGradientTest
        end();
    }

    function begin(){
        surface = canvasSetup.surface;
        pixelImage = new Pixelimage( 1024*4, 768*4 );
        pixelImage.transparent = true;
    }
    function draw( triangleGMLs: Array<String> ){
        for( shapeString in triangleGMLs ) TriangleGML.withString( pixelImage, shapeString );
    }
    function end(){
        pixelImage.jsCanvas.to( surface.me, 0, 0 );
    }

    function drawGrid(){
        pixelImage.fillShape.lineGrid( 100, 100, 1024*3, 768*3, 100, 2.5, 0xfF003300 );
    }
    var arrowShapeTest: String = 
                    '<ArrowShape
                        both="false"
                        x1="500" y1="400" 
                        x2="890" y2="230" 
                        arrowWidth="70"
                        strokeWidth="30" strokeColor="0xff0000FF">
                    </ArrowShape>';
    var arrowShapeReverseFlareTest: String = 
                    '<ArrowShape
                        flare="true"
                        both="false"
                        reverseFlare="true"
                        x1="100" y1="300" 
                        x2="360" y2="120" 
                        arrowWidth="60"
                        arrowHeight="50"
                       
                        strokeWidth="5" strokeColor="0xffFF0000">
                    </ArrowShape>'; /*soft="10."*/
    var arrowShapeFlareTest: String = 
                    '<ArrowShape
                        flare="true"
                        both="false"
                        x1="400" y1="400" 
                        x2="560" y2="720" 
                        arrowWidth="60"
                        arrowHeight="50"
                        
                        strokeWidth="5" strokeColor="0xff00FF00">
                    </ArrowShape>';/*soft="10."*/
                    /*
    var arrowThickGradientTest: String = 
                    '<ArrowThickGradient
                        flare="true"
                        reverseFlare="true"
                        both="true"
                        x1="300" y1="300" 
                        x2="560" y2="120" 
                        arrowWidth="60"
                        arrowHeight="50"
                        strokeWidth="5" strokeTopColor="0xFF9000FF" strokeBottomColor="0xffffa200">
                    </ArrowThickGradient>';
                    */
    var lineGridShape = 
                    '<LineGridShape
                        left = "100"  top = "100"
                        width = "2048" height = "1536"
                        delta = "100" deltaH = "100"
                        strokeColor="0xfF003300" strokeWidth="2.5">
                    </LineGridShape>';
}