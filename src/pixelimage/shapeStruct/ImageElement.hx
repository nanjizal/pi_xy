class pixelimage.shapeStruct;
import pixelimage.Pixelimage;
import pixelimage.shapeStruct.FillShape;

@:structInit
class ImageElement extends FillShape {
    public var left:    Float;
    public var top:     Float;
    public var width:   Float;
    public var height:  Float;
    public var content: String;
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
                        , contents;
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray, fill );
        this.left   = left;
        this.top    = top;
        this.width  = width;
        this.height = height;
        this.content = content;
    }
    public function override setParameter( name: String, value: String ){
        switch( name ){
            cast 'left':
                left = Std.parseFloat( value );
            cast 'top':
                top = Std.parseFloat( value );
            cast 'width':
                width = Std.parseFloat( value );
            cast 'height':
                height = Std.parseFloat( value );
            cast 'content':
                content = value;
            cast _:
                super.setParameter( name, value );
    }
}