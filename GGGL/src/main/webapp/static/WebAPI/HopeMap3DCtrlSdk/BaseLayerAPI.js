/**   
 * @fileOverview 三维图层接口
 * @author <a href="http://www.ecitychina.com/">EcityCyber</a>   
 * @version 1.0 
 */
 
/**
 * 图层操作接口
 */
function BaseLayerAPI()
{
};

/**
 * 图层操作对象
 */
var BaseLayerOpObj = new BaseLayerAPI();


/**
 * 创建图层
 *
 */
BaseLayerAPI.prototype.Create = function(name, url)
{
    if (HasTDECtrl())
    {
        var param = new Array();
        param[0] = name;
        param[1] = url;
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "Create", param);
    }
};

/**
* 获取图层ID
*
*/
BaseLayerAPI.prototype.GetLayerByName = function (name) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = name;
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "GetLayerByName", param);
    }
};

/**
* 删除图层
*
*/
BaseLayerAPI.prototype.Remove = function (layerID) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = layerID;
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "Remove", param);
    }
};

/**
* 判断图层是否存在
*
*/
BaseLayerAPI.prototype.IsExist = function (layerID) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = layerID;
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "IsExist", param);
    }
};

/**
* 获取子图层数
*
* @return 返回子图层个数，字符串类型
*/
BaseLayerAPI.prototype.GetChildNum = function (name) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = name;
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "GetChildNum", param);
    }
};

/**
* 跳转到图层视角
*
*/
BaseLayerAPI.prototype.JumpToLayer = function (layerID) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = layerID;
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "JumpToLayer", param);
    }
};

/**
* 创建地形图层
*
*/
BaseLayerAPI.prototype.CreateTerrainLayer = function(name, url, isScene)
{
    if (HasTDECtrl())
    {
        var param = new Array();
        param[0] = name;
        param[1] = url;
		param[2] = isScene;
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "CreateTerrainLayer", param);
    }
};

/**
 * 创建模型图层
 *
 */
BaseLayerAPI.prototype.CreateFeatureLayer = function(name, url, unuse)
{
    if (HasTDECtrl())
    {
        var param = new Array();
        param[0] = name;
        param[1] = url;
		param[2] = unuse;
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "CreateFeatureLayer", param);
    }
};

/**
* 设置图层属性
*
*/
BaseLayerAPI.prototype.SetLayerConfig = function (jsonStr) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = jsonStr;
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "SetLayerConfig", param);
    }
};

/**
* 设置要素属性
*
*/
BaseLayerAPI.prototype.SetFeatureConfig = function (jsonStr) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = jsonStr;
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "SetFeatureConfig", param);
    }
};

/**
 * 获取临时三维要素图层
 *
 */
BaseLayerAPI.prototype.GetTempFeatureLayer = function()
{
    if (HasTDECtrl())
    {
        var param = new Array();
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "GetTempFeatureLayer", param);
    }
};

/**
 * 获取临时三维注记图层
 *
 */
BaseLayerAPI.prototype.GetTempLabelLayer = function()
{
    if (HasTDECtrl())
    {
        var param = new Array();
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "GetTempLabelLayer", param);
    }
};

