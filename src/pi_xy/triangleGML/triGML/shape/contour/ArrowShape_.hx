package pi_xy.triangleGML.triGML.shape.contour;
import pi_xy.triangleGML.triGML.BasicShape;

// TODO: add option for OpenArrow
//@:structInit
abstract class ArrowShape_<DRAWTOOL,IMAGETOOL> extends BasicShape<DRAWTOOL,IMAGETOOL> {
    public var x1: Float;
    public var y1: Float;
    public var x2: Float;
    public var y2: Float;
    public var both: Bool;
    public var flare: Bool;
    public var reverseFlare: Bool;
    public var arrowWidth: Float;
    public var arrowHeight: Float;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeColor        = 0xFFF00000
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
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray );
        this.both = both;
        this.flare = flare;
        this.reverseFlare = reverseFlare;
        this.x1 = x1;
        this.y1 = y1;
        this.x2 = x2;
        this.y2 = y2;
        this.arrowHeight = arrowHeight;
        this.arrowWidth = arrowWidth;
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
            case _:
                super.setParameter( name, value );
        }
    }
}