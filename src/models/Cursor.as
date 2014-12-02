/**
 * Created with IntelliJ IDEA.
 * User: zyc
 * Date: 14-4-22
 * Time: 下午3:38
 * To change this template use File | Settings | File Templates.
 */
package models {
import flash.events.MouseEvent;

import mx.managers.CursorManager;

public class Cursor {
    // 鼠标样式
    [Embed(source="../images/ico_shift.png")]
    public static var cursorShift:Class;
    [Embed(source="../images/ico_pointer1.png")]
    public static var cursorDrag_NE:Class;
    [Embed(source="../images/ico_pointer2.png")]
    public static var cursorDrag_NW:Class;

    // canvas
    [Embed(source="../images/bigger_ico.png")]
    [Bindable]
    public static var canvasBigger:Class;

    [Embed(source="../images/smaller_ico.png")]
    [Bindable]
    public static var canvasSmaller:Class;

    [Embed(source="../images/ico_hand.png")]
    [Bindable]
    public static var canvasHand:Class;

    public static var currentCursor:Class;

    public function Cursor() {

    }

    public static function setCursorByType(type:String, e:MouseEvent):void{
        if(e){
            e.stopPropagation();
        }
        if(type == 'canvas_big'){
            currentCursor = canvasBigger;
            CursorManager.setCursor(currentCursor);
        }else if(type == 'canvas_small'){
            currentCursor = canvasSmaller;
            CursorManager.setCursor(currentCursor);
        }else if(type == 'canvas_hand'){
            currentCursor = canvasHand;
            CursorManager.setCursor(currentCursor);
        }else{
            CursorManager.removeAllCursors();
            currentCursor = null;
        }
        trace(currentCursor);
    }

    public static function cursorHandler():void{
        if(currentCursor){
            CursorManager.setCursor(currentCursor);
        }else{
            CursorManager.removeAllCursors();
        }
    }
}
}
