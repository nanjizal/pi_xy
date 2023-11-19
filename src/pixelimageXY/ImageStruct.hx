package pixelimageXY;

import pixelimageXY.Endian;
import haxe.io.UInt32Array;
import pixelimageXY.pixel.Pixel32;
import iterMagic.Img;
/*
import pixelimageXY.imageAbstracts.*;
import pixelimageXY.imageData.*;
import pixelimageXY.imageData.ImageDefinition;
*/

/**
  This struct is the base of Pixelimage and Pixelshape abstracts
**/
//@:structInit
class ImageStruct {
    public var width:  Int;
    public var height: Int;
    public var image: ImgMulti<Dynamic>;
    public var imageType: ImageType;
    public static var defaultType: ImageType = U32_ARR;
    /*
    public var image( default, default ): ImageDefinition;
    public static var imageType: EnumImageDefinition = UINT32ARRAY;
    public var imageDataType: EnumImageDefinition;
    */
    // for composing shapes where overwitting set as false, for alpha blending set as true.
    public var transparent: Bool = false;
    public var isLittle: Bool;
    // set these when using relative offset x,y
    public var virtualX: Float = 0;
    public var virtualY: Float = 0;
    public var useVirtualPos: Bool = false;
    public var mask: Pixelimage;
    public var useMask: Bool = false;
    public function new(){//< T: ImageDefinition >( width: Int, height: Int, image: T ){
        //this.width    = width;
        //this.height   = height;
        //this.image    = image;
        // uses function from Endian
        this.isLittle = isLittleEndian;
        this.transparent = false;
    }
}