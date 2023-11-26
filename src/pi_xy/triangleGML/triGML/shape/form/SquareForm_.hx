package pi_xy.triangleGML.triGML.shape.form;
import pi_xy.triangleGML.triGML.FillForm;
// TODO: consider extending RectangleForm 
@:structInit
abstract class SquareForm_<DRAWTOOL,IMAGETOOL> extends FillForm<DRAWTOOL,IMAGETOOL> {
    public var left:    Float;
    public var top:     Float;
    public var width:   Float;
    public var height:  Float;
    public var diameter: Float;
    public var rounded: Bool;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeColor        = 0x000000
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        , fill = 0x000000
                        , left = 0.
                        , top = 0.
                        , diameter = 1.
                        , rounded = false
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray, fill );
        this.left      = left;
        this.top       = top;
        this.diameter  = diameter;
        this.rounded   = rounded;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'left':
                left = Std.parseFloat( value );
            case 'top':
                top = Std.parseFloat( value );
            case 'diameter':
                diameter = Std.parseFloat( value );
            case 'rounded':
                rounded = ( StringTools.trim( value ).toLowerCase() == 'true' )? true: false;
            case _:
                super.setParameter( name, value );
        }
    }
}