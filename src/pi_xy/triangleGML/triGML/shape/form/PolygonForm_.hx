package pi_xy.triangleGML.triGML.shape.form;
import pi_xy.triangleGML.triGML.FillForm;

@:structInit
abstract class PolygonForm_<DRAWTOOL,IMAGETOOL> extends FillForm<DRAWTOOL,IMAGETOOL> {
    public var points:Null<Array<Float>>;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeColor        = 0x000000
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        , fill = 0x000000
                        , points = null
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray, fill );
        this.points = points;
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