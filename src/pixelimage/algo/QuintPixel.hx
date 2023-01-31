package pixelimage.algo;

// QuintPixel
// quint is 5, this is used for quad made of 4 triangles
// the fifth side is the centre E.
// concept is to allow soft edges.
import pixelimage.pixel.Pixel32;
import pixelimage.algo.TriPixel;
import pixelimage.algo.HitTri;
import pixelimage.algo.GeomPix;

inline
function softFillQuintilateral( pixelImage: Pixelimage
                 , ax: Float, ay: Float
                 , bx: Float, by: Float
                 , cx: Float, cy: Float
                 , dx: Float, dy: Float 
                 , color: Int
                 , softC: Float = 10
                 , hasHit: Bool = false ): Null<HitQuad>{

    // calculate centre as average
    var ex: Float = ( ax + bx + cx + dx )/4;
    var ey: Float = ( ay + by + cy + dy )/4;
    
    // tri top e a b
    // centre, last, next
    fillTriSoftC( pixelImage, ex, ey, ax, ay, bx, by, color, softC, hasHit );
    // tri right e b c
    fillTriSoftC( pixelImage, ex, ey, bx, by, cx, cy, color, softC, hasHit );
    // tri bottom e c d
    fillTriSoftC( pixelImage, ex, ey, cx, cy, dx, dy, color, softC, hasHit );
    // tri left e d a
    fillTriSoftC( pixelImage, ex, ey, dx, dy, ax, ay, color, softC, hasHit );
    // Debug
    /*
    pixelImage.fillSquare( ax, ay, 12, 0xFFFF0000 );
    pixelImage.fillSquare( bx, by, 12, 0xFF00FF00 );
    pixelImage.fillSquare( cx, cy, 12, 0xFF0000ff );
    pixelImage.fillSquare( dx, dy, 12, 0xFFF000F0 );
    pixelImage.fillSquare( ex, ey, 12, 0xFFF0F000 );
    */
    return if( hasHit == true ){
        var v: HitQuad = { ax: ax, ay: ay, bx: bx, by: by, cx: cx, cy: cy, dx: dx, dy: dy };
        v;
    } else {
        null;
    }
}