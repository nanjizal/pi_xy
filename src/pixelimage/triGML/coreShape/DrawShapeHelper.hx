package pixelimage.triGML.coreShape;


import pixelimage.Pixelimage;
import justPath.SvgLinePath;
import justPath.ILinePathContext;
import justPath.LinePathContextTrace;

@:structInit
class DrawShapeHelper implements ILinePathContext {
    var svgLinePath: SvgLinePath;
    var x0: Float = 0.;
    var y0: Float = 0.;
    var toggleDraw = true;
    var strokeWidth: Float;
    var strokeColor: Int;
    var translateX: Float;
    var translateY: Float;
    var scaleX: Float;
    var scaleY: Float;
    var pixelImage: Pixelimage;
    var info: {ax: Float, ay: Float, bx: Float, by: Float, cx: Float, cy: Float, dx: Float, dy: Float };
    public function new( pixelImage: Pixelimage
                        , strokeWidth: Float
                        , strokeColor: Int
                        , translateX = 0.
                        , translateY = 0.
                        , scaleX = 1.
                        , scaleY = 1.  ){
        this.pixelImage = pixelImage;
        this.strokeWidth = strokeWidth;
        this.strokeColor = strokeColor;
        this.translateX = translateX;
        this.translateY = translateY;
        this.scaleX = scaleX;
        this.scaleY = scaleY;
        svgLinePath = new SvgLinePath( this );
    }
    public
    function lineSegmentTo( x2: Float, y2: Float ){
        if( toggleDraw ){
            var oldInfo = info;
            info = pixelImage.fillLine( x0*scaleX + translateX, y0*scaleY + translateY
                     , x2*scaleX + translateX, y2*scaleY + translateY 
                     , strokeWidth, strokeColor );
            if( info != null && oldInfo != null ){
                pixelImage.fillQuad( oldInfo.bx*scaleX + translateX, oldInfo.by*scaleY + translateY, info.ax*scaleX + translateX, info.ay*scaleY + translateY, info.dx*scaleX + translateX, info.dy*scaleY + translateY, oldInfo.cx*scaleX + translateX, oldInfo.cy*scaleY + translateY, strokeColor );
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
        info = pixelImage.fillLine( x0*scaleX + translateX, y0*scaleY + translateY
                     , x2*scaleX + translateX, y2*scaleY + translateY 
                     , strokeWidth, strokeColor, true );
        if( info != null && oldInfo != null ){
            pixelImage.fillQuad( oldInfo.bx*scaleX + translateX, oldInfo.by*scaleY + translateY
                                , info.ax*scaleX + translateX, info.ay*scaleY + translateY
                                , info.dx*scaleX + translateX, info.dy*scaleY + translateY
                                , oldInfo.cx*scaleX + translateX, oldInfo.cy*scaleY + translateY, strokeColor, true );
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
}
