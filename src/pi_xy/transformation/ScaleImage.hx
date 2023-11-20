package pi_xy.transformation;
import pi_xy.Pixelimage;

@:access( pi_xy.Pixelimage.width )
@:access( pi_xy.Pixelimage.height )
inline
function scaleUpInteger( thisImage: Pixelimage
                       , scaleW: Int = 2, scaleH: Int = 2
                       , transparent: Bool = false, includeMask: Bool = false ): Pixelimage {
    var p = 0;
    var xx = p;
    var q = 0;
    var wNew = Std.int( thisImage.width*scaleW );
    var hNew = Std.int( thisImage.height*scaleH );
    var nextImage = new Pixelimage( wNew, hNew );
    var maxX = wNew;
    var maxY = hNew;
    while( true ){
        var color = thisImage.getARGB( Std.int( p/scaleW ), Std.int( q/scaleH ) );
        nextImage.setARGB( p++, q, color );
        if( p > maxX ){
            p = xx;
            q++;
        } 
        if( q > maxY ) break;
    }
    if( thisImage.mask != null && includeMask ) {
        nextImage.mask = thisImage.mask.transform.scaleUpInt( scaleW, scaleH, thisImage.mask.transparent, includeMask );
    }
    return nextImage;
}
@:access( pi_xy.Pixelimage.rectWindow )
@:access( pi_xy.Pixelimage.width )
@:access( pi_xy.Pixelimage.height )
inline
function scalingXY( thisImage: Pixelimage
                  , sx: Float, sy: Float
                  , transparent = false, includeMask: Bool = false ): Pixelimage {
    var scaleW = Std.int( sx );
    var scaleH = Std.int( sy );
    var ifScaleUpInt = ( scaleW == sx && sx > 0. && scaleH == sy && sy > 0. );
    return if( ifScaleUpInt ){
        thisImage.transform.scaleUpInt( scaleW, scaleH, transparent );
    } else {
        var w = thisImage.width*sx;
        var h = thisImage.height*sy;
        var wid = Math.ceil( w );
        var hi  = Math.ceil( h );
        var nextImage = new Pixelimage( wid, hi );
        nextImage.transparent = thisImage.transparent;
        nextImage.imageShape.quad( thisImage, thisImage.rectWindow, 0, 0, w, 0, w, h, 0, h, false );
        if( thisImage.mask != null && includeMask ){
            nextImage.mask = thisImage.mask.transform.scaleXY( sx, sy, thisImage.mask.transparent, includeMask );
        }
        nextImage;
    }
}