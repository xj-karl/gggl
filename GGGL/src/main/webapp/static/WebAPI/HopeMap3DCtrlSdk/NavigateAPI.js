/**   
 * @fileOverview 三维控件导航接口   
 * @author <a href="http://www.ecitychina.com/">EcityCyber</a>   
 * @version 1.0 
 */
 
/**
 * 导航接口
 */
function NavigateAPI()
{
};

/**
 * 导航操作对象
 */
var NaviOpObj = new NavigateAPI();


/**
 * 设置当前的视点信息 ...高程，距离，方位角，高度角
 */
NavigateAPI.prototype.SetViewPoint = function(x, y, z, heading_deg, pitch_deg, range, duration)
{
    if (HasTDECtrl())
    {
        var param = new Array();
        param[0] = x;
        param[1] = y;
        param[2] = z;
        param[3] = heading_deg;
        param[4] = pitch_deg;
        param[5] = range;
        param[6] = duration;
        return GetTDECtrl().InvokeCmd("NaviOper", "SetViewInfo", param);
    }
};



/**
 * 获取当前的视点信息，关注点x，关注点y，关注点z，方位角，高度角，摄像机与观察点的距离
 *	方位角正北为0度 ，即朝东为90度，南180，西270
 *  高度角水平向前为0度，由上往下看为-90度,仰视天空为90度,由于场景相机问题并不一定能仰视90度看天空
 */
 
NavigateAPI.prototype.GetViewPoint = function()
{
    if (HasTDECtrl())
    {
        var param = new Array();
		
        var result = GetTDECtrl().InvokeCmd("NaviOper", "GetViewInfo", param);
		
		//alert(result);
		
		param = result.split(",");
		
		return param;
    }
};

/**
 * 路径漫游
 *	
 */
NavigateAPI.prototype.ShowTravelTool = function()
{
    if (HasTDECtrl())
    {
        var param = new Array();
		
        return GetTDECtrl().InvokeCmd("NaviOper", "ShowTravelTool", param);
    }
};

/**
 * 路径漫游
 *	
 */
NavigateAPI.prototype.CreateTravel = function()
{
    if (HasTDECtrl())
    {
        var param = new Array();
		
        return GetTDECtrl().InvokeCmd("NaviOper", "CreateTravel", param);
    }
};

/**
 * 路径漫游
 *	
 */
NavigateAPI.prototype.AddPathPoint = function(x,y,z)
{
    if (HasTDECtrl())
    {
        var param = new Array();
		param[0] = x;
		param[1] = y;
		param[2] = z;
        return GetTDECtrl().InvokeCmd("NaviOper", "AddPathPoint", param);
    }
};

/**
 * 路径漫游
 *	
 */
NavigateAPI.prototype.StartStravel = function()
{
    if (HasTDECtrl())
    {
        var param = new Array();
		
        return GetTDECtrl().InvokeCmd("NaviOper", "StartStravel", param);
    }
};

/**
 * 路径漫游
 *	
 */
NavigateAPI.prototype.EndStravel = function()
{
    if (HasTDECtrl())
    {
        var param = new Array();
		
        return GetTDECtrl().InvokeCmd("NaviOper", "EndStravel", param);
    }
};

/**
 * 设置速度
 *	
 */
NavigateAPI.prototype.SetSpeed = function(speed)
{
    if (HasTDECtrl())
    {
        var param = new Array();
		param[0] = speed;
        return GetTDECtrl().InvokeCmd("NaviOper", "SetSpeed", param);
    }
};

/**
 * 设置焦点距离
 *	
 */
NavigateAPI.prototype.SetRange = function(range)
{
    if (HasTDECtrl())
    {
        var param = new Array();
		param[0] = range;
        return GetTDECtrl().InvokeCmd("NaviOper", "SetRange", param);
    }
};


/**
* 设置视角跟随
*	
*/
NavigateAPI.prototype.SetAutoTravel = function (isOpen) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = isOpen;
        return GetTDECtrl().InvokeCmd("NaviOper", "SetAutoTravel", param);
    }
};

/**
* 设置漫游过程的俯仰角
*	
*/
NavigateAPI.prototype.SetConstantTile = function (isOpen,angle) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = isOpen;
        param[1] = angle;
        return GetTDECtrl().InvokeCmd("NaviOper", "SetTilt", param);
    }
};

/**
 * 路径是否可视
 *	
 */
NavigateAPI.prototype.RouteVisible = function(visible)
{
    if (HasTDECtrl())
    {
        var param = new Array();
		param[0] = visible;
        return GetTDECtrl().InvokeCmd("NaviOper", "RouteVisible", param);
    }
};

