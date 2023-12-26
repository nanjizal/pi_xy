package pi_xy.triangleGML.triGML.shape.pattern;
import pi_xy.triangleGML.triGML.PatternShape;

//@:structInit
abstract class EllipsePattern_<DRAWTOOL,IMAGETOOL> extends PatternShape<DRAWTOOL,IMAGETOOL> {
    public var left:    Float;
    public var top:     Float;
    public var width:   Float;
    public var height:  Float;
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

                        , left = 0.
                        , top = 0.
                        , width = 1.
                        , height = 1.
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray
            , strokeColor0, strokeColor1, fillColor0, fillColor1
            , strokePatternFill, strokePatternWidth, strokePatternHeight, strokePatternAcross, strokePatternScale
            , fillPatternFill, fillPatternWidth, fillPatternHeight, fillPatternAcross, fillPatternScale );
        this.left   = left;
        this.top    = top;
        this.width  = width;
        this.height = height;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'left':
                left = Std.parseFloat( value );
            case 'top':
                top = Std.parseFloat( value );
            case 'width':
                width = Std.parseFloat( value );
            case 'height':
                height = Std.parseFloat( value );
            case _:
                super.setParameter( name, value );
        }
    }
}