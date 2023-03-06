package pixelimageXY.triangleGML;

import pixelimageXY.Pixelshape;
import triangleGML.shape.form.RectangleForm_;
import pixelimageXY.algo.RoundRecPixel;

class RectangleForm extends RectangleForm_<Pixelshape,Pixelshape>{
    public function render( pixelShape: Pixelshape ): Pixelshape {
        if( rounded == false ){
            // simple rectangle
            var temp = new Pixelshape( Math.ceil( width ), Math.ceil( height ) );
            temp.transparent = false;
            temp.simpleRect( 0, 0, width, height, strokeColor );
            temp.simpleRect( strokeWidth, strokeWidth,width-2*strokeWidth, height-2*strokeWidth, fill );
            pixelShape.putPixelImage( temp, Std.int( left+offX ), Std.int( top+offY) );
            temp = null;
        } else {
            var temp = new Pixelshape( Math.ceil( width ), Math.ceil( height ) );
            temp.transparent = false;
            fillRoundRectangle( cast temp, 0, 0, width, height,strokeColor );
            fillRoundRectangle( cast temp, strokeWidth, strokeWidth, width-2*strokeWidth, height-2*strokeWidth, fill );
            pixelShape.putPixelImage( temp, Std.int( left+offX ), Std.int( top+offY ) );
            temp = null;
        }
        return pixelShape;
    }
}