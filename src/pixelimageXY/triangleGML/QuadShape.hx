package pixelimageXY.triangleGML;

import pixelimageXY.Pixelshape;
import triangleGML.shape.contour.QuadShape_;

class QuadShape extends QuadShape_<Pixelshape,Pixelshape>{
    public var luxury:  Bool;
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'luxury':
                luxury = ( StringTools.trim( value ).toLowerCase() == 'true' )? true: false;          
            case _:
                super.setParameter( name, value );
        }
    }
    public function render( pixelShape: Pixelshape ): Pixelshape {
        this.hitObj = cast if( edgeSoft == 0. ){
            pixelShape.fillQuad( aX+offX, aY+offY, bX+offX, bY+offY, cX+offX, cY+offY, dX+offX, dY+offY, strokeColor, true );
        } else {
            if( luxury ){
                pixelShape.fillSoftQuadQuarter( aX+offX, aY+offY, bX+offX, bY+offY, cX+offX, cY+offY, dX+offX, dY+offY, strokeColor, edgeSoft, true, true, true, true );
            } else {
                pixelShape.fillSoftQuad( aX+offX, aY+offY, bX+offX, bY+offY, cX+offX, cY+offY, dX+offX, dY+offY, strokeColor, edgeSoft, true, true, true, true );
            }
        }
        return pixelShape;
    }
    public override function clear( pixelShape: Pixelshape, color: Int ): Pixelshape {
        pixelShape.fillQuad( aX+offX, aY+offY, bX+offX, bY+offY, cX+offX, cY+offY, dX+offX, dY+offY, color, false );
        return pixelShape;
    }
}