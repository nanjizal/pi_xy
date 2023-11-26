package pi_xy.triangleGML.triGML.shape.contour;
import pi_xy.triangleGML.triGML.BasicShape;

@:structInit
abstract class EllipseShape_<DRAWTOOL,IMAGETOOL> extends BasicShape<DRAWTOOL,IMAGETOOL> {
    public var left:    Float;
    public var top:     Float;
    public var width:   Float;
    public var height:  Float;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeColor        = 0x000000
                        , left = 0.
                        , top = 0.
                        , width = 1.
                        , height = 1.
                        ){
        super( opacity, visibility, strokeColor, 0., null );
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