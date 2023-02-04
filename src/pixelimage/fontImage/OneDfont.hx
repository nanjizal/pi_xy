package pixelimage.fontImage;

@:structInit
class CharPlacement1D {
    public var currX:   Int;
    public var currY:   Int;
    public var minX:    Int;
    public var maxX:    Int;
    inline
    public function new( currX: Int, currY: Int, minX: Int, maxX: Int ){
        this.currX = currX;
        this.currY = currY;
        this.minX  = minX;
        this.maxX  = maxX;
    }
}


@:structInit
class OneDfont{
    public var fontImage:     Pixelimage;
    public var startingAscii: Int;
    public var markerColor:   Int;
    public var pairOffset: Null<haxe.ds.StringMap<Int>>; // kern
    var markers: Array<Int> = [];
    /** 
        assumes font in a single row, with white marker pixels on the top pixel row to provide ascii start and end character information.
        currently setup that the last char is the spacebar one, as per current test data.
    **/
    public function new( fontImage: Pixelimage, startingAscii: Int = 33, markerColor: Int = 0xFFFFFFFF, pairOffset: Null<haxe.ds.StringMap<Int>> = null ){
        this.fontImage     = fontImage;
        this.startingAscii = startingAscii;
        this.markerColor = markerColor;
        this.pairOffset = pairOffset;
        findMarkers();
    }
    inline
    function findMarkers(){
        var l = fontImage.width;
        for( i in 0...l ){
            var color = fontImage.getPixel(i,0);
            if( color == markerColor ){
                markers[ markers.length ] = i;
            }
        }
    }
    inline
    public function createPlacement( str: String, spacingX: Int = 0 ): Array<CharPlacement1D>{
        var code: Int = 33;
        var position: Int = 33;
        var lastLetters = markers.length - 1;
        var rectLeft = 0;
        var rectRight = 0;
        var rectTop = 1; // assumes that image starts below the white marker dot.
        var rectBottom = fontImage.height;
        var charWidth = 0;
        var charWidthLast = 0;
        var charPos = new Array<CharPlacement1D>();
        var totWidth = 0;
        var lastLetter = '';
        var finalPos = markers.length-2;
        var nextLetter = '';
        var currPos = 0;
        for( letter in 0...str.length ){
            code = str.charCodeAt( letter );
            nextLetter = str.charAt( letter );
            position = code - startingAscii;
            if( position >= finalPos || position < 0 ) {
                position = finalPos; //assumes last letter is a space and use instead.
                if( nextLetter!= ' ') trace( 'character not found '+ str.charAt( letter ) );
            }
            rectLeft = markers[ position ];
            rectRight = markers[ position + 1 ];
            charWidth = rectRight - rectLeft;
            currPos += charWidthLast + spacingX;
            if( pairOffset != null ){ // if kerning
                var pair = lastLetter + nextLetter;
                if( pair.length > 1 ){
                    if( pairOffset.exists( pair ) ){
                        currPos += pairOffset.get( pair );
                    }
                }
            }
            var info: CharPlacement1D = { minX: rectLeft, maxX: rectRight, currX: currPos, currY: 0 };
            charPos[ charPos.length ] = info;
            lastLetter = nextLetter;
            charWidthLast = charWidth;
        }
        currPos += charWidthLast + spacingX;
        return charPos;
    }
    /**
        This is used to draw strings, but it is useful that 
        createPlacement and drawPlacement can be used separately 
        to allow for instance curved y placement
    **/
    inline 
    public function drawString( str: String, spacingX: Int = 0, transparent: Bool = false ): Pixelimage {
        var charPos = createPlacement( str, spacingX );
        var pixelImage = new Pixelimage( widthArrCharPlacement1D( charPos ), fontImage.height-1 );
        pixelImage.transparent = transparent;
        return drawPlacement( pixelImage, charPos );
    }
    inline
    public function drawCurveY( charPos: Array<CharPlacement1D>, fy: ( x: Int ) -> Int, transparent = false ): Pixelimage {
        var l = charPos.length;
        var info: CharPlacement1D;
        var minY = 0;
        var maxY = 0;
        var currY = 0;
        // change y to follow curve.
        for( i in 0...l ){
            info = charPos[ i ];
            currY = fy( info.currX + ( info.maxX - info.minX ) );
            if( currY > maxY ) maxY = currY;
            if( currY < 0 ) minY = currY;
            info.currY = currY;
        }
        var pixelImage = new Pixelimage( widthArrCharPlacement1D( charPos ), maxY - minY + fontImage.height-1 );
        pixelImage.transparent = transparent;
        return drawPlacement( pixelImage, charPos, -minY );
    }
    inline
    public function widthArrCharPlacement1D( charPos: Array<CharPlacement1D> ){
        var last = charPos[ charPos.length - 1 ];
        var width = last.currX + ( last.maxX - last.minX ); 
        return width;
    }
    inline
    public function drawPlacement( pixelImage: Pixelimage, charPos: Array<CharPlacement1D>, yOffSet: Int = 0): Pixelimage {
        var rectBottom = fontImage.height;
        var rectTop    = 1; 
        for( info in charPos ){
            pixelImage.putPixelImageRect( fontImage, info.currX, info.currY + yOffSet, info.minX, rectTop, info.maxX, rectBottom );
        }
        return pixelImage;
    }
}