/**
 *  创建要素
 *  featureInfo 为json对象，创建需要赋值如下信息
 *  featureInfo.FeatureName = "要素ID，可传空";
 *	featureInfo.offsetX = 489710.25;
 *	featureInfo.offsetY = 3312747.25;
 *	featureInfo.offsetZ = 0;
 *	featureInfo.scaleX = 1.0;
 *	featureInfo.scaleY = 1.0;
 *	featureInfo.scaleZ = 1.0;
 *	featureInfo.angle = -20;
 *	featureInfo.LayerID = "图层ID";
 *	featureInfo.FeatureUrl = "global://储罐/youlun.ive";
 *
 *
 *  FeatureUrl的传值协议说明:
 *  1、global://
       用以加载用来在场景中控制的模型（如路径动画、骨骼动画等）
 *  global://储罐/youlun.ive 表示加载控件客户端data/储罐 目录下的youlun.ive模型



 *  2、effect://
 *     加载特效
 *  
 *  var EffectParam = {
				type: "",
				width : 0,
				height : 0,
				length : 0,
				configFileName:""
			};
    EffectParam.type = "light_fire";	
	EffectParam.configFileName = "LightFire.txt";

    type可传值:light_fire,water_spout,smoke
    configFileName对应为:LightFire.txt,WaterSpout.txt,smokeDiffuse.txt

 *  由于参数过多，通过上述txt控制粒子的参数，如水流大小方向扩散范围等等
 *  featureInfo.FeatureUrl = "effect://" + JSON.stringify(EffectParam);

 *  3、model://
 *     简易建模协议，通过传递参数构建如集装箱、集装箱的集卡等模型


 *  var ModelParam = {
 *					ModelType: "",
 *					width : 2.2,
 *					height : 2.37,
 *					length : 5.0,
 *					color : "color_1",
 *					code : "10086",
 *					Box2_Color : "color_8",
 *					Box2_Code: "未知",
 *					Icon: "Image:1_3.png;HorizonAlign:right;VerticalAlign:top;size:1;",
 *					Icon2: "Image:1_4.png;HorizonAlign:left;VerticalAlign:bottom;size:0.5;"
 *	        };
 *  a、ModelParam.ModelType可传递值有:Box_Only,Car1_Only,Car2_Only,Car1_With_Box,Car2_With_Box
    b、width、height、length、color、code、: 为集装箱的规格
    c、Icon说明:Image为集装箱侧面的图片贴图，使用的必须为控件data下的res.db里的纹理库中的图片

 *  featureInfo.FeatureUrl = "model://" + JSON.stringify(ModelParam);
 * 
 *
 @  范围创建的要素ID
 */
BaseLayerAPI.prototype.CreateFeature = function(featureInfo)
{
    if (HasTDECtrl())
    {
        var param = new Array();
        param[0] = featureInfo;
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "CreateFeature", param);
    }
};

/**
*  批量创建多个要素
*  featureInfo为CreateFeature参数的JSON数组（多个对象）
*
@  范围创建的要素ID(JSON对象，包含多个)
*/
BaseLayerAPI.prototype.CreateMultiFeature = function(featureInfo)
{
    if (HasTDECtrl())
    {
        var param = new Array();
        param[0] = featureInfo;
        var result =  GetTDECtrl().InvokeCmd("BaseLayerOper", "CreateMultiFeature", param);
		return eval('(' + result + ')');
    }
};

/**
* 移除要素
* featureInfo.FeatureID
* featureInfo.LayerID
*/
BaseLayerAPI.prototype.RemoveFeature = function (featureInfo) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = featureInfo;
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "RemoveFeature", param);
    }
};

/**
* 更新要素 ()
*
*/
BaseLayerAPI.prototype.UpdateFeature = function (featureInfo) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = featureInfo;
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "UpdateFeature", param);
    }
};


/**
 * 创建要素路径动画、骨骼动画
 *
 *
 * animeInfo说明

    为JSON对象，需要传递

    RouteParam.route = new Array;
	RouteParam.route[0] = {route : {path:[p1],time: 2.0,anime:"stand"}};
	RouteParam.route[1] = {route : {path:[p1,p2],speed: 54,anime:"run"}};
	RouteParam.route[2] = {route : {path:[p2],time: 2.0,anime:"stand"}};
	RouteParam.route[3] = {route : {path:[p2,p3],speed: 14.0,anime:"walk"}};
	RouteParam.route[4] = {route : {path:[p3,p2,p1],speed: 52.5,anime:"run"}};
	RouteParam.route[5] = {route : {path:[p1],time: 1,anime:"stand"}};
	RouteParam.times = 1;
	RouteParam.finish = "Stay_End_Point";

    route为移动的路径，每一小段路径具有不同的speed 和 anime,path为该段路径的路径点，如果该段路径只有一个点则传time表示在
    该点停留的时间，anime的动画由对应模型具有的骨骼动画决定，由模型制作人员告知

    times为路径动画的循环次数

    finishe为动画循环结束后的模型状态，可传值
    Stay_Feature_Position（回归要素原来位置）
    Stay_Start_Point（路径动画起始点）
    Stay_End_Point（路径动画起终点）
    Disappear（消失）
 *
 *
 */
