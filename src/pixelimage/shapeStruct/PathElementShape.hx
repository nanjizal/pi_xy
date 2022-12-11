package pixelimage.shapeStruct;
import pixelimage.Pixelimage;
import pixelimage.shapeStruct.FillShape;
import justPath.SvgLinePath;
import justPath.ILinePathContext;
import justPath.LinePathContextTrace;

@:structInit
class PathElementShape extends FillShape implements ILinePathContext {
    public var pathData: String;
    public var translateX: Float;
    public var translateY: Float;
    public var scaleX: Float;
    public var scaleY: Float;
    var x0: Float = 0.;
    var y0: Float = 0.;
    var temp: Pixelimage;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeColor        = 0x000000
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        , fill = 0x000000
                        , pathData = ''
                        , translateX = 0.
                        , translateY = 0.
                        , scaleX = 1.
                        , scaleY = 1.
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray, fill );
        this.pathData = pathData;
        this.translateX = translateX;
        this.translateY = translateY;
        this.scaleX     = scaleX;
        this.scaleY     = scaleY;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'pathData':
                pathData =value;
            case 'translateX':
                translateX = Std.parseFloat( value );
            case 'translateY':
                translateY = Std.parseFloat( value );
            case 'scaleX':
                scaleX = Std.parseFloat( value );
            case 'scaleY':
                scaleY = Std.parseFloat( value );
            case _:
                super.setParameter( name, value );
        }
    }
    public override function render( pixelImage: Pixelimage ): Pixelimage {
        //var pData = { lineTo: lineTo, moveTo: moveTo };
        trace( 'render pathData ' + pathData );
        temp = new Pixelimage( Math.ceil( pixelImage.width ), Math.ceil( pixelImage.height ) );
        temp.transparent = true;
        var sp = new SvgLinePath( this );
        sp.parse( pathData );
        pixelImage.putPixelImage( temp, Std.int( 0 ), Std.int( 0 ) );
        temp = null;
        //var sp2 = new SvgLinePath( new LinePathContextTrace() );
        //sp2.parse( pathData );
        return super.render( pixelImage );
    }
    public
    function lineTo( x2: Float, y2: Float ){
        temp.fillLine( x0*scaleX + translateX, y0*scaleY + translateY
                     , x2*scaleX + translateX, y2*scaleY + translateY 
                     , strokeWidth, strokeColor );
        //temp.fillGradLine( 3*x0, 3*y0, 3*x2, 3*y2, strokeWidth, strokeColor, strokeColor, 0xFF00FF00, 0xFF00FF00 );
        //temp.fillGradLine( x0, y0, x2, y2, strokeWidth,strokeColor, strokeColor, 0xFF00FF00, 0xFF00FF00  );
        //temp.fillGradLine( x0, y0, x2+0.5, y2+0.5, strokeWidth, strokeColor, strokeColor, 0xFF00FF00, 0xFF00FF00 );
        //temp.fillSquare( x2, y2, strokeWidth/2, strokeColor );
        //strokeColor = Std.random(0xFFFFFF) + 0xFF000000;
        x0 = x2;
        y0 = y2;
    }
    public
    function moveTo( x1: Float, y1: Float ){
        x0 = x1;
        y0 = y1;
    }
}