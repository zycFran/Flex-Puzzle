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
public class Piece extends Object {

    private var _patterns:Array = [];       // 每个item是一个花型单元
    private var _items:Array = [];       // 每个item是一个花型单元
    private var _layout:String = "vbox";         //  花型接方式      默认 Single
    private var _size:String = 'normal';        //  Piece 宽高比     ，默认 1:1
                                                          //  normal: 1:1,  small: 7:10

    private var _space:int;              //  间隔 像素         默认 10px

    private var _height:Number;    // 打印长度 px
    private var _width:Number;     // 打印宽度 px

    private var _paddingLeft:int;    // 打印长度 px
    private var _paddingTop:int;     // 打印宽度 px

    private var _serial:String;
    private var _thumbUrl:String;
    private  var _name:String;
    private  var _raw:Object;
    private  var _selected:Boolean;
    private  var _autoFit:Boolean;

    public function Piece(model:Object) {
        super();
        _size = model.size || 'normal';
        _layout = model.layout || 'vbox';
        _space = model.space || 0;
        _serial = model.serial || String(Math.random());
        _thumbUrl = model.thumbUrl;
        _name = model.name;
        _patterns = model.patterns || [];
        _items = model.items || [{flex: 1}];

        _width = model.width;
        _height = model.height;
        _autoFit = model.autoFit || false;

        _paddingLeft = model.paddingLeft || 0;
        _paddingTop = model.paddingTop || 0;

        _selected =  model.selected || false;

        _raw = model;
    }

    public function get patterns():Array {
        return _patterns || [];
    }

    public function get layout():String {
        return _layout;
    }
    public function set layout(r:String):void {
        _layout = r;
    }

    [Bindable]
    public function get selected():Boolean {
        return _selected;
    }
    public function set selected(r:Boolean):void {
        _selected = r;
    }
    public function get autoFit():Boolean {
        return _autoFit;
    }
    public function set autoFit(r:Boolean):void {
        _autoFit = r;
    }
    public function get size():String {
        return _size;
    }
    public function set size(r:String):void {
        _size = r;
    }
    public function get paddingLeft():int {
        return _paddingLeft;
    }
    public function set paddingLeft(len:int):void {
        _paddingLeft = len;
    }
    public function get paddingTop():int {
        return _paddingTop;
    }
    public function set paddingTop(len:int):void {
        _paddingTop = len;
    }
    public function get height():Number {
        return Number(_height.toFixed(2));
    }
    public function set height(len:Number):void {
        _height = len;
    }
    public function get raw():Object {
        return _raw;
    }
    public function get space():int {
        return _space;
    }
    public function set space(len:int):void {
        _space = len;
    }
    public function set width(len:Number):void {
        _width = len;
    }
    [Bindable]
    public function get width():Number {
        return Number(_width.toFixed(2));
    }

    public function set patterns(p:Array):void {
        _patterns = p;
    }

    public function get serial(): String{
        return _serial;
    }
    public function set serial(s:String):void{
        _serial = s;
    }
    public function get items(): Array{
        return _items;
    }
    public function set items(p:Array):void{
        _items = p;
    }
    [Bindable]
    public function get name(): String{
        return _name;
    }
    public function set name(s:String):void{
        _name = s;
    }

    [Bindable]
    public function get thumbUrl(): String{
        return _thumbUrl;
    }
    public function set thumbUrl(s:String):void{
        _thumbUrl = s;
    }
}
}
