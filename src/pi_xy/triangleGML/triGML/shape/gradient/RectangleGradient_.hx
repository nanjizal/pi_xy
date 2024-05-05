package pi_xy.triangleGML.triGML.shape.gradient;
import pi_xy.triangleGML.triGML.FillForm;
import iterMagic.ParameterString;

abstract class RectangleGradient_<DRAWTOOL,IMAGETOOL> extends BasicGradient<DRAWTOOL,IMAGETOOL> {
    public var left:     Float;
    public var top:      Float;
    public var width:    Float;
    public var height:   Float;
    public var rounded:  Bool;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , left = 0.
                        , top = 0.
                        , width = 1.
                        , height = 1.
                        , colorA = 0xFFFF9900
                        , colorB = 0xFFBFFF00
                        , colorC = 0xFF00EAFF
                        , colorD = 0xFF7300FF
                        , rounded = false
                        ){
        super( opacity, visibility, [ colorA, colorB, colorC, colorD ] );
        this.left   = left;
        this.top    = top;
        this.width  = width;
        this.height = height;
        this.rounded = rounded; 
    }
    public override function setParameter( name: String, value: ParameterString ){
        switch( name ){
            case 'left':
                left = value;
            case 'top':
                top = value;
            case 'width':
                width = value;
            case 'height':
                height = value;
            case 'rounded':
                rounded = value;
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