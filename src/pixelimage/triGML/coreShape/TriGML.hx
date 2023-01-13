package pixelimage.triGML.coreShape;
import pixelimage.triGML.contour.*;
import pixelimage.triGML.coreShape.*;
import pixelimage.triGML.gradient.*;
import pixelimage.triGML.gradientContour.*;
import pixelimage.triGML.patternContour.*;
import pixelimage.triGML.patternShape.*;
import pixelimage.triGML.shape.*;

// module TriGML

enum abstract TriGMLname ( String ) to String {
    /* contour */
    var ARROW_SHAPE                 = 'ArrowShape';
	var CUBIC_CURVE_SHAPE           = 'CubicCurveShape';
    var LINE_GRID_SHAPE             = 'LineGridShape';
    var LINE_SHAPE                  = 'LineShape';
    var POLY_LINE_SHAPE             = 'PolyLineShape';
    var QUAD_CURVE_SHAPE            = 'QuadCurveShape';
    var QUAD_SHAPE                  = 'QuadShape';
    var THRU_CURVE_SHAPE            = 'ThruCurveShape';
    /* gradient */
    var ELLIPSE_RADIAL_GRADIENT     = 'EllipseRadialGradient';
    var PATH_ELEMENT_THICK_GRADIENT = 'PathElementThickGradient';
    var QUAD_GRADIENT               = 'QuadGradient';
    var TRIANGLE_GRADIENT           = 'TriangleGradient';
    /* gradientContour */
    var LINE_GRADIENT               = 'LineGradient';
    var POLY_LINE_GRADIENT          = 'PolyLineGradient';
    /* patternContour */  
    var CUBIC_CURVE_PATTERN         = 'CubicCurvePattern';
    var LINE_PATTERN                = 'LinePattern';
    var QUAD_PATTERN                = 'QuadPattern';
    var TRIANGLE_PATTERN            = 'TrianglePattern';
    // patternShape
    var ARC_PATTERN                 = 'ArcPattern';
    var CIRCLE_PATTERN              = 'CirclePattern';
    var ELLIPSE_PATTERN             = 'EllipsePattern';
    var PATH_ELEMENT_PATTERN        = 'PathElementPattern';
    var QUADRILATERAL_PATTERN       = 'QuadrilateralPattern';
    var RECTANGLE_PATTERN           = 'RectanglePattern';
    var SQUARE_PATTERN              = 'SquarePattern';
    // shape
    var ARC_SHAPE                   = 'ArcShape';
    var CIRCLE_SHAPE                = 'CircleShape';
    var ELLIPSE_SHAPE               = 'EllipseShape';
    var PATH_ELEMENT_SHAPE          = 'PathElementShape';
    var QUADRILATERAL_SHAPE         = 'QuadrilateralShape';
    var RECTANGLE_SHAPE             = 'RectangleShape';
    var SQUARE_SHAPE                = 'SquareShape';
    var STAR6_SHAPE                 = 'Star6Shape';
    var TRIANGLE_SHAPE              = 'TriangleShape';
    var VE_PATH_ELEMENT_SHAPE       = 'VePathElementShape';
}

function getTriGML( nodeName: String ): ShapeInterface {
    var triGMLname: TriGMLname = cast nodeName;
    var s: ShapeInterface = switch( triGMLname ){
        case ARROW_SHAPE:
            new ArrowShape();
        case CUBIC_CURVE_SHAPE:
            new CubicCurveShape();
        case LINE_GRID_SHAPE:
            new LineGridShape();
        case LINE_SHAPE:
            new LineShape();
        case POLY_LINE_SHAPE:
            new PolyLineShape();
        case QUAD_CURVE_SHAPE:
            new QuadCurveShape();
        case QUAD_SHAPE:
            new QuadShape();
        case THRU_CURVE_SHAPE:
            new ThruCurveShape();
        /* gradient */
        case ELLIPSE_RADIAL_GRADIENT:
            new EllipseRadialGradient();
        case PATH_ELEMENT_THICK_GRADIENT:
            new PathElementThickGradient();
        case QUAD_GRADIENT:
            new QuadGradient();
        case TRIANGLE_GRADIENT:
            new TriangleGradient();
        /* gradientContour */
        case LINE_GRADIENT:
            new LineGradient();
        case POLY_LINE_GRADIENT:
            new PolyLineGradient();
        /* patternContour */  
        case CUBIC_CURVE_PATTERN:
            new CubicCurvePattern();
        case LINE_PATTERN:
            new LinePattern();
        case QUAD_PATTERN:
            new QuadPattern();
        case TRIANGLE_PATTERN:
            new TrianglePattern();
        // patternShape
        case ARC_PATTERN:
            new ArcPattern();
        case CIRCLE_PATTERN:
            new CirclePattern();
        case ELLIPSE_PATTERN:
            new EllipsePattern();
        case PATH_ELEMENT_PATTERN:
            new PathElementPattern();
        case QUADRILATERAL_PATTERN:
            new QuadrilateralPattern();
        case RECTANGLE_PATTERN:
            new RectanglePattern();
        case SQUARE_PATTERN:
            new SquarePattern();
        // shape
        case ARC_SHAPE:
            new ArcShape();
        case CIRCLE_SHAPE:
            new CircleShape();
        case ELLIPSE_SHAPE:
            new EllipseShape();
        case PATH_ELEMENT_SHAPE:
            new PathElementShape();
        case QUADRILATERAL_SHAPE:
            new QuadrilateralShape();
        case RECTANGLE_SHAPE: 
            new RectangleShape();
        case SQUARE_SHAPE:
            new SquareShape();
        case STAR6_SHAPE:
            new Star6Shape();
        case TRIANGLE_SHAPE:
            new TriangleShape();
        case VE_PATH_ELEMENT_SHAPE:
            new VePathElementShape(); 
        case _:
            throw( 'shape unfound' );
    }
    return s;
}