BaseLayerAPI.prototype.CreateFeautreAnimePath = function(featurID,layerID,animeInfo)
{
    if (HasTDECtrl())
    {
        var param = new Array();
        param[0] = featurID;
		param[1] = layerID;
		param[2] = animeInfo;
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "CreateFeautreAnimePath", param);
    }
};

/**
* 修改要素路径动画模型
*
*/
BaseLayerAPI.prototype.UpdateFeatureAnimeModel = function (featureInfo) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = featureInfo;
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "UpdateFeatureAnimeModel", param);
    }
};

/**
* 保存动画路径到temp目录
*
*/
BaseLayerAPI.prototype.SaveFeautreAnimePath = function (json) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = json;
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "SaveFeautreAnimePath", param);
    }
};

/**
* 从XML加载动画路径
* json {FeatureID:,LayerID:,Url:}
*/
BaseLayerAPI.prototype.LoadFeautreAnimePath = function (json) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = json;
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "LoadFeautreAnimePath", param);
    }
};

/**
 * 停止要素路径动画
 *
 */
BaseLayerAPI.prototype.StopFeautreAnimePath = function(featurID,layerID)
{
    if (HasTDECtrl())
    {
        var param = new Array();
        param[0] = featurID;
		param[1] = layerID;
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "StopFeautreAnimePath", param);
    }
};

/**
* 删除要素路径动画
*
*/
BaseLayerAPI.prototype.RemoveFeatureAnime = function (featurID, layerID) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = featurID;
        param[1] = layerID;
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "RemoveFeatureAnime", param);
    }
};

/**
* 暂停要素路径动画
*
*/
BaseLayerAPI.prototype.PauseFeatureAnimePath = function (featurID, layerID) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = featurID;
        param[1] = layerID;
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "PauseFeatureAnimePath", param);
    }
};

/**
* 继续要素路径动画
*
*/
BaseLayerAPI.prototype.ResumeFeatureAnimePath = function (featurID, layerID) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = featurID;
        param[1] = layerID;
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "ResumeFeatureAnimePath", param);
    }
};

/**
* 继续要素路径动画
*
*/
BaseLayerAPI.prototype.AppendFeatureAnimeRoute = function (featurID, layerID,routeJSON) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = featurID;
        param[1] = layerID;
        param[2] = routeJSON;
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "AppendFeatureAnimeRoute", param);
    }
};



/**
 * 获取图层数目
 *
 */
BaseLayerAPI.prototype.GetLayerNum = function()
{
    if (HasTDECtrl())
    {
        var param = new Array();
       
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "GetLayerNum", param);
    }
};

/**
 * 获取图层ID
 *
 */
BaseLayerAPI.prototype.GetLayerID = function(index)
{
    if (HasTDECtrl())
    {
        var param = new Array();
        param[0] = index;
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "GetLayerID", param);
    }
};

BaseLayerAPI.prototype.GetLayerIDEx = function (layerID, index) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = layerID;
        param[1] = index;
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "GetLayerID", param);
    }
};


/**
 * 获取图层显示名称
 *
 */
BaseLayerAPI.prototype.GetLayerName = function(layerID)
{
    if (HasTDECtrl())
    {
        var param = new Array();
        param[0] = layerID;
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "GetLayerName", param);
    }
};

/**
 * 获取图层显示状态
 *
 */
BaseLayerAPI.prototype.GetVisible = function(layerID)
{
    if (HasTDECtrl())
    {
        var param = new Array();
        param[0] = layerID;
		
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "GetVisible", param);
    }
};

/**
 * 设置图层显示状态
 *
 */
