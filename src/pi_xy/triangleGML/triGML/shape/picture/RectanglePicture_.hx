package pi_xy.triangleGML.triGML.shape.picture;
import pi_xy.triangleGML.triGML.FillForm;
import iterMagic.ParameterString;

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
    public override function setParameter( name: String, value: ParameterString ){
        switch( name ){
            case 'left':
                left = value;
            case 'top':
                top = value;
            case 'width':
                width = value;
            case 'height':
                height = value;
            case 'pictureX':
                pictureX = value;
            case 'pictureY':
                pictureY = value;
            case 'pictureWidth':
                pictureWidth = value;
            case 'pictureHeight':
                pictureHeight = value; 
            case 'rounded':
                rounded =  value;
            case _:
                super.setParameter( name, value );
        }
    }
}