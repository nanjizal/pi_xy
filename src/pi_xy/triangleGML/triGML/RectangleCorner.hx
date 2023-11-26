package pi_xy.triangleGML,triGML;

// TODO: for rectangles/squares intend to implement some alternatives
//  https://dev.to/ndesmic/how-to-draw-squircles-and-superellipses-3d14
enum abstract RectangleCorner( String ) {
    var ROUNDED  = 'Rounded';
    var SQUARE   = 'Square'; // RIGHT ANGLE
    var CLIPPED  = 'Clipped';
    var SQUIRCLE = 'Squircle';
    var INVERTROUND = 'InvertRound'; // like rounded but inverted
}