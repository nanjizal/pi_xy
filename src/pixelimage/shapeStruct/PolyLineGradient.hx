class pixelimage.shapeStruct;
import pixelimage.Pixelimage;
import pixelimage.shapeStruct.BasicGradient;

abstract enum ColorDirection( String ){
    public var widthways = 'widthways';
    public var longways = 'longways';
}

@:structInit
class PolyLineGradient extends BasicGradient {
    public var points: Array<Float>;
    public var strokeWidth: Float;
    public var colorDirection: ColorDirection;
    public function new(  opacity            = 1.
                        , visibility         = true;
                        , strokeWidth        = 1.
                        , points
                        , colorDirection = longways;
                        , colors
                        ){
        super( opacity, visibility, colors );
        this.strokeWidth = strokeWidth;
        this.colorDirection = colorDirection;
        this.points = points;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            cast 'strokeWidth':
                strokeWidth = Std.parseFloat( value );
            cast 'points':
                value = value.split('[')[1].split(']')[0];
                points = [ for( n in value.split(',') ) Std.parseFloat( n )  ];
            cast 'colorDirection':
                colorDirection ( value == 'widthways' )? widthways: longways;
            cast 'colors':
                value = value.split('[')[1].split(']')[0];
                cornerColors = [ for( n in value.split(',') ) Std.parseInt( n )  ];
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
            var colorCount = 0;
            var colorLen = cornerColors.length;
            var colorA = '0';
            var colorB = '0';
            var colorC = '0';
            var colorD = '0';
            while( i < l ){
                x = points[ i ];
                i++;
                y = points[ i ];
                i++;
                nextX = x;
                nextY = y;
                if( colorDirection == longways ){
                    if( colorCount >= colorLen ) colorCount = 0;
                    colorA = cornerColors[colorCount];
                    colorD = colorA;
                    colorCount++;
                    if( colorCount >= colorLen ) colorCount = 0;
                    colorB = cornerColors[colorCount];
                    colorC = colorB;
                } else {
                    if( colorCount >= colorLen ) colorCount = 0;
                    colorA = cornerColors[colorCount];
                    colorB = colorA;
                    colorCount++;
                    if( colorCount >= colorLen ) colorCount = 0;
                    colorD = cornerColors[colorCount];
                    colorC = colorD;
                    // don't want thickness to wrap round so get next
                    colorCount++;
                    if( colorCount >= colorLen ) colorCount = 0;
                }
                pixelimage.fillGradLine( x, y, nextX, nextY, strokeWidth, colorA, colorB, colorC, colorD );
            }
        }
    }
}