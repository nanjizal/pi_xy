package pixelimageXY.algo;

import pixelimageXY.Pixelimage;
import pixelimageXY.pixel.Pixel32;
import pixelimageXY.pixel.PixelChannel;
// https://en.wikipedia.org/wiki/Xiaolin_Wu%27s_line_algorithm
// algorthim Xiolin Wu

inline
function xWuLine( pixelImage: Pixelimage
                , x0: Float, y0: Float
                , x1: Float, y1: Float
                , color: Pixel32
                ): Void {
        // decompose channels
    var a = ( color >> 24 ) & 0xFF;
    var r = ( color >> 16 ) & 0xFF;
    var g = ( color >> 8 ) & 0xFF;
    var b = color & 0xFF;
    var steep = Math.abs( y1 - y0 ) > Math.abs( x1 - x0 );
    var temp: Float = 0.;
    if( steep ){ // swap x y
        temp = y0;
        y0 = x0;
        x0 = temp;
        temp = y1;
        y1 = x1;
        x1 = temp;
    }
    if( x0 > x1 ){ // swap 0 1
        temp = x1;
        x1 = x0;
        x0 = temp;
        temp = y1;
        y1 = y0;
        y0 = temp;
    }
    var dx = x1 - x0;
    var dy = y1 - y0;
    var gradient = ( dx == 0.0 )? 1.: dy/dx;
    var xend = roundFloor( x0 );
    var yend = y0 + gradient * ( xend - x0 );
    var xgap = rfPart( x0 + 0.5 );
    var xpxl1 = Std.int( xend ); // this will be used in the main loop
    var ypxl1 = Math.floor( yend );
    var a0: Int = 0;
    // only adjust alpha / brightness over the top part.
    var range = 0.25;
    var solid = 1 - range;
    if( steep ){    
        a0 = PixelChannel.boundChannel( a*solid + range*a*( rfPart(yend) * xgap ) );
        pixelImage.set_argbPixel( a0, r, g, b, pixelImage.position( ypxl1,     xpxl1 ) );
        a0 = PixelChannel.boundChannel( a*solid + range*a*( fPart(yend)  * xgap ) );
        pixelImage.set_argbPixel( a0, r, g, b, pixelImage.position( ypxl1 + 1, xpxl1 ) );
    } else {
        a0 = PixelChannel.boundChannel( a*solid + range*a*( rfPart(yend) * xgap ) );
        pixelImage.set_argbPixel( a0, r, g, b, pixelImage.position( xpxl1,     ypxl1 ) );
        a0 = PixelChannel.boundChannel( a*solid + range*a*( fPart(yend)  * xgap ) );
        pixelImage.set_argbPixel( a0, r, g, b, pixelImage.position( xpxl1,     ypxl1 + 1 ) );
    }
    var intery = yend + gradient; // first y-intersection for the main loop
    var xend = roundFloor( x1 );
    var yend = y1 + gradient * ( xend - x1 );
    var xgap = fPart( x1 + 0.5 );
    var xpxl2 = Std.int( xend ); //this will be used in the main loop
    var ypxl2 = Math.floor( yend );
    if( steep ){
        a0 = PixelChannel.boundChannel( a*solid + range*a*( rfPart(yend) * xgap ) );
        pixelImage.set_argbPixel( a0, r, g, b, pixelImage.position( ypxl2,     xpxl2 ) );
        a0 = PixelChannel.boundChannel( a*solid + range*a*( fPart(yend)  * xgap ) );
        pixelImage.set_argbPixel( a0, r, g, b, pixelImage.position( ypxl2 + 1, xpxl2 ) );
    } else {
        a0 = PixelChannel.boundChannel( a*solid + range*a*( rfPart(yend) * xgap ) );
        pixelImage.set_argbPixel( a0, r, g, b, pixelImage.position( xpxl2,     ypxl2 ) );
        a0 = PixelChannel.boundChannel( a*solid + range*a*( fPart(yend)  * xgap ) );
        pixelImage.set_argbPixel( a0, r, g, b, pixelImage.position( xpxl2,     ypxl2 + 1 ) );
    }
    // main loop
    var startX = xpxl1 + 1;
    var endX   = xpxl2 - 1;
    if( steep ){
        for( x in startX...endX ){
           a0 = PixelChannel.boundChannel( a*solid + range*a*( rfPart(intery) ) );
           pixelImage.set_argbPixel( a0, r, g, b, pixelImage.position( Math.floor( intery )    , x ) );
           pos += '' + Math.floor( intery ) + ' ';
           a0 = PixelChannel.boundChannel( a*solid + range*a*( fPart(intery)  ) );
           pixelImage.set_argbPixel( a0, r, g, b, pixelImage.position( Math.floor( intery ) + 1, x ) );
           intery = intery + gradient;
        }
    } else {
        for( x in startX...endX ){
            a0 = PixelChannel.boundChannel( a*solid + range*a*( rfPart(intery) ) );
            pixelImage.set_argbPixel( a0, r, g, b, pixelImage.position( x, Math.floor( intery ) ) );
            a0 = PixelChannel.boundChannel( a*solid + range*a*( fPart(intery) ) );
            pixelImage.set_argbPixel( a0, r, g, b, pixelImage.position( x, Math.floor( intery ) + 1 ) );
            intery = intery + gradient;
        }
    }
}

inline
function roundFloor( v: Float ): Float {
    return Math.floor( v ) + 0.5;
}

inline
function fPart( v: Float ): Float {
    return v - Math.floor( v );
}

inline
function rfPart( v: Float ): Float {
    return 1 - v + Math.floor( v );
}