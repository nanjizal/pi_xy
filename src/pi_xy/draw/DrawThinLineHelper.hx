package pi_xy.draw;

import pi_xy.draw.DrawAbstractHelper;
import pi_xy.hit.HitObjArray;
import pi_xy.Pixelimage;
import justPath.SvgLinePath;
import justPath.ILinePathContext;
import justPath.LinePathContextTrace;
import pi_xy.hit.HitThinLine;
import pi_xy.hit.IhitObj;

@:structInit
class DrawThinLineHelper extends DrawAbstractHelper {
    var strokeColor: Int;
    var info: HitThinLine;
    var oldInfo: HitThinLine;
    public function new( pixelImage: Pixelimage
                        , strokeColor: Int
                        , translateX = 0.
                        , translateY = 0.
                        , scaleX = 1.
                        , scaleY = 1.
                        , hitsAllowed = false  ){
        super( pixelImage, translateX, translateY, scaleX, scaleY, hitsAllowed );
        this.strokeColor = strokeColor;

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
    override function moveTo( x1: Float, y1: Float ){
        super.moveTo( x1, y1 );
        info = null;
    }
}
