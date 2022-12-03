package pixelimage.shapeStruct;
import pixelimage.Pixelimage;

@:structInit
class GroupShape {
    var isDirty = true;
    public var visibility: Bool;
    public var opacity: Float;
    public function new( visibility = true, opacity = 1. ){
        this.visibility = visibility;
        this.opacity = opacity;
    }
    public function setParameter( name: String, value: String ){
        switch( name ){
            cast 'visibility':
                visibility = ( value.toLowerCase() == 'true' )? true: false;
            cast 'opacity':
                opacity = Std.parseFloat( value );
            cast _:
                trace( 'property not found' );
    }
    public function render( pixelImage: Pixelimage ){
        // 
    }
}