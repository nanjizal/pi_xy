package pixelimage;
// module BoundIterator

    /*
        Used for bounding box iteration, calculates lo...hi iterator from 3 values. 
    */
    inline 
    function boundIterator3( a: Float, b: Float, c: Float ): Iterator<Int> {
        return if( a > b ){
            if( a > c ){ // a,b a,c
                (( b > c )? Math.floor( c ): Math.floor( b ))...Math.ceil( a );
            } else { // c,a,b
                Math.floor( b )...Math.ceil( c );
            }
        } else {
            if( b > c ){ // b,a, b,c 
                (( a > c )? Math.floor( c ): Math.ceil( a ))...Math.ceil( b );
            } else { // c,b,a
                Math.floor( a )...Math.ceil( c );
            }
        }
    }
    inline
    function boundIterator4( a: Float, b: Float, c: Float, d: Float ): Iterator<Int> {
        var min = Math.floor( a );
        var max = Math.ceil( a );
        if( b < min ){
            min = Math.floor( b );
        } else if( b > max ){
            max = Math.ceil( b );
        }
        if( c < min ){
            min = Math.floor( c );
        } else if( c > max ){
            max = Math.ceil( c );
        }
        if( d < min ){
            min = Math.floor( d );
        } else if( d > max ){
            max = Math.ceil( d );
        }
        return min...max;
    }
