package pixelimageXY.triangleGML;

import pixelimageXY.Pixelshape;
import triangleGML.shape.contour.QuadShape_;

class QuintShape extends QuintShape_<Pixelshape,Pixelshape>{
    public function render( pixelShape: Pixelshape ): Pixelshape {
        this.hitObj = cast pixelShape.softFillQuint( aX+offX, aY+offY, bX+offX, bY+offY, cX+offX, cY+offY, dX+offX, dY+offY, strokeColor, softEdge );
        return pixelShape;
    }
    public override function clear( pixelShape: Pixelshape, color: Int ): Pixelshape {
        pixelShape.fillQuad( aX+offX, aY+offY, bX+offX, bY+offY, cX+offX, cY+offY, dX+offX, dY+offY, color, false );
        return pixelShape;
    }
}
