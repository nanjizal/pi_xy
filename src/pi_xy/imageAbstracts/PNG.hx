package pi_xy.imageAbstracts;
import pi_xy.Pixelimage;
import pi_xy.pixel.Pixel32;
import pi_xy.formats.Format;
#if sys
@:forward
@:transient
abstract PNG( Pixelimage ) from Pixelimage to Pixelimage {
    inline
    public function new( w: Int, h: Int ){
       this = new Pixelimage( w, h );
    }
    @:access( pi_xy.Pixelimage )
    @:access( pi_xy.ImageStruct )
    public inline
    function to( name: String ): Pixelimage {
        var here: Pixelimage = this;
        toPNG( here, name );
        return here;
    }
    @:access( pi_xy.Pixelimage )
    @:access( pi_xy.ImageStruct )
    public inline
    function from( name: String ): Pixelimage {
        var here: Pixelimage = this;
        var pixelimage = fromPNG( name );
        var resize = here.transform.scaleMatch( pixelimage );
        for( i in 0...here.image.length ) here.image[ i ] = resize.image[ i ];
        return here;
    }
}
#end