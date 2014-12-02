/**
 * Created with IntelliJ IDEA.
 * User: zyc
 * Date: 13-7-23
 * Time: 下午3:54
 * To change this template use File | Settings | File Templates.
 */
/**
 * 印花间 每个可操作 缓存
 */
package utils {
import models.AdjustParams;
import models.Pattern;
import models.Piece;

import mx.states.OverrideBase;

import spark.components.Image;

public class CachePool {

    public static const CACHE:String = "Cache";
    public static const BACK:String = "Back";
    public static const FORWARD:String = "Forward";

    public static var _curStep:int = 0;
    public static var _cacheSteps:Array = [];

    public function CachePool() {
        _curStep = 0;
        _cacheSteps = [];
    }

    public static function getPieceOfCurStep(): Object{
        return getCurStep();
    }

    // 保存当前步骤
    public static function save(p:Object):void {
        // copy 当前 piece
        var patterns:Array = [];
        if(!p.patterns || !p.patterns.length){
            return;
        }
        for (var i:int = 0, len:int = p.patterns.length; i < len; i++) {
            var pattern:Pattern = new Pattern(p.patterns[i].raw);
            pattern.adjustParams.copy(p.patterns[i].adjustParams);
            pattern.selected = p.patterns[i].selected;
            pattern.ptnId = Math.random();
            patterns.push(pattern);
        }

        // 加入缓存队列
        _cacheSteps.push({
            height: p.height,
            width: p.width,
            returnRepeat: p.returnRepeat,
            patterns: patterns
        });

        // 每次保存完之后，当前位置指针指向缓存队列中的最后一个
        _curStep = _cacheSteps.length - 1;
    }

    // 获取当前位置指针指向的缓存队列中的数据
    public static function getCurStep():Object {
        if (_curStep < 0 || _curStep >= _cacheSteps.length) {
            return {};
        }
        return _cacheSteps[_curStep];
    }

    // 清空缓存队列
    public static function clear():void {
        _curStep = 0;
        _cacheSteps = [];
    }

    // 获取缓存队列的大小
    public static function size():int {
        return  _cacheSteps.length;
    }

    public static function set curStep(c:int):void {
        _curStep = c;
    }

    public static function get curStep():int {
        return _curStep;
    }
}
}
