package pi_xy.triangleGML.patternShape;
import pi_xy.Pixelimage;
import pi_xy.Pixelshape;
import pi_xy.triangleGML.coreShape.PatternShape;
import pi_xy.algo.RoundRecPixel;

@:structInit
class RectanglePattern extends PatternShape {
    public var left:    Float;
    public var top:     Float;
    public var width:   Float;
    public var height:  Float;
    public var rounded: Bool;
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
                        , width = 1.
                        , height = 1.
                        , rounded = false
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray
            , strokeColor0, strokeColor1, fillColor0, fillColor1
            , strokePatternFill, strokePatternWidth, strokePatternHeight, strokePatternAcross, strokePatternScale
            , fillPatternFill, fillPatternWidth, fillPatternHeight, fillPatternAcross, fillPatternScale );
        this.left   = left;
        this.top    = top;
        this.width  = width;
        this.height = height;
        this.rounded = rounded; 
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'left':
                left = Std.parseFloat( value );
            case 'top':
                top = Std.parseFloat( value );
            case 'width':
                width = Std.parseFloat( value );
            case 'height':
                height = Std.parseFloat( value );
            case 'rounded':
                rounded =  ( StringTools.trim( value ).toLowerCase() == 'true' )? true: false;
            case _:
                super.setParameter( name, value );
        }
    }
    public override function render( pixelShape: Pixelshape ): Pixelshape {
        var temp = new Pixelshape( Math.ceil( width ), Math.ceil( height ) );
        temp.transparent = false;

        buildPatternTemplates();
        buildRectangles( temp );
        
        pixelShape.putPixelImage( temp, Std.int( left+offX ), Std.int( top+offY ) );
        temp = null;
        
        return super.render( pixelShape );
    }
    public function buildRectangles( temp: Pixelshape ){
        if( rounded == false ){
            if( tiledBorder ){
                temp.tileRect( 0, 0, width, height, tileImageStroke );
            } else { // simple rectangle
                temp.simpleRect( 0, 0, width, height, strokeColor );
            }
            temp.tileRect( strokeWidth, strokeWidth,width-2*strokeWidth, height-2*strokeWidth, tileImageFill );
            
        } else {

            if( tiledBorder ){
                tileRoundRectangle( cast temp, 0, 0, width, height, tileImageStroke );
            } else {
                fillRoundRectangle( cast temp, 0, 0, width, height, strokeColor );
            }
            tileRoundRectangle( cast temp, strokeWidth, strokeWidth, width-2*strokeWidth, height-2*strokeWidth, tileImageFill );
        }
    }
}