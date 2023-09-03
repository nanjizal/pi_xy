package pixelimageXY.imageAbstracts;
import pixelimageXY.Pixelimage;
import pixelimageXY.pixel.Pixel32;
import pixelimageXY.pixel.Pixel28;
import pixelimageXY.pixel.ColorHelp;

enum abstract BorderMode( Int ) {
    var EXTEND  = 0;
    var CROP    = 1;
    var WRAP    = 2;
}

@:transient
abstract Convolution( Pixelimage ) from Pixelimage to Pixelimage {

    inline
    public function new( w: Int, h: Int ){
       this = new Pixelimage( w, h );
    }
    public inline
    function padWrapImage( places: Int ): Pixelimage {
        var img = new Pixelimage( this.width+places, this.height+places );
        img.putPixelImage( this, places, places );
        // draw border
        for( x in 0...this.width - 1 ){
            for( y in 0...places ){
                // top row
                img.setPixel( x+1, y, this.getPixel( x, this.height - 1 ) );
                // bottom row
                img.setPixel( x+1, img.height - y, this.getPixel( x, 0 ) );
            }
        }
        for( y in 0...this.height - 1 ){
            for( x in 0...places ){
                // left column
                img.setPixel( x, y+1, this.getPixel( this.width - 1, y ) );
                // right column
                img.setPixel( x, img.height - y, this.getPixel( 0, y ) );

            }
        }
        // draw corners
        img.setPixel( 0, 0, this.getPixel( this.width - 1, this.height-1 ) );
        img.setPixel( img.width-1, 0, this.getPixel( 0, this.height-1 ) );
        img.setPixel( 0, img.height-1, this.getPixel( this.width - 1, 0 ) );
        img.setPixel( img.width-1, img.height-1, this.getPixel( 0, 0 ) );
        return img;
    }
    public inline
    function padImage( places: Int ): Pixelimage {
        var img = new Pixelimage( this.width+places, this.height+places );
        img.putPixelImage( this, places, places );
        // draw border
        for( x in 0...this.width - 1 ){
            for( y in 0...places ){
                // top row
                img.setPixel( x+1, y, this.getPixel( x, 0 ) );
                // bottom row
                img.setPixel( x+1, img.height - y, this.getPixel( x, this.height - 1 ) );
            }
        }
        for( y in 0...this.height - 1 ){
            for( x in 0...places ){
                // left column
                img.setPixel( x, y+1, this.getPixel( 0, y ) );
                // right column
                img.setPixel( x, img.height - y, this.getPixel( this.width - 1, y ) );

            }
        }
        // draw corners
        img.setPixel( 0, 0, this.getPixel( 0, 0 ) );
        img.setPixel( img.width-1, 0, this.getPixel( this.width - 1, 0 ) );
        img.setPixel( 0, img.height-1, this.getPixel( 0, this.height-1 ) );
        img.setPixel( img.width-1, img.height-1, this.getPixel( this.width - 1, this.height-1 ) );
        return img;
    }
    /**
        Add color border
        ideal to help with testing aspects of padding and to provide useful feature.
    **/
    public inline
    function border( col: Int, places: Int ): Pixelimage {
        var img = new Pixelimage( this.width+places, this.height+places );
        img.putPixelImage( this, places, places );
        // draw border
        for( x in 0...this.width - 1 ){
            for( y in 0...places ){
                // top row
                img.setPixel( x+1, y, col );
                // bottom row
                img.setPixel( x+1, img.height - y, col );
            }
        }
        for( y in 0...this.height - 1 ){
            for( x in 0...places ){
                // left column
                img.setPixel( x, y+1, col );
                // right column
                img.setPixel( x, img.height - y, col );

            }
        }
        // draw corners
        img.setPixel( 0, 0, col );
        img.setPixel( img.width-1, 0, col );
        img.setPixel( 0, img.height-1, col );
        img.setPixel( img.width-1, img.height-1, col );
        return img;
    }
    inline
    public function convolute3x3( a: Float, b: Float, c: Float
                                , d: Float, e: Float, f: Float
                                , g: Float, h: Float, i: Float
                                , borderMode: BorderMode
                                , adjustAlpha: Bool = false
                                , adjustRed : Bool = true
                                , adjustGreen: Bool = true
                                , adjustBlue: Bool = true
                                ){
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
                here = padImage( 1 );
            case CROP:
                //
            case WRAP: 
                here = padWrapImage( 1 );  
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
                    if( a != 0. && a0 != 0 ) r_ += redChannel( a0 ) * a;
                    if( b != 0. && b0 != 0 ) r_ += redChannel( b0 ) * b;
                    if( c != 0. && c0 != 0 ) r_ += redChannel( c0 ) * c;
                    if( d != 0. && d0 != 0 ) r_ += redChannel( d0 ) * d;
                    if( e != 0. && e0 != 0 ) r_ += redChannel( e0 ) * e;
                    if( f != 0. && f0 != 0 ) r_ += redChannel( f0 ) * f;
                    if( g != 0. && g0 != 0 ) r_ += redChannel( g0 ) * g;
                    if( h != 0. && h0 != 0 ) r_ += redChannel( h0 ) * h;
                    if( i != 0. && i0 != 0 ) r_ += redChannel( i0 ) * i;  
                } else {
                    r_ = redChannel( e0 );
                }
                if( adjustGreen ) {
                    g_ = 0.;
                    if( a != 0. && a0 != 0 ) g_ += greenChannel( a0 ) * a;
                    if( b != 0. && b0 != 0 ) g_ += greenChannel( b0 ) * b;
                    if( c != 0. && c0 != 0 ) g_ += greenChannel( c0 ) * c;
                    if( d != 0. && d0 != 0 ) g_ += greenChannel( d0 ) * d;
                    if( e != 0. && e0 != 0 ) g_ += greenChannel( e0 ) * e;
                    if( f != 0. && f0 != 0 ) g_ += greenChannel( f0 ) * f;
                    if( g != 0. && g0 != 0 ) g_ += greenChannel( g0 ) * g;
                    if( h != 0. && h0 != 0 ) g_ += greenChannel( h0 ) * h;
                    if( i != 0. && i0 != 0 ) g_ += greenChannel( i0 ) * i;  
                } else {
                    g_ = greenChannel( e0 );
                }
                if( adjustBlue ) {
                    b_ = 0.;
                    if( a != 0. && a0 != 0 ) b_ += blueChannel( a0 ) * a;
                    if( b != 0. && b0 != 0 ) b_ += blueChannel( b0 ) * b;
                    if( c != 0. && c0 != 0 ) b_ += blueChannel( c0 ) * c;
                    if( d != 0. && d0 != 0 ) b_ += blueChannel( d0 ) * d;
                    if( e != 0. && e0 != 0 ) b_ += blueChannel( e0 ) * e;
                    if( f != 0. && f0 != 0 ) b_ += blueChannel( f0 ) * f;
                    if( g != 0. && g0 != 0 ) b_ += blueChannel( g0 ) * g;
                    if( h != 0. && h0 != 0 ) b_ += blueChannel( h0 ) * h;
                    if( i != 0. && i0 != 0 ) b_ += blueChannel( i0 ) * i;  
                } else {
                    b_ = blueChannel( e0 );
                }
                if( adjustAlpha ) {
                    a_ = 0.;
                    if( a != 0. && a0 != 0 ) a_ += alphaChannel( a0 ) * a;
                    if( b != 0. && b0 != 0 ) a_ += alphaChannel( b0 ) * b;
                    if( c != 0. && c0 != 0 ) a_ += alphaChannel( c0 ) * c;
                    if( d != 0. && d0 != 0 ) a_ += alphaChannel( d0 ) * d;
                    if( e != 0. && e0 != 0 ) a_ += alphaChannel( e0 ) * e;
                    if( f != 0. && f0 != 0 ) a_ += alphaChannel( f0 ) * f;
                    if( g != 0. && g0 != 0 ) a_ += alphaChannel( g0 ) * g;
                    if( h != 0. && h0 != 0 ) a_ += alphaChannel( h0 ) * h;
                    if( i != 0. && i0 != 0 ) a_ += alphaChannel( i0 ) * i;  
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
    public function convolute5x5( a: Float, b: Float, c: Float, d: Float, e: Float
                                , f: Float, g: Float, h: Float, i: Float, j: Float
                                , k: Float, l: Float, m: Float, n: Float, o: Float
                                , p: Float, q: Float, r: Float, s: Float, t: Float
                                , u: Float, v: Float, w: Float, x: Float, y: Float
                                , borderMode: BorderMode
                                , adjustAlpha: Bool = false
                                , adjustRed : Bool = true
                                , adjustGreen: Bool = true
                                , adjustBlue: Bool = true
                                ){
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
                here = padImage( 2 );
            case CROP:
                //
            case WRAP: 
                here = padWrapImage( 2 );  
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
                    if( a != 0. && a0 != 0 ) r_ += redChannel( a0 ) * a;
                    if( b != 0. && b0 != 0 ) r_ += redChannel( b0 ) * b;
                    if( c != 0. && c0 != 0 ) r_ += redChannel( c0 ) * c;
                    if( d != 0. && d0 != 0 ) r_ += redChannel( d0 ) * d;
                    if( e != 0. && e0 != 0 ) r_ += redChannel( e0 ) * e;

                    if( f != 0. && f0 != 0 ) r_ += redChannel( f0 ) * f;
                    if( g != 0. && g0 != 0 ) r_ += redChannel( g0 ) * g;
                    if( h != 0. && h0 != 0 ) r_ += redChannel( h0 ) * h;
                    if( i != 0. && i0 != 0 ) r_ += redChannel( i0 ) * i;
                    if( j != 0. && j0 != 0 ) r_ += redChannel( j0 ) * j;

                    if( k != 0. && k0 != 0 ) r_ += redChannel( k0 ) * k;
                    if( l != 0. && l0 != 0 ) r_ += redChannel( l0 ) * l;
                    if( m != 0. && m0 != 0 ) r_ += redChannel( m0 ) * m;
                    if( n != 0. && n0 != 0 ) r_ += redChannel( n0 ) * n;
                    if( o != 0. && o0 != 0 ) r_ += redChannel( o0 ) * o;

                    if( p != 0. && p0 != 0 ) r_ += redChannel( p0 ) * p;
                    if( q != 0. && q0 != 0 ) r_ += redChannel( q0 ) * q;
                    if( r != 0. && r0 != 0 ) r_ += redChannel( r0 ) * r;
                    if( s != 0. && s0 != 0 ) r_ += redChannel( s0 ) * s;
                    if( t != 0. && t0 != 0 ) r_ += redChannel( t0 ) * t;

                    if( u != 0. && u0 != 0 ) r_ += redChannel( u0 ) * u;
                    if( v != 0. && v0 != 0 ) r_ += redChannel( v0 ) * v;
                    if( w != 0. && w0 != 0 ) r_ += redChannel( w0 ) * w;
                    if( x != 0. && x0 != 0 ) r_ += redChannel( x0 ) * x;
                    if( y != 0. && y0 != 0 ) r_ += redChannel( y0 ) * y;

                } else {
                    r_ = redChannel( e0 );
                }
                if( adjustGreen ) {
                    g_ = 0.;
                    if( a != 0. && a0 != 0 ) g_ += greenChannel( a0 ) * a;
                    if( b != 0. && b0 != 0 ) g_ += greenChannel( b0 ) * b;
                    if( c != 0. && c0 != 0 ) g_ += greenChannel( c0 ) * c;
                    if( d != 0. && d0 != 0 ) g_ += greenChannel( d0 ) * d;
                    if( e != 0. && e0 != 0 ) g_ += greenChannel( e0 ) * e;

                    if( f != 0. && f0 != 0 ) g_ += greenChannel( f0 ) * f;
                    if( g != 0. && g0 != 0 ) g_ += greenChannel( g0 ) * g;
                    if( h != 0. && h0 != 0 ) g_ += greenChannel( h0 ) * h;
                    if( i != 0. && i0 != 0 ) g_ += greenChannel( i0 ) * i;
                    if( j != 0. && j0 != 0 ) g_ += greenChannel( j0 ) * j;

                    if( k != 0. && k0 != 0 ) g_ += greenChannel( k0 ) * k;
                    if( l != 0. && l0 != 0 ) g_ += greenChannel( l0 ) * l;
                    if( m != 0. && m0 != 0 ) g_ += greenChannel( m0 ) * m;
                    if( n != 0. && n0 != 0 ) g_ += greenChannel( n0 ) * n;
                    if( o != 0. && o0 != 0 ) g_ += greenChannel( o0 ) * o;

                    if( p != 0. && p0 != 0 ) g_ += greenChannel( p0 ) * p;
                    if( q != 0. && q0 != 0 ) g_ += greenChannel( q0 ) * q;
                    if( r != 0. && r0 != 0 ) g_ += greenChannel( r0 ) * r;
                    if( s != 0. && s0 != 0 ) g_ += greenChannel( s0 ) * s;
                    if( t != 0. && t0 != 0 ) g_ += greenChannel( t0 ) * t;
                    
                    if( u != 0. && u0 != 0 ) g_ += greenChannel( u0 ) * u;
                    if( v != 0. && v0 != 0 ) g_ += greenChannel( v0 ) * v;
                    if( w != 0. && w0 != 0 ) g_ += greenChannel( w0 ) * w;
                    if( x != 0. && x0 != 0 ) g_ += greenChannel( x0 ) * x;
                    if( y != 0. && y0 != 0 ) g_ += greenChannel( y0 ) * y; 
                } else {
                    g_ = greenChannel( e0 );
                }
                if( adjustBlue ) {
                    b_ = 0.;
                    if( a != 0. && a0 != 0 ) b_ += blueChannel( a0 ) * a;
                    if( b != 0. && b0 != 0 ) b_ += blueChannel( b0 ) * b;
                    if( c != 0. && c0 != 0 ) b_ += blueChannel( c0 ) * c;
                    if( d != 0. && d0 != 0 ) b_ += blueChannel( d0 ) * d;
                    if( e != 0. && e0 != 0 ) b_ += blueChannel( e0 ) * e;

                    if( f != 0. && f0 != 0 ) b_ += blueChannel( f0 ) * f;
                    if( g != 0. && g0 != 0 ) b_ += blueChannel( g0 ) * g;
                    if( h != 0. && h0 != 0 ) b_ += blueChannel( h0 ) * h;
                    if( i != 0. && i0 != 0 ) b_ += blueChannel( i0 ) * i;
                    if( j != 0. && j0 != 0 ) b_ += blueChannel( j0 ) * j;

                    if( k != 0. && k0 != 0 ) b_ += blueChannel( k0 ) * k;
                    if( l != 0. && l0 != 0 ) b_ += blueChannel( l0 ) * l;
                    if( m != 0. && m0 != 0 ) b_ += blueChannel( m0 ) * m;
                    if( n != 0. && n0 != 0 ) b_ += blueChannel( n0 ) * n;
                    if( o != 0. && o0 != 0 ) b_ += blueChannel( o0 ) * o;

                    if( p != 0. && p0 != 0 ) b_ += blueChannel( p0 ) * p;
                    if( q != 0. && q0 != 0 ) b_ += blueChannel( q0 ) * q;
                    if( r != 0. && r0 != 0 ) b_ += blueChannel( r0 ) * r;
                    if( s != 0. && s0 != 0 ) b_ += blueChannel( s0 ) * s;
                    if( t != 0. && t0 != 0 ) b_ += blueChannel( t0 ) * t;
                    
                    if( u != 0. && u0 != 0 ) b_ += blueChannel( u0 ) * u;
                    if( v != 0. && v0 != 0 ) b_ += blueChannel( v0 ) * v;
                    if( w != 0. && w0 != 0 ) b_ += blueChannel( w0 ) * w;
                    if( x != 0. && x0 != 0 ) b_ += blueChannel( x0 ) * x;
                    if( y != 0. && y0 != 0 ) b_ += blueChannel( y0 ) * y;
                } else {
                    b_ = blueChannel( e0 );
                }
                if( adjustAlpha ) {
                    a_ = 0.;
                    if( a != 0. && a0 != 0 ) a_ += alphaChannel( a0 ) * a;
                    if( b != 0. && b0 != 0 ) a_ += alphaChannel( b0 ) * b;
                    if( c != 0. && c0 != 0 ) a_ += alphaChannel( c0 ) * c;
                    if( d != 0. && d0 != 0 ) a_ += alphaChannel( d0 ) * d;
                    if( e != 0. && e0 != 0 ) a_ += alphaChannel( e0 ) * e;

                    if( f != 0. && f0 != 0 ) a_ += alphaChannel( f0 ) * f;
                    if( g != 0. && g0 != 0 ) a_ += alphaChannel( g0 ) * g;
                    if( h != 0. && h0 != 0 ) a_ += alphaChannel( h0 ) * h;
                    if( i != 0. && i0 != 0 ) a_ += alphaChannel( i0 ) * i;
                    if( j != 0. && j0 != 0 ) a_ += alphaChannel( j0 ) * j;

                    if( k != 0. && k0 != 0 ) a_ += alphaChannel( k0 ) * k;
                    if( l != 0. && l0 != 0 ) a_ += alphaChannel( l0 ) * l;
                    if( m != 0. && m0 != 0 ) a_ += alphaChannel( m0 ) * m;
                    if( n != 0. && n0 != 0 ) a_ += alphaChannel( n0 ) * n;
                    if( o != 0. && o0 != 0 ) a_ += alphaChannel( o0 ) * o;

                    if( p != 0. && p0 != 0 ) a_ += alphaChannel( p0 ) * p;
                    if( q != 0. && q0 != 0 ) a_ += alphaChannel( q0 ) * q;
                    if( r != 0. && r0 != 0 ) a_ += alphaChannel( r0 ) * r;
                    if( s != 0. && s0 != 0 ) a_ += alphaChannel( s0 ) * s;
                    if( t != 0. && t0 != 0 ) a_ += alphaChannel( t0 ) * t;
                    
                    if( u != 0. && u0 != 0 ) a_ += alphaChannel( u0 ) * u;
                    if( v != 0. && v0 != 0 ) a_ += alphaChannel( v0 ) * v;
                    if( w != 0. && w0 != 0 ) a_ += alphaChannel( w0 ) * w;
                    if( x != 0. && x0 != 0 ) a_ += alphaChannel( x0 ) * x;
                    if( y != 0. && y0 != 0 ) a_ += alphaChannel( y0 ) * y; 
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
        return convolute3x3(  0., x,        0.
                            , x,  strength, x
                            , 0,  x,        0.
                            , borderMode, adjustAlpha );
    }
    public inline 
    function boxBlur0_3x3( borderMode: BorderMode = EXTEND
                         , adjustAlpha: Bool = false ): Pixelimage {
        return convolute3x3(  1./9., 1./9., 1./9.
                            , 1./9., 1./9., 1./9.
                            , 1./9., 1./9., 1./9.
                            , borderMode, adjustAlpha );
    }
    public inline
    function gussianBlur_3x3( borderMode: BorderMode = EXTEND
                            , adjustAlpha: Bool = false ): Pixelimage {
        return convolute3x3(  1./16., 2./16., 1./16.    
                            , 2./16., 4./16., 2./16.
                            , 1./16., 2./16., 1./16.
                            , borderMode, adjustAlpha );
    }
    public inline
    function gussianBlur_5x5( borderMode: BorderMode = EXTEND
                            , adjustAlpha: Bool = false ): Pixelimage {
        return convolute5x5(  1./256.,  4./256.,  6./256.,  4./256., 1./256.
                            , 4./256., 16./256., 24./256., 16./256., 4./256.
                            , 6./256., 24./256., 36./256., 24./256., 6./256.
                            , 4./256., 16./256., 24./256., 16./256., 4./256.
                            , 1./256.,  4./256.,  6./256.,  4./256., 1./256.  
                            , borderMode, adjustAlpha );                     
    }
    public inline
    function unsharpenMask0_5x5( borderMode: BorderMode = EXTEND
                               , adjustAlpha: Bool = false ): Pixelimage {
        return convolute5x5( -1./256.,  -4./256.,  -6./256.,  -4./256., -1./256.
                           , -4./256., -16./256., -24./256., -16./256., -4./256.
                           , -6./256., -24./256., 476./256., -24./256., -6./256.
                           , -4./256., -16./256., -24./256., -16./256., -4./256.
                           , -1./256.,  -4./256.,  -6./256.,  -4./256., -1./256.  
                           , borderMode, adjustAlpha );  
    }
    public inline
    function edgeEnhance0_3x3( borderMode: BorderMode = EXTEND
                             , adjustAlpha: Bool = false ): Pixelimage {
        return convolute3x3(  0., 0., 0.
                            ,-1., 1., 0.
                            , 0., 0., 0.
                            , borderMode, adjustAlpha );
    }
    public inline
    function edgeDetect0_3x3( strength: Float = 4, borderMode: BorderMode = EXTEND, adjustAlpha: Bool = false ): Pixelimage {
        var x = (strength - 1)/4.;
        return convolute3x3(  0., x,        0.
                            , x, -strength, x
                            , 0,  x,        0.
                            , borderMode, adjustAlpha );
    }
    public inline
    function emboss0_3x3( borderMode: BorderMode = EXTEND, adjustAlpha: Bool = false ): Pixelimage {
        return convolute3x3( -2./3., 1./3., 0.
                            ,-1./3., 1./3., 1./3.
                            , 0,     1./3., 2./3.
                            , borderMode, adjustAlpha );
    }

}