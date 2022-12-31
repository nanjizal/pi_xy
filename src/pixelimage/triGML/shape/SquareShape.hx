package pixelimage.triGML.shape;

import pixelimage.Pixelimage;
import pixelimage.triGML.coreShape.FillShape;

@:structInit
class SquareShape extends FillShape {
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
                        , fill = 0x000000
                        , left = 0.
                        , top = 0.
                        , diameter = 1.
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray, fill );
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

        buildSquare( temp );

        pixelImage.putPixelImage( temp, Std.int( left ), Std.int( top ) );
        temp = null;
        return super.render( pixelImage );
    }
    function buildSquare( temp: Pixelimage ){
        temp.simpleRect( 0., 0., diameter, diameter, strokeColor );
        temp.simpleRect( strokeWidth, strokeWidth, Std.int( diameter-2*strokeWidth ), Std.int( diameter-2*strokeWidth ), fill );
    }
}