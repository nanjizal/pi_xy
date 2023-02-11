package pixelimage.triangleGML.shape;

import pixelimage.Pixelimage;
import pixelimage.Pixelshape;
import pixelimage.triangleGML.coreShape.FillShape;
import pixelimage.algo.RoundRecPixel;

@:structInit
class SquareShape extends FillShape {
    public var left:    Float;
    public var top:     Float;
    public var width:   Float;
    public var height:  Float;
    public var diameter: Float;
    public var rounded: Bool;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeColor        = 0x000000
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        , fill = 0x000000
                        , left = 0.
                        , top = 0.
                        , diameter = 1.
                        , rounded = false
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray, fill );
        this.left      = left;
        this.top       = top;
        this.diameter  = diameter;
        this.rounded   = rounded;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'left':
                left = Std.parseFloat( value );
            case 'top':
                top = Std.parseFloat( value );
            case 'diameter':
                diameter = Std.parseFloat( value );
            case 'rounded':
                rounded = ( StringTools.trim( value ).toLowerCase() == 'true' )? true: false;
            case _:
                super.setParameter( name, value );
        }
    }
    public override function render( pixelShape: Pixelshape ): Pixelshape {
        var temp = new Pixelshape( Math.ceil( diameter ), Math.ceil( diameter ) );
        temp.transparent = false;
        if( rounded == true ){
            buildRounded( temp );
        } else {
            buildSquare( temp );
        }
        pixelShape.putPixelImage( temp, Std.int( left+offX ), Std.int( top+offY ) );
        temp = null;
        return super.render( pixelShape );
    }
    function buildSquare( temp: Pixelshape ){
        temp.simpleRect( 0., 0., diameter, diameter, strokeColor );
        temp.simpleRect( strokeWidth, strokeWidth, Std.int( diameter-2*strokeWidth ), Std.int( diameter-2*strokeWidth ), fill );
    }
    function buildRounded( temp: Pixelshape ){
        fillRoundRectangle( cast temp, 0, 0, diameter, diameter, strokeColor );
        fillRoundRectangle( cast temp, strokeWidth, strokeWidth, diameter-2*strokeWidth, diameter-2*strokeWidth, fill );
    }
}