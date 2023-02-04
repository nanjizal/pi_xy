package pixelimage.algo;

import pixelimage.Pixelimage;
import pixelimage.pixel.Pixel32;
import pixelimage.algo.GeomPix;
import pixelimage.algo.TriPixel;
import pixelimage.algo.LinePixel;
import pixelimage.pixel.TwoGrad;

inline 
function fillLineArrow( pixelImage: Pixelimage
                  , px: Float, py: Float, qx: Float, qy: Float
                  , thick: Float, color: Int, flare: Bool = false, reverseFlare: Bool = false, hasHit: Bool = false ): Null<HitTriArray>{
    var goldenRatio = 1.61803398875;
    //trace( 'pixelArrow fillLineArrow');
    var o = qy-py;
    var a = qx-px;
    var h = Math.pow( o*o + a*a, 0.5 );
    var theta = Math.atan2( o, a );
    var thicker = 2*thick*goldenRatio;
    var sin = Math.sin( theta );
    var cos = Math.cos( theta );
    var radius = thick/2;
    var radius2 = thicker/2;
    var h2 = h/goldenRatio;
    var hitQuad = if( flare ){
        if( reverseFlare ){
            rotateLineFlare( pixelImage, px, py, thick, (thicker - (thicker-thick)/goldenRatio ), h2, theta, color, true );
        } else {
            rotateLineFlare( pixelImage, px, py, (thicker - (thicker-thick)/goldenRatio ), thick, h2, theta, color, true );
        }
    } else {
        rotateLine( pixelImage, px, py, thick, h2, theta, color, true );
    }
    var cx = h2;
    var cy = radius2;
    var bx = h2;
    var by = -radius2;
    var temp = 0.;
    temp = px + rotX( bx, by, sin, cos );
    by = py + rotY( bx, by, sin, cos );
    bx = temp;
    temp = px + rotX( cx, cy, sin, cos );
    cy = py + rotY( cx, cy, sin, cos );
    cx = temp;
    var hitTri = fillTriangle( pixelImage, qx, qy, bx, by, cx, cy, color, hasHit );
    return if( hasHit ){
        var hitArr: Null<HitTriArray> = new HitTriArray( [ hitTri ] );
        if( hitQuad!= null )
            hitArr.triArr.push( hitQuad.triABD );
            hitArr.triArr.push( hitQuad.triBCD );
        hitArr;
    } else {
        null;
    }
}

inline 
function fillSoftLineArrow( pixelImage: Pixelimage
                  , px: Float, py: Float, qx: Float, qy: Float
                  , thick: Float, color: Int
                  , flare: Bool = false, reverseFlare: Bool = false
                  , soft: Float = 40.
                  , hasHit: Bool = false ): Null<HitTriArray>{
    var goldenRatio = 1.61803398875;
    //trace( 'pixelArrow fillLineArrow');
    var o = qy-py;
    var a = qx-px;
    var h = Math.pow( o*o + a*a, 0.5 );
    var theta = Math.atan2( o, a );
    var thicker = 2*thick*goldenRatio;
    var sin = Math.sin( theta );
    var cos = Math.cos( theta );
    var radius = thick/2;
    var radius2 = thicker/2;
    var h2 = h/goldenRatio;
    // bc will connect to head of arrow
    var hitQuad = if( flare ){
        if( reverseFlare ){
            rotateSoftLineFlare( pixelImage, px, py, thick, (thicker - (thicker-thick)/goldenRatio ), h2, theta, color, soft, false, true, true, true, true );
        } else {
            rotateSoftLineFlare( pixelImage, px, py, (thicker - (thicker-thick)/goldenRatio ), thick, h2, theta, color, soft, false, true, true, true, true );
        }
    } else {
        rotateSoftLine( pixelImage, px, py, thick, h2, theta, color, soft, false, true, true, true, true );
    }
    var cx = h2;
    var cy = radius2;
    var bx = h2;
    var by = -radius2;
    var temp = 0.;
    temp = px + rotX( bx, by, sin, cos );
    by = py + rotY( bx, by, sin, cos );
    bx = temp;
    temp = px + rotX( cx, cy, sin, cos );
    cy = py + rotY( cx, cy, sin, cos );
    cx = temp;
    var hitTri = fillTriSoft3( pixelImage, qx, qy, bx, by, cx, cy, color, soft, true, true, true, hasHit );
    return if( hasHit ){
        var hitArr: Null<HitTriArray> = new HitTriArray( [ hitTri ] );
        if( hitQuad!= null )
            hitArr.triArr.push( hitQuad.triABD );
            hitArr.triArr.push( hitQuad.triBCD );
        hitArr;
    } else {
        null;
    }
}


