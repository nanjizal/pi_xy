package pi_xy.triangleGML.triGML.shape.pattern;
import pi_xy.triangleGML.triGML.PatternShape;

import pi_xy.triangleGML.triGML.ArcType;

//@:structInit
abstract class ArcPattern_<DRAWTOOL,IMAGETOOL> extends PatternShape<DRAWTOOL,IMAGETOOL> {
    public var left:       Float;
    public var top:        Float;
    public var width:      Float;
    public var height:     Float;
    public var startAngle: Float;
    public var sweepAngle: Float;
    public var arcType:    ArcType;
    var rx:                Float;
    var ry:                Float;
    public function new(  opacity            = 1.
                        , visibility         = true
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
                        , startAngle = 0.
                        , sweepAngle = 0.
                        , arcType = Pie
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray, strokeColor0, strokeColor1, fillColor0, fillColor1, strokePatternFill, strokePatternWidth, strokePatternHeight, strokePatternAcross, strokePatternScale, fillPatternFill, fillPatternWidth, fillPatternHeight, fillPatternAcross, fillPatternScale );
        this.left       = left;
        this.top        = top;
        this.width      = width;
        this.height     = height;
        this.startAngle = startAngle;
        this.sweepAngle = sweepAngle;
        this.arcType    = arcType;
        rx = width/2;
        ry = height/2;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'left':
                left = Std.parseFloat( value );
            case 'top':
                top = Std.parseFloat( value );
            case 'width':
                width =  Std.parseFloat( value );
            case 'height':
                height = Std.parseFloat( value );
            case 'startAngle':
                var degree = Std.parseFloat( value );
                startAngle = ( degree == 0 )? 0: Math.PI*degree/180;
            case 'sweepAngle':
                var degree = Std.parseFloat( value );
                sweepAngle = ( degree == 0 )? 0: Math.PI*degree/180;
            case 'arcType':
                arcType = cast( value, ArcType );
            case _:
                super.setParameter( name, value );
        }
        rx = width/2;
        ry = height/2;
    }
}