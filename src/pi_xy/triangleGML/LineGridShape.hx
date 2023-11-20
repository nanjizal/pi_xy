package pi_xy.triangleGML;

import pi_xy.Pixelimage;
import triangleGML.shape.contour.LineGridShape_;
import pi_xy.algo.GeomPix;

class LineGridShape extends LineGridShape_<Pixelimage,Pixelimage>{
    public function render( pixelImage: Pixelimage ): Pixelimage {
        if( rotation != 0. 
        || skewX != 0. 
        || skewY != 0. 
        || scaleX != 1.
        || scaleY != 1. ){
            var temp = new Pixelimage( Math.ceil( width ), Math.ceil( height ) );
            temp.transparent = false;
            if( deltaH != 0. ){
                temp.fillShape.lineGridWH( 0, 0, width, height, delta, deltaH, strokeWidth, strokeColor );
            } else {
                temp.fillShape.lineGrid( 0, 0, width, height, delta, strokeWidth, strokeColor );
            }
            var win = new RectangleWindow( 0, 0, temp.width, temp.height );
            var temp2 = new Pixelimage( Math.ceil( width), Math.ceil( height ) );
            temp2.transparent = true;
            temp2.imageShape.rectangle( temp, win, 0, 0, temp.width, temp.height, rotation, transformCentreX, transformCentreY, skewX, skewY, scaleX, scaleY );
            pixelImage.putPixelImage( temp2, Std.int( left+offX ), Std.int( top+offY ) );
            temp = null;
            temp2 = null;
        } else {
            if( deltaH != 0. ){
                pixelImage.fillShape.lineGridWH( left+offX, top+offY, width, height, delta, deltaH, strokeWidth, strokeColor );
            } else {
                pixelImage.fillShape.lineGrid( left+offX, top+offY, width, height, delta, strokeWidth, strokeColor );
            }
        }
        return pixelImage;
    }
}