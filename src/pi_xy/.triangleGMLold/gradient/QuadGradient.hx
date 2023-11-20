package pi_xy.triangleGML.gradient;
import pi_xy.Pixelimage;
import pi_xy.Pixelshape;
import pi_xy.triangleGML.coreShape.BasicGradient;
import pi_xy.iter.BoundIterator;

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
    public override function render( pixelShape: Pixelshape ): Pixelshape {
        var x1_ = x1+offX;
        var x2_ = x2+offX;
        var x3_ = x3+offX;
        var x4_ = x4+offX;
        var y1_ = y1+offY;
        var y2_ = y2+offY;
        var y3_ = y3+offY;
        var y4_ = y4+offY; 
        var iterX  = boundIterator4( x1_, x2_, x3_, x4_ );
        var iterY  = boundIterator4( y1_, y2_, y3_, y4_ );
        var left   = iterX.start;
        var top    = iterY.start;
        var width  = iterX.max - left;
        var height = iterY.max - top;
        var temp   = new Pixelshape( Math.ceil( width ), Math.ceil( height ) );
        temp.transparent = false;
        temp.fillGradQuad( x1_, y1_, cornerColors[0]
                         , x2_, y2_, cornerColors[1]
                         , x3_, y3_, cornerColors[2]
                         , x4_, y4_, cornerColors[3] );
        pixelShape.putPixelImage( temp, left, top );
        temp = null;
        return super.render( pixelShape );
    }
}