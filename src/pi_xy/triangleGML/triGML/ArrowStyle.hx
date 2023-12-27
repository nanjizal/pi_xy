package pi_xy.triangleGML.triGML;

// TODO: change arrow..
// no option for flare with both, by design
enum abstract ArrowStyle( String ) {
    var NORMAL             = 'normal';
    var OPEN               = 'open'; // not filled 
    var FLARE              = 'flare'; // arrow stem gets wider away from head
    var REVERSE_FLARE      = 'reverseFlare'; // arrow stem gets narrower from head
    var BOTH               = 'both';
    var OPEN_BOTH          = 'openBoth';
    var OPEN_FLARE         = 'openFlare';
    var OPEN_REVERSE_FLARE = 'openReverseFlare';
}