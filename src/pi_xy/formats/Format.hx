package pi_xy.formats;
import pi_xy.Pixelimage;
import pi_xy.pixel.Pixel32;
import pi_xy.formats.BytesCameleon;
#if neko
import neko.vm.Module;
#end

#if !js
import format.png.Data;
inline
function toPNG( pixelImage: Pixelimage, name: String, level = 9 ){
    if( name.substr( -4, 1 ) == '.' ){ // remove 'png'
        name = name.substr( 0, -4 );
    }
    var lh = pixelImage.height; 
    var lw = pixelImage.width;
    var w = 0;
    var r = 0;
    var rgba = haxe.io.Bytes.alloc( lw * lh * 4 + lh );
    var w = 0, row = 0;
    for( y in 0...lh ) {
        rgba.set( w++, 0 ); // no filter for this scanline
        for( x in 0...lw ) { // argb   
            // AGBR
            var col: Pixel32 = new Pixel32( pixelImage.getARGB( x, y ) );
            var a: Int = col.c0;
            var r: Int = col.c1;
            var g: Int = col.c2;
            var b: Int = col.c3;
            rgba.set(w++,r); // r
            rgba.set(w++,g); // g
            rgba.set(w++,b); // b
            rgba.set(w++,a); // a
            row += 4;
        }
    }
    var l = new List();
    l.add( CHeader( { width:      pixelImage.width, height: pixelImage.height
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

inline
function fromPNG( name: String, transparent: Bool = true ): Pixelimage {
    if( name.substr( -4, 1 ) == '.' ){ // remove 'png'
        name = name.substr( 0, -4 );
    }
    var reader = new format.png.Reader( 
        sys.io.File.read( haxe.io.Path.join( [ haxe.io.Path.directory( Sys.programPath() )
            , name + ".png" ] )
            , true )
    );
    var data = reader.read();
    var header = format.png.Tools.getHeader( data );
    var bytes: haxe.io.Bytes = format.png.Tools.extract32( data );
    var bytesCameleon  = new pi_xy.formats.BytesCameleon( bytes ); // BGRA
    var pixelImage: Pixelimage = new Pixelimage( header.width, header.height );
    pixelImage.transparent = true;
    // pixelImage.imageTypeString();
    bytesCameleon.BGRA_RGBA();
    pixelImage.fromBytes( bytesCameleon );
    return pixelImage;
}

function get_dir(): String {
    #if neko
    var dir = haxe.io.Path.directory( Module.local().name );
    #else
    var dir = haxe.io.Path.directory( Sys.executablePath() );
    #end
    return dir;
}

#end