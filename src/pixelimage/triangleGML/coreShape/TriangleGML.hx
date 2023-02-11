package pixelimage.triangleGML.coreShape;
import pixelimage.triangleGML.contour.*;
import pixelimage.triangleGML.coreShape.*;
import pixelimage.triangleGML.gradient.*;
import pixelimage.triangleGML.gradientContour.*;
import pixelimage.triangleGML.patternContour.*;
import pixelimage.triangleGML.patternShape.*;
import pixelimage.triangleGML.shape.*;
import pixelimage.Pixelimage;
import pixelimage.Pixelshape;
import pixelimage.textureContour.*;
import pixelimage.textureShape.*;
import pixelimage.triangleGML.contour.QuintShape;
import pixelimage.fontImage.OneDfont;
import pixelimage.triangleGML.coreShape.TriangleGML;
// module TriangleGML

class TriangleGML {
    var pixelShape: Pixelshape;
    var xml: Xml;
    var offX: Float;
    var offY: Float;

    public var imageResource = new haxe.ds.StringMap<Pixelimage>();
    public var fontResource1D = new haxe.ds.StringMap<OneDfont>();
    /** 
        allows setting an images for the XML shapes that need images 
        image must already be converted to a Pixelimage / Pixelshape
        within the XML shape it must be 'image'+'*' = name
    **/
    public function addImage( name: String, pixelShape: Pixelshape ): Pixelimage {
        var pixelImage: Pixelimage = ( pixelShape: Pixelimage ); // allows direct setting as a shape.
        var lowerName = name.toLowerCase();
        imageResource.set( lowerName, pixelImage );
        return pixelImage;
    }
    /** 
        allows setting an font for the XML shapes that need images 
        fontImage must already be converted to a Pixelimage / Pixelshape
        within the XML shape it must be 'basicfont'+'*' = name
    **/
    public function addFont1D( name: String, fontImage: Pixelimage
                            , startingAscii: Int = 33, markerColor: Int = 0xFFFFFFFF
                            , pairOffset: Null<haxe.ds.StringMap<Int>> = null ): OneDfont {
        var pixelImage: Pixelimage = ( fontImage: Pixelimage ); // allows direct setting as a shape.
        var oneDfont = new OneDfont( pixelImage, startingAscii, markerColor, pairOffset );
        var lowerName = name.toLowerCase();
        fontResource1D.set( lowerName, oneDfont );
        return oneDfont;
    }
    public var shapes: Array<ShapeInterface>;
    public function new( pixelShape: Pixelshape, xml: Xml, x: Float = 0., y: Float = 0. ){
        this.pixelShape = pixelShape;
        this.xml = xml;
        this.offX = x;
        this.offY = y;
        process();
    }
    public function addShape( str: String, x: Float = 0., y: Float = 0. ): TriangleGML {
        // consider revising perhaps should process new shape and then process new xml with this child as well?
        xml = Xml.parse( '<node>'+str+'</node>' ).firstElement(); 
        this.offX = x;
        this.offY = y;
        process();
        return this;
    }
    public static inline function withString( pixelShape: Pixelshape, str: String, x: Float = 0., y: Float = 0. ): TriangleGML {
        trace(str);
        var xml = Xml.parse( '<node>'+str+'</node>' ).firstElement();
        trace( xml );
        return new TriangleGML( pixelShape, xml, x, y );
    }
    function process(){
        //trace( xml );
        for( e in xml.elements() ) processShape( e );
    }
    
    function processShape( x: Xml ){
        var name: String = x.nodeName;
        var s = getTriangleGML( name );
        for( att in x.attributes() ){
            trace( att + ' ' + x.get(att) );
            if( att.substr( 0, 'image'.length ) == 'image' ){
                // use image resource
                s.setImage( att.toLowerCase(), imageResource.get( x.get(att) ) );
            } else if(  att.substr( 0, 'fontbasic'.length ).toLowerCase() == 'fontbasic' ){
                // use font 1D resource
                s.setBasicFont( att.toLowerCase(), fontResource1D.get( x.get(att) ) );
            } else {
                s.setParameter( att, x.get( att ) );
            }
        }
        if( offX != 0. || offY != 0. ){
            s.translate( offX, offY );
        }
        s.render( pixelShape );
        if( shapes == null ) shapes = [];
        shapes.push( s );
    }
}

enum abstract TriangleGMLname ( String ) to String {
    /* contour */
    var ARROW_SHAPE                 = 'ArrowShape';
	var CUBIC_CURVE_SHAPE           = 'CubicCurveShape';
    var LINE_GRID_SHAPE             = 'LineGridShape';
    var LINE_SHAPE                  = 'LineShape';
    var POLY_LINE_SHAPE             = 'PolyLineShape';
    var QUAD_CURVE_SHAPE            = 'QuadCurveShape';
    var QUAD_SHAPE                  = 'QuadShape';
    var QUAD_SOFT_SHAPE             = 'QuadSoftShape';
    var QUINT_SHAPE                 = 'QuintShape';
    var SOFT_ELLIPSE_SHAPE          = 'SoftEllipseShape';
    var THRU_CURVE_SHAPE            = 'ThruCurveShape';
    var TRIANGLE_SOFT_SHAPE         = 'TriangleSoftShape';
    /* gradient */
    var ARROW_THICK_GRADIENT        = 'ArrowThickGradient';
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
    var PATH_SOFT_ELEMENT_PATTERN   = 'PathSoftElementPattern';
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

function getTriangleGML( nodeName: String ): ShapeInterface {
    var triangleGMLname: TriangleGMLname = cast nodeName;
    var s: ShapeInterface = switch( triangleGMLname ){
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
        case QUAD_SOFT_SHAPE:
            new QuadSoftShape();
        case QUINT_SHAPE:
            new QuintShape();
        case SOFT_ELLIPSE_SHAPE:
            new SoftEllipseShape();
        case THRU_CURVE_SHAPE:
            new ThruCurveShape();
        case TRIANGLE_SOFT_SHAPE:
            new TriangleSoftShape();
        /* gradient */
        case ARROW_THICK_GRADIENT:
            new ArrowThickGradient();
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
        case PATH_SOFT_ELEMENT_PATTERN:
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