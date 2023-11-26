package pi_xy.triangleGML.triGML;

interface ShapeInterface<DRAWTOOL,IMAGETOOL> {
    function setParameter( name: String, value: String ):Void;
    function translate( x: Float, y: Float ):Void;
    function hit( x: Float, y: Float ): Bool;
    function clear( drawTool: DRAWTOOL, color: Int ): DRAWTOOL;
    function render( drawTool: DRAWTOOL ): DRAWTOOL;
    function setImage( name: String, imageTool: IMAGETOOL ):IMAGETOOL;
}