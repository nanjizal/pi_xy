package pi_xy.triangleGML.triGML.shape.pattern;
import pi_xy.triangleGML.triGML.PatternShape;

//@:structInit
abstract class PathElementPattern_<DRAWTOOL,IMAGETOOL> extends PatternShape<DRAWTOOL,IMAGETOOL> {
    public var pathData: String;
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
                        
                        , strokeColor0 = 0x00000000
                        , strokeColor1 = 0x00000000
                        , fillColor0   = 0x00000000
                        , fillColor1   = 0x00000000
                        , strokePatternFill = null
                        , strokePatternWidth = null
                        , strokePatternHeight = null
                        , strokePatternAcross = true
                        , strokePatternScale = 1
                        , fillPatternFill = null
                        , fillPatternWidth = 16
                        , fillPatternHeight = 16
                        , fillPatternAcross = true
                        , fillPatternScale = 1

                        , pathData = ''
                        , translateX = 0.
                        , translateY = 0.
                        , scaleX = 1.
                        , scaleY = 1.
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray
            , strokeColor0, strokeColor1, fillColor0, fillColor1
            , strokePatternFill, strokePatternWidth, strokePatternHeight, strokePatternAcross, strokePatternScale
            , fillPatternFill, fillPatternWidth, fillPatternHeight, fillPatternAcross, fillPatternScale );
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