package pixelimage.triGML.coreShape;

interface ShapeInterface {
    public function setParameter( name: String, value: String ):Void;
    public function render( pixelImage: Pixelimage ): Pixelimage;
}