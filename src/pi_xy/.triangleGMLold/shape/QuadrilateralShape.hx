package pi_xy.triangleGML.shape;
import pi_xy.Pixelimage;
import pi_xy.Pixelshape;
import pi_xy.triangleGML.coreShape.FillShape;
import pi_xy.iter.BoundIterator;

@:structInit
class QuadrilateralShape extends FillShape {
    public var x1:      Float;
    public var y1:      Float;
    public var x2:      Float;
    public var y2:      Float;
    public var x3:      Float;
    public var y3:      Float;
    public var x4:      Float;
    public var y4:      Float;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeColor        = 0x000000
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        , fill = 0x000000
                        , x1 = 0.
                        , y1 = 0.
                        , x2 = 0.
                        , y2 = 0.
                        , x3 = 0.
                        , y3 = 0.
                        , x4 = 0.
                        , y4 = 0.
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray, fill );
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
            case _:
                super.setParameter( name, value );
        }
    }
    public override function render( pixelShape: Pixelshape ): Pixelshape {
        var iterX  = boundIterator4( x1, x2, x3, x4 );
        var iterY  = boundIterator4( y1, y2, y3, y4 );
        var left   = iterX.start;
        var top    = iterY.start;
        var width  = iterX.max - left;
        var height = iterY.max - top;
        var temp   = new Pixelshape( Math.ceil( width ), Math.ceil( height ) );
        temp.transparent = false;
        var rx = width/2;
        var ry = height/2;

        var x1_ = x1 - left;
        var x2_ = x2 - left;
        var x3_ = x2 - left;
        var x4_ = x4 - left;

        var y1_ = y1 - top;
        var y2_ = y2 - top;
        var y3_ = y3 - top;
        var y4_ = y4 - top;

        // slight round error
        temp.fillQuad( x1_, y1_, x2_, y2_, x3_, y3_, x4_, y4_, strokeColor );

        x1_ += strokeWidth;
        x2_ += strokeWidth;
        x3_ += strokeWidth;
        x4_ += strokeWidth;

        y1_ += strokeWidth;
        y2_ += strokeWidth;
        y3_ += strokeWidth;
        y4_ += strokeWidth;

        // slight round error
        temp.fillQuad( x1_, y1_, x2_, y2_, x3_, y3_, x4_, y4_, fill );

        pixelShape.putPixelImage( temp, Std.int( left+offX ), Std.int( top+offY ) );
        temp = null;

        return super.render( pixelShape );
    }
    
}