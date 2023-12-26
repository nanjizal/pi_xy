package pi_xy.triangleGML.triGML.shape.form;
import pi_xy.triangleGML.triGML.FillForm;

//@:structInit
abstract class PathElementForm_<DRAWTOOL,IMAGETOOL> extends FillForm<DRAWTOOL,IMAGETOOL> {
    public var pathData: String = '';
    public var translateX: Float;
    public var translateY: Float;
    public var scaleX: Float;
    public var scaleY: Float;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeColor        = 0x000000
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        , fill = 0x000000
                        , pathData = ''
                        , translateX = 0.
                        , translateY = 0.
                        , scaleX = 1.
                        , scaleY = 1.
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray, fill );
        this.pathData = pathData;
        this.translateX = translateX;
        this.translateY = translateY;
        this.scaleX     = scaleX;
        this.scaleY     = scaleY;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'pathData':
                pathData =value;
            case 'translateX':
                translateX = Std.parseFloat( value );
            case 'translateY':
                translateY = Std.parseFloat( value );
            case 'scaleX':
                scaleX = Std.parseFloat( value );
            case 'scaleY':
                scaleY = Std.parseFloat( value );
            case _:
                super.setParameter( name, value );
        }
    }
}