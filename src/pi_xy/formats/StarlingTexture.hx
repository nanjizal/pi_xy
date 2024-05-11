package pi_xy.formats;
#if starling
import pi_xy.Pixelimage;
import lime.graphics.ImageBuffer;
import lime.graphics.Image;
import starling.textures.Texture;
import starling.display.Image;
import openfl.display.BitmapData;
import starling.display.Quad;
import pi_xy.formats.LimeImage.toLimeImage;

inline
function toStarlingTexture( pixelImage: pi_xy.Pixelimage ): starling.textures.Texture {
    return starling.textures.Texture.fromBitmapData( BitmapData.fromImage( toLimeImage( pixelImage ) ));
}
inline
function toStarlingQuad( pixelImage: pi_xy.Pixelimage, width: Float = 0, height: Float = 0 ): starling.display.Quad {
    var texture = starling.textures.Texture.fromBitmapData( BitmapData.fromImage( toLimeImage( pixelImage ) ));
    if( width == 0 ) width = texture.width;
    if( height == 0 ) height = texture.height;
    var quad: Quad = new Quad( width, height ); 
    quad.texture = texture;
    return quad;
}
inline
function toStarlingImage( pixelImage: pi_xy.Pixelimage ){
    return new starling.display.Image( toStarlingTexture( pixelImage ) );
}
#end