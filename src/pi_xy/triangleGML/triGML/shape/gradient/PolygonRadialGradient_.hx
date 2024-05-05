package pi_xy.triangleGML.triGML.shape.gradient;
import pi_xy.triangleGML.triGML.BasicGradient;
import iterMagic.ParameterString;

abstract class PolygonRadialGradient_<DRAWTOOL,IMAGETOOL> extends BasicGradient<DRAWTOOL,IMAGETOOL> {
    public var points:Null<Array<Float>>;
    public var colorIn: Int;
    public var colorOut: Int;
    public var gradientCentreX: Float;
    public var gradientCentreY: Float;
    public var gradientRotation: Float;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , points  = null
                        , colorIn = 0xFFFFFF00
                        , colorOut = 0xFF0000FF
                        , gradientCentreX = 0.
                        , gradientCentreY = 0.
                        ){
        super( opacity, visibility, [ colorIn, colorOut ] );
        this.points = points;
        this.gradientCentreY = gradientCentreX;
        this.gradientCentreY = gradientCentreY;
    }
    public override function setParameter( name: String, value: ParameterString ){
        switch( name ){
            case 'points':
                points = value]; 
            case 'gradientCentreX':
                gradientCentreX = value;
            case 'gradientCentreY':
                gradientCentreY = value;
            case 'colorIn':
                cornerColors[0] = value;
            case 'colorOut':
                cornerColors[1] = value;  
            case _:
                super.setParameter( name, value );
        }
    }
}