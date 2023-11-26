package pi_xy.triangleGML.triGML;

import pi_xy.triangleGML.triGML.hitTest.IhitObj;

@:structInit
abstract class GroupShape<DRAWTOOL,IMAGETOOL> implements ShapeInterface<DRAWTOOL,IMAGETOOL> {
    var isDirty = true; // TODO: <-- potentially remove
    // implementation may choose to ignore visibility and opacity
    public var visibility: Bool;
    public var opacity:    Float;
    public var offX:       Float = 0.;
    public var offY:       Float = 0.;
    public var hitObj:     Null<IhitObj<DRAWTOOL>> = null;
    // implementations may vary or may choose to ignore
    public var edgeSoft:    Float = 0;
    public var externalSoft: Bool = false;
    public var rotation:    Float = 0.;
    public var transformCentreX:     Float = 0.;
    public var transformCentreY:     Float = 0.;
    public var skewX:       Float = 0.;
    public var skewY:       Float = 0.;
    public var scaleX:      Float = 1.;
    public var scaleY:      Float = 1.;
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
            case 'rotation':
                var degree = Std.parseFloat( value );
                rotation = ( degree == 0 )?0: Math.PI*degree/180;
            case 'theta':
                rotation = Std.parseFloat( value );
            case 'transformCentreX':
                transformCentreX = Std.parseFloat( value );
            case 'transformCentreY':
                transformCentreY = Std.parseFloat( value );
            case 'skewX':
                skewX = Std.parseFloat( value );
            case 'skewY':
                skewY = Std.parseFloat( value );
            case 'scaleX':
                scaleX = Std.parseFloat( value );
            case 'scaleY':
                scaleY = Std.parseFloat( value );
            case 'scale':
                scaleX = scaleY = Std.parseFloat( value );
            case 'edgeSoft':
                edgeSoft = Std.parseFloat( value );   
            case 'externalSoft':
                externalSoft = ( StringTools.trim( value ).toLowerCase() == 'true' )? true: false;
            case _:
                trace( 'property not found ' + name );
        }
    }
    public function translate( x: Float, y: Float ){
        offX = x;
        offY = y;
    }
    abstract public function render( drawTool: DRAWTOOL ): DRAWTOOL;

    public function hit( x: Float, y: Float ): Bool {
        return if( hitObj == null ){
            false;
        } else {
            hitObj.hit( x, y );
        }
    }
    public function clear( drawTool: DRAWTOOL, color: Int ): DRAWTOOL {
        return drawTool;
    }
    public function setImage( name: String, imageTool: IMAGETOOL ):IMAGETOOL {
        return imageTool;
    }
}