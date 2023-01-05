package pixelimage.algo;
// untested..
@:structInit
class HitEllipse implements IhitObj {
    public var cx: Float;
    public var cy: Float;
    public var rx: Float;
    public var ry: Float;
    public var phi: Float = 0;
    var x_phi_rx: Float;
    var x_phi_ry: Float;
    var y_phi_rx: Float;
    var y_phi_ry: Float;
    inline
    function new( cx: Float,  cy: Float
                , rx: Float,  ry: Float
                , ?phi: Float = 0. ){
        this.cx = cx;
        this.cy = cy;
        this.rx = rx;
        this.ry = ry;
        this.phi = phi;
        if( phi != 0 ){
            var cphi = Math.cos( phi );
            var sphi = Math.sin( phi );
            x_phi_rx = rx*cphi;
            x_phi_ry = ry*sphi;
            y_phi_rx = rx*sphi;
            y_phi_ry = ry*cphi;
        }
    }
    inline
    public function hit( x: Float, y: Float ){
        var dx = x - cx;
        var dy = y - cy;
        var theta = Math.atan2( dy, dx );
        var stheta = Math.sin( theta );
        var ctheta = Math.cos( theta );
        var totX = ( phi == 0 )? rx*Math.cos( theta ): x_phi_rx * ctheta - x_phi_ry * stheta;
        var totY = ( phi == 0 )? ry*Math.sin( theta ): y_phi_rx * ctheta + y_phi_ry * stheta;
        var xOk = Math.abs( totX ) >= Math.abs( dx );
        var yOk = Math.abs( totY ) >= Math.abs( dy );
        return xOk && yOk;
    }
}