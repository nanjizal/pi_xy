package pixelimageXY.algo;
// setup to help with leaving triangle filling early when 5 point sampling 
// unfortunately does not seem to be easy with 5 point sampling to leave early.
// keeping incase look at optimisation again.
// https://gist.github.com/nanjizal/39e2135fa3612860240ef468f8428ea9
enum abstract Dig(Int) from Int to Int {
    var _0 = 1;
    var _1 = 2;
    var _2 = 4;
    var _3 = 8;
    var _4 = 16;
    var _5 = 32;
    var _6 = 64;
    var _7 = 128;
    var _8 = 264;
}
abstract MultiBool(Int) to Int from Int {
    inline
    public function new( v: Int = 0 ){
        this = v;
    }
    inline
    public function trueMask( mask: Dig ):Int {
        this = this | mask;
        return this;
    }
    inline
    public function falseMask( mask: Dig ):Int {
        this = this & ~mask;
        return this;
    }
    inline
    public function toggle( mask: Dig ){
	    this = this ^ mask;
	    return this;
    }
	inline
    public function value( mask: Dig ){
	    return this & mask != 0;
    }
    inline
    public function valueS( mask: Dig ): String {
	    return (this & mask != 0)? '1': '0';
    }
    inline
    public function toString(): String {
        return   valueS( _7 ) + valueS( _6 )
               + valueS( _5 ) + valueS( _4 )
               + valueS( _3 ) + valueS( _2 )
               + valueS( _1 ) + valueS( _0 );
    }
    inline 
    public function trueTill0(){
	    return ( this: Int ) == ( _0: Int );
    }
    inline 
    public function trueTill1(){
	    return ( this: Int ) == ( _0: Int ) + ( _1: Int );
    }
    inline 
    public function trueTill2(){
	    return ( this: Int ) == ( _0: Int ) + ( _1: Int ) + ( _2: Int );
    }
    inline 
    public function trueTill3(){
	    return ( this: Int ) == ( _0: Int ) + ( _1: Int ) + ( _2: Int ) + ( _3: Int );
    }
    inline 
    public function trueTill4(){
	    return ( this: Int ) == ( _0: Int ) + ( _1: Int ) + ( _2: Int ) + ( _3: Int ) + ( _4: Int );
    }
    inline 
    public function trueTill5(){
	    return ( this: Int ) == ( _0: Int ) + ( _1: Int ) + ( _2: Int ) + ( _3: Int ) + ( _4: Int ) + ( _5: Int );
    }
    inline 
    public function trueTill6(){
	    return ( this: Int ) == ( _0: Int ) + ( _1: Int ) + ( _2: Int ) + ( _3: Int ) + ( _4: Int ) + ( _5: Int ) + ( _6: Int );
    }
    inline 
    public function trueTill7(){
	    return ( this: Int ) == ( _0: Int ) + ( _1: Int ) + ( _2: Int ) 
                              + ( _3: Int ) + ( _4: Int ) + ( _5: Int ) 
                              + ( _6: Int ) + ( _7: Int );
    }
    inline 
    public function trueTill8(){
	    return ( this: Int ) == ( _0: Int ) + ( _1: Int ) + ( _2: Int ) 
                              + ( _3: Int ) + ( _4: Int ) + ( _5: Int ) 
                              + ( _6: Int ) + ( _7: Int );
    }
    // sure this can be improved
    inline
    public function trueTill( mask: Dig ) {
        var bool = true;
        for( i in 0...9 ){
            var v = 1 << i;
            if( !value( v ) ) {
                bool = false;
                break;
            }
            //trace( v );
    	    if( v == mask ) break;
        }
        return bool;
    }
}