package pixelimageXY.draw;


import pixelimageXY.Pixelimage;
import justPath.SvgLinePath;
import justPath.ILinePathContext;
import justPath.LinePathContextTrace;
import pixelimageXY.algo.HitQuad;

@:structInit
class DrawGradThickHelper implements ILinePathContext {
    var svgLinePath: SvgLinePath;
    var x0: Float = 0.;
    var y0: Float = 0.;
    var toggleDraw = true;
    var strokeWidth: Float;
    public var strokeTopColor: Int;
    public var strokeBottomColor: Int;
    var translateX: Float;
    var translateY: Float;
    var scaleX: Float;
    var scaleY: Float;
    var pixelImage: Pixelimage;
    var info: HitQuad;
    var oldInfo: HitQuad;
    public function new(  pixelImage:        Pixelimage
                        , strokeWidth:       Float
                        , strokeTopColor:    Int
                        , strokeBottomColor: Int
                        , translateX = 0.
                        , translateY = 0.
                        , scaleX = 1.
                        , scaleY = 1.  ){
        this.pixelImage = pixelImage;
        this.strokeTopColor = strokeTopColor;
        this.strokeBottomColor = strokeBottomColor;
        this.strokeWidth = strokeWidth;
        this.translateX = translateX;
        this.translateY = translateY;
        this.scaleX = scaleX;
        this.scaleY = scaleY;
        svgLinePath = new SvgLinePath( this );
    }
    public
    function lineSegmentTo( x2: Float, y2: Float ){
        oldInfo = info;
        info = pixelImage.fillGradLine( x0*scaleX + translateX, y0*scaleY + translateY
                 , x2*scaleX + translateX, y2*scaleY + translateY 
                 , strokeWidth
                 , strokeTopColor, strokeTopColor, strokeBottomColor, strokeBottomColor, true );
        if( info != null && oldInfo != null ){
            pixelImage.fillGradQuad( oldInfo.bx*scaleX + translateX, oldInfo.by*scaleY + translateY, strokeTopColor
                            , info.ax*scaleX + translateX, info.ay*scaleY + translateY, strokeTopColor
                            , info.dx*scaleX + translateX, info.dy*scaleY + translateY, strokeBottomColor
                            , oldInfo.cx*scaleX + translateX, oldInfo.cy*scaleY + translateY, strokeBottomColor, true );
        }
        toggleDraw = !toggleDraw;
        x0 = x2;
        y0 = y2;
    }
    public
    function lineTo( x2: Float, y2: Float ){
        oldInfo = info;
        info = pixelImage.fillGradLine( x0*scaleX + translateX, y0*scaleY + translateY
            , x2*scaleX + translateX, y2*scaleY + translateY 
            , strokeWidth
            , strokeTopColor, strokeTopColor, strokeBottomColor, strokeBottomColor, true);
        if( info != null && oldInfo != null ){
            pixelImage.fillGradQuad( oldInfo.bx*scaleX + translateX, oldInfo.by*scaleY + translateY, strokeTopColor
                , info.ax*scaleX + translateX, info.ay*scaleY + translateY, strokeTopColor
                , info.dx*scaleX + translateX, info.dy*scaleY + translateY, strokeBottomColor
                , oldInfo.cx*scaleX + translateX, oldInfo.cy*scaleY + translateY, strokeBottomColor, true );
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
}