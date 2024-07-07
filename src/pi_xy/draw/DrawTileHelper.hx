package pi_xy.draw;

import pi_xy.draw.DrawAbstractHelper;
import pi_xy.Pixelimage;
import justPath.SvgLinePath;
import justPath.ILinePathContext;
import justPath.LinePathContextTrace;
import pi_xy.hit.HitQuad;

@:structInit
class DrawTileHelper extends DrawAbstractHelper {
    var strokeWidth: Float;
    var tileImageStroke: Pixelimage;
    var info: HitQuad;
    var oldInfo: HitQuad;
    public function new( pixelImage: Pixelimage
                        , strokeWidth: Float
                        , tileImageStroke: Pixelimage
                        , translateX = 0.
                        , translateY = 0.
                        , scaleX = 1.
                        , scaleY = 1.
                        , hitsAllowed = false ){
        super( pixelImage, translateX, translateY, scaleX, scaleY, hitsAllowed );
        this.strokeWidth = strokeWidth;
        this.tileImageStroke = tileImageStroke;
        svgLinePath = new SvgLinePath( this );
    }
    public
    function lineSegmentTo( x2: Float, y2: Float ){
        if( toggleDraw ){
            oldInfo = info;
            info = pixelImage.tileShape.line( x0*scaleX + translateX, y0*scaleY + translateY
                     , x2*scaleX + translateX, y2*scaleY + translateY 
                     , strokeWidth, tileImageStroke );
            if( info != null && oldInfo != null ){
                pixelImage.tileShape.quad( oldInfo.bx*scaleX + translateX, oldInfo.by*scaleY + translateY, info.ax*scaleX + translateX, info.ay*scaleY + translateY, info.dx*scaleX + translateX, info.dy*scaleY + translateY, oldInfo.cx*scaleX + translateX, oldInfo.cy*scaleY + translateY, tileImageStroke );
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
        info = pixelImage.tileShape.line( x0*scaleX + translateX, y0*scaleY + translateY
                     , x2*scaleX + translateX, y2*scaleY + translateY 
                     , strokeWidth, tileImageStroke, true );
        if( info != null && oldInfo != null ){
            pixelImage.tileShape.quad( oldInfo.bx*scaleX + translateX, oldInfo.by*scaleY + translateY
                               , info.ax*scaleX + translateX, info.ay*scaleY + translateY
                               , info.dx*scaleX + translateX, info.dy*scaleY + translateY
                               , oldInfo.cx*scaleX + translateX, oldInfo.cy*scaleY + translateY, tileImageStroke, true );
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