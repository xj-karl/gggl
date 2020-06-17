/**   
 * @fileOverview 三维控件量测工具接口   
 * @author <a href="http://www.ecitychina.com/">EcityCyber</a>   
 * @version 1.0 
 */
 
/**
 * 三维量测工具操作接口
 */
function MeasureToolAPI()
{
};

/**
 * 三维量测工具操作对象
 */
var MTOpObj = new MeasureToolAPI();

/**
 * 设置颜色，文字颜色，线颜色和填充颜色
 */
MeasureToolAPI.prototype.SetColor = function(textColor, lineColor, fillColor)
{

};

/**
 * 量测距离
 */
MeasureToolAPI.prototype.MeasureDistacne = function()
{
	if (HasTDECtrl())
    {
        var param = new Array();
        return GetTDECtrl().InvokeCmd("MeasureToolOper", "MeasureDistacne", param);
    }
};

/**
 * 量测面积
 */
MeasureToolAPI.prototype.MeasureArea = function()
{
    if (HasTDECtrl()) {
        var param = new Array();
        return GetTDECtrl().InvokeCmd("MeasureToolOper", "MeasureArea", param);
    }
};

MeasureToolAPI.prototype.MeasureHorLine = function()
{
    if (HasTDECtrl()) {
        var param = new Array();
        return GetTDECtrl().InvokeCmd("MeasureToolOper", "MeasureHor", param);
    }
};

MeasureToolAPI.prototype.MeasureVerLine = function()
{
    if (HasTDECtrl()) {
        var param = new Array();
        return GetTDECtrl().InvokeCmd("MeasureToolOper", "MeasureVer", param);
    }
};

MeasureToolAPI.prototype.MeasureBeeLine = function()
{
    if (HasTDECtrl()) {
        var param = new Array();
        return GetTDECtrl().InvokeCmd("MeasureToolOper", "MeasureBeeline", param);
    }
};

/**
 * 结束量测
 */
MeasureToolAPI.prototype.EndMeasure = function()
{
	var param = new Array();
	return GetTDECtrl().InvokeCmd("MeasureToolOper", "EndMeasure", param);
};

