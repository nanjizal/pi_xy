package pixelimage.triangleGML.shape;
import pixelimage.Pixelimage;
import pixelimage.Pixelshape;
import pixelimage.triangleGML.coreShape.FillShape;
import justPath.SvgLinePath;
import justPath.ILinePathContext;
import justPath.LinePathContextTrace;

@:structInit
class VePathElementShape extends FillShape implements ILinePathContext {
    public var pathData: String = '';
    public var strokeColors: Null<Array<Int>>;
    public var strokeWidths: Null<Array<Float>>;
    public var translateX: Float;
    public var translateY: Float;
    public var scaleX: Float;
    public var scaleY: Float;
    public var sp: SvgLinePath;
    var x0: Float = 0.;
    var y0: Float = 0.;
    var temp: Pixelshape;

    var toggleDraw = true;
    var info: { ax: Float, ay: Float, bx: Float, by: Float, cx: Float, cy: Float, dx: Float, dy: Float };
    
    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeColors:Null<Array<Int>>  = null
                        , strokeWidths: Null<Array<Float>> = null
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
        super( opacity, visibility, 0x000000, 1, strokeDashGapArray, fill );
        this.strokeColors = strokeColors;
        this.strokeWidths = strokeWidths;
        this.pathData = pathData;
        this.translateX = translateX;
        this.translateY = translateY;
        this.scaleX     = scaleX;
        this.scaleY     = scaleY;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'strokeColors':
                value = value.split('[')[1].split(']')[0];
                strokeColors = [ for( n in value.split(',') ) Std.parseInt( n )  ];
            case 'strokeWidths':
                value = value.split('[')[1].split(']')[0];
                strokeWidths = [ for( n in value.split(',') ) Std.parseFloat( n )  ];
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
        var lc = strokeColors.length;
        var ls = strokeWidths.length;
        var l: Int = Std.int( Math.min( lc, ls ) );
        var i: Int = l-1;
        for( k in 0...l ){
            // draw in reverse
            strokeColor = strokeColors[ i ];
            strokeWidth = strokeWidths[ i ];
            i--;
            drawing();
        }
        pixelShape.putPixelImage( temp, Std.int( 0+offX ), Std.int( 0+offY ) );
        temp = null;
        //var sp2 = new SvgLinePath( new LinePathContextTrace() );
        //sp2.parse( pathData );
        return super.render( pixelShape );
    }
    public
    function drawing(){
        if( sp == null ) sp = new SvgLinePath( this );
        if( pathData != '' ) sp.parse( pathData );
    }
    public
    function lineSegmentTo( x2: Float, y2: Float ){
        if( toggleDraw ){
            var oldInfo = info;
            info = temp.fillLine( x0*scaleX + translateX, y0*scaleY + translateY
                     , x2*scaleX + translateX, y2*scaleY + translateY 
                     , strokeWidth, strokeColor, true );
            if( info != null && oldInfo != null ){
                temp.fillQuad( oldInfo.bx*scaleX + translateX, oldInfo.by*scaleY + translateY
                            , info.ax*scaleX + translateX, info.ay*scaleY + translateY
                            , info.dx*scaleX + translateX, info.dy*scaleY + translateY
                            , oldInfo.cx*scaleX + translateX, oldInfo.cy*scaleY + translateY, strokeColor, true );
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
        info = temp.fillLine( x0*scaleX + translateX, y0*scaleY + translateY
                     , x2*scaleX + translateX, y2*scaleY + translateY 
                     , strokeWidth, strokeColor, true );
        if( info != null && oldInfo != null ){
            temp.fillQuad( oldInfo.bx*scaleX + translateX, oldInfo.by*scaleY + translateY, info.ax*scaleX + translateX, info.ay*scaleY + translateY, info.dx*scaleX + translateX, info.dy*scaleY + translateY, oldInfo.cx*scaleX + translateX, oldInfo.cy*scaleY + translateY, strokeColor, true );
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