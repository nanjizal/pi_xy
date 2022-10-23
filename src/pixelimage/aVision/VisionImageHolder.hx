package pixelimage.aVision;
// TO: rework to use image.underling but new is required since don't want to waste on prepoulating
// but more recent Vision Image stores more that width.. so maybe unwise to avoid Image constructor?
// since ByteArray has forward can alloc on it directly on underling with 'OFF' to set 
abstract VisionImageHolder( vision.ds.Image ) from vision.ds.Image to vision.ds.Image {
    inline 
    public function new( ba: vision.ds.ByteArray ){
        this = cast ba;
    }
    inline
    public function toBytes(): haxe.io.Bytes {
        var img: vision.ds.Image = this;
        var arr: vision.ds.ByteArray = cast img;
        var b: haxe.io.Bytes = cast arr;
        var off: Int = abstract.OFF;
        var l: Int = this.width * this.height * off;
        var out = haxe.io.Bytes.alloc( l );
        out.blit( 0, b, off, l );
        return out;
    }
    inline
    public static function fromBytes( wid: Int, hi: Int, bytes: haxe.io.Bytes ){
        var l: Int = wid * hi * 4;
        var off: Int = abstract.OFF;
        var rawVisionImage = haxe.io.Bytes.alloc( l + off );
        rawVisionImage.blit( off, bytes, 0, l );
        var visionByteArray: vision.ds.ByteArray = cast rawVisionImage;
        visionByteArray.setInt32( 0, wid );
        return new VisionImageHolder( visionByteArray );
    }
    inline
    public function image(): vision.ds.Image {
        return ( this: vision.ds.Image );
    }
}