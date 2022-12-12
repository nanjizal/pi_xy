package pixelimage.shapeStruct;
import pixelimage.Pixelimage;
import pixelimage.shapeStruct.FillShape;
import justPath.SvgLinePath;
import justPath.ILinePathContext;
import justPath.LinePathContextTrace;

@:structInit
class PathElementThickGradient extends FillShape implements ILinePathContext {
    public var pathData: String;
    public var strokeTopColor: Int;
    public var strokeBottomColor: Int;
    public var translateX: Float;
    public var translateY: Float;
    public var scaleX: Float;
    public var scaleY: Float;
    var x0: Float = 0.;
    var y0: Float = 0.;
    var temp: Pixelimage;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeTopColor        = 0xFF000000
                        , strokeBottomColor     = 0xFFFFFFFF
                        , strokeWidth         = 1.
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
        super( opacity, visibility, 0xFF000000, 1., strokeDashGapArray, fill );
        this.pathData = pathData;
        this.strokeTopColor = strokeTopColor;
        this.strokeBottomColor = strokeBottomColor;
        this.strokeWidth = strokeWidth;
        this.translateX = translateX;
        this.translateY = translateY;
        this.scaleX     = scaleX;
        this.scaleY     = scaleY;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'pathData':
                pathData =value;
            case 'strokeTopColor':
                strokeTopColor = Std.parseInt( value );
            case 'strokeBottomColor':
                strokeBottomColor = Std.parseInt( value );
            case 'strokeWidth':
                strokeWidth = Std.parseFloat( value );
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
    var toggleDraw = true;
    var info: {ax: Float, ay: Float, bx: Float, by: Float, cx: Float, cy: Float, dx: Float, dy: Float };
    public
    function lineSegmentTo( x2: Float, y2: Float ){
        if( toggleDraw ){
            var oldInfo = info;
            info = temp.fillGradLine( x0*scaleX + translateX, y0*scaleY + translateY
                     , x2*scaleX + translateX, y2*scaleY + translateY 
                     , strokeWidth
                     , strokeTopColor, strokeTopColor, strokeBottomColor, strokeBottomColor );
            if( info != null && oldInfo != null ){
                temp.fillGradQuad( oldInfo.bx*scaleX + translateX, oldInfo.by*scaleY + translateY, strokeTopColor
                                , info.ax*scaleX + translateX, info.ay*scaleY + translateY, strokeTopColor
                                , info.dx*scaleX + translateX, info.dy*scaleY + translateY, strokeBottomColor
                                , oldInfo.cx*scaleX + translateX, oldInfo.cy*scaleY + translateY, strokeBottomColor );
            }
        } else {
            
        }
        toggleDraw = !toggleDraw;
        x0 = x2;
        y0 = y2;
    }
    public
    function lineTo( x2: Float, y2: Float ){
        var oldInfo = info;
        info = temp.fillGradLine( x0*scaleX + translateX, y0*scaleY + translateY
            , x2*scaleX + translateX, y2*scaleY + translateY 
            , strokeWidth
            , strokeTopColor, strokeTopColor, strokeBottomColor, strokeBottomColor );
        if( info != null && oldInfo != null ){
            temp.fillGradQuad( oldInfo.bx*scaleX + translateX, oldInfo.by*scaleY + translateY, strokeTopColor
                , info.ax*scaleX + translateX, info.ay*scaleY + translateY, strokeTopColor
                , info.dx*scaleX + translateX, info.dy*scaleY + translateY, strokeBottomColor
                , oldInfo.cx*scaleX + translateX, oldInfo.cy*scaleY + translateY, strokeBottomColor );
        }
        x0 = x2;
        y0 = y2;
        toggleDraw = true;
    }
    public
    function moveTo( x1: Float, y1: Float ){
        x0 = x1;
        y0 = y1;
        info = null;
        toggleDraw = true;
    }
}