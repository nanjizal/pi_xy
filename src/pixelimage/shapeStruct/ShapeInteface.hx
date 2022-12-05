package pixelimage.shapeStruct;

interface ShapeInteface {
    public function setParameter( name: String, value: String ):Void;
    public function render( pixelImage: Pixelimage ): Pixelimage;
}