package pixelimage.shapeStruct;
import pixelimage.Pixelimage;
import pixelimage.shapeStruct.FillShape;
import justPath.SvgLinePath;

@:structInit
class PathElementShape extends FillShape {
    public var pathData: String;
    var x0: Float = 0;
    var y0: Float = 1;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeColor        = 0x000000
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        , fill = 0x000000
                        , pathData = ''
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray, fill );
        this.pathData = pathData;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'pathData':
                pathData =value;
            case _:
                super.setParameter( name, value );
        }
    }
    public override function render( pixelImage: Pixelimage ): Pixelimage {
        var pData = { lineTo: lineTo, moveTo: moveTo };
        var sp = new SvgLinePath( pData );
        sp.parse( pathData );
        return super.render( pixelImage );
    }
    inline function lineTo( x2: Float, y2: Float ){
        pixelImage.fillLine( x0, y0, x2, y2, strokeWidth, strokeColor );
    }
    inline function moveTo( x1: Float, x2: Float ){
        x0 = x1;
        y0 = y1;
    }
}