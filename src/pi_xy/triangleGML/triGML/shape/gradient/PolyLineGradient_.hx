package pi_xy.triangleGML.triGML.shape.gradient;
import pi_xy.triangleGML.triGML.BasicGradient;
import iterMagic.ParameterString;

enum abstract ColorDirection( String ){
    var widthways = 'widthways';
    var longways = 'longways';
}


abstract class PolyLineGradient_<DRAWTOOL,IMAGETOOL> extends BasicGradient<DRAWTOOL,IMAGETOOL> {
    public var points: Null<Array<Float>>;
    public var strokeWidth: Float;
    public var colorDirection: ColorDirection;
    public function new(  opacity            = 1.
                        , visibility         = true
                        , strokeWidth        = 1.
                        , points             = null
                        , colorDirection = longways
                        , colors            = null
                        ){
        super( opacity, visibility, colors );
        this.strokeWidth = strokeWidth;
        this.colorDirection = colorDirection;
        this.points = points;
    }
    public override function setParameter( name: String, value: ParameterString ): Void {
        switch( name ){
            case 'strokeWidth':
                strokeWidth = value;
            case 'points':
                points = value;
            case 'colorDirection':
                colorDirection = ( value == 'widthways' )? widthways: longways;
            case 'colors':
                cornerColors = value;
            case _:
                super.setParameter( name, value );
        }
    }
}