BaseLayerAPI.prototype.SetVisible = function(layerID, visible)
{
    if (HasTDECtrl())
    {
        var param = new Array();
        param[0] = layerID;
		param[1] = visible;
		param[2] = "";
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "SetVisible", param);
    }
};

/**
 * 设置图层显示范围
 *
 */
BaseLayerAPI.prototype.SetFeatureLayerFilter = function(layerID, regionJson)
{
    if (HasTDECtrl())
    {
        var param = new Array();
        param[0] = layerID;
		param[1] = regionJson;
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "SetFeatureLayerFilter", param);
    }
};


/**
 * 快捷管网图层透明
 *
 */
BaseLayerAPI.prototype.NetOpacity = function(name, isOpen)
{
    if (HasTDECtrl())
    {
        var param = new Array();
        param[0] = name;
		param[1] = isOpen;
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "NetOpacity", param);
    }
};

/**
 * 要素高亮(简便接口,复杂要求使用SetFeatureEffect)
 *
 */
BaseLayerAPI.prototype.SetHightLightOn = function(featureID,layerID,gid,table)
{
    if (HasTDECtrl())
    {
        return this.SetFeatureEffect(featureID, layerID, gid, table, "effect:high-light;color1:1 0 0 1;color2:0 0 1 1");
    }
};

/**
* 设置要素透明度(简便接口,复杂要求使用SetFeatureEffect)
*
*/
BaseLayerAPI.prototype.SetFeatureOpacity = function (featureID, layerID, opacity) {
    if (HasTDECtrl()) {
        return this.SetFeatureEffect(featureID, layerID, "", "", "effect:transparent;color:1.0 1.0 1.0 " + opacity);
    }
};

/**
* 流向动态纹理(简便接口,复杂要求使用SetFeatureEffect)
*
*/
BaseLayerAPI.prototype.TextureMoveOn = function (featureID, layerID, gid, table) {
    if (HasTDECtrl()) {
        return this.SetFeatureEffect(featureID, layerID, gid, table, "effect:texture-animation;reverse:false");
    }
};

/**
* 三维查询接口，查询三维db图层中的三维要素
*
* layerID：三维图层的ID
* whereClause：查询SQL，如name = 'xx' 或 gid = 100,只能查询图层DB里的Entity三维实体表
*
* @return 返回查询到的所有FeatureID列表，为JSON对象
*/
BaseLayerAPI.prototype.SelectFeature = function (layerID, whereClause) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = layerID;
        param[1] = whereClause;
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "SelectFeature", param);
    }
};

/**
* 三维查询接口，查询三维db图层中的三维要素,并且赋予特效
* 参数与说明同上
*
* efflect说明同SetFeatureEffect
* 
*
* @return 返回查询到的所有FeatureID列表，为JSON对象
*/
BaseLayerAPI.prototype.SelectFeatureAndEffect = function (layerID, whereClause, effect) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = layerID;
        param[1] = whereClause;
        param[2] = effect;

        return GetTDECtrl().InvokeCmd("BaseLayerOper", "SelectFeatureAndEffect", param);
    }
};

/**
* 三维查询接口，查询三维db图层中的三维要素
*
* layerID：三维图层的ID
* wherePoint："x y"
* nearRange：距离(m),如 2.0
*
* @return 返回查询到的所有FeatureID列表，为JSON对象, var obj = eval('(' + result + ')'); obj[0].Feature.FeatureID ...
*/
BaseLayerAPI.prototype.SelectNearFeature = function (layerID, wherePoint,nearRange) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = layerID;
        param[1] = wherePoint;
        param[2] = nearRange;
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "SelectNearFeature", param);
    }
};

/**
* 管网类的接口，实现管点图层与管线图层同时打开流向分析 （一般不用）
*
*/
BaseLayerAPI.prototype.TextureMoveOnEx = function (netName, isOpen)
{
    if (HasTDECtrl())
    {
        var param = new Array();
        param[0] = netName;
		param[1] = isOpen;

        return GetTDECtrl().InvokeCmd("BaseLayerOper", "TextureMoveOnEx", param);
    }
};

