package pixelimageXY.formats;
import pixelimageXY.Pixelshape;
import pixelimageXY.Pixelimage;
import pixelimageXY.pixel.Pixel32;
#if neko
import neko.vm.Module;
#end

#if !js
import format.png.Data;
inline
function toPNG( pixelShape: Pixelshape, name: String, level = 9 ){
    var lh = pixelShape.height; 
    var lw = pixelShape.width;
    var w = 0;
    var r = 0;
    //var data = pixelShape.getBytes();
    
    var rgba = haxe.io.Bytes.alloc( lw * lh * 4 + lh );
    var w = 0, r = 0;
    for( y in 0...lh ) {
        rgba.set(w++,0); // no filter for this scanline
        for( x in 0...lw ) { // argb   
            // AGBR
            var col: Pixel32 = new Pixel32( pixelShape.getARGB( x, y ) );
            var a: Int = col.c0;
            var r: Int = col.c1;
            var g: Int = col.c2;
            var b: Int = col.c3;
            rgba.set(w++,r); // r
            rgba.set(w++,g); // g
            rgba.set(w++,b); // b
            rgba.set(w++,a); // a

            /*rgba.set(w++,data.get(r+2)); // r
            rgba.set(w++,data.get(r+3)); // g
            rgba.set(w++,data.get(r+1)); // b
            rgba.set(w++,data.get(r)); // a*/
            r += 4;
        }
    }
    /*
    for( y in 0...lh ) {
        rgba.set(  w++, 0 ); // no filter for this scanline
        rgba.blit( w, bytes, r, lw );
        r += lw;
        w += lw;
    }
    */
	var l = new List();
	l.add( CHeader( { width:      pixelShape.width, height: pixelShape.height
                    , colbits:    8,                color:  ColTrue( true )
                    , interlaced: false }) );
	l.add( CData( format.tools.Deflate.run( rgba, level ) ) );
	l.add( CEnd );
    trace( 'create writer' );
    var dir = haxe.io.Path.directory( Sys.programPath() );
    //var dir = get_dir();
	var writer = new format.png.Writer( 
        sys.io.File.write( haxe.io.Path.join( [ dir, name + ".png" ] ), true )
    );
	writer.write( l );
    trace( 'written');
}
/*
inline
function fromPNG( name: String, transparent: Bool = true ): Pixelimage {
    var reader = new format.png.Reader( 
        sys.io.File.read( haxe.io.Path.join( [ haxe.io.Path.directory( Sys.programPath() )
            , name + ".png" ] )
            , true )
    );
    var data = reader.read();
    var header = format.png.Tools.getHeader( data );
    var bytes  = format.png.Tools.extract32( data ); // BGRA
    var pixelImage = new Pixelimage( header.width, header.height );
    pixelImage.transparent = true;
    // need ABGR
    var p = 0;
	for( i in 0...bytes.length >> 2 ) {
        // BGRA to AGBR
        var b = bytes.get( p );
		var g = bytes.get(p + 1);
		var r = bytes.get(p + 2);
		var a = bytes.get(p + 3);
		bytes.set( p++, a );
		bytes.set( p++, g );
		bytes.set( p++, b );
		bytes.set( p++, r );
    }
    pixelImage.fromBytes( bytes, 0 );
    return pixelImage;
}
*/
function get_dir(): String {
    #if neko
    var dir = haxe.io.Path.directory( Module.local().name );
    #else
    var dir = haxe.io.Path.directory( Sys.executablePath() );
    #end
    return dir;
}

#end