package pixelimage.triGML.patternShape;

import pixelimage.Pixelimage;
import pixelimage.triGML.coreShape.PatternShape;

@:structInit
class SquarePattern extends PatternShape {
    public var left:    Float;
    public var top:     Float;
    public var width:   Float;
    public var height:  Float;
    public var diameter: Float;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeColor        = 0x000000
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        
                        , strokeColor0 = 0x00000000
                        , strokeColor1 = 0x00000000
                        , fillColor0   = 0x00000000
                        , fillColor1   = 0x00000000
                        , strokePatternFill = null
                        , strokePatternWidth = null
                        , strokePatternHeight = null
                        , strokePatternAcross = true
                        , strokePatternScale = 1
                        , fillPatternFill = null
                        , fillPatternWidth = 16
                        , fillPatternHeight = 16
                        , fillPatternAcross = true
                        , fillPatternScale = 1

                        , left = 0.
                        , top = 0.
                        , diameter = 1.
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray
            , strokeColor0, strokeColor1, fillColor0, fillColor1
            , strokePatternFill, strokePatternWidth, strokePatternHeight, strokePatternAcross, strokePatternScale
            , fillPatternFill, fillPatternWidth, fillPatternHeight, fillPatternAcross, fillPatternScale );
        this.left      = left;
        this.top       = top;
        this.diameter  = diameter;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'left':
                left = Std.parseFloat( value );
            case 'top':
                top = Std.parseFloat( value );
            case 'diameter':
                diameter = Std.parseFloat( value );
            case _:
                super.setParameter( name, value );
        }
    }
    public override function render( pixelImage: Pixelimage ): Pixelimage {
        var temp = new Pixelimage( Math.ceil( diameter ), Math.ceil( diameter ) );
        temp.transparent = false;

        buildPatternTemplates();
        buildSquare( temp );

        pixelImage.putPixelImage( temp, Std.int( left ), Std.int( top ) );
        temp = null;
        return super.render( pixelImage );
    }
    function buildSquare( temp: Pixelimage ){
        temp.tileRect( 0., 0., diameter, diameter, tileImageStroke );
        temp.tileRect( strokeWidth, strokeWidth, diameter-2*strokeWidth, diameter-2*strokeWidth, tileImageFill );
    }
}