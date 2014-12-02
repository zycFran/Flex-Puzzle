/**
 * Created with IntelliJ IDEA.
 * User: zyc
 * Date: 13-7-23
 * Time: 下午3:54
 * To change this template use File | Settings | File Templates.
 */
/**
 * 定义 全局变量和静态变量
 */
package models {

import events.Dispatcher;
import events.PieceEvent;

import mx.collections.ArrayCollection;

public class Global extends Object{

    public static var HACK_FOR_PATTERN:Boolean = false;

    public static var uploadUrl:String = '';
    public static var uploadDataFieldName:String = 'upload_file';

    [Bindable]
    public static var waterLabel:String = '文字';

    [Bindable]
    public static var waterLabelColor:Number = 0x000000;

    [Bindable]
    public static var waterLabelSize: Number = 35;

    [Bindable]
    public static var waterImage:String = 'images/test/water.jpg';

    // 图片缩放范围
    [Bindable]
    public static var minScale:Number = 1;

    [Bindable]
    public static var maxScale:Number = 2;

    public static var autoFit:Boolean = true;

    public static var showRight:Boolean = false;

    public static var uploadParams:Object = {};

    public static function beforeUpload():Boolean{
        return true;
    }

    public static const SIZE_MAP:Object = {
        normal: 1,
        small: 7/10,
        big: 10/7
    };

    // 花型 列表
    public static var patternList:Array = [];

    // 模版
    public static var pieceList:Array = [];

    public function Global() {

    }
    public static function initPieceList(p:Array, bool:Boolean=false):void{
        pieceList = [];
        var _piece:Piece;
        var fg:Boolean = false;
        for(var i:int = 0; i < p.length; i++){
            pieceList.push(new Piece(p[i]));
            if(p[i].selected){
                fg = true;
                _piece = pieceList[i];
            }
        }
        if(!p.length || !bool){
            return;
        }
        if(!fg){
            _piece = pieceList[0];
        }
        var ev:PieceEvent = new PieceEvent(PieceEvent.PIECE_CHANGE);
        ev.piece = _piece;
        Dispatcher.getInstance().dispatchEvent(ev);

        Dispatcher.getInstance().dispatchEvent(new PieceEvent(PieceEvent.LIST_HIDE));
        Dispatcher.getInstance().dispatchEvent(new PieceEvent(PieceEvent.PIECE_INIT));
    }

    public static function findPieceBySerial(s:String): *{
        for(var i:int = 0; i < pieceList.length; i++){
            if(s == pieceList[i].serial){
                return pieceList[i];
            }
        }
    }
    public static function findPieceSelected(): *{
        for(var i:int = 0; i < pieceList.length; i++){
           if(pieceList[i].selected){
               return pieceList[i];
           }
        }
        return null;
    }
}
}
