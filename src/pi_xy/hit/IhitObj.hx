package pi_xy.hit;

interface IhitObj {
    public function rectBoundsHit( x: Float, y: Float ): Bool;
    public function hit( x: Float, y: Float ): Bool;
    public var undoImage: Null<Pixelimage>;
    public var undoX: Int;
    public var undoY: Int;
}