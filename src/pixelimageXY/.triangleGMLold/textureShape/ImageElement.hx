package pixelimageXY.triangleGML.textureShape;
import pixelimageXY.Pixelimage;
import pixelimageXY.Pixelshape;
import pixelimageXY.triangleGML.coreShape.FillShape;

@:structInit
class ImageElement extends FillShape {
    public var left:    Float;
    public var top:     Float;
    public var width:   Float;
    public var height:  Float;
    public var content: String;
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
                        , content = ''
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray, fill );
        this.left   = left;
        this.top    = top;
        this.width  = width;
        this.height = height;
        this.content = content;
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
            case 'content':
                content = value;
            case _:
                super.setParameter( name, value );
        }
    }
    public override function render( pixelShape ): Pixelshape {
        trace( 'Not implemented yet ');
        return super.render( pixelShape );
    }
}