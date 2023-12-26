package pi_xy.triangleGML.triGML.shape.pattern;

import pi_xy.triangleGML.triGML.PatternStroke;

//@:structInit
abstract class QuadPattern_<DRAWTOOL,IMAGETOOL> extends PatternStroke<DRAWTOOL,IMAGETOOL> {
    public var aX:      Float;
    public var aY:      Float;
    public var bX:      Float;
    public var bY:      Float;
    public var cX:      Float;
    public var cY:      Float;
    public var dX:      Float;
    public var dY:      Float;
    public function new(  opacity            = 1.
                        , visibility          = true

                        , strokeColor0 = 0x00000000
                        , strokeColor1 = 0x00000000

                        , strokePatternFill = null
                        , strokePatternWidth = null
                        , strokePatternHeight = null
                        , strokePatternAcross = true
                        , strokePatternScale = 1

                        , aX: Float = 0.
                        , aY: Float = 0.
                        , bX: Float = 1.
                        , bY: Float = 0.
                        , cX: Float = 1.
                        , cY: Float = 1.
                        , dX: Float = 0.
                        , dY: Float = 1.
                        ){
        super( opacity, visibility, 0x00000000, 0, null
            , strokeColor0, strokeColor1
            , strokePatternFill, strokePatternWidth, strokePatternHeight, strokePatternAcross, strokePatternScale );
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
                bY = Std.parseFloat( value );
            case 'cX':
                cX = Std.parseFloat( value );
            case 'cY':
                cY = Std.parseFloat( value );
            case 'dX':
                dX = Std.parseFloat( value );
            case 'dY':
                dY = Std.parseFloat( value );
            case _:
                super.setParameter( name, value );
        }
    }
}