/**
 * 清除所有场景要素、图层特效
 *
 */
BaseLayerAPI.prototype.ClearAllEffect = function()
{
    if (HasTDECtrl())
    {
		var param = new Array();
		return GetTDECtrl().InvokeCmd("BaseLayerOper", "ClearAllEffect", param);
    }
};

/**
 * 兼容函数
 *
 */
BaseLayerAPI.prototype.SetHightLightOff = function()
{
    return this.ClearAllEffect();
};

/**
* 
* 三维要素缩放动画(简便接口)
*/
BaseLayerAPI.prototype.SetScaleAnime = function (featureID, layerID, gid, table) {
    if (HasTDECtrl()) {
        return this.SetFeatureEffect(featureID, layerID, gid, table, "effect:scale-animation");
    }
};

/**
* 
* 设置图层颜色(简便接口)
*/
BaseLayerAPI.prototype.SetLayerColor = function (layerID, color) {
    if (HasTDECtrl()) {
        return this.SetFeatureEffect("", layerID, "", "", "effect:transparent;texture:disable;color:" + color);
    }
};

/**
* 
* 设置图层透明度(简便接口)
*/
BaseLayerAPI.prototype.SetLayerTransparent = function (layerID, opacity) {
    if (HasTDECtrl()) {
        return this.SetFeatureEffect("", layerID, "", "", "effect:transparent;texture:disable;color:1.0 1.0 1.0 " + opacity);
    }
};

/**
* 设置图层透明度(简便接口)
*
*/
BaseLayerAPI.prototype.SetOpacity = function (layerID, opacity) {
    return this.SetLayerTransparent(layerID, opacity);
};

/**
* 
* 设置三维要素特效
* 
* 
* effect:传入参数
* 
* 1、high-light(高亮)
* 
* 示例: effect:high-light;color1:0.0 1.0 0.0 1.0;color2:0 0 1 1.0;interval:500;loop:99;
* color1,color2:闪烁交替的两种颜色R G B A
* interval:闪烁的时间间隔 
* loop：闪烁的次数
* 
* 2、texture-animation(管线流向)
* 示例: effect:texture-animation;reverse:false
* reverse:管子流向的方向正反
* 
* 3、scale-animation(缩放动画)
* 示例: effect:scale-animation;loop:99;
* loop：缩放的次数
* 
* 4、transparent
* 示例: effect:transparent;color:1.0 1.0 1.0 0.5;texture:true
* color: R G B A
* texture:透明颜色是否去掉模型本身的纹理，即白色壳子
* 
* 
* featureID传空则对整个layerID产生效果
* gid 的话传空字符串
* 
* @return 无
*/
BaseLayerAPI.prototype.SetFeatureEffect = function (featureID, layerID, gid, table, effect) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = JSON.stringify({ FeatureID: featureID, LayerID: layerID, Effect: effect, GID: gid, Table: table });
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "SetFeatureEffect", param);
    }
};

/**
* 
* 清除特定对象要素效果
* 
* gid table 没有可以传空
*/
BaseLayerAPI.prototype.ClearFeatureEffect = function (featureID,layerID,gid,table) {
    if (HasTDECtrl()) {
        return this.SetFeatureEffect(featureID, layerID, gid, table, "");
    }
};

/**
 * 获取图层透明度 (无效)
 *
 */
BaseLayerAPI.prototype.GetOpacity = function(name)
{
    return 1.0;
};

/**
* 
* 清除特定图层效果
* 
*/
BaseLayerAPI.prototype.ClearLayerEffect = function (layerID) {
    if (HasTDECtrl()) {
        var param = new Array();
        var temp = {
            LayerID: "",
            Effect: ""
        }
        temp.LayerID = layerID;
        var param = new Array();
        param[0] = JSON.stringify(temp);
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "SetFeatureEffect", param);
    }
};

/**
 * 跳转到图层、某个要素的位置，如果要素ID为-1则跳转到整个图层范围(无效)
 *
 */
