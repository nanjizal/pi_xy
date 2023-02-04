package pixelimage.triangleGML.coreShape;

interface ShapeInterface {
    public function setParameter( name: String, value: String ):Void;
    public function translate( x: Float, y: Float ):Void;
    public function clear( pixelShape: Pixelshape, color: Int ): Pixelshape;
    public function hit( x: Float, y: Float ): Bool;
    public function render( pixelShape: Pixelshape ): Pixelshape;
}