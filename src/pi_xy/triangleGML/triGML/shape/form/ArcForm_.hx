package pi_xy.triangleGML.triGML.shape.form;
import pi_xy.triangleGML.triGML.FillForm;

import pi_xy.triangleGML.triGML.ArcType;

//@:structInit
abstract class ArcForm_<DRAWTOOL,IMAGETOOL> extends FillForm<DRAWTOOL,IMAGETOOL> {
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
                        , fill = 0x000000
                        , left = 0.
                        , top = 0.
                        , width = 1.
                        , height = 1.
                        , startAngle = 0.
                        , sweepAngle = 0.
                        , arcType = Pie
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray, fill );
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