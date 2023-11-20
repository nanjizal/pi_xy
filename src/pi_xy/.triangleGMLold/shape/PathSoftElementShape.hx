package pi_xy.triangleGML.shape;
import pi_xy.Pixelimage;
import pi_xy.Pixelshape;
import pi_xy.triangleGML.coreShape.FillShape;
import justPath.SvgLinePath;
import justPath.ILinePathContext;
import justPath.LinePathContextTrace;

@:structInit
class PathSoftElementShape extends FillShape implements ILinePathContext {
    public var pathData: String = '';
    public var translateX: Float;
    public var translateY: Float;
    public var scaleX: Float;
    public var scaleY: Float;
    var x0: Float = 0.;
    var y0: Float = 0.;
    var temp: Pixelshape;
    var soft: Float;
    var toggleDraw = true;
    var info: { ax: Float, ay: Float, bx: Float, by: Float, cx: Float, cy: Float, dx: Float, dy: Float };
    
    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeColor        = 0x000000
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        , fill = 0x000000
                        , soft = 40.
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
        this.soft = soft;
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
            case 'soft':
                soft = Std.parseFloat( value );    
            case _:
                super.setParameter( name, value );
        }
    }
    public override function render( pixelShape: Pixelshape ): Pixelshape {
        //trace( 'render pathData ' + pathData );
        temp = new Pixelshape( Math.ceil( pixelShape.width ), Math.ceil( pixelShape.height ) );
        temp.transparent = true;
        drawing();
        pixelShape.putPixelImage( temp, Std.int( 0+offX ), Std.int( 0+offY ) );
        temp = null;
        //var sp2 = new SvgLinePath( new LinePathContextTrace() );
        //sp2.parse( pathData );
        return super.render( pixelShape );
    }
    public
    function drawing(){
        var sp = new SvgLinePath( this );
        if( pathData != '' ) sp.parse( pathData );
    }
    public
    function lineSegmentTo( x2: Float, y2: Float ){
        if( toggleDraw ){
            var oldInfo = info;
            info = temp.fillSoftLine( x0*scaleX + translateX, y0*scaleY + translateY
                     , x2*scaleX + translateX, y2*scaleY + translateY 
                     , strokeWidth, strokeColor, soft, true, false, true, false, true );
            if( info != null && oldInfo != null ){
                temp.fillSoftQuad( oldInfo.bx*scaleX + translateX, oldInfo.by*scaleY + translateY
                             , info.ax*scaleX + translateX, info.ay*scaleY + translateY
                             , info.dx*scaleX + translateX, info.dy*scaleY + translateY
                             , oldInfo.cx*scaleX + translateX, oldInfo.cy*scaleY + translateY, strokeColor, soft, true, false, true, false, true );
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
        info = temp.fillSoftLine( x0*scaleX + translateX, y0*scaleY + translateY
                     , x2*scaleX + translateX, y2*scaleY + translateY 
                     , strokeWidth, strokeColor, soft, true, false, true, false, true );
        if( info != null && oldInfo != null ){
            temp.fillSoftQuad( oldInfo.bx*scaleX + translateX, oldInfo.by*scaleY + translateY
                         , info.ax*scaleX + translateX, info.ay*scaleY + translateY
                         , info.dx*scaleX + translateX, info.dy*scaleY + translateY
                         , oldInfo.cx*scaleX + translateX, oldInfo.cy*scaleY + translateY, strokeColor, soft, true, false, true, false, true );
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