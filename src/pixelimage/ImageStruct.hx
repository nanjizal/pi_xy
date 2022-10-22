package pixelimage;

import pixelimage.Endian;
import haxe.io.UInt32Array;

/**
  This struct is the base of Pixelimage and Pixelshape abstracts
**/
@:structInit
class ImageStruct {
  public var width:  Int;
  public var height: Int;
  public var image:  UInt32Array;
  // for composing shapes where overwitting set as false, for alpha blending set as true.
  public var transparent: Bool = false;
  public var isLittle: Bool;
  // set these when using relative offset x,y
  public var virtualX: Float = 0;
  public var virtualY: Float = 0;
  public var useVirtualPos: Bool = false;
  public var mask: Pixelimage;
  public var useMask: Bool = false;
  public function new( width: Int, height: Int, image: UInt32Array ){
    this.width    = width;
    this.height   = height;
    this.image    = image;
    // uses function from Endian
    this.isLittle = isLittleEndian;
    this.transparent = false;
  }
}