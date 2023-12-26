package pi_xy.triangleGML.triGML.shape.contour;
import pi_xy.triangleGML.triGML.BasicShape;

//@:structInit
abstract class PolyLineShape_<DRAWTOOL,IMAGETOOL> extends BasicShape<DRAWTOOL,IMAGETOOL> {
    public var points: Null<Array<Float>>;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeColor        = 0x000000
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        , fill = 0x000000
                        , points = null
                        , edgeSoft = 0.
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray );
        this.points = points;
        this.edgeSoft = edgeSoft;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'points':
                value = value.split('[')[1].split(']')[0];
                points = [ for( n in value.split(',') ) Std.parseFloat( n )  ];
            case _:
                super.setParameter( name, value );
        }
    }
}