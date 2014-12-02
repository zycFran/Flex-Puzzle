/**
 * Created with IntelliJ IDEA.
 * User: zyc
 * Date: 13-7-23
 * Time: 下午3:54
 * To change this template use File | Settings | File Templates.
 */
/**
 * 印花间 每个可操作的花型单元
 */
package models {
import flash.display.BitmapData;

import spark.components.Image;

public class Pattern extends Object{

    private var _selected:Boolean = false;             //  是否可拖动
    private var _raw:Object;

    private var _ptnId:Number;
    private var _thumbUrl:String;
    private var _imageType:String;
    private var _bitmapData:BitmapData;

    public function Pattern(ptn:Object) {
        _raw = ptn;

        _thumbUrl = ptn.thumbUrl;
        _bitmapData = ptn.bitmapData || null;
        _imageType = ptn.imageType;
    }

    public function get source():* {
        if(_imageType == 'preview'){
            return _bitmapData;
        }else{
           return _thumbUrl;
        }
    }

    public function get imageType():String {
        return _imageType;
    }

    public function set raw(b:Object):void {
        _raw = b;
    }

    public function get raw():Object {
        return _raw;
    }
    public function set ptnId(p:Number):void {
        _ptnId = p;
    }

    public function get ptnId():Number {
        return _ptnId;
    }
    public function get thumbUrl():String {
        return _thumbUrl;
    }
    public function get bitmapData():BitmapData {
        return _bitmapData;
    }
}
}
