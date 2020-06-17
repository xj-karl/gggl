/**
 * @fileOverview 三维控件
 * @author <a href="http://www.ecitychina.com/">EcityCyber</a>   
 * @version 1.0 
 */ 

/**
 * 三维控件接口对象
 */
var _3DControl;

/**
 * 获取三维控件对象
 *
 * @ return 三维控件对象
 */
function GetTDECtrl() 
{
    HasTDECtrl();
    return _3DControl;
}

/**
 * 判断是否有三维控件接口对象
 * 
 * @return true或false
 */
function HasTDECtrl()
{
    if (_3DControl != null && _3DControl != "")
    {
        return true;
    }
    
    var version = "";
    
    _3DControl = document.getElementById("Web3DCtrl");
    if (_3DControl != null)
    {
        try
        {
            version = _3DControl.InvokeCmd("CommonOper", "GetVersion", null);
        }
        catch(e)
        {
            _3DControl = null;
        }
    }
    
    if (_3DControl == null)
    {
        _3DControl = document.getElementById("npWeb3DCtrl");
        
        try
        {
            version = _3DControl.InvokeCmd("CommonOper", "GetVersion", null);
        }
        catch(e)
        {
            _3DControl = null;
        }
    }
    
    if (_3DControl != null) return true;
    
    return false;
};

/**
 * 获取三维控件所在网页的地址
 * 
 * @return 网页URL
 */
function GetCtrlBaseURL()
{
    return document.URL;
};

/**
 * 获取三维控件参数
 * 
 * @return 三维控件的参数
 */
function GetCtrlParam()
{
    if (HasTDECtrl())
    {
        var paramstr = "";
        var ctrl = GetTDECtrl();
        var params = ctrl.childNodes;
        for (var i = 0; i < params.length; ++i)
        {
            var param = params[i];
            if (param.tagName == "PARAM")
            {
                var name = param["name"];
                name = name.replace(/%/g, "%1");
                name = name.replace(/=/g, "%2");
                name = name.replace(/&/g, "%3");
                var value = param["value"];
                value = value.replace(/%/g, "%1");
                value = value.replace(/=/g, "%2");
                value = value.replace(/&/g, "%3");
                paramstr += name + "=" + value + "&";            
            }
            
        }
        paramstr = paramstr.substr(0, paramstr.length - 1);
        return paramstr;
    }
    
    return null;
};

/**
 * 获取对象的绝对位置
 * 
 * @return var[2]
 */
function GetAbsolutePos(obj) 
{
    var ow = new Array(0, 0);
    var pw = obj;
    while (pw && pw.offsetParent) 
    {
        ow[0] += pw.offsetLeft;
        ow[1] += pw.offsetTop;
        pw = pw.offsetParent;
    }
    return ow;
}

/**
 * 函数：获取窗口大小
 * 
 * 该函数支持主流浏览器
 */
function findDimensions() 
{
    var winWidth = 0;
    var winHeight = 0;

     //获取窗口宽度
     if (window.innerWidth)
           winWidth = window.innerWidth;
     else if ((document.body) && (document.body.clientWidth))
           winWidth = document.body.clientWidth;
     //获取窗口高度
     if (window.innerHeight)
           winHeight = window.innerHeight;
     else if ((document.body) && (document.body.clientHeight))
           winHeight = document.body.clientHeight;
   
     //通过深入Document内部对body进行检测，获取窗口大小
     if (document.documentElement  
        && document.documentElement.clientHeight 
        && document.documentElement.clientWidth)
     {
         winHeight = document.documentElement.clientHeight;
         winWidth = document.documentElement.clientWidth;
     }
     
     //结果输出
     var size = new Array(winWidth, winHeight);
     return size;
}


/**
 * 通用操作接口
 */
function CommonOperAPI()
{
};


/**
 * 通用操作对象
 */
var CommonOpObj = new CommonOperAPI();

/*
* 获取三维控件版本信息
*
*/
CommonOperAPI.prototype.GetVersion = function () {
    if (HasTDECtrl()) {
        return GetTDECtrl().InvokeCmd("CommonOper", "GetVersion", null);
    }
}

/*
* 获取三维控件是32还是64位
*
*/
CommonOperAPI.prototype.GetPlatform = function () {
    if (HasTDECtrl()) {
        return GetTDECtrl().InvokeCmd("CommonOper", "GetPlatform", null);
    }
}

/*
* 切换三维视图显示模式
* @param mode "earth" or "space"
*
*/
CommonOperAPI.prototype.SetDisplayMode = function (mode)
{
    if (HasTDECtrl())
    {
        var param = new Array();
		param[0] = mode;
		param[1] = "0";
		param[2] = "0";
        return GetTDECtrl().InvokeCmd("CommonOper", "SetVisibleMode", param);
    }
}

/*
 * 获取三维控件工作目录
 *
 */
CommonOperAPI.prototype.GetWorkDirectory = function ()
{
    if (HasTDECtrl())
    {
        var param = new Array();
        return GetTDECtrl().InvokeCmd("CommonOper", "GetCtrlPath", param);
    }
}

