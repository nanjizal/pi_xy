package pixelimageXY.triangleGML.gradient;

import pixelimageXY.Pixelimage;
import pixelimageXY.Pixelshape;
import pixelimageXY.triangleGML.coreShape.BasicGradient;

@:structInit
class TriangleGradient extends BasicGradient {
    public var aX:      Float;
    public var aY:      Float;
    public var bX:      Float;
    public var bY:      Float;
    public var cX:      Float;
    public var cY:      Float;
    public function new(  opacity    = 1.
                        , visibility = true
                        , aX: Float = 0.
                        , aY: Float = 0.
                        , bX: Float = 1.
                        , bY: Float = 0.
                        , cX: Float = 0.
                        , cY: Float = 1.
                        , colorA = 0xFFFF0000
                        , colorB = 0xFF00FF00
                        , colorC = 0xFF0000FF
                        ){
        super( opacity, visibility, [ colorA, colorB, colorC ] );
        this.aX = aX;
        this.aY = aY;
        this.bX = bX;
        this.bY = bY;
        this.cX = cX;
        this.cY = cY;
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
            case 'colorA':
                cornerColors[0] = Std.parseInt( value );
            case 'colorB':
                cornerColors[1] = Std.parseInt( value );
            case 'colorC':
                cornerColors[2] = Std.parseInt( value );
            case _:
                super.setParameter( name, value );
        }
    }
    public override function render( pixelShape: Pixelshape ): Pixelshape {
        pixelShape.fillGradTri( aX + offX, aY+offY, cornerColors[0], bX+offX, bY+offY, cornerColors[1], cX+offX, cY+offY, cornerColors[2] );
        return super.render( pixelShape );
    }
}