package pixelimageXY.triangleGML;

import pixelimageXY.Pixelimage;
import triangleGML.shape.contour.QuintShape_;
import pixelimageXY.algo.QuintPixel;

class QuintShape extends QuintShape_<Pixelimage,Pixelimage>{
    public function render( pixelImage: Pixelimage ): Pixelimage {
        this.hitObj = cast pixelImage.softShape.quint( aX+offX, aY+offY, bX+offX, bY+offY, cX+offX, cY+offY, dX+offX, dY+offY, strokeColor, edgeSoft );
        return pixelImage;
    }
    public override function clear( pixelImage: Pixelimage, color: Int ): Pixelimage {
        pixelImage.fillShape.quad( aX+offX, aY+offY, bX+offX, bY+offY, cX+offX, cY+offY, dX+offX, dY+offY, color, false );
        return pixelImage;
    }
}
