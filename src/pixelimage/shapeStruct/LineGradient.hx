class pixelimage.shapeStruct;
import pixelimage.Pixelimage;
import pixelimage.shapeStruct.BasicGradient;

@:structInit
class LineGradient extends BasicGradient {
    public var x1: Float;
    public var y1: Float;
    public var x2: Float;
    public var y2: Float;
    public var strokeWidth: Float;
    public function new(  opacity            = 1.
                        , visibility          = true;
                        , x1 = 0.
                        , y1 = 0.
                        , x2 = 0.
                        , y2 = 0.
                        , colorA = 0xFFFF9900;
                        , colorB = 0xFFBFFF00;
                        , colorC = 0xFF00EAFF;
                        , colorD = 0xFF7300FF;
                        , strokeWidth = 1.;
                        ){
        super( opacity, visibility, [ colorA, colorB, colorC, colorD ] );
        this.x1 = x1;
        this.y1 = y1;
        this.x2 = x2;
        this.y2 = y2;
        this.strokeWidth = strokeWidth;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            cast 'x1':
                x1 = Std.parseFloat( value );
            cast 'y1':
                y1 = Std.parseFloat( value );
            cast 'x2':
                x2 = Std.parseFloat( value );
            cast 'y2':
                y2 = Std.parseFloat( value );
            cast 'colorA':
                colorA = Std.parseInt( value );
            cast 'colorB':
                colorB = Std.parseInt( value );
            cast 'colorC':
                colorC = Std.parseInt( value );
            cast 'colorD':
                colorD = Std.parseInt( value );
            cast 'colorFirst':
                colorA = Std.parseInt( value );
                colorD = Std.parseInt( value );
            cast 'colorSecond':
                colorB = Std.parseInt( value );
                colorC = Std.parseInt( value );
            cast 'colorTop':
                colorA = Std.parseInt( value );
                colorB = Std.parseInt( value );
            cast 'colorBottom':
                colorC = Std.parseInt( value );
                colorD = Std.parseInt( value );
            cast _:
                super.setParameter( name, value );
    }
    public function render( pixelImage: Pixelimage ){
        pixelimage.fillGradLine( x1, y1, x2, y2, strokeWidth
            , cornerColor[0], cornerColor[1], cornerColor[2], colorColor[3] );
    }
}