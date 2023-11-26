package pi_xy.triangleGML;

import pi_xy.Pixelimage;
import pi_xy.triangleGML.triGML.shape.contour.QuadShape_;

class QuadShape extends QuadShape_<Pixelimage,Pixelimage>{
    public var luxury:  Bool;
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'luxury':
                luxury = ( StringTools.trim( value ).toLowerCase() == 'true' )? true: false;          
            case _:
                super.setParameter( name, value );
        }
    }
    public function render( pixelImage: Pixelimage ): Pixelimage {
        this.hitObj = cast if( edgeSoft == 0. ){
            pixelImage.fillShape.quad( aX+offX, aY+offY, bX+offX, bY+offY, cX+offX, cY+offY, dX+offX, dY+offY, strokeColor, true );
        } else {
            if( luxury ){
                pixelImage.softShape.quadQuarter( aX+offX, aY+offY, bX+offX, bY+offY, cX+offX, cY+offY, dX+offX, dY+offY, strokeColor, edgeSoft, true, true, true, true );
            } else {
                pixelImage.softShape.quad( aX+offX, aY+offY, bX+offX, bY+offY, cX+offX, cY+offY, dX+offX, dY+offY, strokeColor, edgeSoft, true, true, true, true );
            }
        }
        return pixelImage;
    }
    public override function clear( pixelImage: Pixelimage, color: Int ): Pixelimage {
        pixelImage.fillShape.quad( aX+offX, aY+offY, bX+offX, bY+offY, cX+offX, cY+offY, dX+offX, dY+offY, color, false );
        return pixelImage;
    }
}