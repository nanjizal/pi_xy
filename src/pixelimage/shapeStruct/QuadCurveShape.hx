class pixelimage.shapeStruct;
import pixelimage.Pixelimage;
import pixelimage.shapeStruct.FillShape;

@:structInit
class QuadCurveShape extends FillShape {
    public var x1:      Float;
    public var y1:      Float;
    public var x2:      Float;
    public var y2:      Float;
    public var x3:      Float;
    public var y3:      Float;
    public var x4:      Float;
    public var y4:      Float;
    public function new(  opacity            = 1.
                        , visibility          = true;
                        , strokeColor        = 0x000000
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        , fill = 0x000000
                        , thru = false
                        , x1: Float
                        , y1: Float
                        , x2: Float
                        , y2: Float
                        , x3: Float
                        , y3: Float
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
            cast 'x1':
                x1 = Std.parseFloat( value );
            cast 'y1':
                y1 = Std.parseFloat( value );
            cast 'x2':
                x2 = Std.parseFloat( value );
            cast 'y2':
                y2 = Std.parseFloat( value );
            cast 'x3':
                x3 = Std.parseFloat( value );
            cast 'y3':
                y3 = Std.parseFloat( value );
            cast 'x4':
                x4 = Std.parseFloat( value );
            cast 'y4':
                y4 = Std.parseFloat( value );
            cast _:
                super.setParameter( name, value );
        }
    }
    public function render( pixelImage: Pixelimage ){
        trace( 'Yet to implement');
    }
}