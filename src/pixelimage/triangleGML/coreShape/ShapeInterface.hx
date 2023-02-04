package pixelimage.triangleGML.coreShape;

interface ShapeInterface {
    public function setParameter( name: String, value: String ):Void;
    public function translate( x: Float, y: Float ):Void;
    public function render( pixelShape: Pixelshape ): Pixelshape;
}