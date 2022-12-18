package pixelimage.shapeStruct;
import pixelimage.Pixelimage;
import pixelimage.shapeStruct.FillShape;
import pixelimage.algo.RoundRecPixel;

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
                        , foreStroke = 0x00000000
                        , backStroke = 0x00000000
                        , foreFill   = 0x00000000
                        , backFill   = 0x00000000
                        , forePatternFill = null
                        , forePatternWidth = null
                        , forePatternHeight = null
                        , forePatternAcross = true
                        , forePatternScale = 1
                        , backPatternFill = null
                        , backPatternWidth = 16
                        , backPatternHeight = 16
                        , backPatternAcross = true
                        , backPatternScale = 1
                        , left = 0.
                        , top = 0.
                        , width = 1.
                        , height = 1.
                        , rounded = false
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray, foreStroke, backStroke, foreFill, backFill, forePatternFill, forePatternWidth, forePatternHeight, forePatternAcross, forePatternScale, backPatternFill, backPatternWidth, backPatternHeight, backPatternAcross, backPatternScale );
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
    public override function render( pixelImage: Pixelimage ): Pixelimage {
        // stroke tile image if used.
        var srcImageFore: Pixelimage = null;
        var tiledBorder: Bool = ( forePatternFill != null );
        if( tiledBorder ){
            srcImageFore = new Pixelimage( forePatternWidth, forePatternHeight );
            srcImageFore.transparent = false;
        
            if( forePatternAcross ){
                // draws pattern as a tile
                srcImageFore.patternRect( 0, 0, forePatternWidth, forePatternHeight, foreStroke, backStroke, forePatternFill );
            } else {
                // if pattern is defined to draw y first ( allow some shorter patterns );
                srcImageFore.patternRect( 0, 0, forePatternWidth, forePatternHeight, foreStroke, backStroke, forePatternFill );
            }
            if( forePatternScale > 1 ) srcImageFore = srcImageFore.scaleUpInt( forePatternScale, forePatternScale );
        }
        // fill tile image
        var srcImageBack = new Pixelimage( backPatternWidth, backPatternHeight );
        srcImageBack.transparent = false;
    
        if( backPatternAcross ){
            // draws pattern as a tile
            srcImageBack.patternRect( 0, 0, backPatternWidth, backPatternHeight, foreFill, backFill, backPatternFill );
        } else {
            // if pattern is defined to draw y first ( allow some shorter patterns )
            srcImageBack.patternRectDown( 0, 0, backPatternWidth, backPatternHeight, foreFill, backFill, backPatternFill );
        }
        if( backPatternScale > 1 ) srcImageBack = srcImageBack.scaleUpInt( backPatternScale, backPatternScale );
        var temp = new Pixelimage( Math.ceil( width ), Math.ceil( height ) );
        temp.transparent = false;
        
        if( rounded == false ){
            if( tiledBorder ){
                temp.tileRect( 0, 0, width, height, srcImageFore );
            } else { // simple rectangle
                temp.simpleRect( 0, 0, width, height, strokeColor );
            }
            temp.tileRect( strokeWidth, strokeWidth,width-2*strokeWidth, height-2*strokeWidth, srcImageBack );
            
        } else {

            if( tiledBorder ){
                tileRoundRectangle( cast temp, 0, 0, width, height, srcImageFore );
            } else {
                fillRoundRectangle( cast temp, 0, 0, width, height,strokeColor );
            }
            tileRoundRectangle( cast temp, strokeWidth, strokeWidth, width-2*strokeWidth, height-2*strokeWidth, srcImageBack );
        }
        pixelImage.putPixelImage( temp, Std.int( left ), Std.int( top ) );
        temp = null;
        srcImageFore = null;
        srcImageBack = null;
        return super.render( pixelImage );
    }
}