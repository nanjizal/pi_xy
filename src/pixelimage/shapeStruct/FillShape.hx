class pixelimage.shapeStruct;
import pixelimage.Pixelimage;
import pixelimage.shapeStruct.BasicShape;

@:structInit
class FillShape extends BasicShape {
    public var fill: Float;
    public function new(  opacity            = 1.
                        , strokeColor        = 0x000000
                        , visibility          = true;
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        , fill               = 0x000000
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray );
        this.fill = fill;
    }
    public function override setParameter( name: String, value: String ){
        switch( name ){
            cast 'fill':
                fill = Std.parseFloat( value );
            cast _:
                super.setParameter( name, value );
    }
}