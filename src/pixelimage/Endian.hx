package pixelimage;
/**
    little endian most desktops and laptops, seems that canvas context is ABGR so this is used to detect conversion
**/

// TODO very broken!!!
final isLittleEndian = (() -> {
    #if js
    final a8 = new js.lib.Uint8Array(4);
    final a32 = (new js.lib.Uint32Array(a8.buffer)[0]=0xFFcc0011);
    return !(a8[0]==0xff);
    #else
    final a8 = new haxe.io.UInt8Array(4);
    //final a32 = (new haxe.io.UInt32Array(a8.view.buffer)[0]=0xFFcc0011);
    return true;//!(a8[0]==0xff);
    #end
})();