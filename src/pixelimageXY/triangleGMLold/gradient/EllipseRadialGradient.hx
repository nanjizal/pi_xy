package pixelimageXY.triangleGML.gradient;
import pixelimageXY.Pixelimage;
import pixelimageXY.Pixelshape;
import pixelimageXY.triangleGML.coreShape.BasicGradient;
import pixelimageXY.iter.BoundIterator;
import pixelimageXY.algo.PolyPixel;

@:structInit
class EllipseRadialGradient extends BasicGradient {
    public var centreX: Float;
    public var centreY: Float;
    public var radiusX: Float;
    public var radiusY: Float;
    public var colorIn: Int;
    public var colorOut: Int;
    public var gradientCentreX: Float;
    public var gradientCentreY: Float;
    public var rotation: Float;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , centreX = 30
                        , centreY = 30
                        , radiusX = 10
                        , radiusY = 10
                        , colorIn = 0xFFFFFF00
                        , colorOut = 0xFF0000FF
                        , gradientCentreX = -1.
                        , gradientCentreY = -1.
                        , rotation = 0.
                        ){
        super( opacity, visibility, [ colorIn, colorOut ] );
        this.centreX = centreX;
        this.centreY = centreY;
        this.radiusX = radiusX;
        this.radiusY = radiusY;
        this.gradientCentreY = gradientCentreX;
        this.gradientCentreY = gradientCentreY;
        this.rotation = rotation;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'centreX': 
                centreX = Std.parseFloat( value );
            case 'centreY':
                centreY = Std.parseFloat( value );
            case 'radiusX':
                radiusX = Std.parseFloat( value );
            case 'radiusY':
                radiusY = Std.parseFloat( value );
            case 'gradientCentreX':
                gradientCentreX = Std.parseFloat( value );
            case 'gradientCentreY':
                gradientCentreY = Std.parseFloat( value );
            case 'rotation':
                rotation = Std.parseFloat( value );
            case 'colorIn':
                cornerColors[0] = Std.parseInt( value );
            case 'colorOut':
                cornerColors[1] = Std.parseInt( value );  
            case _:
                super.setParameter( name, value );
        }
    }
    public override function render( pixelShape: Pixelshape ): Pixelshape {
        if( gradientCentreX == -1. ) gradientCentreX = centreX;
        if( gradientCentreY == -1. ) gradientCentreY = centreY;
        var rSmall = ( radiusX > radiusY )? radiusY: radiusX;
        var rLarge = ( radiusX < radiusY )? radiusY: radiusX;
        var rDif = rLarge - rSmall;
        var temp = ( rotation == 0 )? new Pixelshape( Std.int( 2*radiusX ), Std.int( 2*radiusY ) ):
                                 new Pixelshape( Std.int( 2*rLarge+rDif ), Std.int( 2*rLarge+rDif ) );
        temp.transparent = false;
        fillRadialPolyBuild( temp, centreX, centreY, radiusX, radiusY, colorIn, colorOut, gradientCentreX, gradientCentreY, rotation );
        if( rotation == 0 ){
            pixelShape.putPixelImage( temp, Std.int( centreX-radiusX ), Std.int( centreY-radiusY ) );
        } else {
            pixelShape.putPixelImage( temp, Std.int( centreX-radiusX-rDif ), Std.int( centreY-radiusY-rDif ) ); 
        }
        temp = null;
        return super.render( pixelShape );
    }
}