BaseLayerAPI.prototype.SetInView = function(layername, featureid)
{
    if (HasTDECtrl())
    {
		var param = new Array();
		param[0] = layername;
		param[1] = featureid;
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "SetInView", param);
    }
};

/**
 * 返回result[0] id , result[1] layerid , 三维场景的ID可以用来高亮、跳转等 (管网类操作函数)
 *
 */
BaseLayerAPI.prototype.GetFeatureByGID = function(gid, table)
{
    if (HasTDECtrl())
    {
		var param = new Array();
		param[0] = gid;
		param[1] = table.toLowerCase();
        var result = GetTDECtrl().InvokeCmd("BaseLayerOper", "GetFeatureByGID", param);

		return result.split(",");
    }
};

 /**
 * 返回result[0] x , result[1] y , result[2] z  , 三维场景的ID可以用来高亮、跳转等
 *
 */
BaseLayerAPI.prototype.GetFeaturePosition = function(layerID,featureID)
{
    if (HasTDECtrl())
    {
		var param = new Array();
		param[0] = layerID;
		param[1] = featureID;
        var result = GetTDECtrl().InvokeCmd("BaseLayerOper", "GetFeaturePosition", param);

		return result.split(",");
    }
};

/**
 * result.coordinate.x,result.coordinate.y,result.coordinate.z 三维场景的ID可以用来高亮、跳转等
 *
 */
BaseLayerAPI.prototype.GetFeaturePositionEx = function(featureID,layerID,gid,table)
{
    if (HasTDECtrl())
    {
		var param = new Array();
		param[0] = featureID;
		param[1] = layerID;
		param[2] = gid;
		param[3] = table;
        var result = GetTDECtrl().InvokeCmd("BaseLayerOper", "GetFeaturePosition", param);
		return eval('(' + result + ')');
    }
};

/**
 * 设置注记图层的点击回调
 *
 */
BaseLayerAPI.prototype.SetLabelListener = function(layerID,func)
{
    if (HasTDECtrl())
    {
		var param = new Array();
		param[0] = layerID;
		param[1] = func;
        var result = GetTDECtrl().InvokeCmd("BaseLayerOper", "SetLabelListener", param);
		return result;
    }
};

/**
* 
* 添加要素挂接的标注
* Label_JSON参数同Hope3DLabel，只是此时的x y z为相对Feature的位置的偏移值
*/
BaseLayerAPI.prototype.ShowFeatureLabel = function (featureID, layerID, Label_JSON) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = featureID;
        param[1] = layerID;
        param[2] = Label_JSON;        
        var result = GetTDECtrl().InvokeCmd("BaseLayerOper", "ShowFeatureLabel", param);
        return result;
    }
};

/**
* 
* 删除要素挂接的标注
*/
BaseLayerAPI.prototype.RemoveFeatureLabel = function (featureID, layerID) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = featureID;
        param[1] = layerID;

        var result = GetTDECtrl().InvokeCmd("BaseLayerOper", "RemoveFeatureLabel", param);
        return result;
    }
};

/**
*
* 清除所有要素挂接标注
*/
BaseLayerAPI.prototype.RemoveAllFeatureLabel = function () {
    if (HasTDECtrl()) {
        var param = new Array();
        var result = GetTDECtrl().InvokeCmd("BaseLayerOper", "RemoveAllFeatureLabel", param);
        return result;
    }
};

/**
*
* 兼容函数
*/
BaseLayerAPI.prototype.HideFeatureLabel = function () {
    return this.RemoveAllFeatureLabel();
};

/**
*	
* 设置范围事件回调函数，与AddRegionEvent配合使用
*/
BaseLayerAPI.prototype.SetRegionEventCallback = function (jsFunc) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = jsFunc;
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "SetRegionEventCallback", param);
    }
};

/**
*	
* 添加范围事件,要素移动动画路径过程中进入范围会触发回调事件SetRegionEventCallback
*/
BaseLayerAPI.prototype.AddRegionEvent = function (regionObj) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = regionObj;
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "AddRegionEvent", param);
    }
};

