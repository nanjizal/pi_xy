package pixelimageXY.triangleGML;

import pixelimageXY.Pixelshape;
import triangleGML.shape.picture.NineSlicePicture_;
import pixelimageXY.algo.GeomPix;
#if target.sys
import pixelimageXY.formats.Format;
#end
class NineSlicePicture extends NineSlicePicture_<Pixelshape,Pixelshape>{
    #if target.sys
    public var srcPicture: Bool;

    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'srcPicture':
                var img: Pixelshape = ( cast fromPNG( value, true ): Pixelshape );
                imageTexture = img;
            case _:
                super.setParameter( name, value );
        }
    }
    #end
    // for js would need to add in async code...

    public function render( pixelShape: Pixelshape ): Pixelshape {
// 'rounded' mask not implemented yet.
// pictureX, pictureY, pictureWidth, pictureHeight  relates to win not implemented yet.
        if( imageTexture != null ){
            var win = new RectangleWindow( 0, 0, imageTexture.width, imageTexture.height );
            win.x = pictureX;
            win.y = pictureY;
            if( pictureWidth != 0. ) win.width = pictureWidth;
            if( pictureHeight != 0. )win.height = pictureHeight;
            if( rounded != true ){
                pixelShape.imgNineSlice( imageTexture, win, left, top, initWid, initHi, initLeft, initTop, initFat, initTall,  newWid, newHi, newLeft, newTop, newFat, newTall );
            } else {
                throw( 'not yet implemented' );
                // create rounded mask.
                // if stoke need to draw first and put on top..
            }
        }
        return pixelShape;
    }
    public override function setImage( name: String, value: Pixelshape ){
        if( name.toLowerCase() == 'imagetexture' ){
            if( value == null ) throw( 'failed to find image resource' + name );
            imageTexture = value;
        }
        return value;
    }
}