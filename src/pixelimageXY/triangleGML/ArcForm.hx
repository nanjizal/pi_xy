package pixelimageXY.triangleGML;

import pixelimageXY.Pixelshape;
import triangleGML.shape.form.ArcForm_;
import triangleGML.ArcType;

class ArcForm extends ArcForm_<Pixelshape,Pixelshape>{
    public function render( pixelShape: Pixelshape ): Pixelshape {
        var temp = new Pixelshape( Math.ceil( width ), Math.ceil( height ) );
        temp.transparent = false;
        switch ( arcType ){
            case Chord:
                chord( temp );
            case Ellipse:
                ellipse( temp );
            case Pie:
                pie( temp );
        }
        pixelShape.putPixelImage( temp, Std.int( left+offX ), Std.int( top+offY ) );
        temp = null;
        return pixelShape;
    }
    function chord( temp: Pixelshape ){
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
            temp.fillSquare( rx, ry, strokeWidth, 0x00000000 );
            temp.fillTri( rx, ry, bx, by, cx, cy, strokeColor );
            temp.fillTri( rx, ry, bxS, byS, cxS, cyS, 0x00000000 );
        } else {
            temp.sweepTri( rx, ry, rx, ry, endAngle, 2*Math.PI-sweepAngle+0.01, strokeColor );
            temp.sweepTri( rx, ry, rx-strokeWidth, ry-strokeWidth, endAngle, 2*Math.PI-sweepAngle+0.01, fill );
            temp.fillLine( cx, cy, bx, by, strokeWidth, strokeColor );
        }
    }
    function ellipse( temp: Pixelshape ){
        temp.fillPie( rx, ry, rx, ry, startAngle, sweepAngle, strokeColor );
        temp.fillPie( rx, ry, rx-strokeWidth, ry-strokeWidth, startAngle, sweepAngle, fill );
    }
    function pie( temp: Pixelshape ){
        ellipse( temp );
        var bx = rx * Math.cos( startAngle ) + rx;
        var by = ry * Math.sin( startAngle ) + ry;
        var currAngle = startAngle + sweepAngle/2;
        var ax = strokeWidth * Math.cos( currAngle ) + rx;
        var ay = strokeWidth * Math.sin( currAngle ) + ry;
        currAngle = startAngle + sweepAngle;
        var cx = rx * Math.cos( currAngle ) + rx;
        var cy = ry * Math.sin( currAngle ) + ry;
        temp.fillLine( rx, ry, bx, by, strokeWidth, strokeColor );
        temp.fillLine( rx, ry, cx, cy, strokeWidth, strokeColor );
    }
}