// TODO: arrow for soft will need to be built of just soft outwards facing triangles.. 
// need to do the linePixel rotation in the arrow, can't use linePixel.. 
// probably best to implement soft irregular poly.


inline 
function gradThickLineArrow( pixelImage: Pixelimage
                  , px: Float, py: Float, qx: Float, qy: Float
                  , thick: Float, color1: Int, color2: Int, flare: Bool = false, reverseFlare = false, hasHit: Bool = false ): Null<HitTriArray>{
    var goldenRatio = 1.61803398875;
    //trace( 'pixelArrow fillLineArrow');
    var o = qy-py;
    var a = qx-px;
    var h = Math.pow( o*o + a*a, 0.5 );
    var theta = Math.atan2( o, a );
    var thicker = 2*thick*goldenRatio;
    var sin = Math.sin( theta );
    var cos = Math.cos( theta );
    var radius = thick/2;
    var radius2 = thicker/2;
    var h2 = h/goldenRatio;
    var hitQuad = if( flare ){
        if( reverseFlare ){
            rotateGradLineFlare( pixelImage, px, py, thick, (thicker - (thicker-thick)/goldenRatio ), h2, theta, color1, color1, color2, color2, true );
        } else {
            rotateGradLineFlare( pixelImage, px, py, (thicker - (thicker-thick)/goldenRatio ), thick, h2, theta, color1, color1, color2, color2, true );
        }
    } else {
        rotateGradLine( pixelImage, px, py, thick, h2, theta, color1, color1, color2, color2, true );
    }
    var cx = h2;
    var cy = radius2;
    var bx = h2;
    var by = -radius2;
    var temp = 0.;
    temp = px + rotX( bx, by, sin, cos );
    by = py + rotY( bx, by, sin, cos );
    bx = temp;
    temp = px + rotX( cx, cy, sin, cos );
    cy = py + rotY( cx, cy, sin, cos );
    cx = temp;
    var twoColors= new TwoGrad( color1, color2 );
    var half = twoColors.average();
    var hitTri = fillGradTriangle( pixelImage, qx, qy, half, bx, by, color1, cx, cy, color2, hasHit );
    return if( hasHit ){
        var hitArr: Null<HitTriArray> = new HitTriArray( [ hitTri ] );
        if( hitQuad!= null )
            hitArr.triArr.push( hitQuad.triABD );
            hitArr.triArr.push( hitQuad.triBCD );
        hitArr;
    } else {
        null;
    }
}

inline 
function fillLineArrowBoth( pixelImage: Pixelimage
                  , px: Float, py: Float, qx: Float, qy: Float
                  , thick: Float, color: Int, hasHit: Bool = false ): Null< HitTriArray>{
    var goldenRatio = 1.61803398875;
    //trace( 'pixelArrow fillLineArrow');
    var o = qy-py;
    var a = qx-px;
    var h = Math.pow( o*o + a*a, 0.5 );
    var theta = Math.atan2( o, a );
    var thicker = 2*thick*goldenRatio;
    var sin = Math.sin( theta );
    var cos = Math.cos( theta );
    var radius = thick/2;
    var radius2 = thicker/2;
    var h2 = h/goldenRatio;
    var hSmall = h - h2;

    var px_ = hSmall;
    var py_ = 0.;
    var temp = 0.;

    temp = px + rotX( px_, py_, sin, cos );
    py_ = py + rotY( px_, py_, sin, cos );
    px_ = temp;

    var hitQuad = rotateLine( pixelImage, px_, py_, thick, h2 - hSmall, theta, color, true );
    var cx = h2;
    var cy = radius2;
    var bx = h2;
    var by = -radius2;
    
    var dx = hSmall;
    var dy = radius2;
    var ax = hSmall;
    var ay = -radius2;
    
    temp = px + rotX( bx, by, sin, cos );
    by = py + rotY( bx, by, sin, cos );
    bx = temp;
    temp = px + rotX( cx, cy, sin, cos );
    cy = py + rotY( cx, cy, sin, cos );
    cx = temp;
    
    temp = px + rotX( ax, ay, sin, cos );
    ay = py + rotY( ax, ay, sin, cos );
    ax = temp;

    temp = px + rotX( dx, dy, sin, cos );
    dy = py + rotY( dx, dy, sin, cos ); 
    dx = temp;
    
    var hitTriTop = fillTriangle( pixelImage, qx, qy, bx, by, cx, cy, color, hasHit );
    var hitTriBottom = fillTriangle( pixelImage, px, py, ax, ay, dx, dy, color, hasHit );

    return if( hasHit ){
        var hitArr: Null<HitTriArray> = new HitTriArray( [ hitTriTop, hitTriBottom ] );
        if( hitQuad!= null )
            hitArr.triArr.push( hitQuad.triABD );
            hitArr.triArr.push( hitQuad.triBCD );
        hitArr;
    } else {
        null;
    }
}

