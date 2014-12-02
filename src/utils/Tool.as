package utils {
import flash.display.DisplayObject;

import flash.utils.ByteArray;

import mx.controls.HRule;
import mx.graphics.SolidColorStroke;


import spark.components.Group;
import spark.components.Image;
import spark.components.Label;
import spark.primitives.Line;


public class Tool {
    public function Tool() {

    }

    public static var sizeToPixel:Number = 1;    // 1cm 等于 多少 px

    // startX: pixel
    public static  function createHRuler(target:DisplayObject, hContainer:Group, maxScale:int = 5):void{
        hContainer.removeAllElements();

//        var width:Number = Piece.width;
        var width:Number = convertPixelToSize(target.width);
        var maxWidth:Number = width * maxScale;

        //绘制横线和纵线
        var hRuler:HRule = new HRule();

        hRuler.width = target.width * maxScale * 2;
        hRuler.x = -target.width * maxScale;

        hContainer.addElement(hRuler);

        //绘制横线刻度
        for (var i:int = 0; i < int(maxWidth / 5) + 1; i++) {
            var hLine:Line = new Line();
            hLine.stroke = new SolidColorStroke(0xD9D8D9);
            hLine.xFrom = i * (target.width / (width / 5));
            hLine.xTo = hLine.xFrom;
            hLine.yFrom = 0;
            hLine.yTo = 5;
            if (i % 2 == 0) {
                hLine.yTo = 7;
                var hLabel:Label = new Label();
                hLabel.text = String(i * 5);
                hLabel.setStyle('fontSize', 10);
                hLabel.setStyle('color', '#D9D8D9');
                hLabel.x = hLine.xFrom - 5 * hLabel.text.length / 2;
                hLabel.y = hLine.yTo + 5 ;
                hContainer.addElement(hLabel);
            }
            hContainer.addElement(hLine);
        }

        for (var j:int = 1; j < int(maxWidth / 5) + 1; j++) {
            var hLine2:Line = new Line();
            hLine2.stroke = new SolidColorStroke(0xD9D8D9);
            hLine2.xFrom = - j * (target.width / (width / 5));
            hLine2.xTo = hLine2.xFrom;
            hLine2.yFrom = 0;
            hLine2.yTo = 5;
            if (j % 2 == 0) {
                hLine.yTo = 7;
                var hLabel2:Label = new Label();
                hLabel2.text = String(j * 5);
                hLabel2.setStyle('fontSize', 10);
                hLabel2.setStyle('color', '#D9D8D9');
                hLabel2.x = hLine2.xFrom - 5 * hLabel2.text.length / 2;
                hLabel2.y = hLine2.yTo + 5 ;
                hContainer.addElement(hLabel2);
            }
            hContainer.addElement(hLine2);
        }
    }

    // 复制 图片 （注意：这里的 el 可以是 Spark 的Image组件，也可以是一个Object）
    public static function cloneImage(el:Object, w:Number, h:Number):Image {
        var img:Image = new Image();
        img.source = el.source;
        img.width = w;
        img.height = h;
        return img;
    }

    // 对象的拷贝 两个对象没有关联
    // 可以深度拷贝对象，但是不会一同拷贝类的类型定义
    public static function cloneObj(obj:Object):* {
        var copier:ByteArray = new ByteArray();
        copier.writeObject(obj);
        copier.position = 0;
        return copier.readObject();
    }

    public static function cloneArray(obj:Array):* {
        var copier:ByteArray = new ByteArray();
        copier.writeObject(obj);
        copier.position = 0;
        return copier.readObject();
    }

    public static function convertPixelToSize(number:Number):Number {
        if(!sizeToPixel){
            return 0;
        }
        return Number((number / sizeToPixel).toFixed(2));
    }

    public static function convertSizeToPixel(number:Number):Number {
        if(!sizeToPixel){
            return 0;
        }
        return Number((number * sizeToPixel).toFixed(2));
    }

    // 转换时间格式
    public static function dateFormat(date:Date):String {
        var dYear:String = String(date.getFullYear());
        var dMouth:String = String((date.getMonth() + 1 < 10) ? "0" : "") + (date.getMonth() + 1);
        var dDate:String = String((date.getDate() < 10) ? "0" : "") + date.getDate();
        var ret:String = "";

        ret += dYear + "年" + dMouth + "月" + dDate + "日";
        ret += " " + ((date.getHours() < 10) ? "0" : "") + date.getHours();
        ret += ":" + ((date.getMinutes() < 10) ? "0" : "") + date.getMinutes();
        ret += ":" + ((date.getSeconds() < 10) ? "0" : "") + date.getSeconds();
        return ret;
    }

    // 变换旋转角度[0 360]
    public static function fixRotate(rotate:int):int {
        if (rotate < 0) {
            rotate = 360 + rotate;
        } else if (rotate >= 360) {
            rotate = rotate - 360;
        }
        return rotate;
    }

    public static function getPatternSerialFromUrl(url:String):String {
        if (url.indexOf("serial") < 0) {
            return url;
        }
        var re:String = url.split("serial=")[1];
        re = re.split("&")[0];
        return re;
    }

    // 根据dpi,分辨率计算打印尺寸 单位：cm    默认dpi 150
    public static function calPrintSizeWithDPI(pixel:Array, dpi:Number = 150):Array {
        return [Number((pixel[0] / dpi * 2.54).toFixed(2)), Number((pixel[1] / dpi * 2.54).toFixed(2))];
    }
    // 根据尺寸,分辨率计算dpi 单位：cm    默认dpi 150
    public static function calDPI(pixel:Number, size:Number):Number {
        return Math.round(pixel / size * 2.54);
    }


    public static function calPrintPosByRotation(ta: Object): *{
        var re:Object = {};
        var r: int = ta.rotation;
        if(r == 0){
            re = {
                x: ta.x,
                y: ta.y
            }
        }else if( r == 90){
            re = {
                x: ta.x - ta.height,
                y: ta.y
            }
        }else if(r == 270){
            re = {
                x: ta.x,
                y: ta.y - ta.width
            }
        }else if(r == 180){
            re = {
                x: ta.x - ta.width,
                y: ta.y - ta.height
            }
        }

        return {
            x: convertPixelToSize(re.x),
            y: convertPixelToSize(re.y)
        }
    }

    public static function calShowPosByRotation(ta: Object): *{
        var re:Object = {};
        var r: int = ta.rotate;
        if(r == 0){
            re = {
                x: ta.printLeft,
                y: ta.printTop
            }
        }else if( r == 90){
            re = {
                x: ta.printLeft + ta.printH,
                y: ta.printTop
            }
        }else if(r == 270){
            re = {
                x: ta.printLeft,
                y: ta.printTop + ta.printW
            }
        }else if(r == 180){
            re = {
                x: ta.printLeft + ta.printW,
                y: ta.printTop + ta.printH
            }
        }

        return {
            x: convertSizeToPixel(re.x),
            y: convertSizeToPixel(re.y)
        }
    }

    public static function calPosBeforeRotateByCenter(ta:Object):*{
        var re:Object = {};
        var r: int = ta.rotation;
        if(r == 0){
            re = {
                x: ta.x,
                y: ta.y
            }
        }else if( r == 90){
            re = {
                x: ta.x - (ta.width + ta.height) / 2,
                y: ta.y - (ta.height - ta.width) / 2
            }
        }else if(r == 270){
            re = {
                x: ta.x - (ta.width - ta.height) / 2,
                y: ta.y - (ta.height + ta.width) / 2
            }
        }else if(r == 180){
            re = {
                x: ta.x - ta.width,
                y: ta.y - ta.height
            }
        }

        return re;
    }
    public static function calPosAfterRotateByCenter(ta:Object, r: int):*{
        var re:Object = {};
        var before: Object = calPosBeforeRotateByCenter(ta);
        r = fixRotate(ta.rotation + r);

        if(r == 0){
            re = {
                x: before.x,
                y: before.y
            }
        }else if( r == 90){
            re = {
                x: before.x + (ta.width + ta.height) / 2,
                y: before.y + (ta.height - ta.width) / 2
            }
        }else if(r == 270){
            re = {
                x: before.x + (ta.width - ta.height) / 2,
                y: before.y + (ta.height + ta.width) / 2
            }
        }else if(r == 180){
            re = {
                x: before.x + ta.width,
                y: before.y + ta.height
            }
        }

        ta.rotation = r;
        ta.x = re.x;
        ta.y = re.y;
    }

    // 以原始适应target，不可以放大 不能超过target
    public static function scaleFit(ow:Number, oh:Number, tw:Number, th:Number, scaleMode:String = 'fit'):Object{
        var r:Number;
        while (oh > th || ow > tw) {
            r = Math.min(th / oh, tw / ow);
            oh = r * oh;
            ow = r * ow;
        }
        if (scaleMode === 'fill') {
            r = 1;
            while (oh < th || ow < tw) {
                r += 0.01;
                oh = r * oh;
                ow = r * ow;
            }
        }
        // 默认 scaleMode === fit
        return {
            scaleWidth: ow,
            scaleHeight: oh
        };
    }

    // 以最大尺寸适应target，可以放大 但不能超过target
    public static function scaleToFit(ow:Number, oh:Number, tw:Number, th:Number):Object{
        var r:Number;

        r = 1;
        // 先放大到比target大
        while (oh < th || ow < tw) {
            r += 0.01;
            oh = r * oh;
            ow = r * ow;
        }
        // 再缩小
        while (oh > th || ow > tw) {
            r = Math.min(th / oh, tw / ow);
            oh = r * oh;
            ow = r * ow;
        }
        // 默认 scaleMode === fit
        return {
            scaleWidth: ow,
            scaleHeight: oh
        };
    }

    // 以最小尺寸适应target，可以放大 能超过target
    public static function fillToFit(ow:Number, oh:Number, tw:Number, th:Number):Object{

        var r:Number;

        r = 1;
        if(oh < th || ow < tw){
            // 先放大到比target大
            while (oh < th || ow < tw) {
                r += 0.01;
                oh = r * oh;
                ow = r * ow;
            }
            return {
                scaleWidth: ow,
                scaleHeight: oh
            }
        }else{
            // 再缩小
//            while (oh > th || ow > tw) {
                r = Math.max(th / oh, tw / ow);
                oh = r * oh;
                ow = r * ow;
//            }
            // 默认 scaleMode === fit
            return {
                scaleWidth: ow,
                scaleHeight: oh
            };
        }


    }
}
}