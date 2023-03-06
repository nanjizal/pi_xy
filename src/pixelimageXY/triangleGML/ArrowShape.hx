package pixelimageXY.triangleGML;

import pixelimageXY.Pixelshape;
import triangleGML.shape.contour.ArrowShape_;

class ArrowShape extends ArrowShape_<Pixelshape,Pixelshape>{


    public function render( pixelImage: Pixelshape ): Pixelshape {
        var px = x1 + offX;
        var qx = x2 + offX;
        var py = y1 + offY;
        var qy = y2 + offY;
        trace( 'render arrow' );
        if( edgeSoft != 0 ){
        if( both == false ){
            if( arrowHeight > 0. || arrowWidth > 0. ){
                pixelImage.fillSoftFixArrow( px, py, px, py, arrowWidth, arrowHeight, strokeWidth, strokeColor, flare, reverseFlare, edgeSoft  );
            } else {
                pixelImage.fillSoftArrow( px, py, px, py, strokeWidth, strokeColor, flare, reverseFlare, edgeSoft  );
            }
            
        } else {
            if( arrowHeight > 0. || arrowWidth > 0. ){
                pixelImage.fillSoftFixArrowBoth( px, py, px, py, arrowWidth, arrowHeight, strokeWidth, strokeColor, edgeSoft  );
            } else {
                pixelImage.fillSoftArrowBoth( px, py, px, py, strokeWidth, strokeColor, edgeSoft  );
            }
        }
        } else {
        if( both == false ){
            if( arrowHeight > 0. || arrowWidth > 0. ){
                pixelImage.fillSoftFixArrow( px, py, px, py, arrowWidth, arrowHeight, strokeWidth, strokeColor, flare, reverseFlare, edgeSoft  );
            } else {
                pixelImage.fillSoftArrow( px, py, px, py, strokeWidth, strokeColor, flare, reverseFlare, edgeSoft  );
            }
            
        } else {
            if( arrowHeight > 0. || arrowWidth > 0. ){
                pixelImage.fillFixArrowBoth( px, py, px, py, arrowWidth, arrowHeight, strokeWidth, strokeColor );
            } else {
                pixelImage.fillArrowBoth( px, py, px, py, strokeWidth, strokeColor );
            }
        }
        }
        return pixelImage;
    }
}