inline 
function fillSoftLineArrowBoth( pixelImage: Pixelimage
                  , px: Float, py: Float, qx: Float, qy: Float
                  , thick: Float, color: Int, soft: Float = 40., hasHit: Bool = false ): Null< HitTriArray>{
    var goldenRatio = 1.61803398875;
    //trace( 'pixelArrow fillLineArrow');
    var o = qy-py;
    var a = qx-px;
    var h = Math.pow( o*o + a*a, 0.5 );
    var theta = Math.atan2( o, a );
    var thicker = 2*thick*goldenRatio;
    var sin = Math.sin( theta );
    var cos = Math.cos( theta );
    var radius = thick/2;
    var radius2 = thicker/2;
    var h2 = h/goldenRatio;
    var hSmall = h - h2;

    var px_ = hSmall;
    var py_ = 0.;
    var temp = 0.;

    temp = px + rotX( px_, py_, sin, cos );
    py_ = py + rotY( px_, py_, sin, cos );
    px_ = temp;

    var hitQuad = rotateSoftLine( pixelImage, px_, py_, thick, h2 - hSmall, theta, color, soft, false, true, false, true ,true );
    var cx = h2;
    var cy = radius2;
    var bx = h2;
    var by = -radius2;
    
    var dx = hSmall;
    var dy = radius2;
    var ax = hSmall;
    var ay = -radius2;
    
    temp = px + rotX( bx, by, sin, cos );
    by = py + rotY( bx, by, sin, cos );
    bx = temp;
    temp = px + rotX( cx, cy, sin, cos );
    cy = py + rotY( cx, cy, sin, cos );
    cx = temp;
    
    temp = px + rotX( ax, ay, sin, cos );
    ay = py + rotY( ax, ay, sin, cos );
    ax = temp;

    temp = px + rotX( dx, dy, sin, cos );
    dy = py + rotY( dx, dy, sin, cos ); 
    dx = temp;
    
    var hitTriTop = fillTriSoft3( pixelImage, qx, qy, bx, by, cx, cy, color, soft, true, true, true, hasHit );
    var hitTriBottom = fillTriSoft3( pixelImage, px, py, ax, ay, dx, dy, color, true, true, true, hasHit );

    return if( hasHit ){
        var hitArr: Null<HitTriArray> = new HitTriArray( [ hitTriTop, hitTriBottom ] );
        if( hitQuad!= null )
            hitArr.triArr.push( hitQuad.triABD );
            hitArr.triArr.push( hitQuad.triBCD );
        hitArr;
    } else {
        null;
    }
}

