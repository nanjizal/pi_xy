package pi_xy.triangleGML.triGML.hitTest;

interface IhitObj<IMAGETOOL>{
    public function hit( x: Float, y: Float ): Bool;
    // Not always used.
    public var undoImage: Null<IMAGETOOL>;
    public var undoX: Int;
    public var undoY: Int;
}