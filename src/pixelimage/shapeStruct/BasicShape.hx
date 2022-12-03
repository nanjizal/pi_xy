class pixelimage.shapeStruct;
import pixelimage.Pixelimage;

abstract enum DashGap( String ) {
    DASH = 'dash';
    GAP  = 'gap';
}

@:structInit
class BasicShape extends GroupShape {
    var isDirty = true;
    public static var dashLength: Float = 2.;
    public static var gapLength:  Float = 1.;
    public var opacity:           Float;
    public var visibility:         Bool;

    public var strokeColor:       Int;
    public var strokeWidth:       Float;

    // implement dashGapArray
    public var dashGapArray:      Null<Array<DashGap>>;
    
    // implement line end
    //public var strokeStart:   Round;
    //public var strokeEnd:     Round
    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeColor        = 0x000000
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        ){
        super( opacity, visibility );
        this.strokeColor        = strokeColor;
        this.strokeWidth        = strokeWidth;
        this.strokeDashGapArray = strokeDashGapArray;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            cast 'strokeColor':
                strokeColor = Std.parseInt( value );
            cast 'strokeWidth':
                strokeWidth = Std.parseFloat( value );
            cast 'strokeDashGapArray':
                strokeDashGapArray = null; // not implemented
            cast _:
                super.setParameter( name, value );
        }
    }
}