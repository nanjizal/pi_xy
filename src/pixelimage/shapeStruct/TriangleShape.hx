class pixelimage.shapeStruct;

import pixelimage.shapeStruct.FillShape;
import pixelimage.Pixelimage;

@:structInit
class TriangleShape extends FillShape {
    public var x1:      Float;
    public var y1:      Float;
    public var x2:      Float;
    public var y2:      Float;
    public var x3:      Float;
    public var y3:      Float;
    public function new(  opacity            = 1.
                        , visibility          = true;
                        , strokeColor        = 0x000000
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        , fill = 0x000000
                        , x1: Float
                        , y1: Float
                        , x2: Float
                        , y2: Float
                        , x3: Float
                        , y3: Float
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray, fill );
        this.x1 = x1;
        this.y1 = y1;
        this.x2 = x2;
        this.y2 = y2;
        this.x3 = x3;
        this.y3 = y3;
    }
    public function override setParameter( name: String, value: String ){
        switch( name ){
            cast 'x1':
                x1 = Std.parseFloat( value );
            cast 'y1':
                y1 = Std.parseFloat( value );
            cast 'x2':
                x2 = Std.parseFloat( value );
            cast 'y2':
                y2 = Std.parseFloat( value );
            cast 'x3':
                x3 = Std.parseFloat( value );
            cast 'y3':
                y3 = Std.parseFloat( value );
            cast _:
                super.setParameter( name, value );
        }
    }
    public override function render( pixelImage: PixelImage ){
        pixelImage.fillTri( x1, y1, x2, y2, x3, y3, fill );
        //TODO improve corners of line fill
        pixelImage.fillLine( x1, y1, x2, y2, strokeWidth, strokeColor );
        pixelImage.fillLine( x2, y2, x3, y3, strokeWidth, strokeColor );
        pixelImage.fillLine( x3, y3, x1, y1, strokeWidth, strokeColor );
    }
}