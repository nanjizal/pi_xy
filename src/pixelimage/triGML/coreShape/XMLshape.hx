package pixelimage.triGML.coreShape;
//import haxe.xml.Access;
import pixelimage.Pixelimage;
import pixelimage.Pixelshape;
import pixelimage.textureContour.*;
import pixelimage.textureShape.*;
import pixelimage.triGML.coreShape.TriGML;

class XMLshape {
    var pixelShape: Pixelshape;
    var xml: Xml;
    public function new( pixelShape: Pixelshape, xml: Xml ){
        this.pixelShape = pixelShape;
        this.xml = xml;
        process();
    }
    public static inline function withString( pixelShape: Pixelshape, str: String ): XMLshape {
        trace(str);
        var xml = Xml.parse( '<node>'+str+'</node>' ).firstElement();
        trace( xml );
        return new XMLshape( pixelShape, xml );
    }
    function process(){
        //trace( xml );
        for( e in xml.elements() ) processShape( e );
    }
    
    function processShape( x: Xml ){
        var name: String = x.nodeName;
        var s = getTriGML( name );
        for( att in x.attributes() ){
            trace( att + ' ' + x.get(att) );
            s.setParameter( att, x.get( att ) );
        }
        s.render( pixelShape );
    }
}