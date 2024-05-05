package pi_xy.triangleGML.triGML;

import pi_xy.triangleGML.triGML.GroupShape;
import iterMagic.ParameterString;

abstract class BasicGradient<DRAWTOOL,IMAGETOOL> extends GroupShape<DRAWTOOL,IMAGETOOL> {
    public var cornerColors = new Array<Int>();
    public function new(  opacity            = 1.
                        , visibility         = true
                        , cornerColors       = null
                        ){
        super( opacity, visibility );
        if( cornerColors != null ) this.cornerColors = cornerColors;
    }
    public override function setParameter( name: String, value: ParameterString ){
        switch( name ){
            case 'cornerColors':
                cornerColors = value; 
            case _:
                super.setParameter( name, value );
        }
    }
}