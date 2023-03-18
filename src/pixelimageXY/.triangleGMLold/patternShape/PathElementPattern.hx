package pixelimageXY.triangleGML.patternShape;
import pixelimageXY.Pixelimage;
import pixelimageXY.Pixelshape;
import pixelimageXY.triangleGML.coreShape.PatternShape;
import justPath.SvgLinePath;
import justPath.ILinePathContext;
import justPath.LinePathContextTrace;

@:structInit
class PathElementPattern extends PatternShape implements ILinePathContext {
    public var pathData: String;
    public var translateX: Float;
    public var translateY: Float;
    public var scaleX: Float;
    public var scaleY: Float;
    var x0: Float = 0.;
    var y0: Float = 0.;
    var temp: Pixelshape;

    var toggleDraw = true;
    var info: {ax: Float, ay: Float, bx: Float, by: Float, cx: Float, cy: Float, dx: Float, dy: Float };
    var oldInfo: {ax: Float, ay: Float, bx: Float, by: Float, cx: Float, cy: Float, dx: Float, dy: Float };
    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeColor        = 0x000000
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        
                        , strokeColor0 = 0x00000000
                        , strokeColor1 = 0x00000000
                        , fillColor0   = 0x00000000
                        , fillColor1   = 0x00000000
                        , strokePatternFill = null
                        , strokePatternWidth = null
                        , strokePatternHeight = null
                        , strokePatternAcross = true
                        , strokePatternScale = 1
                        , fillPatternFill = null
                        , fillPatternWidth = 16
                        , fillPatternHeight = 16
                        , fillPatternAcross = true
                        , fillPatternScale = 1

                        , pathData = ''
                        , translateX = 0.
                        , translateY = 0.
                        , scaleX = 1.
                        , scaleY = 1.
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray
            , strokeColor0, strokeColor1, fillColor0, fillColor1
            , strokePatternFill, strokePatternWidth, strokePatternHeight, strokePatternAcross, strokePatternScale
            , fillPatternFill, fillPatternWidth, fillPatternHeight, fillPatternAcross, fillPatternScale );
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
    public override function render( pixelShape: Pixelshape ): Pixelshape {
        //trace( 'render pathData ' + pathData );
        temp = new Pixelshape( Math.ceil( pixelShape.width ), Math.ceil( pixelShape.height ) );
        temp.transparent = true;

        buildPatternTemplates();
        var sp = new SvgLinePath( this );
        sp.parse( pathData );


        pixelShape.putPixelImage( temp, Std.int( 0+offX ), Std.int( 0+offY ) );
        temp = null;
        //var sp2 = new SvgLinePath( new LinePathContextTrace() );
        //sp2.parse( pathData );
        return super.render( pixelShape );
    }
    public
    function lineSegmentTo( x2: Float, y2: Float ){
        if( toggleDraw ){
            oldInfo = info;
            info = temp.tileLine( x0*scaleX + translateX, y0*scaleY + translateY
                     , x2*scaleX + translateX, y2*scaleY + translateY 
                     , strokeWidth, tileImageStroke, true );
            if( info != null && oldInfo != null ){
                temp.tileQuad( oldInfo.bx*scaleX + translateX, oldInfo.by*scaleY + translateY
                             , info.ax*scaleX + translateX, info.ay*scaleY + translateY
                             , info.dx*scaleX + translateX, info.dy*scaleY + translateY
                             , oldInfo.cx*scaleX + translateX, oldInfo.cy*scaleY + translateY, tileImageStroke, true );
            }
        } else {
            
        }
        toggleDraw = !toggleDraw;
        x0 = x2;
        y0 = y2;
    }
    public
    function lineTo( x2: Float, y2: Float ){
        oldInfo = info;
        info = temp.tileLine( x0*scaleX + translateX, y0*scaleY + translateY
                     , x2*scaleX + translateX, y2*scaleY + translateY 
                     , strokeWidth, tileImageStroke, true );
        if( info != null && oldInfo != null ){
            temp.tileQuad( oldInfo.bx*scaleX + translateX, oldInfo.by*scaleY + translateY
                         , info.ax*scaleX + translateX, info.ay*scaleY + translateY
                         , info.dx*scaleX + translateX, info.dy*scaleY + translateY
                         , oldInfo.cx*scaleX + translateX, oldInfo.cy*scaleY + translateY, tileImageStroke, true );
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