inline 
function gradThickLineArrowBoth( pixelImage: Pixelimage
                  , px: Float, py: Float, qx: Float, qy: Float
                  , thick: Float, color1: Int, color2: Int, hasHit: Bool = false ): Null< HitTriArray>{
    var goldenRatio = 1.61803398875;
    //trace( 'pixelArrow fillLineArrow');
    var o = qy-py;
    var a = qx-px;
    var h = Math.pow( o*o + a*a, 0.5 );
    var theta = Math.atan2( o, a );
    var thicker = 2*thick*goldenRatio;
    var sin = Math.sin( theta );
    var cos = Math.cos( theta );
    var radius = thick/2;
    var radius2 = thicker/2;
    var h2 = h/goldenRatio;
    var hSmall = h - h2;

    var px_ = hSmall;
    var py_ = 0.;
    var temp = 0.;

    temp = px + rotX( px_, py_, sin, cos );
    py_ = py + rotY( px_, py_, sin, cos );
    px_ = temp;

    var hitQuad = rotateGradLine( pixelImage, px_, py_, thick, h2 - hSmall, theta, color1, color1, color2, color2, true );
    var cx = h2;
    var cy = radius2;
    var bx = h2;
    var by = -radius2;
    
    var dx = hSmall;
    var dy = radius2;
    var ax = hSmall;
    var ay = -radius2;
    
    temp = px + rotX( bx, by, sin, cos );
    by = py + rotY( bx, by, sin, cos );
    bx = temp;
    temp = px + rotX( cx, cy, sin, cos );
    cy = py + rotY( cx, cy, sin, cos );
    cx = temp;
    
    temp = px + rotX( ax, ay, sin, cos );
    ay = py + rotY( ax, ay, sin, cos );
    ax = temp;

    temp = px + rotX( dx, dy, sin, cos );
    dy = py + rotY( dx, dy, sin, cos ); 
    dx = temp;

    var twoColors= new TwoGrad( color1, color2 );
    var half = twoColors.average();

    var hitTriTop = fillGradTriangle( pixelImage, qx, qy, half, bx, by, color1, cx, cy, color2, hasHit );
    var hitTriBottom = fillGradTriangle( pixelImage, px, py, half, ax, ay, color1, dx, dy, color2, hasHit );

    return if( hasHit ){
        var hitArr: Null<HitTriArray> = new HitTriArray( [ hitTriTop, hitTriBottom ] );
        if( hitQuad!= null )
            hitArr.triArr.push( hitQuad.triABD );
            hitArr.triArr.push( hitQuad.triBCD );
        hitArr;
    } else {
        null;
    }
}

inline 
function fillLineFixedArrow( pixelImage: Pixelimage
                  , px: Float, py: Float, qx: Float, qy: Float
                  , arrowWidth: Float, arrowHeight: Float
                  , thick: Float, color: Int, flare: Bool = false, reverseFlare: Bool = false, hasHit: Bool = false ): Null<HitTriArray>{
    var goldenRatio = 1.61803398875;
    trace('fillLineFixedArrow');
    //trace( 'pixelArrow fillLineArrow');
    var o = qy-py;
    var a = qx-px;
    var h = Math.pow( o*o + a*a, 0.5 );
    var theta = Math.atan2( o, a );
    var thicker = if( arrowWidth > thick*1.1 ) {
        arrowWidth;
    } else {
        // default to automated arrow thickness if width is less than thickness.
        2*thick*goldenRatio;
    }
    var sin = Math.sin( theta );
    var cos = Math.cos( theta );
    var radius = thick/2;
    var radius2 = thicker/2;
    var h2 = if( arrowHeight < h*1.1 ){
        h-arrowHeight;
    } else {
        h/goldenRatio;
    }
    var hitQuad = if( flare ){
        if( reverseFlare ){
            rotateLineFlare( pixelImage, px, py, thick, (thicker - (thicker-thick)/goldenRatio ), h2, theta, color, true );
        } else {
            rotateLineFlare( pixelImage, px, py, (thicker - (thicker-thick)/goldenRatio ), thick, h2, theta, color, true );
        }
    } else {
        rotateLine( pixelImage, px, py, thick, h2, theta, color, true );
    }
    var cx = h2;
    var cy = radius2;
    var bx = h2;
    var by = -radius2;
    var temp = 0.;
    temp = px + rotX( bx, by, sin, cos );
    by = py + rotY( bx, by, sin, cos );
    bx = temp;
    temp = px + rotX( cx, cy, sin, cos );
    cy = py + rotY( cx, cy, sin, cos );
    cx = temp;
    var hitTri = fillTriangle( pixelImage, qx, qy, bx, by, cx, cy, color, hasHit );
    return if( hasHit ){
        var hitArr: Null<HitTriArray> = new HitTriArray( [ hitTri ] );
        if( hitQuad!= null )
            hitArr.triArr.push( hitQuad.triABD );
            hitArr.triArr.push( hitQuad.triBCD );
        hitArr;
    } else {
        null;
    }
}

