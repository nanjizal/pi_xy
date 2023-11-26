package pi_xy.triangleGML;

import pi_xy.Pixelimage;
import pi_xy.triangleGML.triGML.shape.form.CircleForm_;

class CircleForm extends CircleForm_<Pixelimage,Pixelimage>{
    public function render( pixelImage: Pixelimage ): Pixelimage {
        var temp = new Pixelimage( Math.ceil( diameter ), Math.ceil( diameter ) );
        temp.transparent = false;
        buildCircle( temp );
        pixelImage.putPixelImage( temp, Std.int( left+offX ), Std.int( top+offY ) );
        temp = null;
        return pixelImage;
    }

    function buildCircle( temp: Pixelimage ){
        var w = Math.round( strokeWidth/2 );
        var r = diameter/2;
        var innerR = diameter/2 - 4*w;
        var cx = diameter/2;
        var cy = diameter/2;
        var phi = 0.;
        var innerCx: Float = cx - w/4;
        var innerCy: Float = cy - w/4;
        temp.fillShape.ellipseTri( cx, cy, r, r, strokeColor, phi );
        temp.fillShape.ellipseTri( innerCx, innerCy, innerR, innerR, fill, phi );
    }
}