/*
* 获取三维点对应的屏幕坐标
*
* @param x,y,z
*      三维坐标点
* @return 返回对应的屏幕坐标，起始坐标为三维窗口的左下角
*      格式："x,y"
*/
CommonOperAPI.prototype.GetScreenPoint = function (x, y, z) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = x;
        param[1] = y;
        param[2] = z;
        return eval("(" + GetTDECtrl().InvokeCmd("CommonOper", "GetScreenPoint", param) + ")");
    }
}

/*
 * 拾取要素
 *
 */
 CommonOperAPI.prototype.StartPick = function (query_callback)
{	
	if (HasTDECtrl())
	{
		var param = new Array();
		param[0] = query_callback;
		return GetTDECtrl().InvokeCmd("CommonOper","PickModel",param);
	}
};

CommonOperAPI.prototype.StartPickEx = function (query_callback)
{	
	if (HasTDECtrl())
	{
		var param = new Array();
		param[0] = query_callback;
		return GetTDECtrl().InvokeCmd("CommonOper","PickModel",param);
	}
};

/*
 * 停止拾取要素
 *
 */
CommonOperAPI.prototype.EndPickModel = function ()
{	
    if (HasTDECtrl())
    {
		var param = new Array();
		return GetTDECtrl().InvokeCmd("CommonOper","EndPickModel",param);
	}
};

CommonOperAPI.prototype.SetSkyBoxOn = function ()
{	
    if (HasTDECtrl())
    {
		var param = new Array();
		param[0] = "true";
		return GetTDECtrl().InvokeCmd("CommonOper","setSkyBoxVisible",param);
	}
};


CommonOperAPI.prototype.SetSkyBoxOff = function ()
{	
    if (HasTDECtrl())
    {
		var param = new Array();
		param[0] = "false";
		return GetTDECtrl().InvokeCmd("CommonOper","setSkyBoxVisible",param);
	}
};

 CommonOperAPI.prototype.AddWaterEffect = function (x,y,z)
{	
    if (HasTDECtrl())
    {
		var param = new Array();
		param[0] = x;
		param[1] = y;
		param[2] = z;
		return GetTDECtrl().InvokeCmd("CommonOper","AddWaterEffect",param);
	}
};

CommonOperAPI.prototype.ClearWaterEffect = function ()
{	
    if (HasTDECtrl())
    {
		var param = new Array();
		return GetTDECtrl().InvokeCmd("CommonOper","ClearWaterEffect",param);
	}
};

CommonOperAPI.prototype.LoadXML = function (name)
{	
    if (HasTDECtrl())
    {
		var param = new Array();
		param[0] = name;
		GetTDECtrl().InvokeCmd("CommonOper","LoadXML",param);
	}
};

CommonOperAPI.prototype.SetConfig_AnimeScaleTime = function (time,scale)
{	
    if (HasTDECtrl())
    {
		var param = new Array();
		param[0] = time;
		param[0] = scale;
		GetTDECtrl().InvokeCmd("CommonOper","SetConfig_AnimeScaleTime",param);
	}
};

/*
* 显示Cegui菜单工具条
*
*/
CommonOperAPI.prototype.ShowUI = function (name) {
    this.SetGUI(name);
    if (HasTDECtrl()) {
        var param = new Array();
        GetTDECtrl().InvokeCmd("CommonOper", "ShowGUI", param);
    }
};

/*
* 隐藏Cegui菜单工具条
*
*/
CommonOperAPI.prototype.HideUI = function () {
    if (HasTDECtrl()) {
        var param = new Array();
        GetTDECtrl().InvokeCmd("CommonOper", "HideGUI", param);
    }
};

/*
* 显示WebKit菜单工具条(无效)
*
*/
CommonOperAPI.prototype.ShowWebKit = function () {
    if (HasTDECtrl()) {
        var param = new Array();
        GetTDECtrl().InvokeCmd("CommonOper", "ShowWebKit", param);
    }
};

/*
* 隐藏WebKit菜单工具条(无效)
*
*/
CommonOperAPI.prototype.HideWebKit = function () {
    if (HasTDECtrl()) {
        var param = new Array();
        GetTDECtrl().InvokeCmd("CommonOper", "HideWebKit", param);
    }
};

/*
* 设置显示哪个GUI，根据UI的config名称来判断
*
*/
CommonOperAPI.prototype.SetGUI = function (name) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = name;
        GetTDECtrl().InvokeCmd("CommonOper", "SetGUI", param);
    }
};

