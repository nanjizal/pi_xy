package pixelimageXY.triangleGML.shape;

import pixelimageXY.triangleGML.coreShape.FillShape;
import pixelimageXY.Pixelimage;
import pixelimageXY.Pixelshape;

@:structInit
class TriangleShape extends FillShape {
    public var x1:      Float;
    public var y1:      Float;
    public var x2:      Float;
    public var y2:      Float;
    public var x3:      Float;
    public var y3:      Float;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeColor        = 0x000000
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        , fill = 0x000000
                        , x1 = 0.
                        , y1 = 0.
                        , x2 = 0.
                        , y2 = 0.
                        , x3 = 0.
                        , y3 = 0.
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray, fill );
        this.x1 = x1;
        this.y1 = y1;
        this.x2 = x2;
        this.y2 = y2;
        this.x3 = x3;
        this.y3 = y3;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'x1':
                x1 = Std.parseFloat( value );
            case 'y1':
                y1 = Std.parseFloat( value );
            case 'x2':
                x2 = Std.parseFloat( value );
            case 'y2':
                y2 = Std.parseFloat( value );
            case 'x3':
                x3 = Std.parseFloat( value );
            case 'y3':
                y3 = Std.parseFloat( value );
            case _:
                super.setParameter( name, value );
        }
    }
    public override function render( pixelShape: Pixelshape ): Pixelshape {
        pixelShape.fillTri( x1, y1, x2, y2, x3, y3, fill );
        //TODO improve corners of line fill
        pixelShape.fillLine( x1, y1, x2, y2, strokeWidth, strokeColor );
        pixelShape.fillLine( x2, y2, x3, y3, strokeWidth, strokeColor );
        pixelShape.fillLine( x3, y3, x1, y1, strokeWidth, strokeColor );
        return super.render( pixelShape );
    }
}