package pi_xy.draw;

import pi_xy.draw.DrawAbstractHelper;
import pi_xy.Pixelimage;
import justPath.SvgLinePath;
import justPath.ILinePathContext;
import justPath.LinePathContextTrace;
import pi_xy.hit.HitQuad;

@:structInit
class DrawGradThickHelper extends DrawAbstractHelper {
    var strokeWidth: Float;
    public var strokeTopColor: Int;
    public var strokeBottomColor: Int;
    var info: HitQuad;
    var oldInfo: HitQuad;
    public function new(  pixelImage:        Pixelimage
                        , strokeWidth:       Float
                        , strokeTopColor:    Int
                        , strokeBottomColor: Int
                        , translateX = 0.
                        , translateY = 0.
                        , scaleX = 1.
                        , scaleY = 1.
                        , hitsAllowed = false  ){
        super( pixelImage, translateX, translateY, scaleX, scaleY, hitsAllowed );
        this.strokeTopColor = strokeTopColor;
        this.strokeBottomColor = strokeBottomColor;
        this.strokeWidth = strokeWidth;
        svgLinePath = new SvgLinePath( this );
    }
    public
    function lineSegmentTo( x2: Float, y2: Float ){
        oldInfo = info;

        info = pixelImage.gradientShape.line( x0*scaleX + translateX, y0*scaleY + translateY
                 , x2*scaleX + translateX, y2*scaleY + translateY 
                 , strokeWidth
                 , strokeTopColor, strokeTopColor, strokeBottomColor, strokeBottomColor, true );
        if( info != null && oldInfo != null ){
            pixelImage.gradientShape.quad( oldInfo.bx*scaleX + translateX, oldInfo.by*scaleY + translateY, strokeTopColor
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
        
        info = pixelImage.gradientShape.line( x0*scaleX + translateX, y0*scaleY + translateY
            , x2*scaleX + translateX, y2*scaleY + translateY 
            , strokeWidth
            , strokeTopColor, strokeTopColor, strokeBottomColor, strokeBottomColor, true);
        if( info != null && oldInfo != null ){
            pixelImage.gradientShape.quad( oldInfo.bx*scaleX + translateX, oldInfo.by*scaleY + translateY, strokeTopColor
                , info.ax*scaleX + translateX, info.ay*scaleY + translateY, strokeTopColor
                , info.dx*scaleX + translateX, info.dy*scaleY + translateY, strokeBottomColor
                , oldInfo.cx*scaleX + translateX, oldInfo.cy*scaleY + translateY, strokeBottomColor, true );
        }
        
        x0 = x2;
        y0 = y2;
        toggleDraw = true;
    }
    public
    override function moveTo( x1: Float, y1: Float ){
        super.moveTo( x1, y1 );
        info = null;
    }
}