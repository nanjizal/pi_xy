package pixelimage.aVision;

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
        var off: Int = 4;
        var l: Int = this.width * this.height * off;
        var out = haxe.io.Bytes.alloc( l );
        out.blit( 0, b, off, l );
        return out;
    }
    inline
    public static function fromBytes( wid: Int, hi: Int, bytes: haxe.io.Bytes ){
        var l: Int = wid * hi * 4;
        var off: Int = 4;
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