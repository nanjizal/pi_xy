# π - x y
## pi_xy provides pixel image manipulation on the CPU using Haxe.

![image](https://user-images.githubusercontent.com/20134338/195204970-fa2f6dee-86cf-48e5-a152-cf35e2b4d1cc.png)

## The library aims to support Haxe game engines and standalone js
### assumes Haxe 4.3.4+
- [OpenFL](https://www.openfl.org/) see [ OpenflTest > ](https://github.com/nanjizal/pi_xyOpenflTest)
- [lime](https://lime.openfl.org/) see [ LimeTest > ](https://github.com/nanjizal/pi_xyLimeTest)
- [peote-view](https://github.com/maitag/peote-view) see [ PeoteTest > ](https://github.com/nanjizal/pi_xyPeoteTest)
- NME ( Linux c++ )
- Heaps ( web )
- Ceramic ( web )
- Kha ( web )
- format PNG
- Javascript Canvas 
### TODO or check engines and/or platforms.
- JVM or other non c++/js solutions
- Flash
- Flixel
  
Would welcome input from various platforms and engine experts on securing coverage, integration is not super optimised as ImageStruct can use a range of data structures so it maybe feasible to reduce conversion.
  
```Haxe
// Haxe javascript example 

import pi_xy.Pixelimage;
import htmlHelper.canvas.CanvasSetup;
import htmlHelper.canvas.Surface;

function main(){
    var canvasSetup = new CanvasSetup();
    var surface = canvasSetup.surface; 
    /*  possible image structures 
        BYTES_INT  - Bytes 
        ARRAY_INT  - Array<Int>
        U32_ARR    - UInt32Array
        VECTOR_INT - Vector<Int>
    */
    Pixelimage.defaultType = BYTES_INT;
    var image = new Pixelimage( 1024*4, 768*4 );
    image.transparent = true;
    image.gradientShape.triangle( 100, 900,  0xFFFF0000
                                , 300, 1200, 0xFF00FF00
                                , 500, 1000, 0xFF0000FF );
    image.jsCanvas.to( surface.me, 0, 0 );
}
```
## XML nodes can be used although may need more thought.
```Haxe
// Haxe C++/sys example

import pi_xy.Pixelshape;
import pi_xy.formats.Format;
import pi_xy.triangleGML.TriangleGML;

function main(){ 
    var image = new Pixelimage( 1024*3, 768*3 );
    image.transparent = true;
    var parser = new TriangleGML( image );
    parser.addShape( aGrid, 10, 0 );
    image.PNG.to( 'grid.png' );
}

var aGrid = 
'<LineGridShape
    left = "100"  top = "100"
    width = "2048" height = "1536"
    delta = "100" deltaH = "100"
    strokeColor="0xfF003300" strokeWidth="3">
</LineGridShape>';
```


## Features
- Alpha blending or overdraw ( transparency = false ) allowing composition
- Image skew, scale and rotations, barycentric UV mapping allows fairly reasonable quality ( image.transform.flippedX() )
- Soft edge lines and gradient lines
- Arc, pie, ellipse, polygon
- Curves and SVG data paths
- Pattern shapes, use of an array of bool to define a simple image texture.
- Rounded rectangles
- Arrows including tapering and double arrows
- Ve multiple color edges
- convolution filter support

## Old 'pixelimage' links.

[ samples wip > ](https://nanjizal.github.io/pixelimage-samples) 

[ demo showUsed > ](https://nanjizal.github.io/pixelimage/showUsed/index.html)

[ demo bin > ](https://nanjizal.github.io/pixelimage/bin/index.html)

[ haxe dox ](https://nanjizal.github.io/pixelimage/pages/)


