package pi_xy.imageAbstracts;
import pi_xy.Pixelimage;
import pi_xy.pixel.Pixel32;
import pi_xy.pixel.Pixel28;
import pi_xy.pixel.ColorHelp;

@:structInit
class NineColorBorder {
    public var left: Int;
    public var right: Int;
    public var top: Int;
    public var bottom: Int;
    public var leftTop: Int;
    public var rightTop: Int;
    public var leftBottom: Int;
    public var rightBottom: Int;
    public var middle: Int;
    public inline
    function new( left: Int = 0xFF80ADF0
                , right: Int = 0xFFF08080
                , top: Int = 0xFFF9F17F
                , bottom: Int = 0xff94eaea
                , leftTop: Int = 0xffe09500
                , rightTop: Int = 0xff9ff49f
                , leftBottom: Int = 0xFFf0a0f0
                , rightBottom: Int = 0xFFB18BEA
                , middle: Int = 0xFFf0a0a0  ){
        this.left = left;
        this.right = right;
        this.top = top;
        this.bottom = bottom;
        this.leftTop = leftTop;
        this.rightTop = rightTop;
        this.leftBottom = leftBottom;
        this.rightBottom = rightBottom;
        this.middle = middle;
    }
}

@:transient
abstract RectanglePad( Pixelimage ) from Pixelimage to Pixelimage {

    inline
    public function new( w: Int, h: Int ){
       this = new Pixelimage( w, h );
    }
    public inline
    function colorPadImage( places: Int, color: Null<NineColorBorder> = null ){
        return colorPadImageXY( places, places, color );
    }    
    public inline
    function colorPadImageXY( placesX: Int, placesY: Int, color: Null<NineColorBorder> = null ){
        var img = new Pixelimage( this.width+2*placesX, this.height+2*placesY );
        img.putPixelImage( this, placesX, placesY );
        if( color == null ) color = new NineColorBorder();
        // draw border
        for( x in 0...this.width ){ for( y in 0...placesY ){
                // top row
                img.setPixel( x+placesX, y, color.top );
                // bottom row
                img.setPixel( x+placesX, img.height - y -1, color.bottom );
        }}
        for( y in 0...this.height ){ for( x in 0...placesX ){
                // left column
                img.setPixel( x, y+placesY, color.left );
                // right column
                img.setPixel( img.width - x - 1, y + placesY, color.right );

        }}
        for( x in 0...placesX ){ for( y in 0...placesY ){
                // draw corners
                img.setPixel( x, y, color.leftTop );
                img.setPixel( x + placesX + this.width, y, color.rightTop );
                img.setPixel( x + placesX + this.width, y + placesY + this.height, color.rightBottom );
                img.setPixel( x, y + placesY + this.width, color.leftBottom );
        }}
        return img;
    }
    public inline
    function borderPad( placesX: Int, placesY: Int, color: Int ){
        var img = new Pixelimage( this.width+2*placesX, this.height+2*placesY );
        img.putPixelImage( this, placesX, placesY );
        // draw border
        for( x in 0...this.width ){ for( y in 0...placesY ){
                // top row
                img.setPixel( x+placesX, y, color );
                // bottom row
                img.setPixel( x+placesX, img.height - y -1, color );
        }}
        for( y in 0...this.height ){ for( x in 0...placesX ){
                // left column
                img.setPixel( x, y+placesY, color );
                // right column
                img.setPixel( img.width - x - 1, y + placesY, color );

        }}
        for( x in 0...placesX ){ for( y in 0...placesY ){
                // draw corners
                img.setPixel( x, y, color );
                img.setPixel( x + placesX + this.width, y, color );
                img.setPixel( x + placesX + this.width, y + placesY + this.height, color );
                img.setPixel( x, y + placesY + this.width, color );
        }}
        return img;
    }
    public inline
    function padImage( places: Int ): Pixelimage {
        return padImageXY( places, places );
    }
    public inline
    function padImageXY( placesX: Int, placesY: Int ): Pixelimage {
        var img = new Pixelimage( this.width+2*placesX, this.height+2*placesY );
        img.putPixelImage( this, placesX, placesY );
        // draw border
        for( x in 0...this.width ){ for( y in 0...placesY ){
                // top row
                img.setPixel( x+placesX, y, this.getPixel( x, 0 ) );
                // bottom row
                img.setPixel( x+placesX, img.height - y -1, this.getPixel( x, this.height - 1 ) );
        }}
        for( y in 0...this.height ){ for( x in 0...placesX ){
                // left column
                img.setPixel( x, y+placesY, this.getPixel( 0, y ) );
                // right column
                img.setPixel( img.width - x - 1, y + placesY, this.getPixel( this.width - 1, 0 ) );

        }}
        for( x in 0...placesX ){ for( y in 0...placesY ){
                // draw corners
                img.setPixel( x, y, this.getPixel( 0, 0 ) );
                img.setPixel( x + placesX + this.width, y, this.getPixel( this.width - 1, 0 ) );
                img.setPixel( x + placesX + this.width, y + placesY + this.height, this.getPixel( this.width - 1, this.height - 1 ) );
                img.setPixel( x, y + placesY + this.width, this.getPixel( 0, this.height - 1 ) );
        }}
        return img;
    }
    public inline
    function padWrapImage( places: Int ): Pixelimage {
        return padWrapImageXY( places, places );
    }
    // could probably use better approach as used elsewhere in code.
    // but works so ok for now.
    public inline
    function padWrapImageXY( placesX: Int, placesY: Int ): Pixelimage {
        var img = new Pixelimage( this.width+2*placesX, this.height+2*placesY );
        img.putPixelImage( this, placesX, placesY );
        // draw border
        for( x in 0...this.width ){ for( y in 0...placesY ){
                // top row
                img.setPixel( x+placesX, y, this.getPixel( x, this.height - 1 - placesY+y ) );
                // bottom row
                img.setPixel( x+placesX, img.height - y -1, this.getPixel( x, placesY-y ) );
        }}
        for( y in 0...this.height ){ for( x in 0...placesX ){
                // left column
                img.setPixel( x, y+placesY, this.getPixel( this.width - 1 - placesX + x, y ) );
                // right column
                img.setPixel( img.width - x - 1, y + placesY, this.getPixel( placesX - x , y ) );

        }}
        for( x in 0...placesX ){ for( y in 0...placesY ){
                // draw corners
                img.setPixel( x, y, this.getPixel( this.width - 1 - placesX + x, this.height - 1 - placesY + y ) );  
                img.setPixel( x + placesX + this.width, y, this.getPixel( x, this.height - 1 - placesY + y ) );
                img.setPixel( x + placesX + this.width, y + placesY + this.height, this.getPixel( x, y ) );
                img.setPixel( x, y + placesY + this.width, this.getPixel( this.width - 1 - placesX + x, y ) );
        }}
        return img;
    }        
}