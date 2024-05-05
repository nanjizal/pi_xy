package pi_xy.triangleGML.triGML;
import iterMagic.ParameterString;
interface ShapeInterface<DRAWTOOL,IMAGETOOL> {
    function setParameter( name: String, value: ParameterString ):Void;
    function translate( x: Float, y: Float ):Void;
    function hit( x: Float, y: Float ): Bool;
    function clear( drawTool: DRAWTOOL, color: Int ): DRAWTOOL;
    function render( drawTool: DRAWTOOL ): DRAWTOOL;
    function setImage( name: String, imageTool: IMAGETOOL ):IMAGETOOL;
}