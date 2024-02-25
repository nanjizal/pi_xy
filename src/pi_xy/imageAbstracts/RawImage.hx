package pi_xy.imageAbstracts;
import pi_xy.Pixelimage;
import iterMagic.Img;
/**
    Provides methods to deal directly with the raw Pixelimage data
    take care as the internal colour values are not ARGB format
    methods are very similar to the Picture class within Img in iterMagic
**/
@:transient
abstract RawImage( Pixelimage ) from Pixelimage to Pixelimage {

    inline
    public function new( w: Int, h: Int ){
       this = new Pixelimage( w, h );
    }
    /**
        clone the current Pixelimage to a new one, does not copy the mask.
    **/
    public inline function clone(): Pixelimage {
        var here = ( this: ImageStruct );
        var cloned = new Pixelimage( this.width, this.height, here.imageType );
        return toFrom( cloned, abstract );
    }
    /**
        direct array access of pixel Int
        not advised as pixels normally have mask and blend applied
        and the color order is changed when set indirectly.
        see setPixel on Pixelimage
    **/
    @:arrayAccess
    public inline
    function set( index: Int, value: Int ): Int
        return this.image.set( index, value );
    @:arrayAccess
    public inline
    function get( index: Int ): Int
        return this.image[ index ];
    /**
        transfers pixel values directly from first image to second
        returns second image
    **/
    public static inline
    function fromTo( a: Pixelimage, b: Pixelimage ) {
        for( i in 0...b.image.length ) b.image[ i ] = a.image[ i ];
        return b;
    }
    /**
        transfers pixel values directly from second image to first
        return first image
    **/
    public static inline
    function toFrom( a: Pixelimage, b: Pixelimage ) {
        for( i in 0...b.image.length ) a.image[ i ] = b.image[ i ];             
        return a;
    }
    /**
        debug tool traces the pixel data in rows to console.
    **/
    public inline
    function traceGrid(){
        this.image.traceGrid();
    }
    /**
        traces the pixel values stored internally
    **/
    public inline
    function imgToString(){
        return this.image.toString();
    }
    public var rawImageData( get, set ): RawImageData;
    private inline
    function get_rawImageData(): RawImageData {
        return this.image.getRaw();
    }
    private inline
    function set_rawImageData( d: RawImageData ): RawImageData {
        return this.image.setRaw( d );
    }
}