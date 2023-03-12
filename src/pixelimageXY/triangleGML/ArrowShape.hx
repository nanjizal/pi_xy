package pixelimageXY.triangleGML;

import pixelimageXY.Pixelshape;
import triangleGML.shape.contour.ArrowShape_;

class ArrowShape extends ArrowShape_<Pixelshape,Pixelshape>{


    public function render( pixelShape: Pixelshape ): Pixelshape {
        var px = x1 + offX;
        var qx = x2 + offX;
        var py = y1 + offY;
        var qy = y2 + offY;

        var arrowFixed = arrowHeight > 0. || arrowWidth > 0.;
        var hasSoftEdge = edgeSoft != 0;
        var doubleSided = both;
        trace( 'render arrow' );
        trace( 'arrowHeight' );
        trace( 'arrowWidth' );
        
        trace( 'fixed arrow ' + Std.string( arrowFixed ) );
        trace( 'arrow soft edge ' + Std.string( hasSoftEdge ) );
        trace( 'arrow double sided ' + Std.string( both ) );
        pixelShape.fillArrow( px, py, arrowWidth, arrowHeight, strokeWidth, strokeColor );
        /*
        switch( [ hasSoftEdge, doubleSided, arrowFixed ] ){
            case [ false, false, false ]:
                pixelShape.fillArrow( px, py, arrowWidth, arrowHeight, strokeWidth, strokeColor );
            case [ false, false, true ]:
                pixelShape.fillFixArrow( px, py, px, py, arrowWidth, arrowHeight, strokeWidth, strokeColor );
            if( hasSoftEdge ){
        if( both ){
            if( arrowFixed ){
                pixelImage.fillSoftFixArrow( px, py, px, py, arrowWidth, arrowHeight, strokeWidth, strokeColor, flare, reverseFlare, edgeSoft  );
            } else {
                pixelImage.fillSoftArrow( px, py, px, py, strokeWidth, strokeColor, flare, reverseFlare, edgeSoft  );
            }
            
        } else {
            if( arrowFixed ){
                pixelImage.fillSoftFixArrowBoth( px, py, px, py, arrowWidth, arrowHeight, strokeWidth, strokeColor, edgeSoft  );
            } else {
                pixelImage.fillSoftArrowBoth( px, py, px, py, strokeWidth, strokeColor, edgeSoft  );
            }
        }
        } else {
        if( both ){
            if( arrowFixed ){
                pixelImage.fillSoftFixArrow( px, py, px, py, arrowWidth, arrowHeight, strokeWidth, strokeColor, flare, reverseFlare, edgeSoft  );
            } else {
                pixelImage.fillSoftArrow( px, py, px, py, strokeWidth, strokeColor, flare, reverseFlare, edgeSoft  );
            }
            
        } else {
            if( arrowFixed ){
                pixelImage.fillFixArrowBoth( px, py, px, py, arrowWidth, arrowHeight, strokeWidth, strokeColor );
            } else {
                pixelImage.fillArrowBoth( px, py, px, py, strokeWidth, strokeColor );
            }
        }
        }
        */
        return pixelShape;
    }
}