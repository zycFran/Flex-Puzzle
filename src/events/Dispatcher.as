/**
 * 分发全局事件 所有的类都可以监听
 * author: zyc
 */
package events {
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;

public class Dispatcher extends EventDispatcher {
    private static var instance:Dispatcher;

    public function Dispatcher(target:IEventDispatcher = null) {
        super(target);
    }

    public static function getInstance():Dispatcher {
        if (instance == null) {
            instance = new Dispatcher();
        }
        return instance;
    }
}
}