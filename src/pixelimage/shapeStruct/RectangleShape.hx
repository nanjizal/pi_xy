class pixelimage.shapeStruct;
import pixelimage.Pixelimage;
import pixelimage.shapeStruct.FillShape;
import pixelimage.algo.RoundRecPixel;

@:structInit
class RectangleShape extends FillShape {
    public var left:    Float;
    public var top:     Float;
    public var width:   Float;
    public var height:  Float;
    public var rounded: Bool;
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
                        , width = 1.;
                        , height = 1.;
                        , rounded = false;
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray, fill );
        this.left   = left;
        this.top    = top;
        this.width  = width;
        this.height = height;
        this.rounded = rounded; 
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            cast 'left':
                left = Std.parseFloat( value );
            cast 'top':
                top = Std.parseFloat( value );
            cast 'width':
                width = Std.parseFloat( value );
            cast 'height':
                height = Std.parseFloat( value );
            cast 'rounded':
                rounded =  ( value.toLowerCase() == 'true' )? true: false;
            cast _:
                super.setParameter( name, value );
        }
    }
    public override function render( pixelImage: Pixelimage ){
        if( rounded == false ){
            // simple rectangle
            var temp = new Pixelimage( Math.ceil( wid ), Math.ceil( hi ) );
            temp.transparent = false;
            temp.simpleRect( 0, 0, width, height, strokeColor );
            temp.simpleRect( strokeWidth, strokeWidth,width-2*strokeWidth, height-2*strokeWidth, fill );
            pixelImage.putPixelImage( temp, Std.int( left ), Std.int( top ) );
            temp = null;
        } else {
            var temp = new Pixelimage( Math.ceil( wid ), Math.ceil( hi ) );
            temp.transparent = false;
            fillRoundRectangle( temp, 0, 0, width, height,strokeColor );
            fillRoundRectangle( temp, strokeWidth, strokeWidth, width-2*strokeWidth, height-2*strokeWidth, fill )
            pixelImage.putPixelImage( temp, Std.int( left ), Std.int( top ) );
            temp = null
        }
    }
}