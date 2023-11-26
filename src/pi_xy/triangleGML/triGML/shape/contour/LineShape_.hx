package pi_xy.triangleGML.triGML.shape.contour;
import pi_xy.triangleGML.triGML.BasicShape;

@:structInit
abstract class LineShape_<DRAWTOOL,IMAGETOOL> extends BasicShape<DRAWTOOL,IMAGETOOL> {
    public var x1: Float;
    public var y1: Float;
    public var x2: Float;
    public var y2: Float;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeColor        = 0xFFF00000
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        , x1 = 0.
                        , y1 = 0.
                        , x2 = 0.
                        , y2 = 0.
                        , edgeSoft = 0.
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray );
        this.x1 = x1;
        this.y1 = y1;
        this.x2 = x2;
        this.y2 = y2;
        this.edgeSoft = edgeSoft;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'x1':
                x1 = Std.parseFloat( value );
            case 'y1':
                y1 = Std.parseFloat( value );
            case 'x2':
                x2 = Std.parseFloat( value );
            case 'y2':
                y2 = Std.parseFloat( value );         
            case _:
                super.setParameter( name, value );
        }
    }
}