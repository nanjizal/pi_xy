package pixelimage.shapeStruct;
import pixelimage.Pixelimage;
import pixelimage.shapeStruct.FillShape;

@:structInit
class EllipseArcShape extends FillShape {
    public var left:    Float;
    public var top:     Float;
    public var width:   Float;
    public var height:  Float;
    public var startAngle: Float;
    public var sweepAngle: Float;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeColor        = 0x000000
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        , fill = 0x000000
                        , left = 0.
                        , top = 0.
                        , width = 1.
                        , height = 1.
                        , startAngle = 0.
                        , sweepAngle = 0.
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray, fill );
        this.left   = left;
        this.top    = top;
        this.width  = width;
        this.height = height;
        this.startAngle = startAngle;
        this.sweepAngle = sweepAngle;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'left':
                left = Std.parseFloat( value );
            case 'top':
                top = Std.parseFloat( value );
            case 'width':
                width = Std.parseFloat( value );
            case 'height':
                height = Std.parseFloat( value );
            case 'startAngle':
                var degree = Std.parseFloat( value );
                startAngle = ( degree == 0 )? 0: Math.PI*degree/180;
            case 'sweepAngle':
                var degree = Std.parseFloat( value );
                sweepAngle = ( degree == 0 )? 0: Math.PI*degree/180;
            case _:
                super.setParameter( name, value );
        }
    }
    public override function render( pixelImage: Pixelimage ){
        trace( 'no implemented yet' );
    }
}