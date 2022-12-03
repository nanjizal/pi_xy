class pixelimage.shapeStruct;

import pixelimage.Pixelimage;
import pixelimage.shapeStruct.FillShape;

@:structInit
class SquareShape extends FillShape {
    public var left:    Float;
    public var top:     Float;
    public var width:   Float;
    public var height:  Float;
    public function new(  opacity            = 1.
                        , visibility          = true;
                        , strokeColor        = 0x000000
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        , fill = 0x000000
                        , left = 0.;
                        , top = 0.;
                        , diameter = 1.;
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray, fill );
        this.left      = left;
        this.top       = top;
        this.diameter  = diameter;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            cast 'left':
                left = Std.parseFloat( value );
            cast 'top':
                top = Std.parseFloat( value );
            cast 'diameter':
                diameter = Std.parseFloat( value );
            cast _:
                super.setParameter( name, value );
        }
    }
    public override function render( pixelImage: Pixelimage ){
        //pixelImage.fillSquare( left, top, diameter, fill );
        var temp = new Pixelimage( Math.ceil( wid ), Math.ceil( hi ) );
        temp.transparent = false;
        temp.simpleRect( 0, 0, diameter, diameter, strokeColor );
        temp.simpleRect( strokeWidth, strokeWidth, diameter-2*strokeWidth, diameter-2*strokeWidth, fill );
        pixelImage.putPixelImage( temp, Std.int( left ), Std.int( top ) );
        temp = null;
    }
}