package pi_xy.triangleGML.triGML.shape.form;
import pi_xy.triangleGML.triGML.FillForm;

@:structInit
abstract class StarForm_<DRAWTOOL,IMAGETOOL> extends FillForm<DRAWTOOL,IMAGETOOL> {
    public var left:    Float;
    public var top:     Float;
    public var width:   Float;
    public var height:  Float;
    public var diameter: Float;
    public var sides:    Float;
    public var innerRadius: Null<Float>;

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
                        , sides = 6
                        , innerRadius = null
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray, fill );
        this.left      = left;
        this.top       = top;
        this.diameter  = diameter;
        this.sides     = sides; // defaults to 6 as this can be created with just two triangles so fairly optimal
        this.innerRadius = innerRadius; // if null assumes the star is like overlapping triangle, consider odd..
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'left':
                left = Std.parseFloat( value );
            case 'top':
                top = Std.parseFloat( value );
            case 'diameter':
                diameter = Std.parseFloat( value );
            case 'sides':
                sides = Std.parseInt( value );
            case 'innerRadius':
                innerRadius = Std.parseFloat( value );
            case _:
                super.setParameter( name, value );
        }
    }
}