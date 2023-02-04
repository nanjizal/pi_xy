package pixelimage.triangleGML.contour;
import pixelimage.Pixelimage;
import pixelimage.Pixelshape;
import pixelimage.triangleGML.coreShape.BasicShape;

@:structInit
class LineGridShape extends BasicShape {
    public var left:    Float;
    public var top:     Float;
    public var width:   Float;
    public var height:  Float;
    public var delta:   Float;
    public var deltaH:  Float;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeColor        = 0xFFF00000
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        , left = 0.
                        , top = 0.
                        , width = 1.
                        , height = 1.
                        , delta = 1.
                        , deltaH = 0.
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray );
        this.left   = left;
        this.top    = top;
        this.width  = width;
        this.height = height;
        this.delta  = delta;
        this.deltaH = deltaH;
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
            case 'delta':
                delta = Std.parseFloat( value );
            case 'deltaH':
                deltaH = Std.parseFloat( value );
            case _:
                super.setParameter( name, value );
        }
    }
    public override function render( pixelShape: Pixelshape ): Pixelshape {
        if( deltaH != 0. ){
            pixelShape.lineGridWH( left+offX, top+offY, width, height, delta, deltaH, strokeWidth, strokeColor );
        } else {
            pixelShape.lineGrid( left+offX, top+offY, width, height, delta, strokeWidth, strokeColor );
        }
        return super.render( pixelShape );
    }
}