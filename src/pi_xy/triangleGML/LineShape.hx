package pi_xy.triangleGML;

import pi_xy.Pixelimage;
import pi_xy.pixel.Pixel32;
import triangleGML.shape.contour.LineShape_;
import pi_xy.pixel.ColorHelp;
import pi_xy.algo.Xiolin_Wu_Line;

class LineShape extends LineShape_<Pixelimage,Pixelimage>{
    public var luxury: Bool;

    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'luxury':
                luxury = ( StringTools.trim( value ).toLowerCase() == 'true' )? true: false; 
                trace('setting luxury '+ value );
            case _:
                super.setParameter( name, value );
        }
    }
    public function render( pixelImage: Pixelimage ): Pixelimage {
        var px = x1 + offX;
        var qx = x2 + offX;
        var py = y1 + offY;
        var qy = y2 + offY;
        
        if( strokeWidth < 1. ){
            var alpha = getAlpha( strokeColor ) * 0.75;
            xWuLine( pixelImage, px, py, qx, qy, strokeColor, alpha );
            xWuLine( pixelImage, px, px, qx, qy, strokeColor, alpha );
        } else {
            if( edgeSoft == 0. ){
                pixelImage.fillShape.line( px, py, qx, qy, strokeWidth, strokeColor );
            } else {

                if( luxury ){
                    pixelImage.softShape.lineLuxury( px, py, qx, qy, strokeWidth, strokeColor, edgeSoft );
                } else {
                    trace("luxury!!");
                    pixelImage.softShape.line( px, py, qx, qy, strokeWidth, strokeColor, edgeSoft );
                }
            }
        }
        return pixelImage;
    }
}