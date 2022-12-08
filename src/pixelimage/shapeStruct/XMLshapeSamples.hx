package pixelimage.shapeStruct;

function shapeTestArr():Array<String>{
    return [    chordArcTest
            ,   circleTest
            ,   cubicCurveTest
            ,   ellipseArcTest
            ,   ellipseTest
            ,   lineGradientTest
            ,   lineShapeTest
            ,   polyLineGradientTest
            ,   polyLineShapeTest 
            ,   quadCurveTest 
            ,   quadShape
            ,   rectangleShape
            ,   squareShape
            ,   triangleGradientTest
            ,   triangleShape ];
}


var triangleGradientTest: String = '<TriangleGradient aX="100" aY="100" bX="200" bY="150" cX="130" cY="220" colorA="0xffFF0000" colorB="0xff0f00ff" colorC="0xffcc00cc"></TriangleGradient>';
// strokeColor='0xFF0000' strokeWidth='1' fill='0xFF00FF00'
// left='100' top='100' width='200' height='50'

var chordArcTest = "<ChordArcShape left='100' top='100' width='200' height='50' strokeColor='0xFF0000' strokeWidth='1' fill='0xFF00FF00' startAngle='10' sweepAngle='90'></chordArcShape>";

var circleTest: String = '<CircleShape left="200" top="200" diameter="300" strokeColor="0xFFFF0000" strokeWidth="10" fill="0xFF00FF00"></CircleShape>';

// thru allows drawing thru control point
var cubicCurveTest = "<CubicCurveShape thru='true' x1='100' y1='100' x2='200' y2='150' x3='130' y3='220' strokeColor='0xFF0000' strokeWidth='1' fill='0xFF00FF00'></CubicCurveShape>";

var ellipseArcTest = "<EllipseArcTest top='100' width='200' height='50' strokeColor='0xFF0000' strokeWidth='1' fill='0xFF00FF00' startAngle='10' sweepAngle='90'></EllipseArcTest>";

var ellipseTest =  "<EllipseShape top='100' width='200' height='50' strokeColor='0xFF0000' strokeWidth='1' fill='0xFF00FF00'></EllipseShape>";

// var imageElement = <ImageElement  left='100' top='100' width='200' height='50' contents='image'></ImageElement>";

var lineGradientTest= "<LineGradient x1='100' y1='300' x2='300' y2='120' strokewidth='1' colorA='0xFF0000' colorB='0xa00cc0' colorC='0x0fa00f' colorD='0x000fff'></LineGradient>";

var lineShapeTest: String = '<LineShape x1="100" y1="300" x2="360" y2="120" strokeWidth="30" strokeColor="0xffFF0000"></LineShape>';

// needs justPath to implement..?
//var pathElementTest = "<PathElementShape path='svg path here' strokewidth='1' strokeColor='0xFF0000' fill='0x0000ff'></PathElementShape>";

var polyLineGradientTest = "<PolyLineGradient points= '[ 100,100, 50,50, 30,30, 70,200 ]' colorDirection='longways' cornerColors='[0xFF0000,0x0f00ff,0xaaaa00,0xcc00cc]'></PolyLineGradient>";

var polyLineShapeTest = "<PolyLineShape points= '[ 100,100, 50,50, 30,30, 70,200 ]' strokeColor='0xFF0000' strokeWidth='1' fill='0xFF00FF00'></PolyLineShape>"; // no fill yet!

var quadCurveTest = "<QuadCurveShape x1='100' y1='300' x2='300' y2='120' x3='130' y3='220' x4='500' y4='500' strokeColor='0xFF0000' strokeWidth='1'></QuadCurveShape>";

// rethink coordinates for tests!
var quadShape = "<QuadShape x1='100' y1='300' x2='300' y2='120' x3='130' y3='220' x4='500' y4='500' strokeColor='0xFF0000' strokeWidth='1' fill='0xFF00FF00'></QuadShape>";

var rectangleShape = "<RectangleShape left='100' top='100' width='200' height='50' rounded='true' strokeColor='0xFF0000' strokeWidth='1' fill='0xFF00FF00'></RectangleShape>";

// should I add rounded possibility?
var squareShape = "<SquareShape left='100' top='100' diameter='90' strokeColor='0xFF0000' strokeWidth='1' fill='0xFF00FF00'></SquareShape>";



var triangleShape = "<TriangleShape x1='100' y1='100' x2='200' y2='150' x3='130' y3='220' strokeColor='0xFF0000' strokeWidth='1' fill='0xFF00FF00'></TriangleShape>";