inline 
function fillSoftLineFixedArrow( pixelImage: Pixelimage
                  , px: Float, py: Float, qx: Float, qy: Float
                  , arrowWidth: Float, arrowHeight: Float
                  , thick: Float, color: Int
                  , flare: Bool = false, reverseFlare: Bool = false
                  , soft: Float = 40.
                  , hasHit: Bool = false ): Null<HitTriArray>{
    var goldenRatio = 1.61803398875;
    var o = qy-py;
    var a = qx-px;
    var h = Math.pow( o*o + a*a, 0.5 );
    var theta = Math.atan2( o, a );
    var thicker = if( arrowWidth > thick*1.1 ) {
        arrowWidth;
    } else {
        // default to automated arrow thickness if width is less than thickness.
        2*thick*goldenRatio;
    }
    var sin = Math.sin( theta );
    var cos = Math.cos( theta );
    var radius = thick/2;
    var radius2 = thicker/2;
    var h2 = if( arrowHeight < h*1.1 ){
        h-arrowHeight;
    } else {
        h/goldenRatio;
    }
    var hitQuad = if( flare ){
        if( reverseFlare ){
            rotateSoftLineFlare( pixelImage, px, py, thick, (thicker - (thicker-thick)/goldenRatio ), h2, theta, color, soft, true, false, true, true, true );
        } else {
            rotateSoftLineFlare( pixelImage, px, py, (thicker - (thicker-thick)/goldenRatio ), thick, h2, theta, color, soft, true, false, true, true, true );
        }
    } else {
        rotateSoftLine( pixelImage, px, py, thick, h2, theta, color, soft, true, false, true, true, true );
    }
    var cx = h2;
    var cy = radius2;
    var bx = h2;
    var by = -radius2;
    var temp = 0.;
    temp = px + rotX( bx, by, sin, cos );
    by = py + rotY( bx, by, sin, cos );
    bx = temp;
    temp = px + rotX( cx, cy, sin, cos );
    cy = py + rotY( cx, cy, sin, cos );
    cx = temp;
    var hitTri = fillTriSoft3( pixelImage, qx, qy, bx, by, cx, cy, color, soft, true, true, true, hasHit );
    return if( hasHit ){
        var hitArr: Null<HitTriArray> = new HitTriArray( [ hitTri ] );
        if( hitQuad!= null )
            hitArr.triArr.push( hitQuad.triABD );
            hitArr.triArr.push( hitQuad.triBCD );
        hitArr;
    } else {
        null;
    }
}

inline 
function gradThickLineFixedArrow( pixelImage: Pixelimage
                  , px: Float, py: Float, qx: Float, qy: Float
                  , arrowWidth: Float, arrowHeight: Float
                  , thick: Float, color1: Int, color2: Int, flare: Bool = false, reverseFlare: Bool = false, hasHit: Bool = false ): Null<HitTriArray>{
    var goldenRatio = 1.61803398875;
    var o = qy-py;
    var a = qx-px;
    var h = Math.pow( o*o + a*a, 0.5 );
    var theta = Math.atan2( o, a );
    var thicker = if( arrowWidth > thick*1.1 ) {
        arrowWidth;
    } else {
        // default to automated arrow thickness if width is less than thickness.
        2*thick*goldenRatio;
    }
    var sin = Math.sin( theta );
    var cos = Math.cos( theta );
    var radius = thick/2;
    var radius2 = thicker/2;
    var h2 = if( arrowHeight < h*1.1 ){
        h-arrowHeight;
    } else {
        h/goldenRatio;
    }
    var hitQuad = if( flare ){
        if( reverseFlare ){
            rotateGradLineFlare( pixelImage, px, py, thick, (thicker - (thicker-thick)/goldenRatio ), h2, theta, color1, color1, color2, color2, true );
        } else {
            rotateGradLineFlare( pixelImage, px, py, (thicker - (thicker-thick)/goldenRatio ), thick, h2, theta, color1, color1, color2, color2, true );
        }
        
    } else {
        rotateGradLine( pixelImage, px, py, thick, h2, theta, color1, color1, color2, color2, true );
    }
    var cx = h2;
    var cy = radius2;
    var bx = h2;
    var by = -radius2;
    var temp = 0.;
    temp = px + rotX( bx, by, sin, cos );
    by = py + rotY( bx, by, sin, cos );
    bx = temp;
    temp = px + rotX( cx, cy, sin, cos );
    cy = py + rotY( cx, cy, sin, cos );
    cx = temp;
    var twoColors= new TwoGrad( color1, color2 );
    var half = twoColors.average();
    var hitTri = fillGradTriangle( pixelImage, qx, qy, half, bx, by, color1, cx, cy, color2, hasHit );
    return if( hasHit ){
        var hitArr: Null<HitTriArray> = new HitTriArray( [ hitTri ] );
        if( hitQuad!= null )
            hitArr.triArr.push( hitQuad.triABD );
            hitArr.triArr.push( hitQuad.triBCD );
        hitArr;
    } else {
        null;
    }
}

