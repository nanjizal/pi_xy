package pi_xy.application;

import htmlHelper.canvas.CanvasSetup;
import htmlHelper.canvas.Surface;

import pi_xy.Pixelimage;
import pi_xy.formats.Format;
import pi_xy.triangleGML.TriangleGML;

function main() new Arcs();
class Arcs {

    // htmlHelper requirements
    var canvasSetup = new CanvasSetup();
    public function new(){
        var surface = canvasSetup.surface;
        var pixelImage = new Pixelimage( 1024*4, 768*4 );
        pixelImage.transparent = true;
        var parser = new TriangleGML( pixelImage );
        parser.addShape( backGround, 10, 10 );
        parser.addShape( aGrid,         10,   10 );
        parser.addShape( arcPie,        10,    0 );
        parser.addShape( arcEllipse,    10,  500 );
        parser.addShape( arcChord,      10, 1000 );
        parser.addShape( arcPie2,     1210,    0 );
        parser.addShape( arcEllipse2, 1210,  500 );
        parser.addShape( arcChord2,   1210, 1000 );
        // promise used on JS to allow adding assets.
        parser.renderPromise().then(
            ( _ ) -> pixelImage.jsCanvas.to( surface.me, 0, 0 )
        );
        
    }

    var backGround = 
    '<RectangleForm
        left = "-1"
        top = "-1"
        width = "3073"
        height = "2305"
        fill = "0xFF000203">
    </RectangleForm>';
    
    var aGrid = 
    '<LineGridShape
        left = "100"  top = "100"
        width = "2048" height = "1536"
        delta = "100" deltaH = "100"
        strokeColor="0xfF003300" strokeWidth="3">
    </LineGridShape>';
    
    var arcPie = 
    '<ArcForm 
        left="100"  top="100" 
        width="500" height="480" 
        strokeColor="0xFFFF0000" strokeWidth="12" 
        fill="0xFF00FF00" 
        startAngle="0" sweepAngle="240"
        arcType="pie">
    </ArcForm>';
    
    var arcEllipse =
    '<ArcForm 
        left="100"  top="100" 
        width="500" height="480" 
        strokeColor="0xFF0000FF" strokeWidth="12" 
        fill="0xFFFF00EE" 
        startAngle="0" sweepAngle="240"
        arcType="ellipse">
    </ArcForm>';
    
    var arcChord =
    '<ArcForm 
        left="100"  top="100" 
        width="500" height="480" 
        strokeColor="0xFFFF7700" strokeWidth="12" 
        fill="0xFF00A6FF" 
        startAngle="0" sweepAngle="240"
        arcType="chord">
    </ArcForm>';
    
    var arcPie2 = 
    '<ArcForm 
        left="100"  top="100" 
        width="500" height="480" 
        strokeColor="0xFFFF0000" strokeWidth="12" 
        fill="0xFF00FF00" 
        startAngle="120" sweepAngle="70"
        arcType="pie">
    </ArcForm>';
    
    var arcEllipse2 =
    '<ArcForm 
        left="100"  top="100" 
        width="500" height="480" 
        strokeColor="0xFF0000FF" strokeWidth="12" 
        fill="0xFFFF00EE" 
        startAngle="-43" sweepAngle="108"
        arcType="ellipse">
    </ArcForm>';
    
    var arcChord2 =
    '<ArcForm 
        left="100"  top="100" 
        width="500" height="480" 
        strokeColor="0xFFFF7700" strokeWidth="12" 
        fill="0xFF00A6FF" 
        startAngle="190" sweepAngle="90"
        arcType="chord">
    </ArcForm>';
}