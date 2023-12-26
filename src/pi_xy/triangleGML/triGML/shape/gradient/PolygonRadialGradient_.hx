package pi_xy.triangleGML.triGML.shape.gradient;
import pi_xy.triangleGML.triGML.BasicGradient;

//@:structInit
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
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'points':
                value = value.split('[')[1].split(']')[0];
                points = [ for( n in value.split(',') ) Std.parseFloat( n )  ]; 
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