inline 
function fillLineFixedArrowBoth( pixelImage: Pixelimage
                  , px: Float, py: Float, qx: Float, qy: Float
                  , arrowWidth: Float, arrowHeight: Float
                  , thick: Float, color: Int, hasHit: Bool = false ): Null< HitTriArray>{
    var goldenRatio = 1.61803398875;
    var o = qy-py;
    var a = qx-px;
    var h = Math.pow( o*o + a*a, 0.5 );
    var theta = Math.atan2( o, a );
    var thicker = if( arrowWidth > thick*1.1 ) {
        arrowWidth;
    } else {
        // default to automated arrow thickness if width is less than thickness.
        2*thick*goldenRatio;
    }
    var sin = Math.sin( theta );
    var cos = Math.cos( theta );
    var radius = thick/2;
    var radius2 = thicker/2;
    var h2 = if( arrowHeight < h*1.1 ){
        h-arrowHeight;
    } else {
        h/goldenRatio;
    }
    var hSmall = h - h2;

    var px_ = hSmall;
    var py_ = 0.;
    var temp = 0.;

    temp = px + rotX( px_, py_, sin, cos );
    py_ = py + rotY( px_, py_, sin, cos );
    px_ = temp;

    var hitQuad = rotateLine( pixelImage, px_, py_, thick, h2 - hSmall, theta, color, true );
    var cx = h2;
    var cy = radius2;
    var bx = h2;
    var by = -radius2;
    
    var dx = hSmall;
    var dy = radius2;
    var ax = hSmall;
    var ay = -radius2;
    
    temp = px + rotX( bx, by, sin, cos );
    by = py + rotY( bx, by, sin, cos );
    bx = temp;
    temp = px + rotX( cx, cy, sin, cos );
    cy = py + rotY( cx, cy, sin, cos );
    cx = temp;
    
    temp = px + rotX( ax, ay, sin, cos );
    ay = py + rotY( ax, ay, sin, cos );
    ax = temp;

    temp = px + rotX( dx, dy, sin, cos );
    dy = py + rotY( dx, dy, sin, cos ); 
    dx = temp;
    
    var hitTriTop = fillTriangle( pixelImage, qx, qy, bx, by, cx, cy, color, hasHit );
    var hitTriBottom = fillTriangle( pixelImage, px, py, ax, ay, dx, dy, color, hasHit );

    return if( hasHit ){
        var hitArr: Null<HitTriArray> = new HitTriArray( [ hitTriTop, hitTriBottom ] );
        if( hitQuad!= null )
            hitArr.triArr.push( hitQuad.triABD );
            hitArr.triArr.push( hitQuad.triBCD );
        hitArr;
    } else {
        null;
    }
}

