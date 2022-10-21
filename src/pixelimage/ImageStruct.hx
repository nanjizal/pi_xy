package pixelimage;

import pixelimage.Endian;
import haxe.io.UInt32Array;

@:structInit
class ImageStruct {
  public var width:  Int;
  public var height: Int;
  public var image:  UInt32Array;
  public var transparent: Bool = false;
  public var isLittle: Bool;
  public var virtualX: Float = 0;
  public var virtualY: Float = 0;
  public var useVirtualPos: Bool = false;
  public function new( width: Int, height: Int, image: UInt32Array ){
    this.width    = width;
    this.height   = height;
    this.image    = image;
    this.isLittle = isLittleEndian;
    this.transparent = false;
  }
}