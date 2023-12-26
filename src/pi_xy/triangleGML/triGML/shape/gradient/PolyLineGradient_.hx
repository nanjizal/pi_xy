package pi_xy.triangleGML.triGML.shape.gradient;
import triangleGML.triGML.BasicGradient;

enum abstract ColorDirection( String ){
    var widthways = 'widthways';
    var longways = 'longways';
}

//@:structInit
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
    public override function setParameter( name: String, value: String ): Void {
        switch( name ){
            case 'strokeWidth':
                strokeWidth = Std.parseFloat( value );
            case 'points':
                value = value.split('[')[1].split(']')[0];
                points = [ for( n in value.split(',') ) Std.parseFloat( n )  ];
            case 'colorDirection':
                colorDirection = ( value == 'widthways' )? widthways: longways;
            case 'colors':
                value = value.split('[')[1].split(']')[0];
                cornerColors = [ for( n in value.split(',') ) Std.parseInt( n )  ];
            case _:
                super.setParameter( name, value );
        }
    }
}