inline 
function fillSoftLineFixedArrowBoth( pixelImage: Pixelimage
                  , px: Float, py: Float, qx: Float, qy: Float
                  , arrowWidth: Float, arrowHeight: Float
                  , thick: Float, color: Int
                  , soft: Float = 40.
                  , hasHit: Bool = false ): Null< HitTriArray>{
    var goldenRatio = 1.61803398875;
    var o = qy-py;
    var a = qx-px;
    var h = Math.pow( o*o + a*a, 0.5 );
    var theta = Math.atan2( o, a );
    var thicker = if( arrowWidth > thick*1.1 ) {
        arrowWidth;
    } else {
        // default to automated arrow thickness if width is less than thickness.
        2*thick*goldenRatio;
    }
    var sin = Math.sin( theta );
    var cos = Math.cos( theta );
    var radius = thick/2;
    var radius2 = thicker/2;
    var h2 = if( arrowHeight < h*1.1 ){
        h-arrowHeight;
    } else {
        h/goldenRatio;
    }
    var hSmall = h - h2;

    var px_ = hSmall;
    var py_ = 0.;
    var temp = 0.;

    temp = px + rotX( px_, py_, sin, cos );
    py_ = py + rotY( px_, py_, sin, cos );
    px_ = temp;

    var hitQuad = rotateSoftLine( pixelImage, px_, py_, thick, h2 - hSmall, theta, color, soft, true, false, true, false, true );
    var cx = h2;
    var cy = radius2;
    var bx = h2;
    var by = -radius2;
    
    var dx = hSmall;
    var dy = radius2;
    var ax = hSmall;
    var ay = -radius2;
    
    temp = px + rotX( bx, by, sin, cos );
    by = py + rotY( bx, by, sin, cos );
    bx = temp;
    temp = px + rotX( cx, cy, sin, cos );
    cy = py + rotY( cx, cy, sin, cos );
    cx = temp;
    
    temp = px + rotX( ax, ay, sin, cos );
    ay = py + rotY( ax, ay, sin, cos );
    ax = temp;

    temp = px + rotX( dx, dy, sin, cos );
    dy = py + rotY( dx, dy, sin, cos ); 
    dx = temp;
    
    var hitTriTop = fillTriSoft3(  pixelImage, qx, qy, bx, by, cx, cy, color, true, true, true, hasHit );
    var hitTriBottom = fillTriSoft3(  pixelImage, px, py, ax, ay, dx, dy, color, true, true, true, hasHit );

    return if( hasHit ){
        var hitArr: Null<HitTriArray> = new HitTriArray( [ hitTriTop, hitTriBottom ] );
        if( hitQuad!= null )
            hitArr.triArr.push( hitQuad.triABD );
            hitArr.triArr.push( hitQuad.triBCD );
        hitArr;
    } else {
        null;
    }
}

inline 
function gradThickLineFixedArrowBoth( pixelImage: Pixelimage
                  , px: Float, py: Float, qx: Float, qy: Float
                  , arrowWidth: Float, arrowHeight: Float
                  , thick: Float, color1: Int, color2: Int, hasHit: Bool = false ): Null< HitTriArray>{
    var goldenRatio = 1.61803398875;
    var o = qy-py;
    var a = qx-px;
    var h = Math.pow( o*o + a*a, 0.5 );
    var theta = Math.atan2( o, a );
    var thicker = if( arrowWidth > thick*1.1 ) {
        arrowWidth;
    } else {
        // default to automated arrow thickness if width is less than thickness.
        2*thick*goldenRatio;
    }
    var sin = Math.sin( theta );
    var cos = Math.cos( theta );
    var radius = thick/2;
    var radius2 = thicker/2;
    var h2 = if( arrowHeight < h*1.1 ){
        h-arrowHeight;
    } else {
        h/goldenRatio;
    }
    var hSmall = h - h2;

    var px_ = hSmall;
    var py_ = 0.;
    var temp = 0.;

    temp = px + rotX( px_, py_, sin, cos );
    py_ = py + rotY( px_, py_, sin, cos );
    px_ = temp;

    var hitQuad = rotateGradLine( pixelImage, px_, py_, thick, h2 - hSmall, theta, color1, color1, color2, color2, true );
    var cx = h2;
    var cy = radius2;
    var bx = h2;
    var by = -radius2;
    
    var dx = hSmall;
    var dy = radius2;
    var ax = hSmall;
    var ay = -radius2;
    
    temp = px + rotX( bx, by, sin, cos );
    by = py + rotY( bx, by, sin, cos );
    bx = temp;
    temp = px + rotX( cx, cy, sin, cos );
    cy = py + rotY( cx, cy, sin, cos );
    cx = temp;
    
    temp = px + rotX( ax, ay, sin, cos );
    ay = py + rotY( ax, ay, sin, cos );
    ax = temp;

    temp = px + rotX( dx, dy, sin, cos );
    dy = py + rotY( dx, dy, sin, cos ); 
    dx = temp;
    var twoColors= new TwoGrad( color1, color2 );
    var half = twoColors.average();
    var hitTriTop = fillGradTriangle( pixelImage, qx, qy, half, bx, by, color1, cx, cy, color2, hasHit );
    var hitTriBottom = fillGradTriangle( pixelImage, px, py, half, ax, ay, color1, dx, dy, color2, hasHit );

    return if( hasHit ){
        var hitArr: Null<HitTriArray> = new HitTriArray( [ hitTriTop, hitTriBottom ] );
        if( hitQuad!= null )
            hitArr.triArr.push( hitQuad.triABD );
            hitArr.triArr.push( hitQuad.triBCD );
        hitArr;
    } else {
        null;
    }
}
                