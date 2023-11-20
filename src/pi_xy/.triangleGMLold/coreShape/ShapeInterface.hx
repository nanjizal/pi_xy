package pi_xy.triangleGML.coreShape;
import pi_xy.fontImage.OneDfont;
import pi_xy.Pixelimage;
import pi_xy.Pixelshape;
interface ShapeInterface {
    public function setParameter( name: String, value: String ):Void;
    public function translate( x: Float, y: Float ):Void;
    public function clear( pixelShape: Pixelshape, color: Int ): Pixelshape;
    public function hit( x: Float, y: Float ): Bool;
    public function render( pixelShape: Pixelshape ): Pixelshape;
    public function setImage( name: String, pixelImage: Pixelimage ):Void;
    public function setBasicFont( name: String, basicFont: OneDfont ): Void; 
}