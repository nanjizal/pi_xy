package pixelimage.triGML.contour;
import pixelimage.Pixelimage;
import pixelimage.triGML.coreShape.FillShape;
import pixelimage.triGML.coreShape.DrawShapeHelper; 

@:structInit
class CubicCurveShape extends FillShape {
    public var x1:      Float;
    public var y1:      Float;
    public var x2:      Float;
    public var y2:      Float;
    public var x3:      Float;
    public var y3:      Float;
    public var x4:      Float;
    public var y4:      Float;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeColor        = 0x000000
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        , fill = 0x000000
                        , thru = false
                        , x1 = 0.
                        , y1 = 0.
                        , x2 = 0.
                        , y2 = 0.
                        , x3 = 0.
                        , y3 = 0.
                        , x4 = 0.
                        , y4 = 0.
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray, fill );
        this.x1 = x1;
        this.y1 = y1;
        this.x2 = x2;
        this.y2 = y2;
        this.x3 = x3;
        this.y3 = y3;
        this.x4 = x4;
        this.y4 = y4;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'thru':
                var bools = StringTools.trim( value ).toLowerCase();
                thru = ( bools == 'true' || bools == '1' )? true: false; 
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
            case 'x4':
                x4 = Std.parseFloat( value );
            case 'y4':
                y4 = Std.parseFloat( value );
            case _:
                super.setParameter( name, value );
        }
    }
    public override function render( pixelImage: Pixelimage ): Pixelimage {
        var drawing = new DrawShapeHelper( pixelImage, strokeWidth, strokeColor );
        drawing.moveTo( x1, y1 );
        drawing.curveTo( x2, y2, x3, y3, x4, y4 );
        return super.render( pixelImage );
    }
}