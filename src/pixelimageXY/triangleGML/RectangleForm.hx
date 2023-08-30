package pixelimageXY.triangleGML;

import pixelimageXY.Pixelimage;
import triangleGML.shape.form.RectangleForm_;
import pixelimageXY.algo.RoundRecPixel;

class RectangleForm extends RectangleForm_<Pixelimage,Pixelimage>{
    public function render( pixelImage: Pixelimage ): Pixelimage {
        if( rounded == false ){
            // simple rectangle
            var temp = new Pixelimage( Math.ceil( width ), Math.ceil( height ) );
            temp.transparent = false;
            temp.simpleRect( 0, 0, width, height, strokeColor );
            temp.simpleRect( strokeWidth, strokeWidth,width-2*strokeWidth, height-2*strokeWidth, fill );
            pixelImage.putPixelImage( temp, Std.int( left+offX ), Std.int( top+offY) );
            temp = null;
        } else {
            var temp = new Pixelimage( Math.ceil( width ), Math.ceil( height ) );
            temp.transparent = false;
            fillRoundRectangle( temp, 0, 0, width, height,strokeColor );
            fillRoundRectangle( temp, strokeWidth, strokeWidth, width-2*strokeWidth, height-2*strokeWidth, fill );
            pixelImage.putPixelImage( temp, Std.int( left+offX ), Std.int( top+offY ) );
            temp = null;
        }
        return pixelImage;
    }
}