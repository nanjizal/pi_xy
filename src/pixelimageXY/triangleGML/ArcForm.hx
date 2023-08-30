package pixelimageXY.triangleGML;

import pixelimageXY.Pixelimage;
import triangleGML.shape.form.ArcForm_;
import triangleGML.ArcType;

class ArcForm extends ArcForm_<Pixelimage,Pixelimage>{
    public function render( pixelImage: Pixelimage ): Pixelimage {
        var temp = new Pixelimage( Math.ceil( width ), Math.ceil( height ) );
        temp.transparent = false;
        switch ( arcType ){
            case Chord:
                chord( temp );
            case Ellipse:
                ellipse( temp );
            case Pie:
                pie( temp );
        }
        pixelImage.putPixelImage( temp, Std.int( left+offX ), Std.int( top+offY ) );
        temp = null;
        return pixelImage;
    }
    function chord( temp: Pixelimage ){
        ellipse( temp );
        //temp.fillPie( rx, ry, rx, ry, startAngle, sweepAngle, fill );
        var endAngle = startAngle + sweepAngle;
        var bx = rx * Math.cos( startAngle ) + rx;
        var by = ry * Math.sin( startAngle ) + ry;
        var cx = rx * Math.cos( endAngle ) + rx;
        var cy = ry * Math.sin( endAngle ) + ry;
        if( sweepAngle < Math.PI ){
            var bxS = ( rx - strokeWidth ) * Math.cos( startAngle ) + rx;
            var byS = ( ry - strokeWidth ) * Math.sin( startAngle ) + ry;  
            var cxS = ( rx - strokeWidth ) * Math.cos( endAngle + 0.01 ) + rx;
            var cyS = ( ry - strokeWidth ) * Math.sin( endAngle + 0.01) + ry;
            temp.fillShape.square( rx, ry, strokeWidth, 0x00000000 );
            temp.fillShape.triangle( rx, ry, bx, by, cx, cy, strokeColor );
            temp.fillShape.triangle( rx, ry, bxS, byS, cxS, cyS, 0x00000000 );
        } else {
            temp.fillShape.sweepTri( rx, ry, rx, ry, endAngle, 2*Math.PI-sweepAngle+0.01, strokeColor );
            temp.fillShape.sweepTri( rx, ry, rx-strokeWidth, ry-strokeWidth, endAngle, 2*Math.PI-sweepAngle+0.01, fill );
            temp.fillShape.line( cx, cy, bx, by, strokeWidth, strokeColor );
        }
    }
    function ellipse( temp: Pixelimage ){
        temp.fillShape.pie( rx, ry, rx, ry, startAngle, sweepAngle, strokeColor );
        temp.fillShape.pie( rx, ry, rx-strokeWidth, ry-strokeWidth, startAngle, sweepAngle, fill );
    }
    function pie( temp: Pixelimage ){
        ellipse( temp );
        var bx = rx * Math.cos( startAngle ) + rx;
        var by = ry * Math.sin( startAngle ) + ry;
        var currAngle = startAngle + sweepAngle/2;
        var ax = strokeWidth * Math.cos( currAngle ) + rx;
        var ay = strokeWidth * Math.sin( currAngle ) + ry;
        currAngle = startAngle + sweepAngle;
        var cx = rx * Math.cos( currAngle ) + rx;
        var cy = ry * Math.sin( currAngle ) + ry;
        temp.fillShape.line( rx, ry, bx, by, strokeWidth, strokeColor );
        temp.fillShape.line( rx, ry, cx, cy, strokeWidth, strokeColor );
    }
}