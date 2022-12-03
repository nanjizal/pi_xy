class pixelimage.shapeStruct;
import pixelimage.Pixelimage;
import pixelimage.shapeStruct.FillShape;

@:structInit
class EllipseShape extends FillShape {
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
                        , width = 1.;
                        , height = 1.;
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray, fill );
        this.left   = left;
        this.top    = top;
        this.width  = width;
        this.height = height;
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
            cast _:
                super.setParameter( name, value );
    }
    public override function render( pixelImage: Pixelimage ){
        var rW = width/2;
        var rH = height/2;
        var innerRw = rW - strokeWidth/2;
        var innerRh = rH - strokeWidth/2;
        var cx = left - rW;
        var cy = top - rH;
        var phi = 0;
        var innerCx = cx + strokeWidth;
        var innerCy = cy + strokeWidth;
        var temp = new Pixelimage( Math.ceil( wid ), Math.ceil( hi ) );
        temp.transparent = false;
        pixelImage.fillEllipseTri( cx, cy, rW, rH, strokeColor, phi );
        pixelImage.fillEllipseTri( innerCx, innerCy, innerRw, innerRh, fill, phi );
        pixelImage.putPixelImage( temp, Std.int( left ), Std.int( top ) );
        temp = null;
    }
}