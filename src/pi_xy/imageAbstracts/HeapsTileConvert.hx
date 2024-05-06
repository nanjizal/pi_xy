package pi_xy.imageAbstracts;

#if heaps
import pi_xy.Pixelimage;
import pi_xy.formats.HeapsTile;
import h2d.Tile;

@:forward
@:transient
abstract HeapsTileConvert( Pixelimage ) from Pixelimage to Pixelimage {
    inline
    public function new( w: Int, h: Int ){
       this = new Pixelimage( w, h );
    }
    @:to
    public inline
    function toHeapsTile(): Tile {
        var heapsTile: HeapsTile = this;
        return heapsTile;
    }
    @:to
    public inline
    function toTile(): Tile {
        var tile: Tile = toHeapsTile();
        return tile;
    }
    @:to
    public inline
    function toHeapsPixels(): hxd.Pixels {
        return pi_xy.formats.HeapsPixels.toHeapsPixels( this );
    }
}
#end