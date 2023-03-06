package pixelimageXY.algo;

interface IhitObj {
    public function hit( x: Float, y: Float ): Bool;
    public var undoImage: Null<Pixelimage>;
    public var undoX: Int;
    public var undoY: Int;
}