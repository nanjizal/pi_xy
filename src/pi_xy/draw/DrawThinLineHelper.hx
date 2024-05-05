package pi_xy.draw;


import pi_xy.hit.HitObjArray;
import pi_xy.Pixelimage;
import justPath.SvgLinePath;
import justPath.ILinePathContext;
import justPath.LinePathContextTrace;
import pi_xy.hit.HitThinLine;
import pi_xy.hit.IhitObj;

@:structInit
class DrawThinLineHelper implements ILinePathContext {
    var svgLinePath: SvgLinePath;
    var x0: Float = 0.;
    var y0: Float = 0.;
    var toggleDraw = true;
    var strokeColor: Int;
    var translateX: Float;
    var translateY: Float;
    var scaleX: Float;
    var scaleY: Float;
    var pixelImage: Pixelimage;
    var info: HitThinLine;
    var oldInfo: HitThinLine;
    var hitsAllowed: Bool;
    var hitsArr: HitObjArray;
    public function new( pixelImage: Pixelimage
                        , strokeColor: Int
                        , translateX = 0.
                        , translateY = 0.
                        , scaleX = 1.
                        , scaleY = 1.
                        , hitsAllowed = false  ){
        this.pixelImage = pixelImage;
        this.strokeColor = strokeColor;
        this.translateX = translateX;
        this.translateY = translateY;
        this.scaleX = scaleX;
        this.scaleY = scaleY;
        this.hitsAllowed = hitsAllowed;
        if( hitsAllowed ) hitsArr = new HitObjArray( new Array<IhitObj>() );
        svgLinePath = new SvgLinePath( this );
    }
    public
    function lineSegmentTo( x2: Float, y2: Float ){
        if( toggleDraw ){
            oldInfo = info;
            info = pixelImage.lineShape.thinLine( 
                  x0*scaleX + translateX, y0*scaleY + translateY
                , x2*scaleX + translateX, y2*scaleY + translateY 
                , strokeColor );
            
            if( info != null && oldInfo != null ){
                final temp = pixelImage.lineShape.thinLine( 
                      oldInfo.bx*scaleX + translateX, oldInfo.by*scaleY + translateY
                    , info.ax*scaleX + translateX,    info.ay*scaleY + translateY
                    , strokeColor );
                if( hitsAllowed ) hitsArr.push( temp );
            }
            if( hitsAllowed ) hitsArr.push( info );
        } else {
            
        }
        toggleDraw = !toggleDraw;
        x0 = x2;
        y0 = y2;
    }
    public
    function lineTo( x2: Float, y2: Float ){
        oldInfo = info;
        info = pixelImage.lineShape.thinLine( 
              x0*scaleX + translateX, y0*scaleY + translateY
            , x2*scaleX + translateX, y2*scaleY + translateY 
            , strokeColor );
        if( info != null && oldInfo != null ){
            final temp = pixelImage.lineShape.thinLine( 
                  oldInfo.bx*scaleX + translateX, oldInfo.by*scaleY + translateY
                , info.ax*scaleX + translateX,    info.ay*scaleY + translateY
                , strokeColor );
            if( hitsAllowed ) hitsArr.push( temp );
        }
        if( hitsAllowed ) hitsArr.push( info );
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
    public
    function quadTo( x2: Float, y2: Float, x3: Float, y3: Float ){
        svgLinePath.quadTo( x2, y2, x3, y3 );
    }
    public
    function curveTo( x2: Float, y2: Float, x3: Float, y3: Float, x4: Float, y4: Float ){
        svgLinePath.curveTo( x2, y2, x3, y3, x4, y4 );
    }
    public
    function quadThru( x2: Float, y2: Float, x3: Float, y3: Float ){
        svgLinePath.quadThru( x2, y2, x3, y3 );
    }
    public inline
    function archBezier( distance: Float, distance2: Float, radius: Float, rotation: Float ){            
        var nx = x0 + distance*Math.cos( rotation );
        var ny = y0 + distance*Math.sin( rotation );
        var thruX = x0 + distance2*Math.cos( rotation ) - radius*Math.cos( rotation + Math.PI/2 );
        var thruY = y0 + distance2*Math.sin( rotation ) - radius*Math.sin( rotation + Math.PI/2 );
        svgLinePath.quadThru( thruX, thruY, nx, ny );
    }
    public inline
    function triangleArch(  distance: Float, distance2: Float, radius: Float, rotation: Float ){
        var nx = x0 + distance*Math.cos( rotation );
        var ny = y0 + distance*Math.sin( rotation );
        var thruX = x0 + distance2*Math.cos( rotation ) - radius*Math.cos( rotation + Math.PI/2 );
        var thruY = y0 + distance2*Math.sin( rotation ) - radius*Math.sin( rotation + Math.PI/2 );
        svgLinePath.lineTo( thruX, thruY );
        svgLinePath.lineTo( nx, ny );
    }
    public inline
    function path( str: String ){
        svgLinePath.parse( str );
    }
}
