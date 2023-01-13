package pixelimage.triGML.contour;
import pixelimage.Pixelimage;
import pixelimage.triGML.coreShape.BasicShape;

@:structInit
class ArrowShape extends BasicShape {
    public var x1: Float;
    public var y1: Float;
    public var x2: Float;
    public var y2: Float;
    public var both: Bool;
    public var flare: Bool;
    public var arrowWidth: Float;
    public var arrowHeight: Float;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeColor        = 0xFFF00000
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        , both = false
                        , flare = false
                        , x1 = 0.
                        , y1 = 0.
                        , x2 = 0.
                        , y2 = 0.
                        , arrowWidth = 0.
                        , arrowHeight = 0.
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray );
        this.both = both;
        this.flare = flare;
        this.x1 = x1;
        this.y1 = y1;
        this.x2 = x2;
        this.y2 = y2;
        this.arrowHeight;
        this.arrowWidth;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'both':
                both = ( StringTools.trim( value ).toLowerCase() == 'true' )? true: false;
            case 'flare':
                flare = ( StringTools.trim( value ).toLowerCase() == 'true' )? true: false;
            case 'x1':
                x1 = Std.parseFloat( value );
            case 'y1':
                y1 = Std.parseFloat( value );
            case 'x2':
                x2 = Std.parseFloat( value );
            case 'y2':
                y2 = Std.parseFloat( value );
            case 'arrowWidth':
                arrowWidth = Std.parseFloat( value );
            case 'arrowHeight':
                arrowHeight = Std.parseFloat( value );
            case _:
                super.setParameter( name, value );
        }
    }
    public override function render( pixelImage: Pixelimage ): Pixelimage {
        if( both == false ){
            if( arrowHeight > 0. || arrowWidth > 0. ){
                pixelImage.fillFixArrow( x1, y1, x2, y2, arrowWidth, arrowHeight, strokeWidth, strokeColor, flare );
            } else {
                pixelImage.fillArrow( x1, y1, x2, y2, strokeWidth, strokeColor, flare );
            }
            
        } else {
            if( arrowHeight > 0. || arrowWidth > 0. ){
                pixelImage.fillFixArrowBoth( x1, y1, x2, y2, arrowWidth, arrowHeight, strokeWidth, strokeColor );
            } else {
                pixelImage.fillArrowBoth( x1, y1, x2, y2, strokeWidth, strokeColor );
            }
        }
        return super.render( pixelImage );
    }
}