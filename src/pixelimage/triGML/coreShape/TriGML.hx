package pixelimage.triGML.coreShape;

// module TriGML

enum abstract TriGMLname (String) to String {
    /* contour */
    var cubicCurveShape_name =  'CubicCurveShape';
    var lineGridShape_name =    'LineGridShape';
    var lineShape_name =        'LineShape';
    var polyLineShape_name =    'PolyLineShape';
    var quadCurveShape_name =   'QuadCurveShape';
    var thruCurveShape_name =  'ThruCurveShape';
    /* gradient */
    var pathElementThickGradient = 'PathElementThickGradient';
    var quadGradient             = 'QuadGradient';
    var triangleGradient         = 'TriangleGradient';
    /* gradientContour */

}