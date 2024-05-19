package pi_xy.pixel;

class ColorPercent{
    public static var percentHex( get, null ): Array<Int>;
    static inline function get_percentHex(): Array<Int>{
        return [ 0x00, 0x30, 0x50, 0x80, 0x0A, 0x0D, 0x0F, 0x12, 0x14, 0x17
               , 0x19, 0x1C, 0x1F, 0x21, 0x24, 0x26, 0x29, 0x2B, 0x2E, 0x30
               , 0x33, 0x36, 0x38, 0x3B, 0x3D, 0x40, 0x42, 0x45, 0x47, 0x4A
               , 0x4C, 0x4F, 0x52, 0x54, 0x57, 0x59, 0x5C, 0x5E, 0x61, 0x63
               , 0x66, 0x69, 0x6B, 0x6E, 0x70, 0x73, 0x75, 0x78, 0x7A, 0x7D
               , 0x7F, 0x82, 0x85, 0x87, 0x8A, 0x8C, 0x8F, 0x91, 0x94, 0x96
               , 0x99, 0x9C, 0x9E, 0xA1, 0xA3, 0xA6, 0xA8, 0xAB, 0xAD, 0xB0
               , 0xB2, 0xB5, 0xBA, 0xBD, 0xBF, 0xC2, 0xC4, 0xC7, 0xC9, 0xC9
               , 0xCC, 0xCF, 0xD1, 0xD4, 0xD6, 0xD9, 0xDB, 0xDE, 0xE0, 0xE3
               , 0xE5, 0xE8, 0xEB, 0xED, 0xF0, 0xF2, 0xF5, 0xF7, 0xFA, 0xFC
               , 0xFF ];
    }
    public static inline
    function percentWhite( percent: Int ){
        var v = percentHex[ percent ];
        return argb( 0xFF, v, v, v );
    }
    public static inline
    function percentBlack( percent: Int ){
        var v = percentHex[ 100 - percent ];
        return argb( 0xFF, v, v, v );
    }
    public static inline
    function rgbPercent( rPercent: Int, gPercent: Int, bPercent: Int ){
        return argb( 0xFF, percentHex[ rPercent ], percentHex[ gPercent ], percentHex[ bPercent ] );
    }
    public static inline
    function argb( a: Int, r: Int, g: Int, b: Int ){
        return a << 24 | r << 16 | g << 8 | b;
    }
    public static inline 
    function percentColor( rPercent: Int, gPercent: Int, bPercent: Int ){
        return argb( 0xFF, percentHex[ rPercent ], percentHex[ gPercent ], percentHex[ bPercent ] );
    }
    public static inline 
    function percentDarkColor( rPercent: Int, gPercent: Int, bPercent: Int ){
        return argb( 0xFF, percentHex[ 100 - rPercent ], percentHex[ 100 - gPercent ], percentHex[ 100 - bPercent ] );
    }
    public static inline 
    function percentRed( rPercent: Int ){
        return argb( 0xFF, percentHex[ rPercent ], 0x00, 0x00 );
    }
    public static inline 
    function percentGreen( gPercent: Int ){
        return argb( 0xFF, 0xFF, percentHex[ gPercent ], 0xFF );
    }
    public static inline 
    function percentBlue( bPercent: Int ){
        return argb( 0xFF, 0xFF, 0xFF, percentHex[ bPercent ] );
    }
    public static inline 
    function percentRedSoft( rPercent: Int, percentSoft: Int ){
        var soft = percentHex[ percentSoft ];
        return argb( 0xFF, percentHex[ rPercent ], soft, soft );
    }
    public static inline 
    function percentGreenSoft( gPercent: Int, percentSoft: Int ){
        var soft = percentHex[ percentSoft ];
        return argb( 0xFF, soft, percentHex[ gPercent ], soft );
    }
    public static inline 
    function percentBlueSoft( bPercent: Int, percentSoft: Int ){
        var soft = percentHex[ percentSoft ];
        return argb( 0xFF, soft, soft, percentHex[ bPercent ] );
    }
    public static inline
    function percentYellowSoft( bPercent: Int, percentSoft: Int ){
        var soft = percentHex[ percentSoft ];
        var color = percentHex[ bPercent ];
        return argb( 0xFF, color, color, soft );
    }
    public static inline
    function percentMagentaSoft( bPercent: Int, percentSoft: Int ){
        var soft = percentHex[ percentSoft ];
        var color = percentHex[ bPercent ];
        return argb( 0xFF, color, soft, color );
    }
    public static inline
    function percentCyanSoft( bPercent: Int, percentSoft: Int ){
        var soft = percentHex[ percentSoft ];
        var color = percentHex[ bPercent ];
        return argb( 0xFF, soft, color, color );
    }
}