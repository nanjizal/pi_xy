package pixelimageXY.pixel;
/* Not working don't use at mo
// maps sRGB #000000 to L* = 0, disregarding sRGB's encoding viewing flare of 1%.
// ported to haxe from Jan Behrens work.
// https://www.magnetkern.de/srlab2.html
// further reading
// https://raphlinus.github.io/color/2021/01/18/oklab-critique.html
// note: there is a TS port but it is apache2 so looking at original
// note2: my pallette lib has OKLib conversion.
@:structInit
class SrLab2_ {
    public var l: Float;
    public var a: Float;
    public var b: Float;
    public inline 
    function new( l: Float, a: Float, b: Float ){
        this.l = l;
        this.a = a;
        this.b = b;
    }
}
@:forward
@:transitive
abstract SrLab2( SrLab2_ ) from SrLab2_ to SrLab2_ {
    public inline
    function new( lab: SrLab2_ ){
        this = lab;
    }
    @:to 
    public inline 
    function toRGB(): RGB {
        return SrLab2RGB( this.l, this.a, this.b );
    } 
    @:from
    static inline
    public function fromRGB( rgb : RGB ): SrLab2 {
        return RGBtoSrLab2( rgb.r, rgb.g, rgb.b );
    }
    @:to
    inline
    public function toString():String {
      var l = this.l;
      var a = this.a;
      var b = this.b;
      return 'l:$l,a:$a,b:$b';
    }
}
@:structInit
class RGB_ {
    public var r: Float;
    public var g: Float;
    public var b: Float;
    public inline 
    function new( r: Float, g: Float, b: Float ){
        this.r = r;
        this.g = g;
        this.b = b;
    }
}
@:forward
@:transitive
abstract RGB( RGB_ )from RGB_ to RGB_ {
    public inline
    function new( rgb: RGB_ ){
        this = rgb;
    }
    @:to 
    public inline 
    function toSrLab2(): SrLab2{
        return RGBtoSrLab2( this.r, this.g, this.b );
    } 
    @:from
    static inline
    public function fromSrLab2( lab : SrLab2 ): RGB {
        return SrLab2RGB( lab.l, lab.a, lab.b );
    }
    @:to
    public inline
    function toRGBHex(): Int {
        return ( toHexInt( this.r ) << 16 ) 
             | ( toHexInt( this.g ) << 8 ) 
             |   toHexInt( this.b );
    }
    @:from
    static inline
    public function fromRGBHex( col: Int ): RGB {
        var rgb: RGB_ = { r: colIntToFloat( col >> 16 & 0xFF )
                         , g: colIntToFloat( col >> 8 & 0xFF )
                         , b: colIntToFloat( col & 0xFF ) };
        return ( rgb: RGB );
    }
    @:to
    inline
    public function toString():String {
      var r = this.r;
      var g = this.g;
      var b = this.b;
      return 'r:$r,g:$g,b:$b';
    }
}
inline
function colIntToFloat( c: Int ): Float {
    return ( c == 0 )? 0.: c/255;
}
inline 
function toHexInt( c: Float ): Int {
    return Math.round( c * 255 );
}
inline
function rgbToCube( ch: Float ): Float {
    return ( ch <= 0.03928 )? ch/12.92: Math.pow( ( ch + 0.055 ) / 1.055, 2.4 );
}
function remapCubeSr( v: Float ): Float {
    return ( v <= (216. / 24389.) )? v *( 24389. / 2700. ): 1.16*Math.pow( v, 1.0/3. ) - 0.16;
}

inline 
function RGBtoSrLab2( r: Float, g: Float, b: Float ): SrLab2{
    r = rgbToCube( r );
    g = rgbToCube( g );
    b = rgbToCube( b );
    // map to cube
    var x = 0.320530 * r + 0.636920 * g + 0.042560 * b;
    x = remapCubeSr( x );
    var y = 0.161987 * r + 0.756636 * g + 0.081376 * b;
    y = remapCubeSr( y );
    var z = 0.017228 * r + 0.108660 * g + 0.874112 * b;
    z = remapCubeSr( z );
    var sr: SrLab2 = cast { 
             l:  37.0950 * x +  62.9054 * y -   0.0008 * z
           , a: 663.4684 * x - 750.5078 * y +  87.0328 * z
           , b:  63.9569 * x + 108.4576 * y - 172.4152 * z };
    return sr;
}
inline
function cubeToRGB( ch: Float ): Float {
    return (ch <= 0.00304 )? ch * 12.92: 1.055 * Math.pow( ch, (1./2.4 ) ) - 0.055;
}
inline
function remapCubeRGB( v: Float ): Float {
    return ( v <= 0.08 )? v *( 2700. / 24389. ): Math.pow( ( v + 0.16 )/ 0.16, 3. );
}
inline 
function SrLab2RGB( l: Float, a: Float, b: Float ): RGB {
    var x = 0.01 * l + 0.000904127 * a + 0.000456344 * b;
    x = remapCubeRGB( x );
    var y = 0.01 * l - 0.000533159 * a - 0.000269178 * b;
    y = remapCubeRGB( y );
    var z = 0.01 * l                   - 0.005800000 * b;
    z = remapCubeRGB( z );
    var rgb: RGB_ = { r: cubeToRGB(  5.435679 * x - 4.599131 * y + 0.163593 * z )
                    , g: cubeToRGB( -1.168090 * x + 2.327977 * y - 0.159798 * z )
                    , b: cubeToRGB(  0.037840 * x - 0.198564 * y + 1.160644 * z ) };
    return ( rgb: RGB );
}
*/

