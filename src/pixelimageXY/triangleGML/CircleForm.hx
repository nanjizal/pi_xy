package pixelimageXY.triangleGML;

import pixelimageXY.Pixelshape;
import triangleGML.shape.form.CircleForm_;

class CircleForm extends CircleForm_<Pixelshape,Pixelshape>{
    public function render( pixelShape: Pixelshape ): Pixelshape {
        var temp = new Pixelshape( Math.ceil( diameter ), Math.ceil( diameter ) );
        temp.transparent = false;
        buildCircle( temp );
        pixelShape.putPixelImage( temp, Std.int( left+offX ), Std.int( top+offY ) );
        temp = null;
        return pixelShape;
    }

    function buildCircle( temp: Pixelshape ){
        var w = Math.round( strokeWidth/2 );
        var r = diameter/2;
        var innerR = diameter/2 - 4*w;
        var cx = diameter/2;
        var cy = diameter/2;
        var phi = 0.;
        var innerCx: Float = cx - w/4;
        var innerCy: Float = cy - w/4;
        temp.fillEllipseTri( cx, cy, r, r, strokeColor, phi );
        temp.fillEllipseTri( innerCx, innerCy, innerR, innerR, fill, phi );
    }
}