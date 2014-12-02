/**
 * Created with IntelliJ IDEA.
 * User: zyc
 * Date: 14-11-22
 * Time: 下午1:47
 * To change this template use File | Settings | File Templates.
 */
package events {

import flash.events.Event;

import models.Piece;

public class PieceEvent extends Event {

    public static const PIECE_INIT:String = "PIECE_INIT";
    public static const PIECE_CHANGE:String = "PIECE_CHANGE";
    public static const PANEL_TOGGLE:String = "PANEL_TOGGLE";
    public static const CHANGE_SIZE:String = "CHANGE_SIZE";
    public static const CHANGE_ROTATE:String = "CHANGE_ROTATE";
    public static const REMOVE_PATTERN:String = "REMOVE_PATTERN";
    public static const SAVE_IMAGE:String = "SAVE_IMAGE";
    public static const CLEAR_STATE:String = "CLEAR_STATE";
    public static const CHANGE_SIZE_SINGLE:String = "CHANGE_SIZE_SINGLE";
    public static const NEW_PATTERN:String = "NEW_PATTERN";
    public static const LIST_HIDE:String = "LIST_HIDE";
    public static const PATTERN_INIT:String = "PATTERN_INIT";
    public static const PATTERN_REMOVE:String = "PATTERN_REMOVE";
    public static const AUTO_FIT:String = "AUTO_FIT";
    public static const SHOW_RIGHT:String = "SHOW_RIGHT";

    public var piece:Piece;
    public var scale:Number;
    public var rotate:Number;
    public var toggle:Boolean;
    public var saveType:String;
    public var patterns:Array;
    public var patternRaw:Object;

    public function PieceEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
        super(type, bubbles, cancelable);
    }

    override public function clone():Event {
        var ev:PieceEvent = new PieceEvent(type, bubbles, cancelable);
        ev.piece = piece;
        ev.scale = scale;
        ev.rotate = rotate;
        ev.toggle = toggle;
        ev.saveType = saveType;
        ev.patterns = patterns;
        ev.patternRaw = patternRaw;
        return ev;
    }
}
}