/**
 * 设置场景位置移动事件回调函数
 *	
 */
NavigateAPI.prototype.RegisterOnMoveEvent = function(callback)
{
    if (HasTDECtrl())
    {
        var param = new Array();
		param[0] = callback;
        return GetTDECtrl().InvokeCmd("NaviOper", "RegisterOnMoveEvent", param);
    }
};

/**
* 设置场景位置移动事件回调函数
*	
*/
NavigateAPI.prototype.RegisterOnMoveEvent = function (callback) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = callback;
        return GetTDECtrl().InvokeCmd("NaviOper", "RegisterOnMoveEvent", param);
    }
};

/**
* 设置场景切换平面、球面的回调函数
*	
*/
NavigateAPI.prototype.RegisterOnChangeSceneEvent = function (callback)
{
    if (HasTDECtrl())
    {
        var param = new Array();
        param[0] = callback;
        return GetTDECtrl().InvokeCmd("NaviOper", "RegisterOnChangeSceneEvent", param);
    }
};

NavigateAPI.prototype.SetPlanePlayer = function()
{
    if (HasTDECtrl())
    {
        var param = new Array();
        return GetTDECtrl().InvokeCmd("NaviOper", "SetPlanePlayer", param);
    }
};

NavigateAPI.prototype.SetPersonPlayer = function()
{
    if (HasTDECtrl())
    {
        var param = new Array();
        return GetTDECtrl().InvokeCmd("NaviOper", "SetPersonPlayer", param);
    }
};

/**
 * 暂停
 *	
 */
NavigateAPI.prototype.PauseTravel = function()
{
    if (HasTDECtrl())
    {
        var param = new Array();

        return GetTDECtrl().InvokeCmd("NaviOper", "PauseTravel", param);
    }
};

/**
 * 继续
 *	
 */
NavigateAPI.prototype.ResumeTravel = function()
{
    if (HasTDECtrl())
    {
        var param = new Array();
		
        return GetTDECtrl().InvokeCmd("NaviOper", "ResumeTravel", param);
    }
};

/**
 * 模型是否可视
 *	
 */
NavigateAPI.prototype.SetModelVisible = function(visible)
{
    if (HasTDECtrl())
    {
        var param = new Array();
		param[0] = visible;
        return GetTDECtrl().InvokeCmd("NaviOper", "SetModelVisible", param);
    }
};

/**
 * 导航图标
 *	
 */
NavigateAPI.prototype.AddLabel = function(x,y,z,text,icon)
{
    if (HasTDECtrl())
    {
        var param = new Array();
		param[0] = x;
		param[1] = y;
		param[2] = z;
		param[3] = text;
		param[4] = icon;
        return GetTDECtrl().InvokeCmd("NaviOper", "AddLabel", param);
    }
};

/**
 * 导航图标
 *	
 */
NavigateAPI.prototype.RemoveAllLabel = function()
{
    if (HasTDECtrl())
    {
        var param = new Array();

        return GetTDECtrl().InvokeCmd("NaviOper", "RemoveAllLabel", param);
    }
};

/**
* 开启地下浏览
*	
*/
NavigateAPI.prototype.SetUnderGroundView = function (height) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = height;
        return GetTDECtrl().InvokeCmd("NaviOper", "SetUnderGroundView", param);
    }
};

/**
* 关闭地下浏览
*	
*/
NavigateAPI.prototype.CloseUnderGroundView = function () {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = "0";
        return GetTDECtrl().InvokeCmd("NaviOper", "SetUnderGroundView", param);
    }
};

/**
* 跟随模型
*	
*/
NavigateAPI.prototype.TraceFeature = function (featureID,layerID) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = featureID;
        param[1] = layerID;

        return GetTDECtrl().InvokeCmd("NaviOper", "TraceFeature", param);
    }
};

/**
* 停止跟随模型
*	
*/
NavigateAPI.prototype.EndTrace = function () {
    if (HasTDECtrl()) {
        var param = new Array();
        return GetTDECtrl().InvokeCmd("NaviOper", "EndTrace", param);
    }
};

/**
* 设置范围事件回调函数(跟随的模型走到某个范围内触发的事件)
*	
*/
NavigateAPI.prototype.SetRegionEventCallback = function (jsFunc) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = jsFunc;
        return GetTDECtrl().InvokeCmd("NaviOper", "SetRegionEventCallback", param);
    }
};


/**
* 添加范围事件(跟随的模型走到某个范围内触发的事件)
*	
*/
NavigateAPI.prototype.AddRegionEvent = function (regionObj) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = regionObj;
        return GetTDECtrl().InvokeCmd("NaviOper", "AddRegionEvent", param);
    }
};
