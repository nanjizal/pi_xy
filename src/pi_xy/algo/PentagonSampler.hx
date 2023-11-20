package pi_xy.algo;
class PentagonSampler{

    public static var x0( get, null ): Float;
    inline public static function get_x0(): Float {
        return getXs( 1 );
    }
    public static var x1( get, null ): Float;
    inline public static function get_x1(): Float {
        return getXs( 2 );
    }
    public static var x2( get, null ): Float;
    inline public static function get_x2(): Float {
        return getXs( 3 );
    }
    public static var x3( get, null ): Float;
    inline public static function get_x3(): Float {
        return getXs( 4 );
    }
    public static var x4( get, null ): Float;
    inline public static function get_x4(): Float {
        return getXs( 5 );
    }
    public static var y0( get, null ): Float;
    inline public static function get_y0(): Float {
        return getYs( 1 );
    }
    public static var y1( get, null ):Float;
    inline public static function get_y1(): Float {
        return getYs( 2 );
    }
    public static var y2( get, null ):Float;
    inline public static function get_y2(): Float {
        return getYs( 3 );
    }
    public static var y3( get, null ):Float;
    inline public static function get_y3(): Float {
        return getYs( 4 );
    }
    public static var y4( get, null ):Float;
    inline public static function get_y4(): Float {
        return getYs( 5 );
    }
    public static macro function getXs( times: Float ): haxe.macro.Expr.ExprOf<Float> { 
        // pentagon angle
        var theta = 2 * Math.PI / 5; 
        // offset so the pentagon sampling is off centre
        var omega = theta / 3; 
        // arbitary seems reasonable
        var delta = 1 / Math.pow( 2, 0.5 );
        return macro $v{ delta * Math.cos( theta + times * omega ) };
    }
    public static macro function getYs( times: Float ): haxe.macro.Expr.ExprOf<Float> { 
        // pentagon angle
        var theta = 2 * Math.PI / 5; 
        // offset so the pentagon sampling is off centre
        var omega = theta / 3; 
        // arbitary seems reasonable
        var delta = 1 / Math.pow( 2, 0.5 );    
        return macro $v{ delta * Math.sin( theta + times * omega ) };
    }

}