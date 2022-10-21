package pixelimage;

import htmlHelper.canvas.CanvasSetup;
import htmlHelper.canvas.Surface;
import pixelimage.Pixelimage;

function main() new DemoUse();
class DemoUse {
    public var canvasSetup = new CanvasSetup();
    public function new(){
        trace( 'Pixelimage example on Canvas' );
        var g   = canvasSetup.surface;
        var p = new Pixelimage( 1024, 768 );
        var p = new Pixelshape( 1024*4, 768*4 );
        p.transparent = true;
        p.setRelativePosition( 0, 0 );
        var a = [0x33F000c0, 0x99F000c0, 0xaaF000c0, 0xccF000c0,0xeeF000c0];
        var gap = 200;
        for( i in 0...5 ){
            p.fillTri( 100 + i*gap, 100+800, 300+i*gap, 800+400, 500+i*gap, 300+400+300, a[i] );
        }
        p.drawToContext( g.me, 0, 0 );
        // p.drawFromContext( g.me, 0, 0 );
        // trace( p.getPixelString( 101, 101) );
   }
}