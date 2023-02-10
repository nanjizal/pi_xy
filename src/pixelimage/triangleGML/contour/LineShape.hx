package pixelimage.triangleGML.contour;
import pixelimage.Pixelimage;
import pixelimage.Pixelshape;
import pixelimage.triangleGML.coreShape.BasicShape;

@:structInit
class LineShape extends BasicShape {
    public var x1: Float;
    public var y1: Float;
    public var x2: Float;
    public var y2: Float;
    public var soft: Float;
    public var luxury: Bool;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeColor        = 0xFFF00000
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        , x1 = 0.
                        , y1 = 0.
                        , x2 = 0.
                        , y2 = 0.
                        , soft = 0.
                        , luxury: Bool = false
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray );
        this.x1 = x1;
        this.y1 = y1;
        this.x2 = x2;
        this.y2 = y2;
        this.soft = soft;
        this.luxury = luxury;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'x1':
                x1 = Std.parseFloat( value );
            case 'y1':
                y1 = Std.parseFloat( value );
            case 'x2':
                x2 = Std.parseFloat( value );
            case 'y2':
                y2 = Std.parseFloat( value );
            case 'soft':
                soft = Std.parseFloat( value );
            case 'luxury':
                luxury = ( StringTools.trim( value ).toLowerCase() == 'true' )? true: false; 
                trace('setting luxury '+ value );            
            case _:
                super.setParameter( name, value );
        }
    }
    public override function render( pixelShape: Pixelshape ): Pixelshape {
        var px = x1 + offX;
        var qx = x2 + offX;
        var py = y1 + offY;
        var qy = y2 + offY;
        if( soft == 0. ){
            pixelShape.fillLine( px, py, qx, qy, strokeWidth, strokeColor );
        } else {

            if( luxury ){
                pixelShape.fillSoftLineLuxury( px, py, qx, qy, strokeWidth, strokeColor, soft );
            } else {
                trace("luxury!!");
                pixelShape.fillSoftLine( px, py, qx, qy, strokeWidth, strokeColor, soft );
            }
        }
        return super.render( pixelShape );
    }
}