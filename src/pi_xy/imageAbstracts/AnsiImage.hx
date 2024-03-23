package pi_xy.imageAbstracts;

// adapted from my Xperimental lib
// https://github.com/nanjizal/Xperimental/blob/master/pngAnsi/src/Main.hx
#if ansi
import ANSI;
import pi_xy.Pixelimage;
import pi_xy.pixel.Pixel32;
import pi_xy.pixel.Pixel28;
import pi_xy.pixel.ColorHelp;

@:forward
enum abstract CharSet( String ) from String to String {
    var CharSimple = " .:-=+*#%@";
    var CharComplex = " .'`^" + '",:;Il!i><~+_-?][}{1)(|' +'\\' + '/tfjrxnuvczXYUJCLQ0OZmwqpdbkhao*#MW&8%B@$█';
}
class RGBratios{
    public var r: Float;
    public var g: Float;
    public var b: Float;
    public function new( red: Float, green: Float, blue: Float ){ // adjust these to create different colored images
        var tot = red+green+blue;
        var ratio = 1/tot;
        if( tot == 1. ){
            r = red;
            g = green;
            b = blue;
        } else {
            r = red*ratio;
            g = green*ratio;
            b = blue*ratio;
        }
    }
    public static inline 
    function standard(){
        return new RGBratios( 0.21, 0.72, 0.07 );
    }
}
@:transient
abstract AnsiImage( Pixelimage ) from Pixelimage to Pixelimage {
    inline public function new(w:Int, h:Int) {
        this = new Pixelimage(w, h);
    }
    public inline
    function ansiSimple( scaleFactor = 1., ratios: RGBratios = null ){
        initScreen();
        if( ratios == null ) ratios = RGBratios.standard();
        luminosityGrey( this, CharSimple, ratios, scaleFactor );
    }
    public inline
    function ansiComplex( scaleFactor = 1., ratios: RGBratios = null ){
        initScreen();
        if( ratios == null ) ratios = RGBratios.standard();
        luminosityGrey( this, CharComplex, ratios, scaleFactor );
    }
    public inline
    function ansiCustom( str: String, scaleFactor = 1., ratios: RGBratios = null ){
        initScreen();
        if( ratios == null ) ratios = RGBratios.standard();
        luminosityGrey( this, str, ratios, scaleFactor );
    }
    public inline
    function ansi_out( scaleFactor = 1. ){
        ansiComplex( scaleFactor );
    }
    inline
    function initScreen(){
        out( ANSI.title("Output") );
        out( clear() );
        out( ANSI.set( BlackBack ) );
    }
    inline
    function xy( x: Float, y: Float ){
        return ANSI.setXY( Std.int( x ), Std.int( y ) );
    }
    inline
    function clear(){
        return ANSI.eraseDisplay();
    }
    inline
    function out( s: String = "") {
        #if sys
            Sys.stdout().writeString( s + "\n" );
        #else
            trace( s );
        #end
    }
    inline
    function luminosityGrey( pixelImage: Pixelimage, charSet: CharSet, ratios: RGBratios, scaleFactor: Float = 1. ){
        var p: Pixel32;
        var pf: { a: Float, r: Float, g: Float, b: Float };
        var w = pixelImage.width;
        var h = pixelImage.height;
        var brightness = charSet;
        var l: Float;
        var toggle = true;
        var scale = brightness.length;
        ANSI.set( White );
        var str = '';
        w = Std.int( Math.min( w*scaleFactor, 99 ) );
        h = Std.int( Math.min( h*scaleFactor, 84 ) );
        var r: Bool;
        var b: Bool;
        var g: Bool;
        var c: Float;
        var ratiosR = ( 0.3 - ratios.r/2 );
        var ratiosG = ( 0.3 - ratios.g/2 );
        var ratiosB = ( 0.3 - ratios.b/2 ); 
        var color = White;
        for( x in 0...w ){
            if( toggle ){ // skip rows
                for( y in 0...h ){
                    p = pixelImage.getPixel( Math.round( x/scaleFactor ), Math.round( y/scaleFactor ) );
                    pf = pi_xy.pixel.ColorHelp.hexToARGB( p );
                    l = pf.a*( 0.21*pf.r + 0.72*pf.g + 0.07*pf.b ) * scale;
                    r = pf.r > ratiosR;
                    g = pf.g > ratiosG;
                    b = pf.r > ratiosB;
                    color = White;
                    if( r && b && g ){
                        color = White;
                    } else {
                        if( !r && !g && !b ){
                            color = Black;
                        } else {
                            if( r ){
                                if( g ){
                                    color = Yellow;
                                } else if( b ){
                                    color = Magenta;
                                } else {
                                    color = Red;
                                }
                            } else if( g ){
                                if( b ){
                                    color = Cyan;
                                } else { 
                                    color = Green;
                                }
                            } else {
                                color = Blue;
                            }
                        }
                    }
                    str += xy( x + 1, y/2 + 1 ) + ANSI.set( color ) + brightness.charAt( Std.int( Math.round( l ) ) );
                }
            }
            toggle = !toggle;
        }
        str += xy( 0, Math.round( h/2 ) + 1 );
        str += ANSI.set( White );
        out( str );
    }
}
#end