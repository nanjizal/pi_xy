package pixelimage.triGML.contour;
import pixelimage.Pixelimage;
import pixelimage.triGML.coreShape.FillShape;
import pixelimage.draw.DrawShapeHelper;


@:structInit
class QuadCurveShape extends FillShape {
    public var x1:      Float;
    public var y1:      Float;
    public var x2:      Float;
    public var y2:      Float;
    public var x3:      Float;
    public var y3:      Float;
    public var thru:    Bool;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeColor        = 0x000000
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        , fill = 0x000000
                        , thru = false
                        , x1: Float = 0.
                        , y1: Float = 0.
                        , x2: Float = 0.
                        , y2: Float = 0.
                        , x3: Float = 0.
                        , y3: Float = 0.
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray, fill );
        this.thru = thru;
        this.x1 = x1;
        this.y1 = y1;
        this.x2 = x2;
        this.y2 = y2;
        this.x3 = x3;
        this.y3 = y3;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'thru':
                thru = ( value.toLowerCase() == 'true' )? true: false;
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
        var drawing = new DrawShapeHelper( pixelShape, strokeWidth, strokeColor );
        drawing.moveTo( x1, y1 );
        drawing.quadTo( x2, y2, x3, y3 );
        return super.render( pixelShape );
    }
}