package pi_xy;
/**
    little endian most desktops and laptops, seems that canvas context is ABGR so this is used to detect conversion
**/
final isLittleEndian = (() -> {
    #if kha
        // from kha
        #if js
            return js.Syntax.code("new Uint8Array(new Uint32Array([0x12345678]).buffer)[0] === 0x78");
        #else
            return true;
        #end
    #end
    #if js
    final a8 = new js.lib.Uint8Array(4);
    final a32 = (new js.lib.Uint32Array(a8.buffer)[0]=0xFFcc0011);
    return !(a8[0]==0xff);
    //  (ps3 || wiiu || flash) ?
    #elseif ( flash )
    return false;
    #else
    return true;
    #end
})();