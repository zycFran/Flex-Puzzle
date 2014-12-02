/**
 * Created with IntelliJ IDEA.
 * User: zyc
 * Date: 14-11-24
 * Time: 下午11:26
 * To change this template use File | Settings | File Templates.
 */

var puzzleSwf ;
// 模版示例
var templates = [
    {
        layout: "hbox",                  // 布局: hbox(横向布局)  vbox(竖向布局)默认为vbox
        selected: false,                 // 是否启用 默认是false （不是必须项）
        thumbUrl: 'images/temp/tp2.png', // 模版缩略图 （必须项）
        items: [                         // 子元素数组[]，默认为[{flex:1}]
            {flex: 1},                   // : flex(int) 表示划分单元
            {flex: 1}
        ],
        space: 20,                         // 子元素之间的间隔(px)默认5px
        paddingLeft: 10,                  // 模版的左(右)边距 默认10px
        paddingTop: 10,                   // 模版的上(下)边距 默认10px
        width: 500,                       // 模版宽(px)（必须项）
        height: 400                       // 模版高(px)（必须项）
    },
    {
        layout: "vbox",
        selected: true,
        thumbUrl: 'images/temp/tp4.png',
        items: [
            {flex: 2},
            {flex: 1}
        ],
        space: 1,
        width: 500,
        height: 500
    }
];

// 初始化
function onInit()
{
    puzzleSwf = document.getElementById("Puzzle");

    // 设置模版
    puzzleSwf.setTemplate(templates);

    // 设置图片
    puzzleSwf.loadPhoto([
         'http://121.40.192.218/images/zp/thumb/IMG_7571.JPG',
         'http://121.40.192.218/images/zp/thumb/IMG_7609.JPG'
        // "http://open.web.meitu.com/sources/images/1.jpg"
    ]);

    // 自适应屏幕分辨率(默认true) true: 模版大小按照宽高比自动放缩适应屏幕分辨率; false: 模版大小就是设置的宽高
    puzzleSwf.setAutoFit(true);

    // 设置上传地址
    puzzleSwf.setUploadURL("http://121.40.192.218/image_upload.php");

    // 设置上传参数 (object)
    puzzleSwf.setUploadArgs({c:1111, d:"goodluck" });

    //  puzzleSwf.setUploadType(2); 目前只支持type=2的上传（表单上传）

    // 设置上传文件名 默认upload_file
    puzzleSwf.setUploadDataFieldName("upload_file");

    // 设置水印文字 默认无
    puzzleSwf.setWaterLabel("水印文字示例");

    // 设置水印文字大小(int) 默认为35
    puzzleSwf.setWaterLabelSize(35);

    // 设置水印文字颜色(16进制) 默认为0x000000
    puzzleSwf.setWaterLabelColor(0x000000);

    // 设置水印图片 (url) 默认无
    puzzleSwf.setWaterImage('images/test/water.jpg');

    // 图片缩放范围 (倍数)
    puzzleSwf.setMinScale(1);
    puzzleSwf.setMaxScale(3);
}

// 上传前:在图片上传前调用，提供上传前最后一个机会来改变上传数据甚至终止上传，
// 如果需要终止上传，只要返回false，需要继续上传则返回true；同时data参数为object类型
function onBeforeUpload (data)
{
    var size = data.size;
    if(size > 2 * 1024 * 1024)
    {
        alert("图片不能超过2M");
        return false;
    }
    return true;

//    puzzleSwf.setUploadArgs({c:1111, d:"goodluck" });
//    return true;
}
// 上传响应
function onUploadResponse(data)
{
    alert("上传响应" + data);
}

// 上传失败
function onDebug(data)
{
    alert("错误响应" + data);
}