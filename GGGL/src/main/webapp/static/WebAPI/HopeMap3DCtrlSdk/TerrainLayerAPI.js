/**   
 * @fileOverview 三维控件地形图层接口
 * @author <a href="http://www.ecitychina.com/">EcityCyber</a>   
 * @version 1.0 
 */

/**
 * 图层操作接口
 */
function TerrainLayerAPI()
{
};

/**
 * 图层操作对象
 */
var TerrainLayerOpObj = new TerrainLayerAPI();

/**
 * 地形图层透明设置
 */
TerrainLayerAPI.prototype.SetTerrainOpacity = function(opacity)
{
    if (HasTDECtrl())
    {
        var param = new Array();
        param[0] = opacity;
        return GetTDECtrl().InvokeCmd("TerrainLayerOper", "SetTerrainOpacity", param);
    }
};

/**
 * 地形图层透明设置
 */
TerrainLayerAPI.prototype.ShowTerrainOption = function()
{
    if (HasTDECtrl())
    {
        var param = new Array();

        return GetTDECtrl().InvokeCmd("TerrainLayerOper", "ShowTerrainOption", param);
    }
};

/**
 * 开始地形开挖
 */
TerrainLayerAPI.prototype.StartTerrainGrub = function()
{
    if (HasTDECtrl())
    {
        var param = new Array();
        param[0] = "";
        return GetTDECtrl().InvokeCmd("TerrainLayerOper", "StartTerrainGrub", param);
    }
};

TerrainLayerAPI.prototype.StartTerrainGrubEx = function(callback)
{
    if (HasTDECtrl())
    {
        var param = new Array();
        param[0] = callback;
        return GetTDECtrl().InvokeCmd("TerrainLayerOper", "StartTerrainGrub", param);
    }
};

/**
 * 设置开挖深度
 */
TerrainLayerAPI.prototype.SetDepth = function(depth)
{
    if (HasTDECtrl())
    {
        var param = new Array();
		param[0] = depth;
        return GetTDECtrl().InvokeCmd("TerrainLayerOper", "SetDepth", param);
    }
};

/**
* 设置开挖角度,参数个数小于边个数，以最后一个参数往后设置每个边的角度
* 30 30 45 45
*/
TerrainLayerAPI.prototype.SetAngles = function (angles) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = angles;
        return GetTDECtrl().InvokeCmd("TerrainLayerOper", "SetAngles", param);
    }
};

/**
* 
*/
TerrainLayerAPI.prototype.Digging = function () {
    if (HasTDECtrl()) {
        var param = new Array();
        return GetTDECtrl().InvokeCmd("TerrainLayerOper", "Digging", param);
    }
};

/**
 * 清除开挖
 */
TerrainLayerAPI.prototype.ClearGrub = function()
{
    if (HasTDECtrl())
    {
        var param = new Array();

        return GetTDECtrl().InvokeCmd("TerrainLayerOper", "ClearGrub", param);
    }
};

/**
 * 结束地形开挖
 */
TerrainLayerAPI.prototype.EndTerrainGrub = function()
{
    if (HasTDECtrl())
    {
        var param = new Array();

        return GetTDECtrl().InvokeCmd("TerrainLayerOper", "EndTerrainGrub", param);
    }
};