package pi_xy.triangleGML.triGML.shape.gradient;
import pi_xy.triangleGML.triGML.BasicGradient;
import iterMagic.ParameterString;

abstract class TriangleGradient_<DRAWTOOL,IMAGETOOL> extends BasicGradient<DRAWTOOL,IMAGETOOL> {
    public var aX:      Float;
    public var aY:      Float;
    public var bX:      Float;
    public var bY:      Float;
    public var cX:      Float;
    public var cY:      Float;
    public function new(  opacity    = 1.
                        , visibility = true
                        , aX: Float = 0.
                        , aY: Float = 0.
                        , bX: Float = 1.
                        , bY: Float = 0.
                        , cX: Float = 0.
                        , cY: Float = 1.
                        , colorA = 0xFFFF0000
                        , colorB = 0xFF00FF00
                        , colorC = 0xFF0000FF
                        ){
        super( opacity, visibility, [ colorA, colorB, colorC ] );
        this.aX = aX;
        this.aY = aY;
        this.bX = bX;
        this.bY = bY;
        this.cX = cX;
        this.cY = cY;
    }
    public override function setParameter( name: String, value: ParameterString ){
        switch( name ){
            case 'aX':
                aX = value;
            case 'aY':
                aY = value;
            case 'bX':
                bX = value;
            case 'bY':
                bY = value;
            case 'cX':
                cX = value;
            case 'cY':
                cY = value;
            case 'colorA':
                cornerColors[0] = value;
            case 'colorB':
                cornerColors[1] = value;
            case 'colorC':
                cornerColors[2] = value;
            case _:
                super.setParameter( name, value );
        }
    }
}