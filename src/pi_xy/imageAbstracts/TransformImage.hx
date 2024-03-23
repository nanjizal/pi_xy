package pi_xy.imageAbstracts;
import pi_xy.Pixelimage;
import pi_xy.transformation.FlipImage;
import pi_xy.transformation.SpinImage;
import pi_xy.transformation.ScaleImage;

@:transient
abstract TransformImage( Pixelimage ) from Pixelimage to Pixelimage {

    inline
    public function new( w: Int, h: Int ){
       this = new Pixelimage( w, h );
    }
    inline public
    function flipX( inPlace: Bool = true, includeMask: Bool = false ): Pixelimage {
        return abstract.flippedX( 0, 0, this.width, this.height, this.transparent, inPlace, includeMask );
    }
    inline public
    function flipY( inPlace: Bool = true, includeMask: Bool = false ): Pixelimage {
        return abstract.flippedY( 0, 0, this.width, this.height, this.transparent, inPlace, includeMask );
    }
    /**
        creates a new Pixelimage that is flipped horizonally.
        inPlace overwrites current.
    **/
    inline public
    function flippedX( x: Float, y: Float
                     , w: Float, h: Float
                     , transparent: Bool = false
                     , inPlace: Bool = false, includeMask: Bool = false ): Pixelimage {
        return imageflipX( this
                       , x, y, w, h, transparent, inPlace, includeMask );
    }
    /**
        creates a new Pixelimage that is flipped vertically.
        inPlace overwrites current.
    **/
    inline public
    function flippedY( x: Float, y: Float, w: Float, h: Float
                     , transparent: Bool = false
                     , inPlace: Bool = false, includeMask: Bool = false ): Pixelimage {
        return imageflipY( this
                       , x, y, w, h, transparent, inPlace, includeMask );
    }
        /**
        creates a new Pixelimage base on current image, rotated 90° clockwise
    **/
    inline public
    function spunClock90( x: Float, y: Float, w: Float, h: Float
                         , transparent: Bool = false, includeMask: Bool = false ): Pixelimage {
        return spinClock90( this
                        , x, y, w, h, transparent, includeMask );
    }
    inline public
    function spunAntiClock90( x: Float, y: Float, w: Float, h: Float
                  , transparent: Bool = false, includeMask: Bool = false ): Pixelimage {
        return spinAntiClock90( this
                            , x, y, w, h, transparent, includeMask );
    }
    inline public
    function spun180( x: Float, y: Float, w: Float, h: Float
                  , transparent: Bool = false, includeMask: Bool = false ): Pixelimage {
        return spin180( this
                    , x, y, w, h, transparent, includeMask );
    }
    inline public
    function scaleMatch( img: Pixelimage
                       , transparent = false, includeMask = false ): Pixelimage {
        var here: Pixelimage = this;
        return if( img.width != here.width || img.height != here.height ) {
                            img.transform.scaleXY( here.width/img.width, here.height/img.height );
                        } else {
                            img;
                        }
    }
    inline public
    function scaleXY( sx: Float, sy: Float
                    , transparent = false, includeMask: Bool = false ): Pixelimage {
        return scalingXY( this
                      , sx, sy, transparent, includeMask );
    }
    inline public
    function rotateClockwiseDegrees( angle: Float, centreX = 0., centreY = 0.
                                   , transparent: Bool = false, includeMask: Bool = false ){

        return rotatingClockwiseDegrees( this
                                     , angle, centreX, centreY
                                     , transparent, includeMask );
    }
    inline public
    function rotateClockwiseRadians( theta: Float, centreX = 0., centreY = 0.
                                   , transparent: Bool = false, includeMask: Bool = false ){
        return rotatingClockwiseRadians( this
                                    , theta, centreX, centreY
                                    , transparent, includeMask );
    }

    public inline
    function rotate( theta: Float, centreX = 0., centreY = 0.
                   , transparent: Bool = false, includeMask: Bool = false ){       
        return rotating( this
                     , theta, centreX, centreY
                     , transparent, includeMask );   
    }
    inline public
    function scaleUpInt( scaleW: Int = 2, scaleH: Int = 2
                       , transparent: Bool = false, includeMask: Bool = false ): Pixelimage {
        return scaleUpInteger( this
                           , scaleW, scaleH
                           , transparent, includeMask );
    }
    // probably needs testing and tweaking.
    inline public
    function skew( skewX: Float, skewY: Float, inPlace: Bool = false ){
        return if( inPlace ){
            this.imageShape.rectangle( this, this.rectWindow, 0, 0, this.width, this.height, skewX, skewY, 1., 1., false );
            this;
        } else {
            var p: Pixelimage = this.raw.clone();
            p.imageShape.rectangle( this, this.rectWindow, 0, 0, this.width, this.height, skewX, skewY, 1., 1., false );
            p;
        }
    }
}