package pixelimageXY.triangleGML;

import pixelimageXY.Pixelshape;
import pixelimageXY.triangleGML.*;

import triangleGML.TriangleGML_;
import triangleGML.ShapeInterface;

class TriangleGML extends TriangleGML_<Pixelshape,Pixelshape> {
    /*
    public static inline function withString( pixelShape: Pixelshape, str: String, x: Float = 0., y: Float = 0. ): TriangleGML {
        trace(str);
        var xml = Xml.parse( '<node>'+str+'</node>' ).firstElement();
        trace( xml );
        return new TriangleGML( pixelShape, xml, x, y );
    }
    */
    public function getTriangleGML( nodeName: String ): ShapeInterface<Pixelshape,Pixelshape>{
        
        var s: ShapeInterface<Pixelshape,Pixelshape> = switch( nodeName ){
                case ARROW_SHAPE:
                    new ArrowShape();
                case ARC_FORM:
                    new ArcForm();
                case LINE_GRID_SHAPE:
                    new LineGridShape();
                case QUAD_SHAPE:
                    new QuadShape();
                case RECTANGLE_FORM:
                    new RectangleForm();
                case ELLIPSE_FORM:
                    new EllipseForm();
                case CIRCLE_FORM:
                    new CircleForm();
                case LINE_SHAPE:
                    new LineShape();
                case _:
                    throw( 'shape unfound' );
        }
        return s;          
    }
}