package pixelimage.triGML.shape;
import pixelimage.Pixelimage;
import pixelimage.triGML.coreShape.FillShape;

@:structInit
class EllipseShape extends FillShape {
    public var left:    Float;
    public var top:     Float;
    public var width:   Float;
    public var height:  Float;
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
                        , width = 1.
                        , height = 1.
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray, fill );
        this.left   = left;
        this.top    = top;
        this.width  = width;
        this.height = height;
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
            case _:
                super.setParameter( name, value );
        }
    }
    public override function render( pixelImage: Pixelimage ): Pixelimage {
        var temp = new Pixelimage( Math.ceil( width ), Math.ceil( height ) );
        temp.transparent = false;
        
        var rW = width/2;
        var rH = height/2;
        var innerRw = rW - strokeWidth/2;
        var innerRh = rH - strokeWidth/2;
        var cx = rW;
        var cy = rH;
        var phi = 0;
        var innerCx = cx + strokeWidth;
        var innerCy = cy + strokeWidth;

        temp.fillEllipseTri( cx, cy, rW, rH, strokeColor, phi );
        temp.fillEllipseTri( innerCx, innerCy, innerRw, innerRh, fill, phi );
        pixelImage.putPixelImage( temp, Std.int( left ), Std.int( top ) );
        temp = null;
        return super.render( pixelImage );
    }
}