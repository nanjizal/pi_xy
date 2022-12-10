package pixelimage.shapeStruct;

function shapeTestArr():Array<String>{
    return [    arcTest
            ,   circleTest
            ,   cubicCurveTest
            ,   ellipseTest
            ,   lineGradientTest
            ,   lineShapeTest
            ,   pathElementQuadTest
            ,   pathElementCubicTest
            ,   polyLineGradientTest
            ,   polyLineShapeTest 
            ,   quadCurveTest 
            ,   quadShape
            ,   rectangleShape
            ,   squareShape
            ,   triangleGradientTest
            ,   triangleShape ];
    }

// strokeColor='0xFF0000' strokeWidth='1' fill='0xFF00FF00'
// left='100' top='100' width='200' height='50'

var arcTest = 
                    '<ArcShape 
                        left="100"  top="100" 
                        width="500" height="480" 
                        strokeColor="0xFFFF0000" strokeWidth="5" 
                        fill="0xFF00FF00" 
                        startAngle="0" sweepAngle="240"
                        arcType="pie"></ArcShape>';

var circleTest: String = 
                    '<CircleShape 
                        left="200" top="200" 
                        diameter="300" 
                        strokeColor="0xFFFF0000" strokeWidth="10" 
                        fill="0xFF00FF00">
                    </CircleShape>';

// thru allows drawing thru control point
var cubicCurveTest = 
                    '<CubicCurveShape 
                        thru="true" 
                        x1="100" y1="100" 
                        x2="200" y2="150" 
                        x3="130" y3="220" 
                        strokeColor="0xFF0000" strokeWidth="1" 
                        fill="0xFF00FF00">
                    </CubicCurveShape>';

var ellipseArcTest = 
                    '<EllipseArcTest 
                        left="100"  top="100" 
                        width="200" height="50" 
                        strokeColor="0xFF0000" strokeWidth="1" 
                        fill="0xFF00FF00" 
                        startAngle="10" sweepAngle="90">
                    </EllipseArcTest>';

var ellipseTest =  
                    '<EllipseShape 
                        top="100" 
                        width="200" 
                        height="50" 
                        strokeColor="0xFF0000" strokeWidth="1" 
                        fill="0xFF00FF00">
                    </EllipseShape>';

var imageElement = 
                    '<ImageElement  
                        left="100" top="100" 
                        width="200" height="50" 
                        contents="image">
                    </ImageElement>';

var lineGradientTest = 
                    '<LineGradient 
                        x1="100" y1="300" 
                        x2="300" y2="120" 
                        strokewidth="1" 
                        colorA="0xFF0000" colorB="0xa00cc0" colorC="0x0fa00f" colorD="0x000fff">
                    </LineGradient>';

var lineShapeTest: String = 
                    '<LineShape 
                        x1="100" y1="300" 
                        x2="360" y2="120" 
                        strokeWidth="30" strokeColor="0xffFF0000">
                    </LineShape>';
var quadtest_d      = "M200,300 Q400,50 600,300 T1000,300";
var cubictest_d     = "M100,200 C100,100 250,100 250,200S400,300 400,200";
// needs justPath to implement..?
var pathElementQuadTest =
                    '<PathElementShape 
                        path="$quadtest_d" 
                        strokewidth="1" strokeColor="0xFF0000" 
                        fill="0x0000ff">
                    </PathElementShape>';
var pathElementCubicTest =
                    '<PathElementShape 
                        path="$cubictest_d" 
                        strokewidth="1" strokeColor="0xFF0000" 
                        fill="0x0000ff">
                    </PathElementShape>';
var polyLineGradientTest = 
                    '<PolyLineGradient 
                        points= "[ 100, 100, 50, 50, 30, 30, 70, 200 ]" 
                        colorDirection="longways" 
                        cornerColors="[ 0xFF0000, 0x0f00ff, 0xaaaa00, 0xcc00cc ]">
                    </PolyLineGradient>';

var polyLineShapeTest = 
                    '<PolyLineShape 
                        points= "[ 100, 100, 50, 50, 30, 30, 70, 200 ]" 
                        strokeColor="0xFF0000" strokeWidth="1" 
                        fill="0xFF00FF00">
                    </PolyLineShape>'; // no fill yet!

var quadCurveTest = 
                    '<QuadCurveShape 
                        x1="100" y1="300" 
                        x2="300" y2="120" 
                        x3="130" y3="220" 
                        x4="500" y4="500" 
                        strokeColor="0xFF0000" strokeWidth="1">
                    </QuadCurveShape>';

// rethink coordinates for tests!
var quadShape = 
                    '<QuadShape 
                        x1="100" y1="300" 
                        x2="300" y2="120" 
                        x3="130" y3="220" 
                        x4="500" y4="500" 
                        strokeColor="0xFF0000" strokeWidth="1" 
                        fill="0xFF00FF00">
                    </QuadShape>';

var rectangleShape = 
                    '<RectangleShape 
                        left="100" top="100" 
                        width="200" height="50" 
                        rounded="true" 
                        strokeColor="0xFF0000" 
                        strokeWidth="1" 
                        fill="0xFF00FF00">
                    </RectangleShape>';

// should I add rounded possibility?
var squareShape = 
                    '<SquareShape 
                        left="100" top="100" 
                        diameter="90" 
                        strokeColor="0xFF0000" strokeWidth="1" 
                        fill="0xFF00FF00">
                    </SquareShape>';

var triangleGradientTest: String = 
                    '<TriangleGradient 
                        aX="100" aY="100" 
                        bX="200" bY="150" 
                        cX="130" cY="220" 
                        colorA="0xffFF0000" colorB="0xff0f00ff" colorC="0xffcc00cc">
                    </TriangleGradient>';

var triangleShape = 
                    '<TriangleShape 
                        x1="100" y1="100" 
                        x2="200" y2="150" 
                        x3="130" y3="220" 
                        strokeColor="0xFF0000" strokeWidth="1" 
                        fill="0xFF00FF00">
                    </TriangleShape>';
