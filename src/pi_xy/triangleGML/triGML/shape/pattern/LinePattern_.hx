package pi_xy.triangleGML.triGML.shape.pattern;
import pi_xy.triangleGML.triGML.PatternStroke;


abstract class LinePattern_<DRAWTOOL,IMAGETOOL> extends PatternStroke<DRAWTOOL,IMAGETOOL> {
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

                        , strokeColor0 = 0x00000000
                        , strokeColor1 = 0x00000000

                        , strokePatternFill = null
                        , strokePatternWidth = null
                        , strokePatternHeight = null
                        , strokePatternAcross = true
                        , strokePatternScale = 1

                        , x1 = 0.
                        , y1 = 0.
                        , x2 = 0.
                        , y2 = 0.
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray
            , strokeColor0, strokeColor1
            , strokePatternFill, strokePatternWidth, strokePatternHeight, strokePatternAcross, strokePatternScale );
        this.x1 = x1;
        this.y1 = y1;
        this.x2 = x2;
        this.y2 = y2;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'x1':
                x1 = value;
            case 'y1':
                y1 = value;
            case 'x2':
                x2 = value;
            case 'y2':
                y2 = value;
            case _:
                super.setParameter( name, value );
        }
    }
}