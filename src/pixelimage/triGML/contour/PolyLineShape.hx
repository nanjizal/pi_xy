package pixelimage.triGML.contour;
import pixelimage.Pixelimage;
import pixelimage.triGML.coreShape.DrawShapeHelper;
import pixelimage.triGML.coreShape.FillShape;

@:structInit
class PolyLineShape extends FillShape {
    public var points: Null<Array<Float>>;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeColor        = 0x000000
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        , fill = 0x000000
                        , points = null
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray, fill );
        this.points = points;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'points':
                value = value.split('[')[1].split(']')[0];
                points = [ for( n in value.split(',') ) Std.parseFloat( n )  ];
            case _:
                super.setParameter( name, value );
        }
    }
    public override function render( pixelImage: Pixelimage ): Pixelimage {
        {
            var drawing = new DrawShapeHelper( pixelImage, strokeWidth, strokeColor );
            var l = points.length;
            if( l < 4 ) return pixelImage;
            if( l%2 != 0 ) return pixelImage;
            var i = 0;
            var x = 0.;
            var y = 0.;
            x = points[i];
            i++;
            y = points[i];
            i++;
            drawing.moveTo( x, y );
            while( i < l ){
                x = points[ i ];
                i++;
                y = points[ i ];
                i++;
                drawing.lineTo( x, y );
            }
        }
        return super.render( pixelImage );
    }
}