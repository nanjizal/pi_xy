package pi_xy.triangleGML.triGML.shape.picture;
import pi_xy.triangleGML.triGML.FillForm;
import iterMagic.ParameterString;

abstract class NineSlicePicture_<DRAWTOOL,IMAGETOOL> extends FillForm<DRAWTOOL,IMAGETOOL> {
    public var left:     Float;
    public var top:      Float;

    // initial
    public var initWid:  Float;
    public var initHi:   Float;

    public var initLeft: Float;
    public var initTop:  Float;

    public var initFat:  Float;
    public var initTall: Float;

    // new
    public var newWid:  Float;
    public var newHi:   Float;

    public var newLeft: Float;
    public var newTop:  Float;

    public var newFat:  Float;
    public var newTall: Float;


    public var imageTexture: Null<IMAGETOOL>;
    // rectangleWindow
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

                        , left:     Float = 0.
                        , top:      Float = 0.
                    
                        // initial
                        , initWid:  Float = 4.
                        , initHi:   Float = 4.
                    
                        , initLeft: Float = 1.
                        , initTop:  Float = 1.
                    
                        , initFat:  Float = 2.
                        , initTall: Float = 2.
                    
                        // new
                        , newWid:  Float = 4.
                        , newHi:   Float = 4.
                    
                        , newLeft: Float = 0.5
                        , newTop:  Float = 0.5
                    
                        , newFat:  Float = 3.
                        , newTall: Float = 3.

                        , imageTexture = null
                        , pictureX = 0.
                        , pictureY = 0.
                        , pictureWidth = 0.
                        , pictureHeight = 0.
                        , rounded = false
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray, fill );
        this.left = left;
        this.top = top;
        // init
        this.initWid  = initWid;
        this.initHi   = initHi;
        this.initLeft = initLeft;
        this.initTop  = initTop;
        this.initFat  = initFat;
        this.initTall = initTall;
        // new
        this.newWid  = newWid;
        this.newHi   = newHi;
        this.newLeft = newLeft;
        this.newTop  = newTop;
        this.newFat  = newFat;
        this.newTall = newTall;

        this.imageTexture = imageTexture; // any attribute starting with 'image' is treated as resource image reference
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
            case 'initWid':
                initWid = value;
            case 'initHi':
                initHi = value;
            case 'initLeft':
                initLeft = value;
            case 'initTop':
                initTop = value;
            case 'initFat':
                initFat = value;
            case 'initTall':
                initTall = value;

            case 'newWid':
                newWid = value;
            case 'newHi':
                newHi = value;
            case 'newLeft':
                newLeft = value;
            case 'newTop':
                newTop = value;
            case 'newFat':
                newFat = value;
            case 'newTall':
                newTall = value;
            case 'pictureX':
                pictureX = value;
            case 'pictureY':
                pictureY = value;
            case 'pictureWidth':
                pictureWidth = value;
            case 'pictureHeight':
                pictureHeight = value; 
            case 'rounded':
                rounded = value;
            case _:
                super.setParameter( name, value );
        }
    }
}