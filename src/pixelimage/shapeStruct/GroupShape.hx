package pixelimage.shapeStruct;
import pixelimage.Pixelimage;

@:structInit
class GroupShape {
    var isDirty = true;
    public var visibility: Bool;
    public var opacity: Float;
    public function new( opacity = 1., visibility = true ){
        this.visibility = visibility;
        this.opacity = opacity;
    }
    public function setParameter( name: String, value: String ){
        switch( name ){
            case 'visibility':
                visibility = ( value.toLowerCase() == 'true' )? true: false;
            case 'opacity':
                opacity = Std.parseFloat( value );
            case _:
                trace( 'property not found ' + name );
        }
    }
    public function render( pixelImage: Pixelimage ){
        // 
    }
}