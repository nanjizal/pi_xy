package pi_xy.triangleGML.triGML.shape.gradient;
import pi_xy.triangleGML.triGML.FillForm;
import iterMagic.ParameterString;

abstract class PathElementThickGradient_<DRAWTOOL,IMAGETOOL> extends  FillForm<DRAWTOOL,IMAGETOOL> {
    public var pathData: String;
    public var strokeTopColor: Int;
    public var strokeBottomColor: Int;
    public var translateX: Float;
    public var translateY: Float;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeTopColor        = 0xFF000000
                        , strokeBottomColor     = 0xFFFFFFFF
                        , strokeWidth         = 1.
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
        super( opacity, visibility, 0xFF000000, 1., strokeDashGapArray, fill );
        this.pathData = pathData;
        this.strokeTopColor = strokeTopColor;
        this.strokeBottomColor = strokeBottomColor;
        this.strokeWidth = strokeWidth;
        this.translateX = translateX;
        this.translateY = translateY;
        this.scaleX     = scaleX;
        this.scaleY     = scaleY;
    }
    public override function setParameter( name: String, value: ParameterString ){
        switch( name ){
            case 'pathData':
                pathData =value;
            case 'strokeTopColor':
                strokeTopColor = value;
            case 'strokeBottomColor':
                strokeBottomColor = value;
            case 'strokeWidth':
                strokeWidth = value;
            case 'translateX':
                translateX = value;
            case 'translateY':
                translateY = value;
            case 'scaleX':
                scaleX = value;
            case 'scaleY':
                scaleY = value;
            case _:
                super.setParameter( name, value );
        }
    }
}