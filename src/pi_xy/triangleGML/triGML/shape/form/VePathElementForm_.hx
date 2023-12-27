package pi_xy.triangleGML.triGML.shape.form;
import pi_xy.triangleGML.triGML.FillForm;


abstract class VePathElementShape_<DRAWTOOL,IMAGETOOL> extends FillForm<DRAWTOOL,IMAGETOOL> {
    public var pathData: String = '';
    public var strokeColors: Null<Array<Int>>;
    public var strokeWidths: Null<Array<Float>>;
    public var translateX: Float;
    public var translateY: Float;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeColors:Null<Array<Int>>  = null
                        , strokeWidths: Null<Array<Float>> = null
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        , fill = 0x000000
                        , pathData = ''
                        , translateX = 0.
                        , translateY = 0.
                        , scaleX = 1.
                        , scaleY = 1.
                        ){
        super( opacity, visibility, 0x000000, 1, strokeDashGapArray, fill );
        this.strokeColors = strokeColors;
        this.strokeWidths = strokeWidths;
        this.pathData = pathData;
        this.translateX = translateX;
        this.translateY = translateY;
        this.scaleX     = scaleX;
        this.scaleY     = scaleY;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'strokeColors':
                value = value.split('[')[1].split(']')[0];
                strokeColors = [ for( n in value.split(',') ) Std.parseInt( n )  ];
            case 'strokeWidths':
                value = value.split('[')[1].split(']')[0];
                strokeWidths = [ for( n in value.split(',') ) Std.parseFloat( n )  ];
            case 'pathData':
                pathData =value;
            case 'translateX':
                translateX = Std.parseFloat( value );
            case 'translateY':
                translateY = Std.parseFloat( value );
            case 'scaleX':
                scaleX = Std.parseFloat( value );
            case 'scaleY':
                scaleY = Std.parseFloat( value );
            case _:
                super.setParameter( name, value );
        }
    }
}