/**
*	
* 控制要素显隐
*/
BaseLayerAPI.prototype.SetFeatureVisible = function (featureID,layerID,visible) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = featureID;
		param[1] = layerID;
		param[2] = visible;
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "SetFeatureVisible", param);
    }
};

/**
* 三维特效对象
*
* @param Type有TextAndIcon,Bubble
*/
var Hope3DFireEffect = "Type:LightFireEffect;\
SmokeParticleStartColor:0.6 0.6 0.6 0.2;\
SmokeParticleEndColor:0.7 0.7 0.7 0.0;\
FireParticleStartColor:1 0.643 0 0.4;\
FireParticleEndColor:1 0.2 0.0 0.0;\
FireParticleSizeRange:4.0 6.0;\
SmokeParticleSizeRange:5.0 7.0;\
FireParticleRateRange:15.0 20.0;\
SmokeParticleRateRange:10.0 15.0;\
FireParticleRadiusRange:0.5 1;\
SmokeParticleRadiusRange:0.5 0.5;\
FireParticleLifeTime:2.0;\
SmokeParticleLifeTime:5.0;\
SmokeOffsetPosition:0 0 5";

var Hope3DWaterSpoutEffect = "Type:WaterSpout;\
ParticleSizeRange:0.2 0.2;\
ParticleRateRange:500 600;\
ParticleLifeTime:3;\
ParticleInitialSpeedRange:25 28;\
ParticleRadiusRange:0.1 0.1;\
PhiRange:290 292.3;\
ThetaRange:35 37;\
DomainPlaneVector:0 0 -1 -1;";

var Hope3DSmokeEffect = "Type:Smoke;\
ParticleStartColor:1.0 1.0 1.0 0.5;\
ParticleEndColor:0.5 0.5 0.5 0;\
ParticleSizeRange:8.0 10.0;\
ParticleRateRange: 50.0 70.0;\
ParticleLieTime : 5.0;\
ParticleInitialSpeedRange : 5.0 10.0;\
ParticleXRange : 0.0 10.0;\
ParticleYRange : 0.0 40.0;\
ParticleZRange : 0.0 40.0;\
ParticleTextureTileRange : 1 1 0 0";


/**
*	
*  获取创建图层的模版JSON Object
*/
BaseLayerAPI.prototype.GetTemplateLayerConfig = function () {
    if (HasTDECtrl()) {
        var obj = JSON.parse(GetTDECtrl().InvokeCmd("BaseLayerOper", "GetTemplateLayerConfig", null));
        obj.LayerType = "ModelLayer";
        return obj;
    }
};

BaseLayerAPI.prototype.GetOverlayLayerConfig = function () {
    if (HasTDECtrl()) {
        var obj = BaseLayerOpObj.GetTemplateLayerConfig();
        obj.LayerType = "OverlayLayer";
        return obj;
    }
};

/**
*	
*  创建图层
*/
BaseLayerAPI.prototype.CreateLayer = function (jsonObj) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = JSON.stringify(jsonObj);
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "CreateLayer", param);
    }
};

/**
*	
*  添加贴图
*/
BaseLayerAPI.prototype.AddOverlayImage = function (json) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = json;
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "AddOverlayImage", param);
    }
};

BaseLayerAPI.prototype.RemoveOverlayImage = function (json) {
    if (HasTDECtrl()) {
        var param = new Array();
        param[0] = json;
        return GetTDECtrl().InvokeCmd("BaseLayerOper", "RemoveOverlayImage", param);
    }
};

function Hope3DOverlayImage() {
    this.OverlayID = "";
    this.LayerID = "";
    this.Url = "";
    this.Bound = "";
    this.Alpha = 1.0;
    this.OffsetHeight = 0.0;
};

Hope3DOverlayImage.prototype.Show = function () {
    this.OverlayID = BaseLayerOpObj.AddOverlayImage(JSON.stringify(this));
}

Hope3DOverlayImage.prototype.Remove = function () {
    BaseLayerOpObj.RemoveOverlayImage(JSON.stringify(this));
}