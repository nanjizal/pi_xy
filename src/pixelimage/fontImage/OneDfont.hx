package pixelimage.fontImage;

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
    public function drawString( str: String, spacingX: Int = 0 ): Pixelimage {
        var code: Int = 33;
        var position: Int = 33;
        var lastLetters = markers.length - 1;
        var rectLeft = 0;
        var rectRight = 0;
        var rectTop = 1; // assumes that image starts below the white marker dot.
        var rectBottom = fontImage.height;
        var charWidth = 0;
        var charWidthLast = 0;
        var charPos = new Array<{ rectLeft: Int, rectRight: Int, currPos: Int }>();
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
            var info: { rectLeft: Int, rectRight: Int, currPos: Int } = { rectLeft: rectLeft, rectRight: rectRight, currPos: currPos };
            charPos[ charPos.length ] = info;
            lastLetter = nextLetter;
            charWidthLast = charWidth;
        }
        currPos += charWidthLast + spacingX;
        var pixelImage = new Pixelimage( currPos, rectBottom-1 );
        pixelImage.transparent = false;
        for( info in charPos ){
            pixelImage.putPixelImageRect( fontImage, info.currPos, 0, info.rectLeft, 1, info.rectRight, rectBottom );
        }
        return pixelImage;
    }
}