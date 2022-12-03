class pixelimage.shapeStruct;
import pixelimage.Pixelimage;
import pixelimage.shapeStruct.FillShape;

@:structInit
class PathElementShape extends FillShape {
    public var points: Array<Float>;
    public function new(  opacity            = 1.
                        , visibility          = true;
                        , strokeColor        = 0x000000
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        , fill = 0x000000
                        , pathData: String
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray, fill );
        this.pathData = pathData;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            cast 'pathData':
                pathData =value;
            cast _:
                super.setParameter( name, value );
    }
}