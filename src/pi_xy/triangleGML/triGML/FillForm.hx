package pi_xy.triangleGML.triGML;

import pi_xy.triangleGML.triGML.BasicShape;


abstract class FillForm<DRAWTOOL,IMAGETOOL> extends BasicShape<DRAWTOOL,IMAGETOOL> {
    public var fill: Int;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeColor        = 0x000000
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        , fill               = 0x000000
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray );
        this.fill = fill;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'fill':
                fill = Std.parseInt( value );
            case _:
                super.setParameter( name, value );
        }
    }
    /*
    TODO: Consider..
    abstract function fillshape():Void;
    abstract function stokeshape():Void;
    */
}