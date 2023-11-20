package pi_xy.imageAbstracts;
import pi_xy.Pixelimage;

@:transient
abstract PatternShape( Pixelimage ) from Pixelimage to Pixelimage {

    inline
    public function new( w: Int, h: Int ){
       this = new Pixelimage( w, h );
    }

    inline public 
    function rectangle( x: Float, y: Float
                        , w: Float, h: Float
                        , foreColor: Int, backColor: Int
                        , patternFill: Array<Bool> ){
        return pi_xy.transformation.BinaryPatternFill
            .patternRectangle( this
                             , x, y, w, h
                             , foreColor, backColor, patternFill );
    }
    inline public 
    function rectangleDown( x: Float, y: Float
                            , w: Float, h: Float
                            , foreColor: Int, backColor: Int
                            , patternFill: Array<Bool> ){
        return pi_xy.transformation.BinaryPatternFill
            .patternRectangleDown( this
                                 , x, y, w, h
                                 , foreColor, backColor, patternFill );
    }
}