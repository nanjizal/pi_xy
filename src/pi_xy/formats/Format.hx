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
function toBytes0leftColumn( pixelImage: Pixelimage ): haxe.io.Bytes {
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
    return rgba;
}
inline
function toPNG( pixelImage: Pixelimage, name: String, level = 9 ){
    if( name.substr( -4, 1 ) == '.' ){ // remove 'png'
        name = name.substr( 0, -4 );
    }
    var rgba = toBytes0leftColumn( pixelImage );
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
inline
function toBMP( pixelImage: Pixelimage, name: String ){
    Sys.println( 'save bmp ' + name );
    if( name.substr( -4, 1 ) == '.' ){ // remove 'bmp'
        name = name.substr( 0, -4 );
    }
    var dir = haxe.io.Path.directory( Sys.programPath() );
    var bmpWriter = new format.bmp.Writer( 
        sys.io.File.write( haxe.io.Path.join( [ dir, name + ".bmp" ] )
        , true )
    );
    var bytes = pixelImage.getBytes();
    var bytesCameleon  = new pi_xy.formats.BytesCameleon( bytes );
    bytesCameleon.RGBA_ARGB();
    var bmpData = format.bmp.Tools.buildFromARGB( pixelImage.width, pixelImage.height, bytesCameleon );
    bmpWriter.write( bmpData );
}

inline
function fromBMP( name: String, transparent: Bool = true ){
    if( name.substr( -4, 1 ) == '.' ){ // remove 'bmp'
        name = name.substr( 0, -4 );
    }
    var reader = new format.bmp.Reader( 
        sys.io.File.read( 
            haxe.io.Path.join( 
                [ haxe.io.Path.directory( Sys.programPath() ), name + ".png" ] 
            )
        , true )
    );
    var data = reader.read();
    var header = data.header;
    var bytes: haxe.io.Bytes = format.bmp.Tools.extractARGB( data );
    var bytesCameleon  = new pi_xy.formats.BytesCameleon( bytes ); // ARGB
    var pixelImage: Pixelimage = new Pixelimage( header.width, header.height );
    pixelImage.transparent = transparent;
    bytesCameleon.ARGB_RGBA();
    pixelImage.fromBytes( bytesCameleon );
    return pixelImage;
}

inline
function fromGIFframe( name: String, transparent: Bool = true, frame = 0, cumlative: Bool = false ){
    if( name.substr( -4, 1 ) == '.' ){ // remove 'gif'
        name = name.substr( 0, -4 );
    }
    var reader = new format.gif.Reader( 
        sys.io.File.read( haxe.io.Path.join( [ haxe.io.Path.directory( Sys.programPath() )
        , name + ".png" ] )
        , true )
    );
    var data = reader.read();
    var totalFrames = format.gif.Tools.framesCount( data );
    if( frame > totalFrames - 1 ){
        trace('frame not found using first');
        frame = 0;
    }
    var frameData = format.gif.Tools.frame( data, frame );
    var bytes: haxe.io.Bytes = (cumlative)? format.gif.Tools.extractFullRGBA( data, frame ): format.gif.Tools.extractRGBA( data, frame ); 
    var pixelImage: Pixelimage = new Pixelimage( frameData.width, frameData.height );
    pixelImage.transparent = transparent;
    pixelImage.fromBytes( bytes );
    return pixelImage;
}
inline
function fromGIF( name: String, transparent: Bool = true, cumlative: Bool = false ): Array<Pixelimage>{
    if( name.substr( -4, 1 ) == '.' ){ // remove 'gif'
        name = name.substr( 0, -4 );
    }
    var reader = new format.gif.Reader( 
        sys.io.File.read( haxe.io.Path.join( [ haxe.io.Path.directory( Sys.programPath() )
            , name + ".png" ] )
            , true )
    );
    var data = reader.read();
    var totalFrames = format.gif.Tools.framesCount( data );
    var frameData: format.gif.Data.Frame;
    var arr = new Array<Pixelimage>();
    var bytes: haxe.io.Bytes;
    var bytesCameleon: pi_xy.formats.BytesCameleon;
    for( i in 0...totalFrames ){
        frameData = format.gif.Tools.frame( data, i );
        bytes = (cumlative)? format.gif.Tools.extractFullRGBA( data, i ): format.gif.Tools.extractRGBA( data, i ); 
        var pixelImage: Pixelimage = new Pixelimage( frameData.width, frameData.height );
        pixelImage.transparent = transparent;
        pixelImage.fromBytes( bytes );
        arr[i] = pixelImage;
    }
    return arr;
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