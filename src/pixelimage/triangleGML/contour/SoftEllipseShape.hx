package pixelimage.triangleGML.contour;
import pixelimage.Pixelimage;
import pixelimage.Pixelshape;
import pixelimage.triangleGML.coreShape.BasicShape;

@:structInit
class SoftEllipseShape extends BasicShape {
    public var left:    Float;
    public var top:     Float;
    public var width:   Float;
    public var height:  Float;
    public var softC:   Float;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeColor        = 0x000000
                        , left = 0.
                        , top = 0.
                        , width = 1.
                        , height = 1.
                        , softC = 10.
                        ){
        super( opacity, visibility, strokeColor, 0., null );
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
            case 'softC':
                softC = Std.parseFloat( value );
            case _:
                super.setParameter( name, value );
        }
    }
    public override function render( pixelShape: Pixelshape ): Pixelshape {
        var temp = new Pixelshape( Math.ceil( width ), Math.ceil( height ) );
        temp.transparent = false;
        var rW = width/2;
        var rH = height/2;
        var cx = rW;
        var cy = rH;
        var phi = 0;
        temp.softFillEllipseTri( cx, cy, rW, rH, strokeColor, phi, softC );
        pixelShape.putPixelImage( temp, Std.int( left+offX ), Std.int( top+offY ) );
        temp = null;
        return super.render( pixelShape );
    }
}