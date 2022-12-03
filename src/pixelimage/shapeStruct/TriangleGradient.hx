class pixelimage.shapeStruct;

import pixelimage.Pixelimage;
import pixelimage.shapeStruct.BasicGradient;

@:structInit
class TriangleGradient extends BasicGradient {
    public var x1:      Float;
    public var y1:      Float;
    public var x2:      Float;
    public var y2:      Float;
    public var x3:      Float;
    public var y3:      Float;
    public function new(  opacity    = 1.
                        , visibility = true;
                        , aX: Float = 0.;
                        , aY: Float = 0.;
                        , bX: Float = 1.;
                        , bY: Float = 0.;
                        , cX: Float = 0.;
                        , cY: Float = 1.;
                        , colorA = 0xFFFF0000;
                        , colorB = 0xFF00FF00;
                        , colorC = 0xFF0000FF;
                        ){
        super( opacity, visibility, [ colorA, colorB, colorC ] );
        this.aX = aX;
        this.aY = aY;
        this.bX = bX;
        this.bY = bY;
        this.cX = cX;
        this.cY = cY;
    }
    public function override setParameter( name: String, value: String ){
        switch( name ){
            cast 'aX':
                aX = Std.parseFloat( value );
            cast 'aY':
                aY = Std.parseFloat( value );
            cast 'bX':
                bX = Std.parseFloat( value );
            cast 'bY':
                bY = Std.parseFloat( value );
            cast 'cX':
                cX = Std.parseFloat( value );
            cast 'cY':
                cY = Std.parseFloat( value );
            cast 'colorA':
                colorA = Std.parseInt( value );
            cast 'colorB':
                colorB = Std.parseInt( value );
            cast 'colorC':
                colorC = Std.parseInt( value );
            cast _:
                super.setParameter( name, value );
        }
    }
    public override function render( pixelImage: Pixelimage ){
        pixelImage.fillGradTri( aX, aY, cornerColors[0], bx, by, cornerColors[1], cx, cy, cornerColors[2] );
    }
}