package pi_xy.triangleGML.triGML.shape.picture;
import pi_xy.triangleGML.triGML.FillForm;

//@:structInit
abstract class RectanglePicture_<DRAWTOOL,IMAGETOOL> extends FillForm<DRAWTOOL,IMAGETOOL> {
    public var left:    Float;
    public var top:     Float;
    public var width:   Float;
    public var height:  Float;
    public var image: Null<IMAGETOOL>;
    public var pictureX: Float;
    public var pictureY: Float;
    public var pictureWidth: Float;
    public var pictureHeight: Float;
    public var rounded: Bool;
     
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
                        , width = 100.
                        , height = 100.
                        , image = null
                        , pictureX = 0.
                        , pictureY = 0.
                        , pictureWidth = 100.
                        , pictureHeight = 100.
                        , rounded = false
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray, fill );
        this.left   = left;
        this.top    = top;
        this.width  = width;
        this.height = height;
        this.image = image; // any attribute starting with 'image' is treated as resource image reference
        this.pictureX = pictureX;
        this.pictureY = pictureY;
        this.pictureWidth = pictureWidth;
        this.pictureHeight = pictureHeight;
        this.rounded = rounded; 
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
            case 'pictureX':
                pictureX = Std.parseFloat( value );
            case 'pictureY':
                pictureY = Std.parseFloat( value );
            case 'pictureWidth':
                pictureWidth = Std.parseFloat( value );
            case 'pictureHeight':
                pictureHeight = Std.parseFloat( value ); 
            case 'rounded':
                rounded =  ( StringTools.trim( value ).toLowerCase() == 'true' )? true: false;
            case _:
                super.setParameter( name, value );
        }
    }
}