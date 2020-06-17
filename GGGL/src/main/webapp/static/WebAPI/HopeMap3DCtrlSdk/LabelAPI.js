/**   
 * @fileOverview 三维控件三维标注操作接口   
 * @author <a href="http://www.ecitychina.com/">EcityCyber</a>   
 * @version 1.0 
 */
 
/**
 * 三维标注操作接口
 */
function LabelAPI()
{
};

/**
 * 三维标注操作对象
 */
var LabelOpObj = new LabelAPI();

/**
 * 添加 标注
 *
 * @param Label_JSON
 *      创建标注的参数,参照Hope3DLabel
 * @return 
 *      返回创建标注的Identify
 */
LabelAPI.prototype.AddLabel = function(Label_JSON)
{
    if (HasTDECtrl())
    {
        var param = new Array();
        param[0] = Label_JSON;
        return GetTDECtrl().InvokeCmd("LabelOper", "AddLabel", param);
    }
};

/**
 * 移除
 */
LabelAPI.prototype.RemoveLabel = function (name, layerID)
{
    if (HasTDECtrl())
    {
        var param = new Array();
        param[0] = name;
        param[1] = layerID;
        return GetTDECtrl().InvokeCmd("LabelOper", "RemoveLabel", param);
    }
};

/**
 * 注记特效
 */
LabelAPI.prototype.SetLabelEffect = function (name, layerID,effectStyle) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = name;
        param[1] = layerID;
        param[2] = effectStyle;
        return GetTDECtrl().InvokeCmd("LabelOper", "SetLabelEffect", param);
    }
}


/**
* 移除图层所有对象
*/
LabelAPI.prototype.RemoveAll = function (layerID) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = layerID;
        return GetTDECtrl().InvokeCmd("LabelOper", "RemoveAll", param);
    }
};

/**
 * 创建注记图层
 */
LabelAPI.prototype.CreateLayer = function(Layer_JSON)
{
    if (HasTDECtrl())
    {
        var param = new Array();
		param[0] = Layer_JSON;
        return GetTDECtrl().InvokeCmd("LabelOper", "CreateLayer", param);
    }
};

/**
 * 获取临时注记图层
 */
LabelAPI.prototype.GetTempLayer = function()
{
    if (HasTDECtrl())
    {
        var param = new Array();
        return GetTDECtrl().InvokeCmd("LabelOper", "GetTempLayer", param);
    }
};

// ToolTip
/**
 * 添加Tooltip
 * 该函数会自动调整ToolTip的位置
 * 如果需要手动控制，请使用 SetToolTipPos方法
 *
 * @param x,y,z
 *      ToolTip指向的三维点
 * @bdColor
 *      边框颜色
 * @param width,height
 *      ToolTip的高宽
 * @return 
 *      创建ToolTip的名称
 */
LabelAPI.prototype.AddToolTip = function(JSON_XYZ)
{
    if (HasTDECtrl())
    {
        var param = new Array();
        param[0] = JSON_XYZ;
        return GetTDECtrl().InvokeCmd("LabelOper", "AddToolTip", param);
    }
}

LabelAPI.prototype.HideToolTip = function () {
    if (HasTDECtrl()) {
        var param = new Array();
        return GetTDECtrl().InvokeCmd("LabelOper", "HideToolTip", param);
    }
}

/**
* 三维标注对象
*
* @param Type有TextAndIcon,Bubble
*/
function Hope3DLabel() {
    this.LabelID = "";
    this.LayerID = "";
    this.Text = "";
    this.Url = "";
    this.Type = "TextAndIcon";
    this.OffsetX = 0;
    this.OffsetY = 0;
    this.OffsetZ = 0;
    this.Scale = 1.0;
    this.FontSize = 12;
    this.Opacity = 0.8;
    this.FontColor = 0xFFFFFFFF;
    this.BorderColor = 0x000000FF;
    this.BackGroundColor = 0xFFFFFFFF;
    this.VisibleDistance = 5000;
    this.BubbleTipStyle = "bw:1.2;aw:20;ah:40;cr:8"; //[bw]border width,[aw]arrow width,[ah]arraow heigth,[cr]corner radius
};

Hope3DLabel.prototype.Show = function () {
    this.LabelID = LabelOpObj.AddLabel(JSON.stringify(this));
}

Hope3DLabel.prototype.Remove = function () {
    LabelOpObj.RemoveLabel(this.LabelID, this.LayerID);
}

Hope3DLabel.prototype.HighLight = function () {
    LabelOpObj.SetLabelEffect(this.LabelID, this.LayerID, "effect:scale-animation;loop:2;");
}