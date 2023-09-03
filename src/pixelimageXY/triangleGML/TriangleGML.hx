package pixelimageXY.triangleGML;

import pixelimageXY.Pixelimage;
import pixelimageXY.triangleGML.*;

import triangleGML.TriangleGML_;
import triangleGML.ShapeInterface;

#if js
import js.lib.Promise;
import js.html.XMLHttpRequest;
import js.html.ImageElement;
import js.html.Image;

@:structInit
class ShapeAtt {
    public var shape: ShapeInterface<Pixelimage,Pixelimage>;
    public var att:   String;
    public inline 
    function new( shape: ShapeInterface<Pixelimage,Pixelimage>, att: String ){
        this.shape = shape;
        this.att   = att;
    }
}
#end

class TriangleGML extends TriangleGML_<Pixelimage,Pixelimage> {
    /*
    public static inline function withString( pixelImage: Pixelimage, str: String, x: Float = 0., y: Float = 0. ): TriangleGML {
        trace(str);
        var xml = Xml.parse( '<node>'+str+'</node>' ).firstElement();
        trace( xml );
        return new TriangleGML( pixelImage, xml, x, y );
    }
    */
    #if js 
    // setup promise ... untested with dynamic loading of images so far, but compiles.
    public var promises:   Array<Promise<Pixelimage>> = [];
    public var shapes_att: Array<ShapeAtt> = [];
    public override function processAttribute( att: String, value: String, shape: ShapeInterface<Pixelimage,Pixelimage> ){
        if( att.substr( 0, 'src'.length ) == 'src' ){
            promises.push( load( value ) );
            shapes_att.push( ( { shape: shape, att: att.toLowerCase() }: ShapeAtt ) );
        } else {
            super.processAttribute( att, value, shape );
        }    
    }
    public static function load( url: String) {
        return new Promise( function( resolve, reject ) {
            var image = new Image();
            image.onload = () -> {
                resolve( Pixelimage.imageElementToPixels( image ) );
            }
            image.src = url;
      });
    }
    @:access( TriangleGML.render )
    public function renderPromise(): Promise<Dynamic> {
        var here = this;
        return if( promises.length == 0 ){
            Promise.all( [Promise.resolve()] ).then( 
                ( _ ) -> {
                    here.render();
                    here = null;
                });
        } else {
            Promise.all( promises ).then(
                ( pixelimages ) -> {
                    for( i in 0...pixelimages.length ){
                        var shapeAt = here.shapes_att[ i ];
                        var pixelImage: Pixelimage = pixelimages[ i ];
                        shapeAt.shape.setImage( shapeAt.att, pixelImage );
                    }
                    here.render();
                    here = null;
                });
        }
    }
    #end
    //
    public function getTriangleGML( nodeName: String ): ShapeInterface<Pixelimage,Pixelimage> {
        
        var s: ShapeInterface<Pixelimage,Pixelimage> = switch( nodeName ){
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
                case NINE_SLICE_PICTURE:
                    new NineSlicePicture();
                case LINE_GRADIENT:
                    new LineGradient();
                case _:
                    throw( 'shape unfound ' + nodeName );
        }
        return s;          
    }
}