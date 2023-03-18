package pixelimageXY.triangleGML.shape;

import pixelimageXY.triangleGML.coreShape.FillShape;
import pixelimageXY.Pixelimage;
import pixelimageXY.Pixelshape;

@:structInit
class Star6Shape extends FillShape {
    public var left:    Float;
    public var top:     Float;
    public var width:   Float;
    public var height:  Float;
    public var diameter: Float;
    public var rotation: Float;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeColor        = 0x000000
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        , fill = 0x000000
                        , left = 0.
                        , top = 0.
                        , diameter = 1.
                        , rotation = 0.
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray, fill );
        this.left      = left;
        this.top       = top;
        this.diameter  = diameter;
        this.rotation  = rotation;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'left':
                left = Std.parseFloat( value );
            case 'top':
                top = Std.parseFloat( value );
            case 'diameter':
                diameter = Std.parseFloat( value );
            case 'rotation':
                var degree = Std.parseFloat( value );
                rotation = ( degree == 0 )?0: Math.PI*degree/180;
            case _:
                super.setParameter( name, value );
        }
    }
    public override function render( pixelShape: Pixelshape ): Pixelshape {
        var temp = new Pixelshape( Math.ceil( width ), Math.ceil( height ) );
        temp.transparent = false;
        // outer radius
        var r_ = diameter/2;
        // inner radius
        var _r = r_ - strokeWidth;
        var px = left + r_;
        var py = top + r_;
        var pi = Math.PI;
        var omega: Float = -pi + rotation;

        var s = Math.sin( omega );
        var c = Math.cos( omega );
        var a0x_: Float = px + r_ * s;
        var a0y_: Float = py + r_ * c;
        var _a0x: Float = px + _r * s;
        var _a0y: Float = py + _r * c;
        omega += pi/3;

        s = Math.sin( omega );
        c = Math.cos( omega );
        var a1x_: Float = px + r_ * s;
        var a1y_: Float = py + r_ * c;
        var _a1x: Float = px + _r * s;
        var _a1y: Float = py + _r * c;

        omega += pi/3;
        s = Math.sin( omega );
        c = Math.cos( omega );
        var b0x_: Float = px + r_ * s;
        var b0y_: Float = py + r_ * c;
        var _b0x: Float = px + _r * s;
        var _b0y: Float = py + _r * c;

        omega += pi/3;
        s = Math.sin( omega );
        c = Math.cos( omega );
        var b1x_: Float = px + r_ * s;
        var b1y_: Float = py + r_ * c;
        var _b1x: Float = px + _r * s;
        var _b1y: Float = py + _r * c;

        omega += pi/3;
        s = Math.sin( omega );
        c = Math.cos( omega );
        var c0x_: Float = px + r_ * s;
        var c0y_: Float = py + r_ * c;
        var _c0x: Float = px + _r * s;
        var _c0y: Float = py + _r * c;

        omega += pi/3;
        s = Math.sin( omega );
        c = Math.cos( omega );
        var c1x_: Float = px + r_ * s;
        var c1y_: Float = py + r_ * c;
        var _c1x: Float = px + _r * s;
        var _c1y: Float = py + _r * c;

        // outer stroke triangles.
        temp.fillTri( a0x_, a0y_, b0x_, b0y_, c0x_, c0y_, strokeColor );
        temp.fillTri( a1x_, a1y_, b1x_, b1y_, c1x_, c1y_, strokeColor );
        //inner fill triangles
        temp.fillTri( _a0x, _a0y, _b0x, _b0y, _c0x, _c0y, fill );
        temp.fillTri( _a1x, _a1y, _b1x, _b1y, _c1x, _c1y, fill );

        pixelShape.putPixelImage( temp, Std.int( left+offX ), Std.int( top+offY ) );
        temp = null;
        return super.render( pixelShape );
    }
}
