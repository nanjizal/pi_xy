package pi_xy.triangleGML.triGML;

import pi_xy.triangleGML.triGML.BasicShape;

@:structInit
abstract class PatternStroke<DRAWTOOL,IMAGETOOL> extends BasicShape<DRAWTOOL,IMAGETOOL> {

    public var strokeColor0:        Int;
    public var strokeColor1:        Int;

    public var strokePatternFill:   Null<Array<Bool>>;
    public var strokePatternWidth:  Int;
    public var strokePatternHeight: Int;
    public var strokePatternAcross: Bool;
    public var strokePatternScale:  Int;
    public var imageTileStroke:     IMAGETOOL;

    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeColor        = 0x00000000
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        , strokeColor0 = 0x00000000
                        , strokeColor1 = 0x00000000

                        , strokePatternFill = null
                        , strokePatternWidth = null
                        , strokePatternHeight = null
                        , strokePatternAcross = true
                        , strokePatternScale = 1
                        
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray );
        this.strokeColor0 = strokeColor0;
        this.strokeColor1 = strokeColor1;

        // if strokePattern == null then use stroke
        this.strokePatternFill = strokePatternFill;
        this.strokePatternWidth = strokePatternWidth;
        this.strokePatternHeight = strokePatternHeight;
        this.strokePatternAcross = strokePatternAcross;
        this.strokePatternScale  = strokePatternScale;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'strokeColor0':
                strokeColor0 = Std.parseInt( value );
            case 'strokeColor1':
                strokeColor1 = Std.parseInt( value );

            case 'strokePatternFill':
                value = value.split('[')[1].split(']')[0];
                strokePatternFill = [ for( v in value.split(',') ){
                    var bools = StringTools.trim( v ).toLowerCase();
                    ( bools == 'true' || bools == '1' )? true: false;
                } ];
            case 'strokePatternAcross':
                var bools = StringTools.trim( value ).toLowerCase();
                strokePatternAcross= ( bools == 'true' || bools == '1' )? true: false; 
            case 'strokePatternWidth':
                strokePatternWidth = Std.parseInt( value );
            case 'strokePatternHeight':
                strokePatternHeight = Std.parseInt( value );
            case 'strokePatternScale':
                strokePatternScale = Std.parseInt( value );

            case _:
                super.setParameter( name, value );
        }
    }
    abstract public function buildPatternTemplates():Void;
}