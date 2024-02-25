package pi_xy.imageAbstracts;
import pi_xy.Pixelimage;
import pi_xy.pixel.Pixel32;
import pi_xy.pixel.Pixel28;
import pi_xy.pixel.ColorHelp;

enum abstract BorderMode( Int ) {
    var EXTEND  = 0;
    var CROP    = 1;
    var WRAP    = 2;
}

@:structInit
class Mat5x5data{
    // row0
    public var a: Float;
    public var b: Float;
    public var c: Float;
    public var d: Float;
    public var e: Float;
    // row1
    public var f: Float;
    public var g: Float;
    public var h: Float;
    public var i: Float;
    public var j: Float;
    // row2
    public var k: Float;
    public var l: Float;
    public var m: Float;
    public var n: Float;
    public var o: Float;
    // row3
    public var p: Float;
    public var q: Float;
    public var r: Float;
    public var s: Float;
    public var t: Float;
    public var u: Float;
    // row4
    public var v: Float;
    public var w: Float;
    public var x: Float;
    public var y: Float;

    public inline function new( a: Float, b: Float, c: Float, d: Float, e: Float
                              , f: Float, g: Float, h: Float, i: Float, j: Float
                              , k: Float, l: Float, m: Float, n: Float, o: Float
                              , p: Float, q: Float, r: Float, s: Float, t: Float
                              , u: Float, v: Float, w: Float, x: Float, y: Float ){
        this.a = a;
        this.b = b;
        this.c = c;
        this.d = d;
        this.e = e;
        this.f = f;
        this.g = g;
        this.h = h;
        this.i = i;
        this.j = j;
        this.k = k;
        this.l = l;
        this.m = m;
        this.n = n;
        this.o = o;
        this.p = p;
        this.q = q;
        this.r = r;
        this.s = s;
        this.t = t;
        this.u = u;
        this.v = v;
        this.w = w;
        this.x = x;
        this.y = y;
    }
}

@:structInit
class Mat3x3data{
    // row0
    public var a: Float;
    public var b: Float;
    public var c: Float;
    // row1
    public var d: Float;
    public var e: Float;
    public var f: Float;
    // row2
    public var g: Float;
    public var h: Float;
    public var i: Float;

    public inline function new( a: Float, b: Float, c: Float
                              , d: Float, e: Float, f: Float
                              , g: Float, h: Float, i: Float ){
        this.a = a;
        this.b = b;
        this.c = c;

        this.d = d;
        this.e = e;
        this.f = f;

        this.g = g;
        this.h = h;
        this.i = i;
    }
}

