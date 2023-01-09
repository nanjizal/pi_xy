package pixelimage.triGML.gradient;
import pixelimage.Pixelimage;
import pixelimage.triGML.coreShape.BasicGradient;
import pixelimage.iter.BoundIterator;

@:structInit
class QuadGradient extends BasicGradient {
    public var x1:      Float;
    public var y1:      Float;
    public var color1:  Int;
    public var x2:      Float;
    public var y2:      Float;
    public var color2:  Float;
    public var x3:      Float;
    public var y3:      Float;
    public var color3:  Float;
    public var x4:      Float;
    public var y4:      Float;
    public var color4:  Float;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , x1 = 0.
                        , y1 = 0.
                        , color1 = 0xffd9ff00
                        , x2 = 0.
                        , y2 = 0.
                        , color2 = 0xFFFF00FB
                        , x3 = 0.
                        , y3 = 0.
                        , color3 = 0xFF00FFBF
                        , x4 = 0.
                        , y4 = 0.
                        , color4 = 0xFFFF9500
                        ){
        super( opacity, visibility, [ color1, color2, color3, color4 ] );
        this.x1 = x1;
        this.y1 = y1;
        this.x2 = x2;
        this.y2 = y2;
        this.x3 = x3;
        this.y3 = y3;
        this.x4 = x4;
        this.y4 = y4;
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
            case 'x3':
                x3 = Std.parseFloat( value );
            case 'y3':
                y3 = Std.parseFloat( value );
            case 'x4':
                x4 = Std.parseFloat( value );
            case 'y4':
                y4 = Std.parseFloat( value );
            case 'color1':
                cornerColors[0] = Std.parseInt( value );
            case 'color2':
                cornerColors[1] = Std.parseInt( value );
            case 'color3':
                cornerColors[2] = Std.parseInt( value );
            case 'color4':
                cornerColors[3] = Std.parseInt( value );    
            case _:
                super.setParameter( name, value );
        }
    }
    public override function render( pixelImage: Pixelimage ): Pixelimage {
        var iterX  = boundIterator4( x1, x2, x3, x4 );
        var iterY  = boundIterator4( y1, y2, y3, y4 );
        var left   = iterX.start;
        var top    = iterY.start;
        var width  = iterX.max - left;
        var height = iterY.max - top;
        var temp   = new Pixelimage( Math.ceil( width ), Math.ceil( height ) );
        temp.transparent = false;
        temp.fillGradQuad( x1, y1, cornerColors[0]
                         , x2, y2, cornerColors[1]
                         , x3, y3, cornerColors[2]
                         , x4, y4, cornerColors[3] );
        pixelImage.putPixelImage( temp, left, top );
        temp = null;
        return super.render( pixelImage );
    }
}