/*
* 发送命令给Cegui，执行各种操作
* command参数样例1
* "oper:ShowEmptyFrame;alpha:0.5;x:100;y:100;width:200;height:400;"
* 显示背景框，透明度，位置，大小
*
* command参数样例2
* "oper:HideEmptyFrame;"
* 隐藏背景框
*
*  command参数样例3 (文字框)
* "oper:showtooltip;alpha:0.5;x:100;y:100;width:200;height:400;FontColor:0xFF0000FF;Text:文字1\r\n文字2""
*
*
*
*  command参数样例3 (表格框)
*
*   var TipContent = {
        NameAndValues : null
    };

    TipContent.NameAndValues = new Array;
    TipContent.NameAndValues[0] = {n:"字段1", v:"属性值1" };
    TipContent.NameAndValues[1] = {n:"字段2", v:"属性值2" };
    TipContent.NameAndValues[2] = {n:"字段3", v:"属性值3" };
*
* "oper:showtooltip_table;alpha:0.5;x:100;y:100;width:200;height:400;FontColor:0xFF0000FF;Text:" + JSON.stringify(TipContent);
*/
CommonOperAPI.prototype.InvokeGUI = function (command) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = command;
        GetTDECtrl().InvokeCmd("CommonOper", "InvokeGUI", param);
    }
};

/*
* 绑定Cegui菜单点击的回调函数
*/
CommonOperAPI.prototype.BindGUIEventFunction = function (jsFunctionName) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = jsFunctionName;
        GetTDECtrl().InvokeCmd("CommonOper", "BindGUIEventFunction", param);
    }
};

/*
* 
*
*/
CommonOperAPI.prototype.ShowTool = function (jsonDialog) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = jsonDialog;
        GetTDECtrl().InvokeCmd("CommonOper", "ShowTool", param);
    }
};

/*
* 
*
*/
CommonOperAPI.prototype.ShowDialog = function (jsonDialog) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = jsonDialog;
        GetTDECtrl().InvokeCmd("CommonOper", "ShowDialog", param);
    }
};

/*
* 添加屏幕图片（图例用）
*/
CommonOperAPI.prototype.AddCustomImage = function (JSON_Param) {
    if (HasTDECtrl()) {
        var param = new Array();
		param[0] = JSON_Param;
        GetTDECtrl().InvokeCmd("CommonOper", "AddCustomImage", param);
    }
};

/*
* 移除屏幕图片（图例用）
*/
CommonOperAPI.prototype.RemoveCustomImage = function (name) {
    if (HasTDECtrl()) {
        var param = new Array();
		param[0] = name;
        GetTDECtrl().InvokeCmd("CommonOper", "RemoveCustomImage", param);
    }
};

/*
* 设置场景的复位位置point格式:"x y z"
*/
CommonOperAPI.prototype.SetProjectedHome = function (point) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = point;
        GetTDECtrl().InvokeCmd("CommonOper", "SetProjectedHome", param);
    }
}

/*
* 设置场景配置键值对
*/
CommonOperAPI.prototype.SetConfig = function (name, val) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = name;
        param[1] = val;
        GetTDECtrl().InvokeCmd("CommonOper", "SetConfig", param);
    }
}

/*
* 设置立体模式
* @mode 可传值 ANAGLYPHIC,HORIZONTAL_SPLIT,VERTICAL_SPLIT
*/
CommonOperAPI.prototype.SetStereoMode = function (mode) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = mode;
        GetTDECtrl().InvokeCmd("CommonOper", "SetStereoMode", param);
    }
}

/*
* 设置天气
* @mode 可传值 ANAGLYPHIC,HORIZONTAL_SPLIT,VERTICAL_SPLIT
*/
CommonOperAPI.prototype.SetWeather = function (mode,density) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = mode;
        param[1] = density;
        GetTDECtrl().InvokeCmd("CommonOper", "SetWeather", param);
    }
}

/*
* 设置全屏
*/
CommonOperAPI.prototype.SetFullScreen = function () {
    if (HasTDECtrl()) {
        var param = new Array();
        GetTDECtrl().InvokeCmd("HopeMap3DControl", "SetFullScreen", param);
    }
}

/*
* 设置全屏
*/
CommonOperAPI.prototype.SetDeclutteringOptions = function (style) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = style;
        GetTDECtrl().InvokeCmd("CommonOper", "SetDeclutteringOptions", param);
    }
}

/*
* 启动工具
*/
CommonOperAPI.prototype.StartTool = function (toolname) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = toolname;
        GetTDECtrl().InvokeCmd("CommonOper", "StartTool", param);
    }
}


/**
* 三维自定义图片对象
*
* @param  VerticalALIGN : top,center,bottom
*		  HorizonALIGN : left,center,right
*		  Mergin : left:0;bottom:0;top:0;right:0
*/
function Hope3DImage() {
    this.Name = "";
    this.Url = "";
    this.HorizonALIGN = "left";
    this.VerticalALIGN = "bottom";
    this.Mergin = "bottom:1";
    this.Height = 0;
    this.Width = 0;
};

Hope3DImage.prototype.Show = function () {
    CommonOpObj.AddCustomImage(JSON.stringify(this));
}

Hope3DImage.prototype.Remove = function () {
    CommonOpObj.RemoveCustomImage(this.Name);
}

/**
* 三维控件初始化结束后的回调函数
*/
function OnHopeMap3DCoreIntialized()
{	
    if (HasTDECtrl())
    {
		onHopeMap3DInitialize();
	}
};



