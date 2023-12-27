package pi_xy.triangleGML.triGML.shape.gradient;
import pi_xy.triangleGML.triGML.FillForm;


abstract class RectangleGradient_<DRAWTOOL,IMAGETOOL> extends BasicGradient<DRAWTOOL,IMAGETOOL> {
    public var left:     Float;
    public var top:      Float;
    public var width:    Float;
    public var height:   Float;
    public var rounded:  Bool;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , left = 0.
                        , top = 0.
                        , width = 1.
                        , height = 1.
                        , colorA = 0xFFFF9900
                        , colorB = 0xFFBFFF00
                        , colorC = 0xFF00EAFF
                        , colorD = 0xFF7300FF
                        , rounded = false
                        ){
        super( opacity, visibility, [ colorA, colorB, colorC, colorD ] );
        this.left   = left;
        this.top    = top;
        this.width  = width;
        this.height = height;
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
            case 'rounded':
                rounded =  ( StringTools.trim( value ).toLowerCase() == 'true' )? true: false;
            case 'colorA':
                cornerColors[0] = Std.parseInt( value );
            case 'colorB':
                cornerColors[1] = Std.parseInt( value );
            case 'colorC':
                cornerColors[2] = Std.parseInt( value );
            case 'colorD':
                cornerColors[3] = Std.parseInt( value );
            case 'colorFirst':
                cornerColors[0] = Std.parseInt( value );
                cornerColors[4] = Std.parseInt( value );
            case 'colorSecond':
                cornerColors[2] = Std.parseInt( value );
                cornerColors[3] = Std.parseInt( value );
            case 'colorTop':
                cornerColors[0] = Std.parseInt( value );
                cornerColors[2] = Std.parseInt( value );
            case 'colorBottom':
                cornerColors[4] = Std.parseInt( value );
                cornerColors[3] = Std.parseInt( value );
            case _:
                super.setParameter( name, value );
        }
    }
}