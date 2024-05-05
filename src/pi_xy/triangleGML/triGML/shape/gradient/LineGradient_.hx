package pi_xy.triangleGML.triGML.shape.gradient;
import pi_xy.triangleGML.triGML.BasicGradient;
import iterMagic.ParameterString;

abstract class LineGradient_<DRAWTOOL,IMAGETOOL> extends BasicGradient<DRAWTOOL,IMAGETOOL> {
    public var x1: Float;
    public var y1: Float;
    public var x2: Float;
    public var y2: Float;
    public var strokeWidth: Float;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , x1 = 0.
                        , y1 = 0.
                        , x2 = 0.
                        , y2 = 0.
                        , colorA = 0xFFFF9900
                        , colorB = 0xFFBFFF00
                        , colorC = 0xFF00EAFF
                        , colorD = 0xFF7300FF
                        , strokeWidth = 1.
                        
                        ){
        super( opacity, visibility, [ colorA, colorB, colorC, colorD ] );
        this.x1 = x1;
        this.y1 = y1;
        this.x2 = x2;
        this.y2 = y2;
        this.strokeWidth = strokeWidth;
    }
    public override function setParameter( name: String, value: ParameterString ){
        switch( name ){
            case 'strokeWidth':
                strokeWidth = value;
            case 'x1':
                x1 = value;
            case 'y1':
                y1 = value;
            case 'x2':
                x2 = value;
            case 'y2':
                y2 = value;
            case 'colorA':
                cornerColors[0] = value;
            case 'colorB':
                cornerColors[1] = value;
            case 'colorC':
                cornerColors[2] = value;
            case 'colorD':
                cornerColors[3] = value;
            case 'colorFirst':
                cornerColors[0] = value;
                cornerColors[4] = value;
            case 'colorSecond':
                cornerColors[2] = value;
                cornerColors[3] = value;
            case 'colorTop':
                cornerColors[0] = value;
                cornerColors[2] = value;
            case 'colorBottom':
                cornerColors[4] = value;
                cornerColors[3] = value;
            case _:
                super.setParameter( name, value );
        }
    }
}