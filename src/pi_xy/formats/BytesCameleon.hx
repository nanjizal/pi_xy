package pi_xy.formats;
import haxe.io.Bytes;

@:forward
abstract BytesCameleon( Bytes ) to Bytes from Bytes {
    public inline
    function new( bytes: Bytes ){
        this = bytes;
    }
    public inline
    function ARGB_RGBA(){
        var p = 0;
        var a: Int;
        var r: Int;
        var g: Int;
        var b: Int;
	    for( i in 0...this.length >> 2 ) {
            var a = this.get( p );
		    var r = this.get( p + 1 );
		    var g = this.get( p + 2 );
		    var b = this.get( p + 3 );
		    this.set( p++, r );
		    this.set( p++, g );
		    this.set( p++, b );
		    this.set( p++, a );
        }
    }
    public inline
    function RGBA_ARGB(){
        var p = 0;
        var a: Int;
        var r: Int;
        var g: Int;
        var b: Int;
	    for( i in 0...this.length >> 2 ) {
            var r = this.get( p );
		    var g = this.get( p + 1 );
		    var b = this.get( p + 2 );
		    var a = this.get( p + 3 );
		    this.set( p++, a );
		    this.set( p++, r );
		    this.set( p++, g );
		    this.set( p++, b );
        }
    }
    public inline
    function ARGB_BGRA(){
        var p = 0;
        var a: Int;
        var r: Int;
        var g: Int;
        var b: Int;
	    for( i in 0...this.length >> 2 ) {
            var a = this.get( p );
		    var r = this.get( p + 1 );
		    var g = this.get( p + 2 );
		    var b = this.get( p + 3 );
		    this.set( p++, b );
		    this.set( p++, g );
		    this.set( p++, r );
		    this.set( p++, a );
        }
    }
    public inline
    function ARGB_ABGR(){
        var p = 0;
        var a: Int;
        var r: Int;
        var g: Int;
        var b: Int;
	    for( i in 0...this.length >> 2 ) {
            var a = this.get( p );
		    var r = this.get( p + 1 );
		    var g = this.get( p + 2 );
		    var b = this.get( p + 3 );
		    this.set( p++, a );
		    this.set( p++, b );
		    this.set( p++, g );
		    this.set( p++, r );
        }
    }
    public inline
    function ABGR_ARGB(){
        var p = 0;
        var a: Int;
        var r: Int;
        var g: Int;
        var b: Int;
	    for( i in 0...this.length >> 2 ) {
            var a = this.get( p );
		    var b = this.get( p + 1 );
		    var g = this.get( p + 2 );
		    var r = this.get( p + 3 );
		    this.set( p++, a );
		    this.set( p++, r );
		    this.set( p++, g );
		    this.set( p++, b );
        }
    }
    public inline
    function ABGR_RGBA(){
        var p = 0;
        var a: Int;
        var r: Int;
        var g: Int;
        var b: Int;
	    for( i in 0...this.length >> 2 ) {
            var a = this.get( p );
		    var b = this.get( p + 1 );
		    var g = this.get( p + 2 );
		    var r = this.get( p + 3 );
		    this.set( p++, r );
		    this.set( p++, g );
		    this.set( p++, b );
		    this.set( p++, a );
        }
    }
    public inline
    function BGRA_ARGB(){
        var p = 0;
        var a: Int;
        var r: Int;
        var g: Int;
        var b: Int;
	    for( i in 0...this.length >> 2 ) {
            var b = this.get( p );
		    var g = this.get( p + 1 );
		    var r = this.get( p + 2 );
		    var a = this.get( p + 3 );
		    this.set( p++, a );
		    this.set( p++, r );
		    this.set( p++, g );
		    this.set( p++, b );
        }
    }
    public inline
    function BGRA_RGBA(){
        var p = 0;
        var a: Int;
        var r: Int;
        var g: Int;
        var b: Int;
	    for( i in 0...this.length >> 2 ) {
            var b = this.get( p );
		    var g = this.get( p + 1 );
		    var r = this.get( p + 2 );
		    var a = this.get( p + 3 );
		    this.set( p++, r );
		    this.set( p++, g );
		    this.set( p++, b );
		    this.set( p++, a );
        }
    }
}