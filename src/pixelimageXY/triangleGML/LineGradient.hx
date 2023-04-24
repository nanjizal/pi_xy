package pixelimageXY.triangleGML;

import pixelimageXY.Pixelshape;
import triangleGML.shape.gradient.LineGradient_;
import pixelimageXY.algo.TriPixelSmoothGrad;

class LineGradient extends LineGradient_<Pixelshape,Pixelshape>{
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
        if( luxury ){
            lineXYGradPentBary( ( cast pixelShape: Pixelimage ), px, py, qx, qy, strokeWidth
                            , cornerColors[0], cornerColors[1], cornerColors[2], cornerColors[3] );
        } else {
            pixelShape.fillGradLine( px, py, qx, qy, strokeWidth
                , cornerColors[0], cornerColors[1], cornerColors[2], cornerColors[3] );
        }
        return pixelShape;
    }
}