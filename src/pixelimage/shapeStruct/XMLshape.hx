package pixelimage.shapeStruct;
//import haxe.xml.Access;

class XMLshape {
    var pixelImage: Pixelimage;
    var xml: Xml;
    public function new( pixelImage: PixelImage, xml: Xml ){
        this.pixelImage = pixelImage;
        this.xml = xml;
        process();
    }
    public static inline withString( pixelImage: PixelImage, str: String ): XMLshape {
        var xml = Xml.parse( str ).firstChild();
        return new XMLshape( pixelImage, xml );
    }
    function process(){
        for( e in Xml.elements ) processShape( e );
    }
    function processShape( x: Xml ){
        switch( x.nodeName ){
            case 'ChordArcShape':
                var s = new ChordArcShape();
                for( att in x.attributes() ) s.setParameter( att, x.get( att ) );
                s.render( pixelImage );
            case 'CircleShape':
                var s = new CircleShape();
                for( att in x.attributes() ) s.setParameter( att, x.get( att ) );
                s.render( pixelImage );
            case 'CubicCurveShape':
                var s = new CubicCurveShape();
                for( att in x.attributes() ) s.setParameter( att, x.get( att ) );
                s.render( pixelImage );
            case 'EllipseArcShape':
                var s = new EllipseArcShape();
                for( att in xml.attributes() ) s.setParameter( att, xml.get( att ) );
                s.render( pixelImage );
            case 'LineGradient':
                var s = new LineGradient();
                for( att in xml.attributes() ) s.setParameter( att, xml.get( att ) );
                s.render( pixelImage );
            case 'LineShape':
                var s = new LineShape();
                for( att in xml.attributes() ) s.setParameter( att, xml.get( att ) );
                s.render( pixelImage );
            case 'PathElementShape':
                var s = new PathElementShape();
                for( att in xml.attributes() ) s.setParameter( att, xml.get( att ) );
                s.render( pixelImage );
            case 'PieArcShape':
                var s = new PieArcShape();
                for( att in xml.attributes() ) s.setParameter( att, xml.get( att ) );
                s.render( pixelImage );
            case 'PolyLineGradient':
                var s = new PolyLineGradient();
                for( att in xml.attributes() ) s.setParameter( att, xml.get( att ) );
                s.render( pixelImage );
            case 'PolyLineShape':
                var s = new PolyLineShape();
                for( att in xml.attributes() ) s.setParameter( att, xml.get( att ) );
                s.render( pixelImage );
            case 'QuadCurveShape':
                var s = new QuadCurveShape();
                for( att in xml.attributes() ) s.setParameter( att, xml.get( att ) );
                s.render( pixelImage );
            case 'QuadShape':
                var s = new QuadShape();
                for( att in xml.attributes() ) s.setParameter( att, xml.get( att ) );
                s.render( pixelImage );
            case 'RectangleShape':
                var s = new RectangleShape();
                for( att in xml.attributes() ) s.setParameter( att, xml.get( att ) );
                s.render( pixelImage );
            case 'SquareShape':
                var s = new SquareShape();
                for( att in xml.attributes() ) s.setParameter( att, xml.get( att ) );
                s.render( pixelImage );
            case 'TriangleGradient':
                var s = new TriangleGradient();
                for( att in xml.attributes() ) s.setParameter( att, xml.get( att ) );
                s.render( pixelImage );
            case 'TriangleShape':
                var s = new TriangleShape();
                for( att in xml.attributes() ) s.setParameter( att, xml.get( att ) );
                s.render( pixelImage );
            case 'ComponentShape':
                // this is like a default shape drawn on, if/when nesting gets setup
                var s = new ComponentShape();
                for( att in xml.attributes() ) s.setParameter( att, xml.get( att ) );
            case _:
                trace( 'shape unfound' );
    }
}