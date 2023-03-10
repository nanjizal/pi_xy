# pixelimageXY
![image](https://user-images.githubusercontent.com/20134338/195204970-fa2f6dee-86cf-48e5-a152-cf35e2b4d1cc.png)

## PixelimageXY a generic image/bitmap/pixel Array.
PixelimageXY is a target agnostic Pixel image / bitmap implementation in Haxe ie: JS, c++...
The image data is a [@:structInit](https://code.haxe.org/category/beginner/declare-classes-with-structinit.html) ['ImageStruct'](https://github.com/nanjizal/pixelimageXY/blob/main/src/pixelimageXY/ImageStruct.hx) with an image property ```haxe.io.UInt32Array<Int>``` with [abstracts](https://haxe.org/manual/types-abstract.html); ```Pixelimage``` and ```Pixelshape``` abstracts on ImageStruct.  
<sub><sub>An expected TODO: is to add a [compiler flag](https://haxe.org/manual/lf-condition-compilation.html) to allow a ByteArray alternative.</sub></sub>
  
<sub><sub>UInt32Array was mostly choosen for Javascript target to be light and simple where pixel manipulation would be most costly and because it allows more readable code.</sub></sub>
  
<sub><sub>All processing is done prior to passing to the Canvas.</sub></sub>

## XML nodes can be used.
```Haxe
import pixelimageXY.Pixelshape;
import pixelimageXY.formats.Format;
import pixelimageXY.triangleGML.TriangleGML;

function main(){ 
    var pixelShape = new Pixelshape( 1024*3, 768*3 );
    pixelShape.transparent = true;
    var parser = new TriangleGML( pixelShape );
    parser.addShape( aGrid, 10, 0 );
    toPNG( pixelShape, 'grid.png' );
}

var aGrid = 
'<LineGridShape
    left = "100"  top = "100"
    width = "2048" height = "1536"
    delta = "100" deltaH = "100"
    strokeColor="0xfF003300" strokeWidth="3">
</LineGridShape>';
```

## JS Canvas and hxcpp PNG first supported.
Intitally tested against HTML Javascript canvas using [htmlHelper](https://github.com/nanjizal/htmlHelper) to help with testing against Haxe Javascript, and further developed with Haxe C++ witting images headless to [png](https://en.wikipedia.org/wiki/PNG) with the assistance of haxefoundation's [format](https://github.com/HaxeFoundation/format) library.
  
## Toolkits are being added.
Addtionally support is being added for Haxe tool kits and other libraries, for filters [Vision](https://github.com/ShaharMS/Vision) can be utilised.
  
## 2D software (CPU) rendering engine.
PixelimageXY contains an experimental 2D vector software rendering engine capabilities, it uses [justPath](https://github.com/nanjizal/justPath) to assist in processing SVG path data. Shapes are mostly built from triangles allowing Barycentric image and UV mapping and simple hitTests, this may need revision for some optimisation.
  
Shapes can be defined with simple XML shape nodes using [TriangleXML](https://github.com/nanjizal/triangleGML) mini library. TriangleGML uses [abstract classed](https://haxe.org/manual/types-abstract-class.html) [generics](https://haxe.org/manual/type-system-generic.html) to provide basic (macro less and reflection less) XML parsing and can be implemented against alternatate drawing tools by setting the ```<DRAWTOOL>``` and ```<IMAGETOOL>``` generics.  PixelimageXY inherits the abstract classes and implements a 'render' method and defines the ```getTriangleGML``` method mapping the extended render classes.

## Features
- Alpha blending or overdraw ( transparency = false ) allowing composition, ( Mask needs more testing ).
- Image skew, scale and rotations, barycentric UV mapping allows fairly reasonable quality.
- Soft edge lines and gradient lines ( only tried on cpp ) they maybe heavy, pentagon sampling.
- Arc, pie, ellipse, polygon
- Curves and SVG data paths ( more testing and some edge cases )
- Pattern shapes, use of an array of bool to define a simple image texture.
- Rounded rectangles
- Arrows including tapering and double arrows
- Ve multiple color edges

## WIP progress, wait prior to use.
- Recently implemented soft edged lines and gradient lines using two triangles.
- In progress of rebuilding rendering against the TriangleXML, inital old 'pixelimage' has similar.
- Implementing XML sample use at [TriangleXML-samples](https://github.com/nanjizal/triangleGML-samples) and [pixelimageXY-samples](http://github.com/nanjizal/pixelimageXY-samples)

## Old 'pixelimage' links.

[ samples wip > ](https://nanjizal.github.io/pixelimage-samples) 

[ demo showUsed > ](https://nanjizal.github.io/pixelimage/showUsed/index.html)

[ demo bin > ](https://nanjizal.github.io/pixelimage/bin/index.html)

[ haxe dox ](https://nanjizal.github.io/pixelimage/pages/)

Drawing to UIntArray and then put on Canvas.

![Screenshot from 2022-10-08 09-57-34](https://user-images.githubusercontent.com/20134338/194700314-0c1a6f2a-f0e3-4ace-ba09-114016a0cf89.png)

## For development Rants and screenshots
[pixelimage showcase on Haxe discord](https://discord.com/channels/162395145352904705/1028238027664916550)
