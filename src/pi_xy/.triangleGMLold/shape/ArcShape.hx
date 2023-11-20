package pi_xy.triangleGML.shape;
import pi_xy.Pixelimage;
import pi_xy.Pixelshape;
import pi_xy.triangleGML.coreShape.FillShape;

enum abstract ArcType( String ) from String to String {
    var Chord   = 'chord';
    var Ellipse = 'ellipse';
    var Pie     = 'pie';
}

@:structInit
class ArcShape extends FillShape {
    public var left:       Float;
    public var top:        Float;
    public var width:      Float;
    public var height:     Float;
    public var startAngle: Float;
    public var sweepAngle: Float;
    public var arcType:    ArcType;
    var rx:                Float;
    var ry:                Float;
    public function new(  opacity            = 1.
                        , visibility         = true
                        , strokeColor        = 0x000000
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        , fill = 0x000000
                        , left = 0.
                        , top = 0.
                        , width = 1.
                        , height = 1.
                        , startAngle = 0.
                        , sweepAngle = 0.
                        , arcType = Pie
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray, fill );
        this.left       = left;
        this.top        = top;
        this.width      = width;
        this.height     = height;
        this.startAngle = startAngle;
        this.sweepAngle = sweepAngle;
        this.arcType    = arcType;
        rx = width/2;
        ry = height/2;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'left':
                left = Std.parseFloat( value );
            case 'top':
                top = Std.parseFloat( value );
            case 'width':
                width =  Std.parseFloat( value );
            case 'height':
                height = Std.parseFloat( value );
            case 'startAngle':
                var degree = Std.parseFloat( value );
                startAngle = ( degree == 0 )? 0: Math.PI*degree/180;
            case 'sweepAngle':
                var degree = Std.parseFloat( value );
                sweepAngle = ( degree == 0 )? 0: Math.PI*degree/180;
            case 'arcType':
                arcType = cast( value, ArcType );
            case _:
                super.setParameter( name, value );
        }
        rx = width/2;
        ry = height/2;
    }
    public override function render( pixelShape: Pixelshape ): Pixelshape {
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
        return super.render( pixelShape );
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