package pixelimageXY.triangleGML.contour;
import pixelimageXY.Pixelimage;
import pixelimageXY.triangleGML.coreShape.BasicShape;

@:structInit
class TriangleSoftShape extends BasicShape {
    public var aX:      Float;
    public var aY:      Float;
    public var bX:      Float;
    public var bY:      Float;
    public var cX:      Float;
    public var cY:      Float;
    public var soft3:   Float;
    public var softAB:  Bool;
    public var softBC:  Bool;
    public var softCA:  Bool;
    
    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeColor        = 0xFFF00000

                        , aX: Float = 0.
                        , aY: Float = 0.
                        , bX: Float = 1.
                        , bY: Float = 0.
                        , cX: Float = 1.
                        , cY: Float = 1.
                        , soft3: Float = 10.
                        , softAB: Bool = true
                        , softBC: Bool = true
                        , softCA: Bool = true
                        ){
        super( opacity, visibility, strokeColor, 0., null );
        this.aX = aX;
        this.aY = aY;
        this.bX = bX;
        this.bY = bY;
        this.cX = cX;
        this.cY = cY;
        this.soft3 = soft3;
        this.softAB = softAB;
        this.softBC = softBC;
        this.softCA = softCA;

    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'aX':
                aX = Std.parseFloat( value );
            case 'aY':
                aY = Std.parseFloat( value );
            case 'bX':
                bX = Std.parseFloat( value );
            case 'bY':
                bY = Std.parseFloat( value );
            case 'cX':
                cX = Std.parseFloat( value );
            case 'cY':
                cY = Std.parseFloat( value );         
            case 'soft3':
                soft3 = Std.parseFloat( value ); 
            case 'softAB':
                softAB = ( StringTools.trim( value ).toLowerCase() == 'true' )? true: false;
            case 'softBC':
                softBC = ( StringTools.trim( value ).toLowerCase() == 'true' )? true: false;   
            case 'softCA':
                softCA = ( StringTools.trim( value ).toLowerCase() == 'true' )? true: false;                     
            case _:
                super.setParameter( name, value );
        }
    }
    public override function render( pixelShape: Pixelshape ): Pixelshape {
        pixelShape.softFillTriangle( aX, aY, bX, bY, cX, cY, strokeColor, soft3, softAB, softBC, softCA );
        return super.render( pixelShape );
    }
}