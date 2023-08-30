package pixelimageXY.triangleGML;

import pixelimageXY.Pixelimage;
import triangleGML.shape.form.EllipseForm_;

class EllipseForm extends EllipseForm_<Pixelimage,Pixelimage>{
    public function render( pixelImage: Pixelimage ): Pixelimage {
        var temp = new Pixelimage( Math.ceil( width ), Math.ceil( height ) );
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
            temp.fillShape.ellipseTri( cx, cy, rW, rH, strokeColor, phi );
            temp.fillShape.ellipseTri( innerCx, innerCy, innerRw, innerRh, fill, phi );
        } else {
            temp.softShape.ellipseTri( cx, cy, rW, rH, strokeColor, phi, edgeSoft );
            temp.softShape.ellipseTri( innerCx, innerCy, innerRw, innerRh, fill, phi, edgeSoft );
        }
        pixelImage.putPixelImage( temp, Std.int( left+offX ), Std.int( top+offY ) );
        temp = null;
        return pixelImage;
    }
}