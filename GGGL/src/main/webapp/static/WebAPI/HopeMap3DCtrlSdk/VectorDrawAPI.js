/**   
 * @fileOverview 三维控件矢量绘图接口   
 * @author <a href="http://www.ecitychina.com/">EcityCyber</a>   
 * @version 1.0 
 */
 
/**
 * 三维矢量绘图操作接口
 */

function VectorDrawAPI()
{
};

/**
 *
 * 三维矢量绘图操作对象
 */
var VectorDrawOpObj = new VectorDrawAPI();

/**
*   往临时矢量图层添加对象
*   参数参照Hope3DVector对象
*/
VectorDrawAPI.prototype.Add = function(geomJson)
{
    if (HasTDECtrl())
    {
        var param = new Array();
        param[0] = geomJson;
       
        return GetTDECtrl().InvokeCmd("VectorOper", "Add", param);
    }
};

VectorDrawAPI.prototype.StartDrawVector = function (hope3dLabel, callback) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = hope3dLabel;
        param[1] = callback;
        return GetTDECtrl().InvokeCmd("VectorOper", "StartDrawVector", param);
    }
};

/**
 * 开始绘制图形
 *
 * @param name
 *      矢量图形名
 * @param type
 *      矢量图形类型，包括：<code>lines, rectangle, ellipse, polygon, circle, point</code>
 * @param bdColor 
 *      图形边界颜色
 * @param fillColor 
 *      图形填充颜色(线类型无效)
 * @param opacity
 *      透明度
 * @param lineWidth 
 *      线宽
 * @param lineStyle 
 *      线形，包括：<code>solid, dash, dot, dashdot，dashdotdot</code>
 * @param isTemp
 *      是否为临时图形(RemoveTemp()函数是否对其有影响)
 * @param isContinue
 *      是否为连续操作
 * @param callback
 *      回调函数，绘制完成后被调用
 *      该函数将接收三个参数：
 *      第一个参数返回所绘制图形的名称
 *      第二个参数返回所绘制图形的类型
 *      第三个参数返回所绘制图形的几何信息
 *      几何信息<br>
 *      <li>线段信息格式：<br>
 *      <code>x1,y1|x2,y2|...</code>
 *      <li>矩形信息格式：<br>
 *      <code>minx,miny,maxx,maxy</code>
 *      <li>椭圆信息格式：<br>
 *      <code>minx,miny,maxx,maxy</code>
 *      <li>多边形信息格式：<br>
 *      <code>x1,y1|x2,y2|...</code>
 *      <li>圆型信息格式：<br>
 *      <code>minx,miny,maxx,maxy</code>
 *      <li>点信息格式<br>
 *      <code>x,y</code>
 */
VectorDrawAPI.prototype.StartDraw = function(name, type, bdColor, fillColor, opacity, lineWidth, lineStyle, isContinue, isTemp, callback)
{
    if (HasTDECtrl())
    {
        var param = new Array();
        param[0] = name;
        param[1] = type;
        param[2] = bdColor;
        param[3] = fillColor;
        param[4] = opacity;
        param[5] = lineWidth;
        param[6] = lineStyle;
        param[7] = isTemp;
        param[8] = isContinue;
        param[9] = callback;
        return GetTDECtrl().InvokeCmd("VectorOper", "StartDraw", param);
    }
};

/**
 * 结束绘制
 *
 * 该函数将终止正在进行的绘制操作
 */
VectorDrawAPI.prototype.EndDraw = function()
{
    if (HasTDECtrl())
    {
		var param = new Array();
        return GetTDECtrl().InvokeCmd("VectorOper", "EndDraw", param);
    }
};

/**
 * 清除绘制
 *
 * 该函数将清除所有绘制的对象
 */
VectorDrawAPI.prototype.ClearDraw = function()
{
    if (HasTDECtrl())
    {
		var param = new Array();
        return GetTDECtrl().InvokeCmd("VectorOper", "ClearDraw", param);
    }
};

/**
 * 清除绘制
 *
 * 清除临时图层的所有矢量对象
 */
VectorDrawAPI.prototype.RemoveAll = function()
{
    if (HasTDECtrl())
    {
		var param = new Array();
        return GetTDECtrl().InvokeCmd("VectorOper", "RemoveAll", param);
    }
};

VectorDrawAPI.prototype.AddVector = function (vectorJSON) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = vectorJSON;
        return GetTDECtrl().InvokeCmd("VectorOper", "AddVector", param);
    }
};

VectorDrawAPI.prototype.RemoveVector = function (vectorID, layerID) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = vectorID;
        param[1] = layerID;
        return GetTDECtrl().InvokeCmd("VectorOper", "RemoveVector", param);
    }
};

VectorDrawAPI.prototype.RemoveAllVector = function (layerID) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = layerID;
        return GetTDECtrl().InvokeCmd("VectorOper", "RemoveAllVector", param);
    }
};

VectorDrawAPI.prototype.GetTempVectorLayer = function () {
    if (HasTDECtrl()) {
        var param = new Array();
        return GetTDECtrl().InvokeCmd("VectorOper", "GetTempVectorLayer", param);
    }
};

VectorDrawAPI.prototype.CreateVectorLayer = function (layerID,layerName) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = layerID;
        param[1] = layerName;
        return GetTDECtrl().InvokeCmd("VectorOper", "CreateVectorLayer", param);
    }
};



/**
* 三维矢量对象
*
* @param Geom为JSON格式的几何字符串
*/
function Hope3DVector() {
    this.VecotorID = "";
    this.LayerID = "";
    this.Geom = "";
    this.LineColor = 0xFFFF00FF;
    this.FillColor = 0x00333366;
    this.LineWidth = 1.0;
    this.OffsetHeight = 0.0;
    this.Stipple = 0;
};

Hope3DVector.prototype.Show = function () {
    this.VecotorID = VectorDrawOpObj.AddVector(JSON.stringify(this));
}

Hope3DVector.prototype.Remove = function () {
    VectorDrawOpObj.RemoveVector(this.VecotorID, this.LayerID);
}

Hope3DVector.prototype.StartDraw = function (callback) {
    VectorDrawOpObj.StartDrawVector(JSON.stringify(this), callback);
}