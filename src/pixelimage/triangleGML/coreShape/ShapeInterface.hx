package pixelimage.triangleGML.coreShape;
import pixelimage.fontImage.OneDfont;
import pixelimage.Pixelimage;
import pixelimage.Pixelshape;
interface ShapeInterface {
    public function setParameter( name: String, value: String ):Void;
    public function translate( x: Float, y: Float ):Void;
    public function clear( pixelShape: Pixelshape, color: Int ): Pixelshape;
    public function hit( x: Float, y: Float ): Bool;
    public function render( pixelShape: Pixelshape ): Pixelshape;
    public function setImage( name: String, pixelImage: Pixelimage ):Void;
    public function setBasicFont( name: String, basicFont: OneDfont ): Void; 
}