package pixelimage.triangleGML.contour;
import pixelimage.Pixelimage;
import pixelimage.triangleGML.coreShape.BasicShape;

@:structInit
class QuadShape extends BasicShape {
    public var aX:      Float;
    public var aY:      Float;
    public var bX:      Float;
    public var bY:      Float;
    public var cX:      Float;
    public var cY:      Float;
    public var dX:      Float;
    public var dY:      Float;
    public var soft:    Float;
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
                        , soft: Float = 0.
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
            case _:
                super.setParameter( name, value );
        }
    }
    public override function render( pixelShape: Pixelshape ): Pixelshape {
        if( soft == 0. ){
            pixelShape.fillQuad( aX+offX, aY+offY, bX+offX, bY+offY, cX+offX, cY+offY, dX+offX, dY+offY, strokeColor );
        } else {
            pixelShape.fillSoftQuad( aX+offX, aY+offY, bX+offX, bY+offY, cX+offX, cY+offY, dX+offX, dY+offY, strokeColor, soft, true, true, true, true );
        }
        return super.render( pixelShape );
    }
}