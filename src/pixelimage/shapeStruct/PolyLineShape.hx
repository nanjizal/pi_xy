class pixelimage.shapeStruct;
import pixelimage.Pixelimage;
import pixelimage.shapeStruct.FillShape;

@:structInit
class PolyLineShape extends FillShape {
    public var points: Array<Float>;
    public function new(  opacity            = 1.
                        , visibility          = true;
                        , strokeColor        = 0x000000
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        , fill = 0x000000
                        , points
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray, fill );
        this.points = points;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            cast 'points':
                value = value.split('[')[1].split(']')[0];
                points = [ for( n in value.split(',') ) Std.parseFloat( n )  ];
            cast _:
                super.setParameter( name, value );
        }
    }
    public override function render( pixelImage, Pixelimage ){
        {
            var l = points.length;
            if( l < 4 ) return;
            if( l%2 != 0 ) return;
            var i = 0;
            var x = 0.;
            var y = 0.;
            var nextX = 0.;
            var nextY = 0.;
            x = points[i];
            i++;
            y = points[i];
            i++;
            while( i < l ){
                x = points[ i ];
                i++;
                y = points[ i ];
                i++;
                nextX = x;
                nextY = y;
                pixelImage.fillLine( x, y, nextX, nextY, strokeWidth, strokeColor );
            }
        }
    }
}