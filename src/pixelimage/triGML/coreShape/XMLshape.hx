package pixelimage.triGML.coreShape;
//import haxe.xml.Access;
import pixelimage.Pixelimage;
import pixelimage.triGML.contour.*;
import pixelimage.triGML.coreShape.*;
import pixelimage.triGML.gradient.*;
import pixelimage.triGML.gradientContour.*;
import pixelimage.triGML.patternContour.*;
import pixelimage.triGML.patternShape.*;

// shape
import pixelimage.triGML.shape.ArcShape;
import pixelimage.triGML.shape.CircleShape;
import pixelimage.triGML.shape.EllipseShape;
import pixelimage.triGML.shape.PathElementShape;
import pixelimage.triGML.shape.QuadShape;
import pixelimage.triGML.shape.RectangleShape;
import pixelimage.triGML.shape.SquareShape;
import pixelimage.triGML.shape.Star6Shape;
import pixelimage.triGML.shape.TriangleShape;

import pixelimage.textureContour.*;
import pixelimage.textureShape.*;

class XMLshape {
    var pixelImage: Pixelimage;
    var xml: Xml;
    public function new( pixelImage: Pixelimage, xml: Xml ){
        this.pixelImage = pixelImage;
        this.xml = xml;
        process();
    }
    public static inline function withString( pixelImage: Pixelimage, str: String ): XMLshape {
        trace(str);
        var xml = Xml.parse( '<node>'+str+'</node>' ).firstElement();
        trace( xml );
        return new XMLshape( pixelImage, xml );
    }
    function process(){
        //trace( xml );
        for( e in xml.elements() ) processShape( e );
    }
    
    function processShape( x: Xml ){
        var s: ShapeInterface = 
        switch( x.nodeName ){
            case 'ArcShape':
                new ArcShape();
            case 'CircleShape':
                new CircleShape();
            case 'CubicCurveShape':
                new CubicCurveShape();
            case 'EllipseShape':
                new EllipseShape(); 
            case 'LineGradient':
                new LineGradient();
            case 'LineShape':
                new LineShape();
            case 'PathElementShape':
                new PathElementShape();
            case 'PathElementThickGradient':
                new PathElementThickGradient();
            case 'PolyLineGradient':
                new PolyLineGradient();
            case 'PolyLineShape':
                new PolyLineShape();
            case 'QuadCurveShape':
                new QuadCurveShape();
            case 'QuadShape':
                new QuadShape();
            case 'RectanglePattern':
                new RectanglePattern();
            case 'RectangleShape':
                new RectangleShape();
            case 'SquareShape':
                new SquareShape();
            case 'Star6Shape':
                new Star6Shape();
            case 'TriangleGradient':
                trace('triangle gradient');
                new TriangleGradient();
            case 'TriangleShape':
                new TriangleShape();
            //case 'ComponentShape':
                // this is like a default shape drawn on, if/when nesting gets setup
              //  new ComponentShape();
            case _:
                throw( 'shape unfound' );
        }
        for( att in x.attributes() ){
            trace( att + ' ' + x.get(att) );
            s.setParameter( att, x.get( att ) );
        }
        s.render( pixelImage );
    }
}