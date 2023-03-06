package pixelimageXY.triangleGML;

import pixelimageXY.Pixelshape;
import triangleGML.shape.contour.LineGridShape_;
import pixelimageXY.algo.GeomPix;

class LineGridShape extends LineGridShape_<Pixelshape,Pixelshape>{
    public function render( pixelShape: Pixelshape ): Pixelshape {
        if( rotation != 0. 
        || skewX != 0. 
        || skewY != 0. 
        || scaleX != 1.
        || scaleY != 1. ){
            var temp = new Pixelshape( Math.ceil( width ), Math.ceil( height ) );
            temp.transparent = false;
            if( deltaH != 0. ){
                temp.lineGridWH( 0, 0, width, height, delta, deltaH, strokeWidth, strokeColor );
            } else {
                temp.lineGrid( 0, 0, width, height, delta, strokeWidth, strokeColor );
            }
            var win = new RectangleWindow( 0, 0, temp.width, temp.height );
            var temp2 = new Pixelshape( Math.ceil( width), Math.ceil( height ) );
            temp2.transparent = true;
            temp2.imgRect( temp, win, 0, 0, temp.width, temp.height, rotation, transformCentreX, transformCentreY, skewX, skewY, scaleX, scaleY );
            pixelShape.putPixelImage( temp2, Std.int( left+offX ), Std.int( top+offY ) );
            temp = null;
            temp2 = null;
        } else {
            if( deltaH != 0. ){
                pixelShape.lineGridWH( left+offX, top+offY, width, height, delta, deltaH, strokeWidth, strokeColor );
            } else {
                pixelShape.lineGrid( left+offX, top+offY, width, height, delta, strokeWidth, strokeColor );
            }
        }
        return pixelShape;
    }
}