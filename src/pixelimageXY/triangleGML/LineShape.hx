package pixelimageXY.triangleGML;

import pixelimageXY.Pixelshape;
import triangleGML.shape.contour.LineShape_;

class LineShape extends LineShape_<Pixelshape,Pixelshape>{
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
    public function render( pixelShape: Pixelshape ): Pixelshape {
        var px = x1 + offX;
        var qx = x2 + offX;
        var py = y1 + offY;
        var qy = y2 + offY;
        if( edgeSoft == 0. ){
            pixelShape.fillLine( px, py, qx, qy, strokeWidth, strokeColor );
        } else {

            if( luxury ){
                pixelShape.fillSoftLineLuxury( px, py, qx, qy, strokeWidth, strokeColor, edgeSoft );
            } else {
                trace("luxury!!");
                pixelShape.fillSoftLine( px, py, qx, qy, strokeWidth, strokeColor, edgeSoft );
            }
        }
        return pixelShape;
    }
}