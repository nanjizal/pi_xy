package pixelimage.shapeStruct;
import pixelimage.Pixelimage;
import pixelimage.shapeStruct.BasicShape;

@:structInit
class PatternShape extends BasicShape {
    public var foreStroke: Int;
    public var backStroke: Int;
    public var foreFill: Int;
    public var backFill: Int;

    public var forePatternFill: Null<Array<Bool>>;
    public var forePatternWidth: Int;
    public var forePatternHeight: Int;
    public var forePatternAcross: Bool;

    public var backPatternFill: Null< Array<Bool> >;
    public var backPatternWidth: Int;
    public var backPatternHeight: Int;
    public var backPatternAcross: Bool;

    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeColor        = 0x00000000
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        , foreStroke = 0x00000000
                        , backStroke = 0x00000000
                        , foreFill   = 0x00000000
                        , backFill   = 0x00000000

                        , forePatternFill = null
                        , forePatternWidth = null
                        , forePatternHeight = null
                        , forePatternAcross = true
                        
                        , backPatternFill = null
                        , backPatternWidth = 16
                        , backPatternHeight = 16
                        , backPatternAcross = true
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray );
        this.foreStroke = foreStroke;
        this.backStroke = backStroke;
        this.foreFill = foreFill;
        this.backFill = backFill;

        // if forePattern == null then use stroke
        this.forePatternFill = forePatternFill;
        this.forePatternWidth = forePatternWidth;
        this.forePatternHeight = forePatternHeight;
        this.forePatternAcross = forePatternAcross;

        if( backPatternFill == null ){
            // default test pattern fill, may remove on more testing
            this.backPatternFill = [ true, true, false, false ];
        } else {
            this.backPatternFill = backPatternFill;
        }
        // if forePattern == null then use stroke
        this.backPatternWidth = backPatternWidth;
        this.backPatternHeight = backPatternHeight;
        this.backPatternAcross = backPatternAcross;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'foreStroke':
                foreStroke = Std.parseInt( value );
            case 'backStroke':
                backStroke = Std.parseInt( value );
            case 'foreFill':
                foreFill = Std.parseInt( value );
            case 'backFill':
                backFill = Std.parseInt( value );

            case 'forePatternFill':
                value = value.split('[')[1].split(']')[0];
                forePatternFill = [ for( v in value.split(',') ){
                    var bools = StringTools.trim( v ).toLowerCase();
                    ( bools == 'true' || bools == '1' )? true: false;
                } ];
            case 'forePatternAcross':
                var bools = StringTools.trim( value ).toLowerCase();
                forePatternAcross= ( bools == 'true' || bools == '1' )? true: false; 
            case 'forePatternWidth':
                forePatternWidth = Std.parseInt( value );
            case 'forePatternHeight':
                forePatternHeight = Std.parseInt( value );
             
            case 'backPatternFill':
                value = value.split('[')[1].split(']')[0];
                backPatternFill = [ for( v in value.split(',') ){
                    var bools = StringTools.trim( v ).toLowerCase();
                    ( bools == 'true' || bools == '1' )? true: false;
                } ];
            case 'backPatternAcross':
                var bools = StringTools.trim( value ).toLowerCase();
                backPatternAcross = ( bools == 'true' || bools == '1' )? true: false; 
            case 'backPatternWidth':
                backPatternWidth = Std.parseInt( value );
            case 'backPatternHeight':
                backPatternHeight = Std.parseInt( value ); 
            
            case _:
                super.setParameter( name, value );
        }
    }
}