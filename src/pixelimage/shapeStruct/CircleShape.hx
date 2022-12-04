package pixelimage.shapeStruct;
import pixelimage.Pixelimage;
import pixelimage.shapeStruct.FillShape;

@:structInit
class CircleShape extends FillShape {
    public var left:    Float;
    public var top:     Float;
    public var diameter:   Float;
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
                left     = Std.parseFloat( value );
            case 'strokeWidth':
                top      = Std.parseFloat( value );
            case 'diameter':
                diameter = Std.parseFloat( value );
            case _:
                super.setParameter( name, value );
        }
    }
    public override function render( pixelImage: Pixelimage ){
        var r = diameter/2;
        var innerR = diameter/2 - strokeWidth/2;
        var cx = left - diameter/2;
        var cy = top - diameter/2;
        var phi = 0.;
        var innerCx: Float = cx + strokeWidth;
        var innerCy: Float = cy + strokeWidth;
        var temp = new Pixelimage( Math.ceil( diameter ), Math.ceil( diameter ) );
        temp.transparent = false;
        pixelImage.fillEllipseTri( cx, cy, r, r, strokeColor, phi );
        pixelImage.fillEllipseTri( innerCx, innerCy, innerR, innerR, fill, phi );
        pixelImage.putPixelImage( temp, Std.int( left ), Std.int( top ) );
        temp = null;
    }
}
