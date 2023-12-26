package pi_xy.triangleGML.triGML.shape.gradient;
import pi_xy.triangleGML.triGML.FillForm;

//@:structInit
abstract class ArrowThickGradient_<DRAWTOOL,IMAGETOOL> extends FillForm<DRAWTOOL,IMAGETOOL> {
    public var x1: Float;
    public var y1: Float;
    public var x2: Float;
    public var y2: Float;
    public var both: Bool;
    public var flare: Bool;
    public var reverseFlare: Bool;
    public var arrowWidth: Float;
    public var arrowHeight: Float;
    public var strokeTopColor: Int;
    public var strokeBottomColor: Int;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeTopColor        = 0xFF000000
                        , strokeBottomColor     = 0xFFFFFFFF
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        , both = false
                        , flare = false
                        , reverseFlare = false
                        , x1 = 0.
                        , y1 = 0.
                        , x2 = 0.
                        , y2 = 0.
                        , arrowWidth = 0.
                        , arrowHeight = 0.
                        ){
        super( opacity, visibility, 0xFF000000, 1., strokeDashGapArray, fill );
        this.both = both;
        this.flare = flare;
        this.reverseFlare;
        this.x1 = x1;
        this.y1 = y1;
        this.x2 = x2;
        this.y2 = y2;
        this.arrowHeight;
        this.arrowWidth;
        this.strokeTopColor = strokeTopColor;
        this.strokeBottomColor = strokeBottomColor;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'both':
                both = ( StringTools.trim( value ).toLowerCase() == 'true' )? true: false;
            case 'flare':
                flare = ( StringTools.trim( value ).toLowerCase() == 'true' )? true: false;
            case 'reverseFlare':
                reverseFlare = ( StringTools.trim( value ).toLowerCase() == 'true' )? true: false;    
            case 'x1':
                x1 = Std.parseFloat( value );
            case 'y1':
                y1 = Std.parseFloat( value );
            case 'x2':
                x2 = Std.parseFloat( value );
            case 'y2':
                y2 = Std.parseFloat( value );
            case 'arrowWidth':
                arrowWidth = Std.parseFloat( value );
            case 'arrowHeight':
                arrowHeight = Std.parseFloat( value );
            case 'strokeTopColor':
                strokeTopColor = Std.parseInt( value );
            case 'strokeBottomColor':
                strokeBottomColor = Std.parseInt( value );    
            case _:
                super.setParameter( name, value );
        }
    }
}