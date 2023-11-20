package pi_xy.triangleGML;

import pi_xy.Pixelimage;
import triangleGML.shape.contour.ArrowShape_;

class ArrowShape extends ArrowShape_<Pixelimage,Pixelimage>{


    public function render( pixelImage: Pixelimage ): Pixelimage {
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
        pixelImage.fillShape.arrow( px, py, arrowWidth, arrowHeight, strokeWidth, strokeColor );
        /*
        switch( [ hasSoftEdge, doubleSided, arrowFixed ] ){
            case [ false, false, false ]:
                pixelImage.fillShape.arrow( px, py, arrowWidth, arrowHeight, strokeWidth, strokeColor );
            case [ false, false, true ]:
                pixelImage.fillShape.fixArrow( px, py, px, py, arrowWidth, arrowHeight, strokeWidth, strokeColor );
            if( hasSoftEdge ){
        if( both ){
            if( arrowFixed ){
                pixelImage.softShape.fixArrow( px, py, px, py, arrowWidth, arrowHeight, strokeWidth, strokeColor, flare, reverseFlare, edgeSoft  );
            } else {
                pixelImage.softShape.arrow( px, py, px, py, strokeWidth, strokeColor, flare, reverseFlare, edgeSoft  );
            }
            
        } else {
            if( arrowFixed ){
                pixelImage.softShape.fixArrowBoth( px, py, px, py, arrowWidth, arrowHeight, strokeWidth, strokeColor, edgeSoft  );
            } else {
                pixelImage.softShape.arrowBoth( px, py, px, py, strokeWidth, strokeColor, edgeSoft  );
            }
        }
        } else {
        if( both ){
            if( arrowFixed ){
                pixelImage.softShape.fixArrow( px, py, px, py, arrowWidth, arrowHeight, strokeWidth, strokeColor, flare, reverseFlare, edgeSoft  );
            } else {
                pixelImage.softShape.arrow( px, py, px, py, strokeWidth, strokeColor, flare, reverseFlare, edgeSoft  );
            }
            
        } else {
            if( arrowFixed ){
                pixelImage.fillShape.fixArrowBoth( px, py, px, py, arrowWidth, arrowHeight, strokeWidth, strokeColor );
            } else {
                pixelImage.fillShape.arrowBoth( px, py, px, py, strokeWidth, strokeColor );
            }
        }
        */
        return pixelImage;
    }
}