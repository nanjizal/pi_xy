package pi_xy.triangleGML.triGML.shape.gradient;
import pi_xy.triangleGML.triGML.BasicGradient;

@:structInit
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
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'aX':
                aX = Std.parseFloat( value );
            case 'aY':
                aY = Std.parseFloat( value );
            case 'bX':
                bX = Std.parseFloat( value );
            case 'bY':
                bY= Std.parseFloat( value );
            case 'cX':
                cX = Std.parseFloat( value );
            case 'cY':
                cY= Std.parseFloat( value );
            case 'dX':
                dX = Std.parseFloat( value );
            case 'dY':
                dY = Std.parseFloat( value );
            case 'colorA':
                cornerColors[0] = Std.parseInt( value );
            case 'colorB':
                cornerColors[1] = Std.parseInt( value );
            case 'colorC':
                cornerColors[2] = Std.parseInt( value );
            case 'colorD':
                cornerColors[3] = Std.parseInt( value );    
            case _:
                super.setParameter( name, value );
        }
    }
}