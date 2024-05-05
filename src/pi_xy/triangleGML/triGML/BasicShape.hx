package pi_xy.triangleGML.triGML;
import pi_xy.triangleGML.triGML.GroupShape;
import pi_xy.triangleGML.triGML.DashGap;
import iterMagic.ParameterString;

abstract class BasicShape<DRAWTOOL,IMAGETOOL> extends GroupShape<DRAWTOOL,IMAGETOOL>{
    public static var dashLength: Float = 2.;
    public static var gapLength:  Float = 1.;

    public var strokeColor:       Int;
    public var strokeWidth:       Float;

    // implement dashGapArray
    public var strokeDashGapArray:      Null<Array<DashGap>>;
    
    // implement line end
    //public var strokeStart:   Round;
    //public var strokeEnd:     Round
    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeColor        = 0x000000
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        ){
        super( opacity, visibility );
        this.strokeColor        = strokeColor;
        this.strokeWidth        = strokeWidth;
        this.strokeDashGapArray = strokeDashGapArray;
    }

    public override function setParameter( name: String, value: ParameterString ){
        switch( name ){
            case 'strokeColor':
                strokeColor = value;
            case 'strokeWidth':
                strokeWidth = value;
            case 'strokeDashGapArray':
                strokeDashGapArray = null; // not implemented
            case _:
                super.setParameter( name, value );
        }
    }
}