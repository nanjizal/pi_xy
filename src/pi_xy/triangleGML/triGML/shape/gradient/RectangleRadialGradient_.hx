package pi_xy.triangleGML.triGML.shape.gradient;
import pi_xy.triangleGML.triGML.BasicGradient;
import iterMagic.ParameterString;

abstract class RectangleRadialGradient_<DRAWTOOL,IMAGETOOL> extends BasicGradient<DRAWTOOL,IMAGETOOL> {
    public var centreX: Float;
    public var centreY: Float;
    public var radiusX: Float;
    public var radiusY: Float;
    public var colorIn: Int;
    public var colorOut: Int;
    public var gradientCentreX: Float;
    public var gradientCentreY: Float;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , centreX = 30
                        , centreY = 30
                        , radiusX = 10
                        , radiusY = 10
                        , colorIn = 0xFFFFFF00
                        , colorOut = 0xFF0000FF
                        , gradientCentreX = -1.
                        , gradientCentreY = -1.
                        ){
        super( opacity, visibility, [ colorIn, colorOut ] );
        this.centreX = centreX;
        this.centreY = centreY;
        this.radiusX = radiusX;
        this.radiusY = radiusY;
        this.gradientCentreY = gradientCentreX;
        this.gradientCentreY = gradientCentreY;
    }
    public override function setParameter( name: String, value: ParameterString ){
        switch( name ){
            case 'centreX': 
                centreX = value;
            case 'centreY':
                centreY = value;
            case 'radiusX':
                radiusX = value;
            case 'radiusY':
                radiusY = value;
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