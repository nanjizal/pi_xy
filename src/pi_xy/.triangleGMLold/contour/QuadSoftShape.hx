package pi_xy.triangleGML.contour;
import pi_xy.Pixelimage;
import pi_xy.triangleGML.coreShape.BasicShape;

@:structInit
class QuadSoftShape extends BasicShape {
    public var aX:      Float;
    public var aY:      Float;
    public var bX:      Float;
    public var bY:      Float;
    public var cX:      Float;
    public var cY:      Float;
    public var dX:      Float;
    public var dY:      Float;
    public var soft:    Float;
    public var softAB:  Bool;
    public var softBC:  Bool;
    public var softCD:  Bool;
    public var softDA:  Bool;

    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeColor        = 0xFFF00000

                        , aX: Float = 0.
                        , aY: Float = 0.
                        , bX: Float = 1.
                        , bY: Float = 0.
                        , cX: Float = 1.
                        , cY: Float = 1.
                        , dX: Float = 0.
                        , dY: Float = 1.
                        , soft: Float = 40.
                        , softAB: Bool = true
                        , softBC: Bool = true
                        , softCD: Bool = true
                        , softDA: Bool = true
                        ){
        super( opacity, visibility, strokeColor, 0., null );
        this.aX = aX;
        this.aY = aY;
        this.bX = bX;
        this.bY = bY;
        this.cX = cX;
        this.cY = cY;
        this.dX = dX;
        this.dY = dY;
        this.soft = soft;
        this.softAB = softAB;
        this.softBC = softBC;
        this.softCD = softCD;
        this.softDA = softDA;
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
            case 'dX':
                dX = Std.parseFloat( value );
            case 'dY':
                dY = Std.parseFloat( value );  
            case 'soft':
                soft = Std.parseFloat( value ); 
            case 'softAB':
                softAB = ( StringTools.trim( value ).toLowerCase() == 'true' )? true: false;
            case 'softBC':
                softBC = ( StringTools.trim( value ).toLowerCase() == 'true' )? true: false;   
            case 'softCD':
                softCD = ( StringTools.trim( value ).toLowerCase() == 'true' )? true: false; 
            case 'softDA':
                softDA = ( StringTools.trim( value ).toLowerCase() == 'true' )? true: false; 
            case _:
                super.setParameter( name, value );
        }
    }
    public override function render( pixelShape: Pixelshape ): Pixelshape {
        pixelShape.fillSoftQuad( aX+offX, aY+offY, bX+offX, bY+offY, cX+offX, cY+offY, dX+offX, dY+offY, strokeColor, soft, softAB, softBC, softCD, softDA );
        return super.render( pixelShape );
    }
}