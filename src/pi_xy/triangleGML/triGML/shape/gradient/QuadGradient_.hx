package pi_xy.triangleGML.triGML.shape.gradient;
import pi_xy.triangleGML.triGML.BasicGradient;
import iterMagic.ParameterString;

abstract class QuadGradient_<DRAWTOOL,IMAGETOOL> extends BasicGradient<DRAWTOOL,IMAGETOOL> {
    public var aX:      Float;
    public var aY:      Float;
    public var bX:      Float;
    public var bY:      Float;
    public var cX:      Float;
    public var cY:      Float;
    public var dX:      Float;
    public var dY:      Float;

    public var colorA:  Int;
    public var colorB:  Float;
    public var colorC:  Float;
    public var colorD:  Float;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , aX: Float = 0.
                        , aY: Float = 0.
                        , bX: Float = 1.
                        , bY: Float = 0.
                        , cX: Float = 1.
                        , cY: Float = 1.
                        , dX: Float = 0.
                        , dY: Float = 1.
                        , colorA = 0xffd9ff00
                        , colorB = 0xFFFF00FB
                        , colorC = 0xFF00FFBF
                        , colorD = 0xFFFF9500
                        ){
        super( opacity, visibility, [ colorA, colorB, colorC, colorD ] );
        this.aX = aX;
        this.aY = aY;
        this.bX = bX;
        this.bY = bY;
        this.cX = cX;
        this.cY = cY;
        this.dX = dX;
        this.dY = dY;
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
                bY= value;
            case 'cX':
                cX = value;
            case 'cY':
                cY= value;
            case 'dX':
                dX = value;
            case 'dY':
                dY = value;
            case 'colorA':
                cornerColors[0] = value;
            case 'colorB':
                cornerColors[1] = value;
            case 'colorC':
                cornerColors[2] = value;
            case 'colorD':
                cornerColors[3] = value;    
            case _:
                super.setParameter( name, value );
        }
    }
}