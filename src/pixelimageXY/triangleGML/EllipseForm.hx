package pixelimageXY.triangleGML;

import pixelimageXY.Pixelshape;
import triangleGML.shape.form.EllipseForm_;

class EllipseForm extends EllipseForm_<Pixelshape,Pixelshape>{
    public function render( pixelShape: Pixelshape ): Pixelshape {
        var temp = new Pixelshape( Math.ceil( width ), Math.ceil( height ) );
        temp.transparent = false;
        var rW = width/2;
        var rH = height/2;
        var innerRw = rW - strokeWidth/2;
        var innerRh = rH - strokeWidth/2;
        var cx = rW;
        var cy = rH;
        var phi = 0;
        var innerCx = cx + strokeWidth;
        var innerCy = cy + strokeWidth;
        if( edgeSoft == 0. ){
            temp.fillEllipseTri( cx, cy, rW, rH, strokeColor, phi );
            temp.fillEllipseTri( innerCx, innerCy, innerRw, innerRh, fill, phi );
        } else {
            temp.softFillEllipseTri( cx, cy, rW, rH, strokeColor, phi, edgeSoft );
            temp.softFillEllipseTri( innerCx, innerCy, innerRw, innerRh, fill, phi, edgeSoft );
        }
        pixelShape.putPixelImage( temp, Std.int( left+offX ), Std.int( top+offY ) );
        temp = null;
        return pixelShape;
    }
}