@:transient
abstract Convolution( Pixelimage ) from Pixelimage to Pixelimage {

    inline
    public function new( w: Int, h: Int ){
       this = new Pixelimage( w, h );
    }

    inline
    public function convolute3x3( m33: Mat3x3data
                                , borderMode: BorderMode
                                , adjustAlpha: Bool = false
                                , adjustRed : Bool = true
                                , adjustGreen: Bool = true
                                , adjustBlue: Bool = true
                                ): Pixelimage {
        var a0 = 0;
        var b0 = 0;
        var c0 = 0;
        var d0 = 0;
        var e0 = 0;
        var f0 = 0;
        var g0 = 0;
        var h0 = 0;
        var i0 = 0;
        var r_ = 0.;
        var g_ = 0.;
        var b_ = 0.;
        var a_ = 0.;
        var out: Pixelimage = new Pixelimage( this.width, this.height );
        var here: Pixelimage = this;                            
        // process corners, edges

        switch borderMode {
            case EXTEND:
                here = this.rectanglePad.padImage( 1 );
            case CROP:
                //
            case WRAP: 
                here = this.rectanglePad.padWrapImage( 1 );  
        }
        // get first pixel values
        for( y in 1...this.height-2 ){
 
            for( x in 1...this.width-2 ){
                if( x == 1 ){
                    // reset
                    a0 = here.getPixel( x-1, y-1 );
                    b0 = here.getPixel( x,   y-1 );
                    c0 = here.getPixel( x+1, y-1 );

                    d0 = here.getPixel( x-1, y );
                    e0 = here.getPixel( x, y );
                    f0 = here.getPixel( x+1, y );

                    g0 = here.getPixel( x-1, y+1 );
                    h0 = here.getPixel( x, y+1 );
                    i0 = here.getPixel( x+1, y+1 );  
                } else {
                    // update on next x
                    a0 = b0;
                    b0 = c0;
                    c0 = here.getPixel( x+1, y-1);
                    d0 = e0;
                    e0 = f0;
                    f0 = here.getPixel( x+1, y );
                    g0 = h0;
                    h0 = i0;
                    i0 = here.getPixel( x+1, y+1 );  
                }
                if( adjustRed ) {
                    r_ = 0.;
                    if( m33.a != 0. && a0 != 0 ) r_ += redChannel( a0 ) * m33.a;
                    if( m33.b != 0. && b0 != 0 ) r_ += redChannel( b0 ) * m33.b;
                    if( m33.c != 0. && c0 != 0 ) r_ += redChannel( c0 ) * m33.c;
                    if( m33.d != 0. && d0 != 0 ) r_ += redChannel( d0 ) * m33.d;
                    if( m33.e != 0. && e0 != 0 ) r_ += redChannel( e0 ) * m33.e;
                    if( m33.f != 0. && f0 != 0 ) r_ += redChannel( f0 ) * m33.f;
                    if( m33.g != 0. && g0 != 0 ) r_ += redChannel( g0 ) * m33.g;
                    if( m33.h != 0. && h0 != 0 ) r_ += redChannel( h0 ) * m33.h;
                    if( m33.i != 0. && i0 != 0 ) r_ += redChannel( i0 ) * m33.i;  
                } else {
                    r_ = redChannel( e0 );
                }
                if( adjustGreen ) {
                    g_ = 0.;
                    if( m33.a != 0. && a0 != 0 ) g_ += greenChannel( a0 ) * m33.a;
                    if( m33.b != 0. && b0 != 0 ) g_ += greenChannel( b0 ) * m33.b;
                    if( m33.c != 0. && c0 != 0 ) g_ += greenChannel( c0 ) * m33.c;
                    if( m33.d != 0. && d0 != 0 ) g_ += greenChannel( d0 ) * m33.d;
                    if( m33.e != 0. && e0 != 0 ) g_ += greenChannel( e0 ) * m33.e;
                    if( m33.f != 0. && f0 != 0 ) g_ += greenChannel( f0 ) * m33.f;
                    if( m33.g != 0. && g0 != 0 ) g_ += greenChannel( g0 ) * m33.g;
                    if( m33.h != 0. && h0 != 0 ) g_ += greenChannel( h0 ) * m33.h;
                    if( m33.i != 0. && i0 != 0 ) g_ += greenChannel( i0 ) * m33.i;  
                } else {
                    g_ = greenChannel( e0 );
                }
                if( adjustBlue ) {
                    b_ = 0.;
                    if( m33.a != 0. && a0 != 0 ) b_ += blueChannel( a0 ) * m33.a;
                    if( m33.b != 0. && b0 != 0 ) b_ += blueChannel( b0 ) * m33.b;
                    if( m33.c != 0. && c0 != 0 ) b_ += blueChannel( c0 ) * m33.c;
                    if( m33.d != 0. && d0 != 0 ) b_ += blueChannel( d0 ) * m33.d;
                    if( m33.e != 0. && e0 != 0 ) b_ += blueChannel( e0 ) * m33.e;
                    if( m33.f != 0. && f0 != 0 ) b_ += blueChannel( f0 ) * m33.f;
                    if( m33.g != 0. && g0 != 0 ) b_ += blueChannel( g0 ) * m33.g;
                    if( m33.h != 0. && h0 != 0 ) b_ += blueChannel( h0 ) * m33.h;
                    if( m33.i != 0. && i0 != 0 ) b_ += blueChannel( i0 ) * m33.i;  
                } else {
                    b_ = blueChannel( e0 );
                }
                if( adjustAlpha ) {
                    a_ = 0.;
                    if( m33.a != 0. && a0 != 0 ) a_ += alphaChannel( a0 ) * m33.a;
                    if( m33.b != 0. && b0 != 0 ) a_ += alphaChannel( b0 ) * m33.b;
                    if( m33.c != 0. && c0 != 0 ) a_ += alphaChannel( c0 ) * m33.c;
                    if( m33.d != 0. && d0 != 0 ) a_ += alphaChannel( d0 ) * m33.d;
                    if( m33.e != 0. && e0 != 0 ) a_ += alphaChannel( e0 ) * m33.e;
                    if( m33.f != 0. && f0 != 0 ) a_ += alphaChannel( f0 ) * m33.f;
                    if( m33.g != 0. && g0 != 0 ) a_ += alphaChannel( g0 ) * m33.g;
                    if( m33.h != 0. && h0 != 0 ) a_ += alphaChannel( h0 ) * m33.h;
                    if( m33.i != 0. && i0 != 0 ) a_ += alphaChannel( i0 ) * m33.i;  
                } else {
                    a_ = alphaChannel( e0 );
                }
                if( borderMode == BorderMode.EXTEND || borderMode == BorderMode.WRAP ){
                    out.setPixel( x-1, y-1, Pixel32.from_argb( a_, r_, g_, b_ ) );
                } else {
                    // edge CROP
                    out.setPixel( x, y, Pixel32.from_argb( a_, r_, g_, b_ ) );
                }  
            }
        }
        if( borderMode == BorderMode.CROP ){
            // copy over cropped pixels
            for( x in 0...this.width - 1 ){
                // top
                out.setPixel( x, 0, here.getPixel( x, 0 ) );
                // bottom
                out.setPixel( x, this.height-1, here.getPixel( x, this.height-1 ) );
            }
            for( y in 1...this.height - 2 ){
                // left
                out.setPixel( 0, y, here.getPixel( 0, y ) );
                // right
                out.setPixel( this.width - 1, y, here.getPixel( this.width-1, y ) );
            }
        }
        return out;
    }
    
    inline
    public function convolute5x5( m55: Mat5x5data
                                , borderMode: BorderMode
                                , adjustAlpha: Bool = false
                                , adjustRed : Bool = true
                                , adjustGreen: Bool = true
                                , adjustBlue: Bool = true
                                ): Pixelimage {
        var a0 = 0;
        var b0 = 0;
        var c0 = 0;
        var d0 = 0;
        var e0 = 0;

        var f0 = 0;
        var g0 = 0;
        var h0 = 0;
        var i0 = 0;
        var j0 = 0;

        var k0 = 0;
        var l0 = 0;
        var m0 = 0;
        var n0 = 0;
        var o0 = 0;

        var p0 = 0;
        var q0 = 0;
        var r0 = 0;
        var s0 = 0;
        var t0 = 0;

        var u0 = 0;
        var v0 = 0;
        var w0 = 0;
        var x0 = 0;
        var y0 = 0;

        var r_ = 0.;
        var g_ = 0.;
        var b_ = 0.;
        var a_ = 0.;
        var out: Pixelimage = new Pixelimage( this.width, this.height );
        var here: Pixelimage = this;                            
        // process corners, edges

        switch borderMode {
            case EXTEND:
                here = this.rectanglePad.padImage( 2 );
            case CROP:
                //
            case WRAP: 
                here = this.rectanglePad.padWrapImage( 2 );  
        }
        // get first pixel values
        for( y in 2...this.height-3 ){
            for( x in 2...this.width-3 ){
                if( x == 2 ){           
                    // reset
                    a0 = here.getPixel( x-2, y-2 );
                    b0 = here.getPixel( x-1, y-2 );
                    c0 = here.getPixel( x,   y-2 );
                    d0 = here.getPixel( x+1, y-2 );
                    e0 = here.getPixel( x+2, y-2 );

                    f0 = here.getPixel( x-2, y-1 );
                    g0 = here.getPixel( x-1, y-1 );
                    h0 = here.getPixel( x,   y-1 );
                    i0 = here.getPixel( x+1, y-1 );
                    j0 = here.getPixel( x+2, y-1 );

                    k0 = here.getPixel( x-2, y );
                    l0 = here.getPixel( x-1, y );
                    m0 = here.getPixel( x,   y );
                    n0 = here.getPixel( x+1, y );
                    o0 = here.getPixel( x+2, y );

                    p0 = here.getPixel( x-2, y+1 );
                    q0 = here.getPixel( x-1, y+1 );
                    r0 = here.getPixel( x,   y+1 );
                    s0 = here.getPixel( x+1, y+1 );
                    t0 = here.getPixel( x+2, y+1 );

                    u0 = here.getPixel( x-2, y+2 );
                    v0 = here.getPixel( x-1, y+2 );
                    w0 = here.getPixel( x,   y+2 );
                    x0 = here.getPixel( x+1, y+2 );
                    y0 = here.getPixel( x+2, y+2 );
                } else {
                    // update on next x
                    a0 = b0;
                    b0 = c0;
                    c0 = d0;
                    d0 = e0;
                    e0 = here.getPixel( x+1, y-2);

                    f0 = g0;
                    g0 = h0;
                    h0 = i0;
                    i0 = h0;
                    j0 = here.getPixel( x+1, y-1);

                    k0 = l0;
                    l0 = m0;
                    m0 = n0;
                    n0 = o0;
                    o0 = here.getPixel( x+1, y );

                    p0 = q0;
                    q0 = r0;
                    r0 = s0;
                    s0 = t0;
                    t0 = here.getPixel( x+1, y+1);

                    u0 = v0;
                    v0 = w0;
                    w0 = x0;
                    x0 = v0;
                    v0 = here.getPixel( x+1, y+2);
                }
                if( adjustRed ) {
                    r_ = 0.;
                    if( m55.a != 0. && a0 != 0 ) r_ += redChannel( a0 ) * m55.a;
                    if( m55.b != 0. && b0 != 0 ) r_ += redChannel( b0 ) * m55.b;
                    if( m55.c != 0. && c0 != 0 ) r_ += redChannel( c0 ) * m55.c;
                    if( m55.d != 0. && d0 != 0 ) r_ += redChannel( d0 ) * m55.d;
                    if( m55.e != 0. && e0 != 0 ) r_ += redChannel( e0 ) * m55.e;

                    if( m55.f != 0. && f0 != 0 ) r_ += redChannel( f0 ) * m55.f;
                    if( m55.g != 0. && g0 != 0 ) r_ += redChannel( g0 ) * m55.g;
                    if( m55.h != 0. && h0 != 0 ) r_ += redChannel( h0 ) * m55.h;
                    if( m55.i != 0. && i0 != 0 ) r_ += redChannel( i0 ) * m55.i;
                    if( m55.j != 0. && j0 != 0 ) r_ += redChannel( j0 ) * m55.j;

                    if( m55.k != 0. && k0 != 0 ) r_ += redChannel( k0 ) * m55.k;
                    if( m55.l != 0. && l0 != 0 ) r_ += redChannel( l0 ) * m55.l;
                    if( m55.m != 0. && m0 != 0 ) r_ += redChannel( m0 ) * m55.m;
                    if( m55.n != 0. && n0 != 0 ) r_ += redChannel( n0 ) * m55.n;
                    if( m55.o != 0. && o0 != 0 ) r_ += redChannel( o0 ) * m55.o;

                    if( m55.p != 0. && p0 != 0 ) r_ += redChannel( p0 ) * m55.p;
                    if( m55.q != 0. && q0 != 0 ) r_ += redChannel( q0 ) * m55.q;
                    if( m55.r != 0. && r0 != 0 ) r_ += redChannel( r0 ) * m55.r;
                    if( m55.s != 0. && s0 != 0 ) r_ += redChannel( s0 ) * m55.s;
                    if( m55.t != 0. && t0 != 0 ) r_ += redChannel( t0 ) * m55.t;

                    if( m55.u != 0. && u0 != 0 ) r_ += redChannel( u0 ) * m55.u;
                    if( m55.v != 0. && v0 != 0 ) r_ += redChannel( v0 ) * m55.v;
                    if( m55.w != 0. && w0 != 0 ) r_ += redChannel( w0 ) * m55.w;
                    if( m55.x != 0. && x0 != 0 ) r_ += redChannel( x0 ) * m55.x;
                    if( m55.y != 0. && y0 != 0 ) r_ += redChannel( y0 ) * m55.y;

                } else {
                    r_ = redChannel( e0 );
                }
                if( adjustGreen ) {
                    g_ = 0.;
                    if( m55.a != 0. && a0 != 0 ) g_ += greenChannel( a0 ) * m55.a;
                    if( m55.b != 0. && b0 != 0 ) g_ += greenChannel( b0 ) * m55.b;
                    if( m55.c != 0. && c0 != 0 ) g_ += greenChannel( c0 ) * m55.c;
                    if( m55.d != 0. && d0 != 0 ) g_ += greenChannel( d0 ) * m55.d;
                    if( m55.e != 0. && e0 != 0 ) g_ += greenChannel( e0 ) * m55.e;

                    if( m55.f != 0. && f0 != 0 ) g_ += greenChannel( f0 ) * m55.f;
                    if( m55.g != 0. && g0 != 0 ) g_ += greenChannel( g0 ) * m55.g;
                    if( m55.h != 0. && h0 != 0 ) g_ += greenChannel( h0 ) * m55.h;
                    if( m55.i != 0. && i0 != 0 ) g_ += greenChannel( i0 ) * m55.i;
                    if( m55.j != 0. && j0 != 0 ) g_ += greenChannel( j0 ) * m55.j;

                    if( m55.k != 0. && k0 != 0 ) g_ += greenChannel( k0 ) * m55.k;
                    if( m55.l != 0. && l0 != 0 ) g_ += greenChannel( l0 ) * m55.l;
                    if( m55.m != 0. && m0 != 0 ) g_ += greenChannel( m0 ) * m55.m;
                    if( m55.n != 0. && n0 != 0 ) g_ += greenChannel( n0 ) * m55.n;
                    if( m55.o != 0. && o0 != 0 ) g_ += greenChannel( o0 ) * m55.o;

                    if( m55.p != 0. && p0 != 0 ) g_ += greenChannel( p0 ) * m55.p;
                    if( m55.q != 0. && q0 != 0 ) g_ += greenChannel( q0 ) * m55.q;
                    if( m55.r != 0. && r0 != 0 ) g_ += greenChannel( r0 ) * m55.r;
                    if( m55.s != 0. && s0 != 0 ) g_ += greenChannel( s0 ) * m55.s;
                    if( m55.t != 0. && t0 != 0 ) g_ += greenChannel( t0 ) * m55.t;
                    
                    if( m55.u != 0. && u0 != 0 ) g_ += greenChannel( u0 ) * m55.u;
                    if( m55.v != 0. && v0 != 0 ) g_ += greenChannel( v0 ) * m55.v;
                    if( m55.w != 0. && w0 != 0 ) g_ += greenChannel( w0 ) * m55.w;
                    if( m55.y != 0. && x0 != 0 ) g_ += greenChannel( x0 ) * m55.x;
                    if( m55.y != 0. && y0 != 0 ) g_ += greenChannel( y0 ) * m55.y; 
                } else {
                    g_ = greenChannel( e0 );
                }
                if( adjustBlue ) {
                    b_ = 0.;
                    if( m55.a != 0. && a0 != 0 ) b_ += blueChannel( a0 ) * m55.a;
                    if( m55.b != 0. && b0 != 0 ) b_ += blueChannel( b0 ) * m55.b;
                    if( m55.c != 0. && c0 != 0 ) b_ += blueChannel( c0 ) * m55.c;
                    if( m55.d != 0. && d0 != 0 ) b_ += blueChannel( d0 ) * m55.d;
                    if( m55.e != 0. && e0 != 0 ) b_ += blueChannel( e0 ) * m55.e;

                    if( m55.f != 0. && f0 != 0 ) b_ += blueChannel( f0 ) * m55.f;
                    if( m55.g != 0. && g0 != 0 ) b_ += blueChannel( g0 ) * m55.g;
                    if( m55.h != 0. && h0 != 0 ) b_ += blueChannel( h0 ) * m55.h;
                    if( m55.i != 0. && i0 != 0 ) b_ += blueChannel( i0 ) * m55.i;
                    if( m55.j != 0. && j0 != 0 ) b_ += blueChannel( j0 ) * m55.j;

                    if( m55.k != 0. && k0 != 0 ) b_ += blueChannel( k0 ) * m55.k;
                    if( m55.l != 0. && l0 != 0 ) b_ += blueChannel( l0 ) * m55.l;
                    if( m55.m != 0. && m0 != 0 ) b_ += blueChannel( m0 ) * m55.m;
                    if( m55.n != 0. && n0 != 0 ) b_ += blueChannel( n0 ) * m55.n;
                    if( m55.o != 0. && o0 != 0 ) b_ += blueChannel( o0 ) * m55.o;

                    if( m55.p != 0. && p0 != 0 ) b_ += blueChannel( p0 ) * m55.p;
                    if( m55.q != 0. && q0 != 0 ) b_ += blueChannel( q0 ) * m55.q;
                    if( m55.r != 0. && r0 != 0 ) b_ += blueChannel( r0 ) * m55.r;
                    if( m55.s != 0. && s0 != 0 ) b_ += blueChannel( s0 ) * m55.s;
                    if( m55.t != 0. && t0 != 0 ) b_ += blueChannel( t0 ) * m55.t;
                    
                    if( m55.u != 0. && u0 != 0 ) b_ += blueChannel( u0 ) * m55.u;
                    if( m55.v != 0. && v0 != 0 ) b_ += blueChannel( v0 ) * m55.v;
                    if( m55.w != 0. && w0 != 0 ) b_ += blueChannel( w0 ) * m55.w;
                    if( m55.x != 0. && x0 != 0 ) b_ += blueChannel( x0 ) * m55.x;
                    if( m55.y != 0. && y0 != 0 ) b_ += blueChannel( y0 ) * m55.y;
                } else {
                    b_ = blueChannel( e0 );
                }
                if( adjustAlpha ) {
                    a_ = 0.;
                    if( m55.a != 0. && a0 != 0 ) a_ += alphaChannel( a0 ) * m55.a;
                    if( m55.b != 0. && b0 != 0 ) a_ += alphaChannel( b0 ) * m55.b;
                    if( m55.c != 0. && c0 != 0 ) a_ += alphaChannel( c0 ) * m55.c;
                    if( m55.d != 0. && d0 != 0 ) a_ += alphaChannel( d0 ) * m55.d;
                    if( m55.e != 0. && e0 != 0 ) a_ += alphaChannel( e0 ) * m55.e;

                    if( m55.f != 0. && f0 != 0 ) a_ += alphaChannel( f0 ) * m55.f;
                    if( m55.g != 0. && g0 != 0 ) a_ += alphaChannel( g0 ) * m55.g;
                    if( m55.h != 0. && h0 != 0 ) a_ += alphaChannel( h0 ) * m55.h;
                    if( m55.i != 0. && i0 != 0 ) a_ += alphaChannel( i0 ) * m55.i;
                    if( m55.j != 0. && j0 != 0 ) a_ += alphaChannel( j0 ) * m55.j;

                    if( m55.k != 0. && k0 != 0 ) a_ += alphaChannel( k0 ) * m55.k;
                    if( m55.l != 0. && l0 != 0 ) a_ += alphaChannel( l0 ) * m55.l;
                    if( m55.m != 0. && m0 != 0 ) a_ += alphaChannel( m0 ) * m55.m;
                    if( m55.n != 0. && n0 != 0 ) a_ += alphaChannel( n0 ) * m55.n;
                    if( m55.o != 0. && o0 != 0 ) a_ += alphaChannel( o0 ) * m55.o;

                    if( m55.p != 0. && p0 != 0 ) a_ += alphaChannel( p0 ) * m55.p;
                    if( m55.q != 0. && q0 != 0 ) a_ += alphaChannel( q0 ) * m55.q;
                    if( m55.r != 0. && r0 != 0 ) a_ += alphaChannel( r0 ) * m55.r;
                    if( m55.s != 0. && s0 != 0 ) a_ += alphaChannel( s0 ) * m55.s;
                    if( m55.t != 0. && t0 != 0 ) a_ += alphaChannel( t0 ) * m55.t;
                    
                    if( m55.u != 0. && u0 != 0 ) a_ += alphaChannel( u0 ) * m55.u;
                    if( m55.v != 0. && v0 != 0 ) a_ += alphaChannel( v0 ) * m55.v;
                    if( m55.w != 0. && w0 != 0 ) a_ += alphaChannel( w0 ) * m55.w;
                    if( m55.x != 0. && x0 != 0 ) a_ += alphaChannel( x0 ) * m55.x;
                    if( m55.y != 0. && y0 != 0 ) a_ += alphaChannel( y0 ) * m55.y; 
                } else {
                    a_ = alphaChannel( e0 );
                }
                if( borderMode == BorderMode.EXTEND || borderMode == BorderMode.WRAP ){
                    out.setPixel( x-2, y-2, Pixel32.from_argb( a_, r_, g_, b_ ) );
                } else {
                    // edge CROPd 
                    out.setPixel( x, y, Pixel32.from_argb( a_, r_, g_, b_ ) );
                }  
            }
        }
        if( borderMode == BorderMode.CROP ){
            // copy accross the border that is unprocessed
            for( x in 0...this.width - 1 ){
                // top
                out.setPixel( x, 0, here.getPixel( x, 0 ) );
                out.setPixel( x+1, 0, here.getPixel( x+1, 0) );
                // bottom
                out.setPixel( x, this.height-1, here.getPixel( x, this.height-1 ) );
                out.setPixel( x, this.height-2, here.getPixel( x, this.height-2 ) );
            }
            for( y in 2...this.height - 3 ){
                // left
                out.setPixel( 0, y, here.getPixel( 0, y ) );
                out.setPixel( 1, y, here.getPixel( 1, y ) );
                // right
                out.setPixel( this.width - 1, y, here.getPixel( this.width-1, y ) );
                out.setPixel( this.width - 2, y, here.getPixel( this.width-2, y ) );
            }
        }
        return out;
    }
    
    public inline 
    function sharpen0_3x3( strength: Float = 4
                         , borderMode: BorderMode = EXTEND
                         , adjustAlpha: Bool = false ): Pixelimage {
        var x = (1 - strength )/4.;
        return convolute3x3( { a: 0., b: x,        c: 0.
                             , d: x,  e: strength, f: x
                             , g: 0,  h: x,        i: 0. }
                            , borderMode, adjustAlpha );
    }
    public inline 
    function boxBlur0_3x3( borderMode: BorderMode = EXTEND
                         , adjustAlpha: Bool = false ): Pixelimage {
        return convolute3x3( { a: 1./9., b: 1./9., c: 1./9.
                             , d: 1./9., e: 1./9., f: 1./9.
                            ,  g: 1./9., h: 1./9., i: 1./9. }
                            , borderMode, adjustAlpha );
    }
    public inline
    function gussianBlur_3x3( borderMode: BorderMode = EXTEND
                            , adjustAlpha: Bool = false ): Pixelimage {
        return convolute3x3(  { a: 1./16., b: 2./16., c: 1./16.    
                              , d: 2./16., e: 4./16., f: 2./16.
                              , g: 1./16., h: 2./16., i: 1./16. }
                            , borderMode, adjustAlpha );
    }
    
    inline 
    function gussianBlur55data(): Mat5x5data {
        return { a: 1./256.,  b:  4./256.,  c:  6./256.,  d:  4./256., e: 1./256.
              ,  f: 4./256.,  g: 16./256.,  h: 24./256.,  i: 16./256., j: 4./256.
              ,  k: 6./256.,  l: 24./256.,  m: 36./256.,  n: 24./256., o: 6./256.
              ,  p: 4./256.,  q: 16./256.,  r: 24./256.,  s: 16./256., t: 4./256.
              ,  u: 1./256.,  v:  4./256.,  w: 6./256.,   x:  4./256., y: 1./256. }; 
    }
    public inline
    function gussianBlur_5x5( borderMode: BorderMode = EXTEND
                            , adjustAlpha: Bool = false ): Pixelimage {
        return convolute5x5(  gussianBlur55data()
                            , borderMode, adjustAlpha );                     
    }
    inline 
    function unsharpenMask055data(): Mat5x5data {
        return { a: -1./256.,  b:  -4./256.,  c:  -6./256.,  d:  -4./256., e: -1./256.
              ,  f: -4./256.,  g: -16./256.,  h: -24./256.,  i: -16./256., j: -4./256.
              ,  k: -6./256.,  l: -24./256.,  m: -36./256.,  n: -24./256., o: -6./256.
              ,  p: -4./256.,  q: -16./256.,  r: -24./256.,  s: -16./256., t: -4./256.
              ,  u: -1./256.,  v:  -4./256.,  w: -6./256.,   x:  -4./256., y: -1./256. }; 
    }
    public inline
    function unsharpenMask0_5x5( borderMode: BorderMode = EXTEND
                               , adjustAlpha: Bool = false ): Pixelimage {
        return convolute5x5( unsharpenMask055data() 
                           , borderMode, adjustAlpha );  
    }
    public inline
    function edgeEnhance0_3x3( borderMode: BorderMode = EXTEND
                             , adjustAlpha: Bool = false ): Pixelimage {
        return convolute3x3( { a: 0., b: 0., c: 0.
                             , d: -1.,e: 1., f: 0.
                            ,  g: 0., h: 0., i: 0. }
                            , borderMode, adjustAlpha );
    }
    public inline
    function edgeDetect0_3x3( strength: Float = 4, borderMode: BorderMode = EXTEND, adjustAlpha: Bool = false ): Pixelimage {
        var x = (strength - 1)/4.;
        return convolute3x3(  { a: 0., b: x,         c: 0.
                              , d: x,  e: -strength, f: x
                              , g: 0,  h: x,         i: 0. }
                            , borderMode, adjustAlpha );
    }
    public inline
    function emboss0_3x3( borderMode: BorderMode = EXTEND, adjustAlpha: Bool = false ): Pixelimage {
        return convolute3x3( { a: -2./3., b: 1./3., c: 0.
                             , d: -1./3., e: 1./3., f: 1./3.
                             , g: 0,      h: 1./3., i: 2./3. }
                            , borderMode, adjustAlpha );
    }

}