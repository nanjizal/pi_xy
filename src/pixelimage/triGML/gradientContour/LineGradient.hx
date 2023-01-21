package pixelimage.triGML.gradientContour;
import pixelimage.Pixelimage;
import pixelimage.triGML.coreShape.BasicGradient;

@:structInit
class LineGradient extends BasicGradient {
    public var x1: Float;
    public var y1: Float;
    public var x2: Float;
    public var y2: Float;
    public var strokeWidth: Float;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , x1 = 0.
                        , y1 = 0.
                        , x2 = 0.
                        , y2 = 0.
                        , colorA = 0xFFFF9900
                        , colorB = 0xFFBFFF00
                        , colorC = 0xFF00EAFF
                        , colorD = 0xFF7300FF
                        , strokeWidth = 1.
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
            case 'strokeWidth':
                strokeWidth = Std.parseFloat( value );
            case 'x1':
                x1 = Std.parseFloat( value );
            case 'y1':
                y1 = Std.parseFloat( value );
            case 'x2':
                x2 = Std.parseFloat( value );
            case 'y2':
                y2 = Std.parseFloat( value );
            case 'colorA':
                cornerColors[0] = Std.parseInt( value );
            case 'colorB':
                cornerColors[1] = Std.parseInt( value );
            case 'colorC':
                cornerColors[2] = Std.parseInt( value );
            case 'colorD':
                cornerColors[3] = Std.parseInt( value );
            case 'colorFirst':
                cornerColors[0] = Std.parseInt( value );
                cornerColors[4] = Std.parseInt( value );
            case 'colorSecond':
                cornerColors[2] = Std.parseInt( value );
                cornerColors[3] = Std.parseInt( value );
            case 'colorTop':
                cornerColors[0] = Std.parseInt( value );
                cornerColors[2] = Std.parseInt( value );
            case 'colorBottom':
                cornerColors[4] = Std.parseInt( value );
                cornerColors[3] = Std.parseInt( value );
            case _:
                super.setParameter( name, value );
        }
    }
    public override function render( pixelImage: Pixelimage ): Pixelimage {
        pixelImage.fillGradLine( x1, y1, x2, y2, strokeWidth
            , cornerColors[0], cornerColors[1], cornerColors[2], cornerColors[3] );
        return super.render( pixelImage );
    }
}