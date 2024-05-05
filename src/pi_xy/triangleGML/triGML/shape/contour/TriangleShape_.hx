package pi_xy.triangleGML.triGML.shape.contour;
import pi_xy.triangleGML.triGML.BasicShape;
import iterMagic.ParameterString;

abstract class Triangle_<DRAWTOOL,IMAGETOOL> extends BasicShape<DRAWTOOL,IMAGETOOL> {
    public var aX:      Float;
    public var aY:      Float;
    public var bX:      Float;
    public var bY:      Float;
    public var cX:      Float;
    public var cY:      Float;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeColor        = 0xFFF00000

                        , aX: Float = 0.
                        , aY: Float = 0.
                        , bX: Float = 1.
                        , bY: Float = 0.
                        , cX: Float = 1.
                        , cY: Float = 1.
                        ){
        super( opacity, visibility, strokeColor, 0., null );
        this.aX = aX;
        this.aY = aY;
        this.bX = bX;
        this.bY = bY;
        this.cX = cX;
        this.cY = cY;
    }
    public override function setParameter( name: String, value: ParameterString ){
        switch( name ){
            case 'aX':
                aX = value;
            case 'aY':
                aY = value;
            case 'bX':
                bX = value;
            case 'bY':
                bY = value;
            case 'cX':
                cX = value;
            case 'cY':
                cY = value;                         
            case _:
                super.setParameter( name, value );
        }
    }
}