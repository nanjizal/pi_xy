package pixelimageXY.imageAbstracts;
import pixelimageXY.Pixelimage;
import pixelimageXY.algo.HitTri;
import pixelimageXY.algo.HitQuad;
import pixelimageXY.algo.HitTriArray;
import pixelimageXY.algo.GeomPix;
import pixelimageXY.pixel.Pixel32;
import pixelimageXY.algo.QuadPixel;

@:transient
abstract ImageShape( Pixelimage ) from Pixelimage to Pixelimage {

    inline
    public function new( w: Int, h: Int ){
       this = new Pixelimage( w, h );
    }
    // Not so useful on own as uv are weird.
    public inline
    function triangle( texture: Pixelimage, win: RectangleWindow, ax: Float, ay: Float, au: Float, av: Float
                      , bx: Float, by: Float, bu: Float, bv: Float
                      , cx: Float, cy: Float, cu: Float, cv: Float
                     , hasHit: Bool = true ): Null<HitTri> {
        return pixelimageXY.algo.TriPixel
            .uvTriangle( this, texture, win, ax, ay, au, av, bx, by, bu, bv, cx, cy, cu, cv );
    }
    public inline
    function quad( texture: Pixelimage, win: RectangleWindow
                    , ax: Float, ay: Float
                    , bx: Float, by: Float
                    , cx: Float, cy: Float
                    , dx: Float, dy: Float
                    , hasHit: Bool = true ): Null<HitQuad> {
        return pixelimageXY.algo.QuadPixel
            .imgQuadrilateral( this, texture, win, ax, ay, bx, by, cx, cy, dx, dy, hasHit );
    }
    /** 
        just a simple image ( automatically scaled )
    **/
    public inline
    function image( texture: Pixelimage
                  , x: Float = 0., y: Float = 0.
                  , wid: Float = 0., hi: Float = 0.
                  , hasHit: Bool = true ): Null<HitQuad> {
        var win = new RectangleWindow( 0, 0, texture.width, texture.height );
        if( wid == 0. ) wid = texture.width;
        if( hi == 0. ) hi = texture.height;
        return pixelimageXY.algo.QuadPixel
            .imgQuadrilateral( this, texture, win
                             , x, y
                             , x+wid, y
                             , x+wid, y+hi
                             , x, y+hi );
    }
    public inline
    function rectangle( texture: Pixelimage, win: RectangleWindow
                      , x: Float, y: Float, wid: Float, hi: Float
                      , theta: Float = 0., centreX: Float = 0., centreY: Float = 0.
                      , skewX: Float = 0., skewY: Float = 0.
                      , scaleX: Float = 1., scaleY: Float = 1.
                      , hasHit: Bool = true ): Null<HitQuad> {
        var ax = x;
        var ay = y;
        if( theta != 0. ){
            centreX = x + wid/2 + centreX;
            centreY = y + hi/2  + centreY;
            ax -= centreX;
            ay -= centreY;
        }
        var bx = ax + wid;
        var by = ay;
        var cx = bx;
        var cy = ay + hi;
        var dx = ax;
        var dy = cy;
        // skew does not really cope well with offx and offy changes?
        if( skewX != 0. ){
            ax += skewX;
            bx += skewX;
            cx -= skewX;
            dx -= skewX;
        }
        if( skewY != 0. ){
            ay -= skewY;
            dy -= skewY;
            by += skewY;
            cy += skewY;
        }
        if( scaleX != 1 ){
            ax *= scaleX;
            bx *= scaleX;
            cx *= scaleX;
            dx *= scaleX;
        }
        if( scaleY != 1. ){
            ay *= scaleY;
            bx *= scaleY;
            cx *= scaleY;
            dx *= scaleY;
        }
        if( theta != 0 ){
            var sin = Math.sin( theta );
            var cos = Math.cos( theta );
            var temp = ax;
            ax = rotX( temp, ay, sin, cos );
            ay = rotY( temp, ay, sin, cos );
            var temp = bx;
            bx = rotX( temp, by, sin, cos );
            by = rotY( temp, by, sin, cos );
            var temp = cx;
            cx = rotX( temp, cy, sin, cos );
            cy = rotY( temp, cy, sin, cos );
            var temp = dx;
            dx = rotX( temp, dy, sin, cos );
            dy = rotY( temp, dy, sin, cos );
            ax += centreX;
            ay += centreY;
            bx += centreX;
            by += centreY;
            cx += centreX;
            cy += centreY;
            dx += centreX;
            dy += centreY;
        }
        return quad( texture, win, ax, ay, bx, by, cx, cy, dx, dy, hasHit );
    }

    public inline
    function nineSlice( texture:  Pixelimage, win:   RectangleWindow
                         , x:        Float,      y:     Float
                         , wid:      Float,      hi:    Float
                         , left:     Float,      top:   Float
                         , fat:      Float,      tall:  Float
                         , widNew:    Float,      hiNew:    Float
                         , leftNew:     Float,      topNew:   Float
                         , fatNew:      Float,      tallNew:  Float
                         , hasHit:   Bool = false ): Null<HitQuad>{
        var temp = new Pixelimage( Std.int( wid ), Std.int( hi ) );
        temp.transparent = false;
        var hit: Null<HitQuad> = pixelimageXY.algo.QuadPixel
            .imageNineSlice( temp, texture, win, 0, 0, wid, hi, left, top, fat, tall, widNew, hiNew, leftNew, topNew, fatNew, tallNew,  hasHit );
        this.putPixelImage( temp, Std.int( x ), Std.int( y ) );
        temp = null;
        if( hit != null ){
            hit.ax += x;
            hit.ay += y;
            hit.bx += x;
            hit.by += y;
            hit.cx += x;
            hit.cy += y;
            hit.dx += x;
            hit.dy += y;
        }
        return hit;
    }

    /**
		works with image Fudge of UV values, deprediated unless turns out useful in edge cases.
	**/
	public inline
	function quadFudge( texture: Pixelimage
						 , win: RectangleWindow
						 , ax: Float, ay: Float
						 , bx: Float, by: Float
						 , cx: Float, cy: Float
						 , dx: Float, dy: Float
						 , hasHit: Bool = true ): Null<HitQuad> {
		return imgQuadrilateralFudge( this
									, texture
									, win
									, ax, ay
									, bx, by
									, cx, cy
									, dx, dy
									, hasHit );
	}

	public inline
	function rectFudge( texture: Pixelimage
						 , win: RectangleWindow
						 , x: Float, y: Float
						 , wid: Float, hi: Float
						 , theta: Float = 0.
						 , centreX: Float = 0., centreY:Float = 0.
						 , skewX: Float = 0., skewY:Float = 0.
						 , hasHit: Bool = true ): Null<HitQuad> {
		var ax = x;
		var ay = y;
		if( theta != 0. ){
			centreX = x + wid / 2 + centreX;
			centreY = y + hi / 2 + centreY;
			ax -= centreX;
			ay -= centreY;
		}
		var bx = ax + wid;
		var by = ay;
		var cx = bx;
		var cy = ay + hi;
		var dx = ax;
		var dy = cy;
		// skew does not really cope well with offx and offy changes?
		if( skewX != 0. ){
			ax += skewX;
			bx += skewX;
			cx -= skewX;
			dx -= skewX;
		}
		if( skewY != 0. ){
			ay -= skewY;
			dy -= skewY;
			by += skewY;
			cy += skewY;
		}
		if(theta != 0){
			var sin = Math.sin( theta );
			var cos = Math.cos( theta );
			var temp = ax;
			ax = rotX( temp, ay, sin, cos );
			ay = rotY( temp, ay, sin, cos );
			var temp = bx;
			bx = rotX( temp, by, sin, cos );
			by = rotY( temp, by, sin, cos );
			var temp = cx;
			cx = rotX( temp, cy, sin, cos );
			cy = rotY( temp, cy, sin, cos );
			var temp = dx;
			dx = rotX( temp, dy, sin, cos );
			dy = rotY( temp, dy, sin, cos );
			ax += centreX;
			ay += centreY;
			bx += centreX;
			by += centreY;
			cx += centreX;
			cy += centreY;
			dx += centreX;
			dy += centreY;
		}
		return quadFudge( texture
						   , win
						   , ax, ay
						   , bx, by
						   , cx, cy
						   , dx, dy
						   , hasHit );
	}
}