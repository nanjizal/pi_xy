package pi_xy.triangleGML.triGML.shape.gradient;
import pi_xy.triangleGML.triGML.BasicGradient;

//@:structInit
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
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'centreX': 
                centreX = Std.parseFloat( value );
            case 'centreY':
                centreY = Std.parseFloat( value );
            case 'radiusX':
                radiusX = Std.parseFloat( value );
            case 'radiusY':
                radiusY = Std.parseFloat( value );
            case 'gradientCentreX':
                gradientCentreX = Std.parseFloat( value );
            case 'gradientCentreY':
                gradientCentreY = Std.parseFloat( value );
            case 'colorIn':
                cornerColors[0] = Std.parseInt( value );
            case 'colorOut':
                cornerColors[1] = Std.parseInt( value );  
            case _:
                super.setParameter( name, value );
        }
    }
}