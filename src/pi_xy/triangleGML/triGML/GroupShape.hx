package pi_xy.triangleGML.triGML;

import pi_xy.triangleGML.triGML.hitTest.IhitObj;
import iterMagic.ParameterString;

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
    public function setParameter( name: String, value: ParameterString ){
        switch( name ){
            case 'visibility':
                visibility = value;
            case 'opacity':
                opacity = value;
            case 'rotation':
                rotation = value.toRadian();
            case 'theta':
                rotation = value;
            case 'transformCentreX':
                transformCentreX = value;
            case 'transformCentreY':
                transformCentreY = value;
            case 'skewX':
                skewX = value;
            case 'skewY':
                skewY = value;
            case 'scaleX':
                scaleX = value;
            case 'scaleY':
                scaleY = value;
            case 'scale':
                scaleX = scaleY = value;
            case 'edgeSoft':
                edgeSoft = value;   
            case 'externalSoft':
                externalSoft = value;
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