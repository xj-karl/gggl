<%@ page contentType="text/html;charset=UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>首页</title>
	<%--<link rel="StyleSheet" href="${ctx}/static/WebAPI/dtree.css" type="text/css" />
	<script type="text/javascript" src="${ctx}/static/WebAPI/Andtree.js"></script>
	<script type="text/javascript" src="${ctx}/static/WebAPI/ajax.js"></script>
	<script type="text/javascript" src="${ctx}/static/WebAPI/json2.js"></script>
	<script type="text/javascript" src="${ctx}/static/WebAPI/HopeMap3DCtrlSdk/Ctrl.js"></script>
	<script type="text/javascript" src="${ctx}/static/WebAPI/dragiframe.js"></script>
	<script type="text/javascript" src="${ctx}/static/WebAPI/jquery-3.2.0.slim.min.js"></script>--%>
<style type="text/css">

</style>
	<%--<script type="text/javascript">

		//Test Val
		var UseTestHG;
		var UseTestBL;
		var UseTestHP;
		var UseTestDXH;
		var GlobalVectorOffsetHeight = 0;

		function onHopeMap3DInitialize() {
			CommonOpObj.SetConfig("CacheLocal", "false");
			//CommonOpObj.SetConfig("AlwaysDownloadCache", "true");

			NaviOpObj.RegisterOnChangeSceneEvent("Test_OnChangeScene");
			UseTestDXH = UseTestHP = UseTestHG = UseTestBL = false;

			CommonOpObj.SetConfig("AllowUnderGround", "true");
			//CommonOpObj.SetConfig("AlwaysDownloadCache", "true");
			CommonOpObj.SetConfig("skybox", "2");

			//CommonOpObj.SetProjectedHome("480012.53125 3317565.5 2901.578613");
			CommonOpObj.LoadXML("http://180.166.244.14:9091/layers.xml");
			//CommonOpObj.LoadXML("J:\\HopeMap3D项目\\汕头\\1016\\layers.xml");

			GlobalVectorOffsetHeight = 3.7;

			CommonOpObj.BindGUIEventFunction("OnMenuInvoke");

			BuildTree(treed2);
//			CommonOpObj.ShowWebKit();
			//CommonOpObj.InvokeGUI("oper:hidetitle");

			var workspace = CommonOpObj.GetWorkDirectory();

			if (CommonOpObj.GetPlatform() == "64") {
				workspace += " (x64)" + CommonOpObj.GetVersion();
			}
			else {
				workspace += " (x86)" + CommonOpObj.GetVersion();
			}

			ToolTree.aNodes[0].name = workspace;
			treed.innerHTML = ToolTree.toString();

		}

		function ReSetEye() {
			var info = NaviOpObj.GetViewPoint();
			var x = info[0];
			var y = info[1];
			var z = info[2];
			var heading = info[3];
			var pitch = info[4];
			var range = info[5];
			pitch = -25.0;

			x = 4659.872;
			y = 803680.171;
			z = 0.00;

			x = 468138;
			y = 2585451;
			z = 20.00;

			heading = 9.23;
			pitch = -46.07;
			range = 0;

			NaviOpObj.SetViewPoint(x, y, z, heading, pitch, range, 1.0);

			var layer = BaseLayerOpObj.CreateLayer(BaseLayerOpObj.GetOverlayLayerConfig());
			var image = new Hope3DOverlayImage();
			image.LayerID = layer;
			image.Url = "D:/镇海化工三维可视化-1017.wmv";
			//image.Url = "C:\Users\liguowu\Desktop/413720ee19b06adf7294555bc38a6cd3.mp4";
			image.OffsetHeight = 1.0;


			image.Bound = "468138 2585451 468188 2585541";
			image.Show();
		}

		function Test_OnChangeScene(scene) {
			//CommonOpObj.ShowDialog("OpenShelfDatabase");
			//CommonOpObj.ShowUI("http://192xx:8081/nbg/HopeMap3DMaterials/新建文件夹\Hope3D_UI_HG.xml");
			//Test_CreateModelFeature(0);
			//Test_JumpTo();
			//SetTerrainOpacity();
			//Test_ShowUI(0);
			//ReSetEye();

			//Pick();
			//Test_AddContainer();
			// setTimeout(function () { AISystem(); }, 1000);
			// setTimeout(function () { AutoTravel(); }, 5000);

//		    var ZHM3ASB_layerID = BaseLayerOpObj.GetLayerByName("ZHM3ASB");
//		    BaseLayerOpObj.SelectFeatureAndEffect(ZHM3ASB_layerID, "id = 483", "effect:attach_node;type:feature;scale:2 2 2;url:global://fbx/arrow.fbx");
		}

		var imageObject = null;
		function Test_ScreenImage(flag)
		{
			if(flag == 0)
			{
				if(imageObject == null)
				{
					imageObject = new Hope3DImage;
					imageObject.Name = "图例1";
					imageObject.Url = "global://logo.png";
					imageObject.Url = "E:/1.mp4";
					//imageObject.Url = "rtsp://184.72.239.149/vod/mp4://BigBuckBunny_175k.mov";
					//imageObject.Url = "rtsp://rtsp-v3-spbtv.msk.spbtv.com/spbtv_v3_1/214_110.sdp";
					//imageObject.Url = "http://live.hkstv.hk.lxdns.com/live/hks/playlist.m3u8";
					//imageObject.Url = "http://192.168.8.231:8081/nbg/HopeMap3DMaterials/tuli.png";


					imageObject.HorizonALIGN = "right";
					imageObject.VerticalALIGN = "bottom";
					imageObject.Mergin = "bottom:24;left:-10";
					imageObject.Width = 480;
					imageObject.Height = 272;
					imageObject.Show();

					imageObject = new Hope3DImage;
					imageObject.Name = "图例2";
					imageObject.Url = "E:/项目数据/1.avi";


					imageObject.HorizonALIGN = "left";
					imageObject.VerticalALIGN = "bottom";
					imageObject.Mergin = "bottom:24;left:-10";
					imageObject.Width = 480;
					imageObject.Height = 272;
					imageObject.Show();

//					imageObject = new Hope3DImage;
//					imageObject.Name = "图例3";
//					imageObject.Url = "E:/项目数据/现场作业方式变革——富士通增强现实技术_1.mp4";
//					imageObject.Width = 480;
//					imageObject.Height = 272;
//					imageObject.HorizonALIGN = "left";
//					imageObject.VerticalALIGN = "top";
//					imageObject.Mergin = "bottom:24;left:-10";
//					imageObject.Show();

//					imageObject = new Hope3DImage;
//					imageObject.Name = "图例4";
//					imageObject.Url = "rtmp://live.hkstv.hk.lxdns.com/live/hks";
//					imageObject.Width = 480;
//					imageObject.Height = 272;
//					imageObject.HorizonALIGN = "right";
//					imageObject.VerticalALIGN = "top";
//					imageObject.Mergin = "bottom:24;left:-10";
//					imageObject.Show();
				}
			}
			else
			{
				if(imageObject != null)
				{
					imageObject.Remove();
					imageObject = null;
				}
			}
		}

		function OnMenuInvoke(name) {
			alert(name);
		}

		function EarthMode() {
			CommonOpObj.SetDisplayMode("earth");
		}

		function SpaceMode() {
			CommonOpObj.SetDisplayMode("space");
		}

		function Pick() {
			CommonOpObj.StartPick("PickCallback");
		}

		function EndPick() {
			//根据自己需要取消高亮
			BaseLayerOpObj.SetHightLightOff();
			CommonOpObj.EndPickModel();
		}

		function PickAndLabel() {
			CommonOpObj.StartPick("PickAndLabelCallback");
		}

		var picklabel = null;
		function PickAndLabelCallback(json)
		{
			var obj = eval('(' + json + ')');
			var names = new Array;
			names[0] = {n:"FeatureID",v: obj.featureid};
			names[1] = {n:"LayerID",v: obj.layerid};
			names[2] = {n:"FeatureName",v: obj.name};
			names[3] = {n:"X", v: obj.coordinate.x };
			names[4] = {n:"Y", v: obj.coordinate.y };
			names[5] = {n:"Z", v: obj.coordinate.z };
			names[6] = {n:"GID", v: obj.gid };
			names[7] = {n:"DNO", v: obj.dno };
			names[8] = {n: "Table", v: obj.table };

			if (picklabel != null) {
				picklabel.Remove();
			}

			picklabel = new Hope3DLabel();
			picklabel.LayerID = LabelOpObj.GetTempLayer();


			picklabel.OffsetX = obj.coordinate.x;
			picklabel.OffsetY = obj.coordinate.y;
			picklabel.OffsetZ = obj.coordinate.z;

			var unknown = "unknown";

			var fsize = 12;
			var str;
			str = "<font size=\"" + fsize + "\" color=\"white\">场馆名称:" + unknown +
					"<br>场馆所属单位:" + "<font size=\"" + fsize + "\" color=\"blue\">未知未知未知<br>未知</font>" +
					"<br>联系人:" + unknown + "<br>联系电话:" + unknown +
					"<br>场馆容量:" + unknown + "<br>地址:" + unknown +
					"<br>备注:" + unknown +
					"</font>";


			picklabel.BackGroundColor = 0xFF00FFFF;
			picklabel.Text = str;
			picklabel.Url = "label://" + str;
			picklabel.FontColor = 0xFF00FFFF;
			picklabel.Show();

			ShowToolTip2(JSON.stringify(picklabel));
		}

		function ShowToolTip(hitPoint,content)
		{
			LabelOpObj.AddToolTip(JSON.stringify(hitPoint));

			var view3DOffset = GetAbsolutePos(GetTDECtrl());
			var screenCoord = CommonOpObj.GetScreenPoint(hitPoint.x,hitPoint.y,hitPoint.z);

			var tooltip = document.getElementById('Hope3DToolTip');
			var offset = 50;
			var tipX = view3DOffset[0] + screenCoord.x - 320 * 0.5;
			var tipY = view3DOffset[1] + screenCoord.y - 200 - offset;
			tooltip.style.left = tipX + "px";
			tooltip.style.top = tipY + "px";
			tooltip.style.display = "block";

			var resultText = '<table id="mytable" style ="width:100%" ';
			for (var i = 0; i < content.length; i++)
			{
				resultText+='<tr>';
				resultText+='<th scope="col">';
				resultText+= content[i].n;
				resultText+='</th>';
				resultText+='<td class="row">';
				resultText+= content[i].v;
				resultText+='</td>';
				resultText+='</tr>';
			}
			resultText+='</table>';

			var doc = frames["Hope3DToolTip"].document;
			var div = doc.getElementById("resultView");
			div.innerHTML = resultText;
		}

		function ShowToolTip2(content) {
			var tooltip = document.getElementById('Hope3DToolTip');
			var offset = 50;
			var view3DOffset = GetAbsolutePos(GetTDECtrl());
			var tipX = view3DOffset[0] + 320 * 0.5;
			var tipY = view3DOffset[1] + 200 - offset;
			tooltip.style.left = tipX + "px";
			tooltip.style.top = tipY + "px";
			tooltip.style.display = "block";

			var resultText = '<table id="mytable" style ="width:100%" ';
			resultText += '<tr>';
			resultText += '<th scope="col">';
			resultText += "1";
			resultText += '</th>';
			resultText += '<td class="row">';
			resultText += "dd";
			resultText += '</td>';
			resultText += '</tr>';
			//alert(resultText);

			var doc = frames["Hope3DToolTip"].document;
			var div = doc.getElementById("resultView");
			div.innerText = content;
		}

		function HideToolTip()
		{
			LabelOpObj.HideToolTip();
			var tooltip = document.getElementById('Hope3DToolTip');
			tooltip.style.display = "none";
			BaseLayerOpObj.SetHightLightOff();
		}

		function PickCallback(json)
		{
			var obj = eval('(' + json + ')');

			var names = new Array;
			names[0] = {n:"FeatureID",v: obj.featureid};
			names[1] = {n:"LayerID",v: obj.layerid};
			names[2] = {n:"FeatureName",v: obj.name};
			names[3] = {n:"X", v: obj.coordinate.x };
			names[4] = {n:"Y", v: obj.coordinate.y };
			names[5] = {n:"Z", v: obj.coordinate.z };
			names[6] = {n:"GID", v: obj.gid };
			names[7] = {n:"DNO", v: obj.dno };
			names[8] = {n:"Table", v: obj.table };

			BaseLayerOpObj.SetHightLightOff();
			BaseLayerOpObj.SetHightLightOn(obj.featureid, obj.layerid, obj.gid, obj.table);
			//BaseLayerOpObj.SetFeatureEffect(obj.featureid, obj.layerid, obj.gid, obj.table, "effect:high-light;color1:0.0 1.0 0.0 1.0;color2:0 0 1 1.0;interval:500;loop:99;");
			//BaseLayerOpObj.SetFeatureEffect(obj.featureid, obj.layerid, obj.gid, obj.table, "effect:moving;direction:1 0 0;movetime:1.2;speed:20");
			//BaseLayerOpObj.SetFeatureEffect("", obj.layerid, "", "", "effect:moving;direction:1 0 0;movetime:1.2;speed:20");
			//BaseLayerOpObj.SetScaleAnime(obj.featureid, obj.layerid, obj.gid, obj.table);
			//BaseLayerOpObj.TextureMoveOn(obj.featureid, obj.layerid, obj.gid, obj.table);

			if (UseTestHG) {
				//BaseLayerOpObj.SetFeatureEffect(obj.featureid, obj.layerid, obj.gid, obj.table, "effect: texture-animation; reverse: true;x-direction:false;CustomImage:global://images/1.png");
			}
			else {
				//BaseLayerOpObj.SetFeatureEffect(obj.featureid, obj.layerid, obj.gid, obj.table, "effect: texture-animation; reverse: true;x-direction:true;CustomImage:global://images/1.png");
			}

			//BaseLayerOpObj.SetFeatureEffect(obj.featureid, obj.layerid, obj.gid, obj.table, "effect:transparent;color:0.5 0.5 0.5 0.8;texture:yes;");

			var worldPos = {
				x : obj.coordinate.x,
				y : obj.coordinate.y,
				z : obj.coordinate.z
			};

			ShowToolTip(worldPos,names);
		}

		function SkyBoxON() {
			CommonOpObj.SetSkyBoxOn();
		}

		function SkyBoxOFF() {
			CommonOpObj.SetSkyBoxOff();
		}

		function MeasureDistacne() {
			MTOpObj.MeasureDistacne();
		}

		function MeasureArea() {
			MTOpObj.MeasureArea();
		}

		function endmeasure() {
			MTOpObj.EndMeasure();
		}

		function startdraw(type) {
			//其他参数暂时不需要传
			var vectorShape = new Hope3DVector();

			vectorShape.LineWidth = 2.0;
			vectorShape.LineColor = 0xFF0000FF;
			vectorShape.FillColor = 0xFF000083;
			vectorShape.Stipple = 0;
			vectorShape.OffsetHeight = GlobalVectorOffsetHeight;

			vectorShape.Geom = type;
			vectorShape.StartDraw("vectordrawCallback");

			//VectorDrawOpObj.StartDrawVector(JSON.stringify(vectorShape), "vectordrawCallback");
			//VectorDrawOpObj.StartDraw("",type,"","","","","","false","","vectordrawCallback");
		}

		//ajax单击拾取查询数据回调
		function pickcallBackFunc(xmlHttp)
		{
			var response = xmlHttp.responseText;

			var obj = eval('(' + response + ')');

			alert("本点号:"+obj.features[0].attributes.本点号);
		}

		//ajax范围查询数据回调
		function vectorcallBackFunc(xmlHttp)
		{
			var response = xmlHttp.responseText;

			var obj = eval('(' + response + ')');

			alert("第一条记录本点号:"+obj.results[0].attributes.本点号);
			alert("第二条记录本点号:"+obj.results[1].attributes.本点号);
		}


		var VectorRegionParam = {
			type  : "polygon",
			coordinates : null
		};

		var vectorMutltiLine = null;
		function Test_AddLine()
		{
			if(vectorMutltiLine == null)
			{
				var p1 = [489377.75, 3313259.75];
				var p2 = [489477.75, 3313259.75];
				var p3 = [489477.75, 3313459.75];
				VectorRegionParam.type = "MultiLineString";
				VectorRegionParam.coordinates = new Array;
				VectorRegionParam.coordinates[0] = new Array;
				VectorRegionParam.coordinates[0][0] = p1;
				VectorRegionParam.coordinates[0][1] = p2;
				VectorRegionParam.coordinates[0][2] = p3;

				vectorMutltiLine = new Hope3DVector;
				vectorMutltiLine.LayerID = VectorDrawOpObj.GetTempVectorLayer();
				vectorMutltiLine.Geom = JSON.stringify(VectorRegionParam);
				vectorMutltiLine.Stipple = 255;

				vectorMutltiLine.Show();
			}
		}

		var vectorArrow = null;
		function Test_AddArrow2()
		{
			if(vectorArrow == null)
			{
				var p1 = [489377.75, 3313259.75];
				var p2 = [489477.75, 3313259.75];
				var p3 = [489477.75, 3313459.75];


				VectorRegionParam.type = "arrow";
				VectorRegionParam.coordinates = new Array;
				VectorRegionParam.coordinates[0] = new Array;
				VectorRegionParam.coordinates[0][0] = p1;
				VectorRegionParam.coordinates[0][1] = p2;
				VectorRegionParam.coordinates[0][2] = p3;


				vectorArrow = new Hope3DVector;
				vectorArrow.LayerID = VectorDrawOpObj.GetTempVectorLayer();
				vectorArrow.Geom = JSON.stringify(VectorRegionParam);
				vectorArrow.LineColor = 0xFF0000FF;
				vectorArrow.FillColor = 0xFF000083;
				vectorArrow.OffsetHeight = GlobalVectorOffsetHeight;

				vectorArrow.Show();
			}
		}

		function Test_AddArrow() {
			if (vectorArrow == null) {
				VectorDrawOpObj.StartDraw("", 'line', "", "", "", "", "", "false", "", "vectorArrowDrawCallback");
			}
		}

		function vectorArrowDrawCallback(points) {
			var obj = eval('(' + points + ')');
			var geometry = obj.geometry.coordinates;

			VectorRegionParam.type = "arrow";
			VectorRegionParam.coordinates = new Array;
			VectorRegionParam.coordinates[0] = new Array;
			VectorRegionParam.coordinates = geometry;

			vectorArrow = new Hope3DVector;

			var layerID = VectorDrawOpObj.CreateVectorLayer("", "");
			vectorArrow.LayerID = layerID; //VectorDrawOpObj.GetTempVectorLayer();
			vectorArrow.Geom = JSON.stringify(VectorRegionParam);
			vectorArrow.LineColor = 0xFF0000FF;
			vectorArrow.FillColor = 0xFF000083;

			vectorArrow.OffsetHeight = GlobalVectorOffsetHeight;
			//vectorArrow.OffsetHeight = 21.5;

			vectorArrow.Show();
			ShowToolTip2(JSON.stringify(vectorArrow));
		}

		var vectorRect = null;
		function Test_AddRect()
		{
			if(vectorRect == null)
			{
				var p1 = [499434.49379, 3308782.1609280];
				var p2 = [500213.1696980, 3308782.1609280];
				var p3 = [500213.1696980, 3307607.535393 ];
				var p4 = [499434.49379, 3307607.535393];

				VectorRegionParam.type = "polygon";
				VectorRegionParam.coordinates = new Array;
				VectorRegionParam.coordinates[0] = new Array;
				VectorRegionParam.coordinates[0][0] = p1;
				VectorRegionParam.coordinates[0][1] = p2;
				VectorRegionParam.coordinates[0][2] = p3;
				VectorRegionParam.coordinates[0][3] = p4;

				vectorRect = new Hope3DVector;
				vectorRect.LayerID = VectorDrawOpObj.GetTempVectorLayer();
				vectorRect.Geom = JSON.stringify(VectorRegionParam);
				vectorRect.LineColor = 0xFF0000FF;
				vectorRect.FillColor = 0xFF000044;
				vectorRect.Show();
			}
		}

		var vectorPolygon = null;
		function Test_AddPolygon()
		{
			if(vectorPolygon == null) {
				//
				//var p1 = [499434.49379, 3308782.1609280];
				//var p2 = [500213.1696980, 3308782.1609280];
				//var p3 = [500213.1696980, 3307607.535393 ];
				var p1 = [480436,3317816];
				var p2 = [480436 + 100,3317816];
				var p3 = [480436 + 100,3317816 - 100];

				VectorRegionParam.type = "polygon";
				VectorRegionParam.coordinates = new Array;
				VectorRegionParam.coordinates[0] = new Array;
				VectorRegionParam.coordinates[0][0] = p1;
				VectorRegionParam.coordinates[0][1] = p2;
				VectorRegionParam.coordinates[0][2] = p3;

				vectorPolygon = new Hope3DVector;
				vectorPolygon.LayerID = VectorDrawOpObj.GetTempVectorLayer();
				vectorPolygon.Geom = JSON.stringify(VectorRegionParam);
				vectorPolygon.OffsetHeight = 3.8;
				vectorPolygon.Show();
			}
		}


		function Test_RemoveVector()
		{
			//VectorDrawOpObj.RemoveAll();

			if(vectorRect != null)
			{
				vectorRect.Remove();
				vectorRect = null;
			}

			if(vectorPolygon != null)
			{
				vectorPolygon.Remove();
				vectorPolygon = null;
			}

			if(vectorMutltiLine != null)
			{
				vectorMutltiLine.Remove();
				vectorMutltiLine = null;
			}

			if(vectorArrow != null)
			{
				vectorArrow.Remove();
				vectorArrow = null;
			}

		}

		//控件绘制矢量回调函数
		function vectordrawCallback(point)
		{
			//alert("from scene:"+ point);
			var obj = eval('(' + point + ')');
			var geometry = obj.geometry.coordinates;
			ShowToolTip2(point);
			return;

			var url = 'http://192.168.8.18:8091/nbg/osgjs-master/tutorials/07_Load_Model/index.html';
			if (geometry[0].length == 5) {
				url += '?xmin=' + geometry[0][0][0] + '&ymin=' + geometry[0][0][1] + '&xmax=' + geometry[0][2][0] + '&ymax=' + geometry[0][2][1];
			}

			var a = $("<a href='" + url + "' target='_blank'>hopemap3d</a>").get(0);

			var e = document.createEvent('MouseEvents');
			e.initEvent('click', true, true);
			a.dispatchEvent(e);


			return;
		}

		function vectordrawCallback_NetPreView(point) {
			//alert("from scene:"+ point);
			var obj = eval('(' + point + ')');
			var geometry = obj.geometry.coordinates;
			//ShowToolTip(point);
			alert(geometry);
			return;
		}

		function enddraw() {
			VectorDrawOpObj.EndDraw();
		}

		function cleardraw() {
			VectorDrawOpObj.ClearDraw();
		}

		function SetTerrainOpacity() {
			TerrainLayerOpObj.ShowTerrainOption();
		}

		function GetViewInfo() {
			var info = NaviOpObj.GetViewPoint();
			var x = info[0];
			var y = info[1];
			var z = info[2];
			var heading = info[3];
			var pitch = info[4];
			var range = info[5];

			var names = new Array;
			names[0] = { n: "X", v: x };
			names[1] = { n: "Y", v: y };
			names[2] = { n: "Z", v: z };
			names[3] = { n: "Heading", v: heading };
			names[4] = { n: "Pitch", v: pitch };
			names[5] = { n: "Range", v: range };

			var worldPos = {
				x: x,
				y: y,
				z: z
			};

			ShowToolTip(worldPos, names);
		}

		function ShowTravelTool() {
			NaviOpObj.ShowTravelTool();
		}

		var Dig_Line_Num = 0;
		function TestGrubTerrain(flag) {
			if (flag == 0) {
				TerrainLayerOpObj.StartTerrainGrubEx("grubCallback");
			}
			else if (flag == 1) {

				//angles = "30 45 60 45";
				var angels = "";
				for (var i = 0; i < Dig_Line_Num; i++) {
					angels += "60 ";
				}

				TerrainLayerOpObj.SetDepth(-25);
				TerrainLayerOpObj.SetAngles(angels);
			}
			else if (flag == 2) {
				TerrainLayerOpObj.Digging();
			}
		}

		function StartTerrainGrub() {
			TerrainLayerOpObj.StartTerrainGrubEx("grubCallback");
			TerrainLayerOpObj.SetDepth(-15);
		}

		function grubCallback(grubInfo){
			var grubObj = eval('(' + grubInfo + ')');

			if (grubObj.Command == "OnSetDigParam") {
				Dig_Line_Num = grubObj.LineNum;
			}
			else if (grubObj.Command == "OnDigEnd") {
				alert("开挖体积:" + grubObj.Volume);
				//开挖范围的多边形点集
				//alert(grubObj.Feature);
				var geomObj = eval('(' + grubObj.Feature + ')');
				//...
			}
		}

		function EndTerrainGrub() {
			TerrainLayerOpObj.ClearGrub();
			TerrainLayerOpObj.EndTerrainGrub();
		}

		function CreateTravel() {
			flagStravel = true;
			TerrainLayerOpObj.SetTerrainOpacity(0.5);
			NaviOpObj.CreateTravel();
			/*NaviOpObj.AddPathPoint(534412.3385, 3417936.2092, 10);
            NaviOpObj.AddPathPoint(535027.496, 3418070.8824, 12);
            NaviOpObj.AddPathPoint(535355.5799, 3418079.8783, 14);
            NaviOpObj.AddPathPoint(535729.70155, 3418042.8365, 16);
            NaviOpObj.AddPathPoint(536048.2605, 3418052.36153, 18);
            NaviOpObj.AddPathPoint(536575.8407, 3418125.9158, 20);
            NaviOpObj.SetSpeed(10.0);
            NaviOpObj.SetAutoTravel(false);
            NaviOpObj.SetConstantTile(true,-1.0);
            NaviOpObj.StartStravel();*/
			NaviOpObj.AddPathPoint(458529.79, 3422823.91, -20);
			NaviOpObj.AddPathPoint(458543.9, 3423018.55, -20);
			NaviOpObj.AddPathPoint(458579.53, 3424132.78, -20);
			NaviOpObj.AddPathPoint(458553.56, 3424135.89, -20);
			NaviOpObj.AddPathPoint(458510.29, 3422983.19, -20);
			NaviOpObj.SetSpeed(10.0);
			NaviOpObj.SetAutoTravel(false);
			NaviOpObj.SetConstantTile(true, 7);
			NaviOpObj.StartStravel();
			NaviOpObj.SetAutoTravel(true);
			NaviOpObj.SetUnderGroundView(-1000.0);
		}

		function CreateTravel2() {
			//NaviOpObj.CreateTravel();
			//NaviOpObj.AddPathPoint(2665.232910,794925.3125,149);
			//NaviOpObj.AddPathPoint(2663.699707,795190.4375,149);
			//NaviOpObj.AddPathPoint(2783.084229,795199.125,149);
			TerrainLayerOpObj.SetTerrainOpacity(0.5);

			NaviOpObj.CreateTravel();
			NaviOpObj.AddPathPoint(534412.3385, 3417936.2092, 126);
			NaviOpObj.AddPathPoint(535027.496, 3418070.8824, 126);
			NaviOpObj.AddPathPoint(535027.496, 3418070.8824, 126);
			NaviOpObj.AddPathPoint(535355.5799, 3418079.8783, 126);
			NaviOpObj.AddPathPoint(535729.70155, 3418042.8365, 126);
			NaviOpObj.AddPathPoint(536048.2605, 3418052.36153, 126);
			NaviOpObj.AddPathPoint(536575.8407, 3418125.9158, 126);
			NaviOpObj.SetSpeed(10.0);

			NaviOpObj.SetRange(100.0);
			NaviOpObj.SetAutoTravel(false);
			NaviOpObj.SetConstantTile(true,7);

			//NaviOpObj.SetAutoTravel(true);
			//NaviOpObj.SetConstantTile(true,0);

			NaviOpObj.StartStravel();


			//NaviOpObj.SetUnderGroundView(-1000.0);

			/*
			NaviOpObj.CreateTravel();

            NaviOpObj.AddPathPoint(499664.844336,3307799.14365,2);
            NaviOpObj.AddPathPoint(499391.15238,3307895.14722,2);
            */

			//NaviOpObj.SetSpeed(10.0);
			//NaviOpObj.SetConstantTile(true,7);
			//NaviOpObj.StartStravel();
			//NaviOpObj.SetAutoTravel(false);
		}

		function FreeView(){
			NaviOpObj.SetAutoTravel(true);
			NaviOpObj.SetUnderGroundView(-1000.0);
		}

		function StartStravel() {
			NaviOpObj.StartStravel();
		}

		function EndStravel() {
			NaviOpObj.EndStravel();
			//NaviOpObj.SetUnderGroundView(0);
		}

		var travelRouteVisible = false;
		function TravelRouteVisible() {
			if(travelRouteVisible)
			{
				travelRouteVisible = false;
			}
			else
			{
				travelRouteVisible = true;
			}
			NaviOpObj.RouteVisible(travelRouteVisible);
		}


		function NavigateAPI_OnMove()
		{
			alert("Position Change");
			//获取当前位置信息
			GetViewInfo();
		}

		function RegisterOnMoveEvent() {
			NaviOpObj.RegisterOnMoveEvent("NavigateAPI_OnMove");

			//取消回调传个空字符
			//NaviOpObj.RegisterOnMoveEvent("");
		}

		function TestSelectFeature(flag) {
			var layerID = BaseLayerOpObj.GetLayerByName("建筑");

			var featurePos = BaseLayerOpObj.GetFeaturePositionEx(189, layerID, -1, "建筑");
			var posX = featurePos.coordinate.x;
			var posY = featurePos.coordinate.y;
			var posZ = featurePos.coordinate.z;
			alert(posX);

			//var layerID = BaseLayerOpObj.GetLayerByName("hggx");
			//var whereClause = "name = 'NXPL1202-GEODE' or name = 'NXWS-GEODE'";
			var whereClause = "modelid < 10";
			//var whereClause = "layername = 'gx'";

			//var effectStyle = "effect:high-light";
			var effectStyle = "effect:Texture-Animation";
			effectStyle = "";

			var result;
			if (flag == 0) {
				result = BaseLayerOpObj.SelectFeature(layerID, whereClause);
			}
			else if (flag == 1) {
				result = BaseLayerOpObj.SelectFeatureAndEffect(layerID, whereClause, effectStyle);
			}
			else if (flag == 2) {
				layerID = BaseLayerOpObj.GetLayerByName("整体储罐");
				result = BaseLayerOpObj.SelectNearFeature(layerID, "480420.2957843536 3317528.604508234", 10.0);
				if (result != "") {
					var obj = eval('(' + result + ')');
					BaseLayerOpObj.SetFeatureEffect(obj[0].Feature.FeatureID, layerID, "", "", "effect:high-light;color1:0.0 1.0 0.0 1.0;interval:500;loop:99;");
				}
			}
			alert(result);
		}

		function GetFeatureByGID() {
			var table = "管架预留梁";

			var hightLightObjs = new Array();

			for(var i=0;i<1;i++)
			{
				var gid = i;

				var featureInfo = BaseLayerOpObj.GetFeatureByGID(2194, "js_lin");
				alert(featureInfo);
				var featureID = featureInfo[0];
				var layerID = featureInfo[1];

				var featureObj = new Array();

				featureObj[0] = gid;
				featureObj[1] = table;
				featureObj[2] = featureID;
				featureObj[3] = layerID;

				hightLightObjs[i] = featureObj;
			}

			BaseLayerOpObj.SetHightLightOff();
			for(var i=0;i<4000;i++)
			{
				BaseLayerOpObj.SetHightLightOn(hightLightObjs[i][2],hightLightObjs[i][3],hightLightObjs[i][0],hightLightObjs[i][1]);
			}

		}

		function TestTextureFeatureOn() {
			var netName = "JS";
			var isOpen = "true";
			BaseLayerOpObj.TextureMoveOnEx(netName,isOpen);
		}

		function GetFeaturePos() {
			var gid = 63903;
			gid = 63907;
			gid = 63914;
			var table = "glrq_lin";
			//table = "ksys_lin";

			var whereClause = "gid = " + gid;
			var layerID = BaseLayerOpObj.GetLayerByName("天然气_线");
			var effectStyle = "effect:high-light";
			var result = BaseLayerOpObj.SelectFeatureAndEffect(layerID, whereClause, effectStyle);

			var obj = eval('(' + result + ')');

			//var featureInfo = BaseLayerOpObj.GetFeatureByGID(gid,table);
			//var featureInfo = BaseLayerOpObj.GetFeatureByGID("85","管架梁");
//			alert(featureInfo);
//
//			var featureID = featureInfo[0];
//			var layerID = featureInfo[1];
//			var isLayerVisible = BaseLayerOpObj.GetVisible(layerID);
//
//			if(isLayerVisible == "false")
//			{
//				alert("图层未显示");
//				return;
//			}
//
//			BaseLayerOpObj.SetHightLightOff();
//			BaseLayerOpObj.SetHightLightOn(featureID,layerID,gid,table);
			//BaseLayerOpObj.SetScaleAnime(featureID,layerID,gid,table);
//		    alert(obj[0].Feature.FeatureID);
			var featurePos = BaseLayerOpObj.GetFeaturePositionEx(obj[0].Feature.FeatureID, layerID, gid, table);

			var posX = featurePos.coordinate.x;
			var posY = featurePos.coordinate.y;
			var posZ = featurePos.coordinate.z;

			//alert("场景要素位置:\r\nx:"+ posX + "\r\ny:" + posY + "\r\nz:" + posZ);

			//要素在焦点位置，z = posZ
			//距离焦点
			var range = 50;
			NaviOpObj.SetViewPoint(posX, posY, posZ, 0, -90, range, 2.0);
		}

		function PauseStravel()
		{
			NaviOpObj.PauseTravel();
		}

		function ResumeStravel()
		{
			NaviOpObj.ResumeTravel();
		}

		function Test_WaterEffect()
		{
			CommonOpObj.StartPick("PickCallback_WaterEffect");
		}

		function PickCallback_WaterEffect(json) {
			var obj = eval('(' + json + ')');
			CommonOpObj.AddWaterEffect(obj.coordinate.x, obj.coordinate.y, obj.coordinate.z);
			CommonOpObj.EndPickModel();
		}

		function ClearWaterEffect()
		{
			CommonOpObj.ClearWaterEffect();
		}

		function Test_AddLabel()
		{
			CommonOpObj.StartPick("PickCallback_AddLabel");
		}

		function PickCallback_AddLabel(json)
		{
			var obj = eval('(' + json + ')');
			NaviOpObj.AddLabel(obj.coordinate.x, obj.coordinate.y, obj.coordinate.z, "文字");
			CommonOpObj.EndPickModel();
		}

		function Test_RemoveLabel()
		{
			NaviOpObj.RemoveAllLabel();
		}

		function Test_SetUnderGround()
		{
			NaviOpObj.SetUnderGroundView(-5.0);
		}

		function Test_CloseUnderGround()
		{
			NaviOpObj.CloseUnderGroundView();
		}

		function Test_OnUnload()
		{
			alert();
		}

		function Test_SetLayerOpac()
		{
			var num = BaseLayerOpObj.GetLayerNum() * 1.0;
			{
				var layerID = BaseLayerOpObj.GetLayerID(num - 2);
				BaseLayerOpObj.SetOpacity(layerID,0.5);
			}
			{
				var layerID = BaseLayerOpObj.GetLayerID(num - 1);
				BaseLayerOpObj.SetOpacity(layerID,0.5);
			}
		}

		function Test_GetLayerOpac()
		{
			var num = BaseLayerOpObj.GetLayerNum() * 1.0;
			var layerID = BaseLayerOpObj.GetLayerID(num - 2);
			var opac = BaseLayerOpObj.GetOpacity(layerID);

			var num = BaseLayerOpObj.GetLayerNum() * 1.0;
			{
				var layerID = BaseLayerOpObj.GetLayerID(num - 2);
				BaseLayerOpObj.SetOpacity(layerID,1.0);
			}
			{
				var layerID = BaseLayerOpObj.GetLayerID(num - 1);
				BaseLayerOpObj.SetOpacity(layerID,1.0);
			}
		}

		var lastNet = null;

		function Test_NetOpacity_OFF()
		{
			if(lastNet != null)
			{
				BaseLayerOpObj.NetOpacity(lastNet,false);
				lastNet = null;
			}
		}

		function Test_NetOpacity()
		{
			Test_NetOpacity_OFF();
			CommonOpObj.StartPickEx("NetOpacityCallback");
		}

		function NetOpacityCallback(json)
		{
			var obj = eval('(' + json + ')');

			var info = "要素信息:";

			info += "\r\ngid:" + obj.gid;
			info += "\r\ndno:" + obj.dno;
			info += "\r\n表名:" + obj.table;
			info += "\r\n拾取坐标:" + obj.coordinate.x + "," + obj.coordinate.y + "," + obj.coordinate.z;

			info += "\r\n三维实体ID:" + obj.featureid;

			info += "\r\n三维图层ID:" + obj.layerid;
			info += "\r\n三维实体Name:" + obj.name;

			alert(info);

			lastNet = obj.table.split('_')[0];

			BaseLayerOpObj.NetOpacity(lastNet,true);

			//BaseLayerOpObj.SetHightLightOff();
			//BaseLayerOpObj.SetHightLightOn(obj.featureid,obj.layerid,obj.gid,obj.table);
			CommonOpObj.EndPickModel();
		}

		var FeatureParam = {
			LayerID : "",
			FeatureName : "",
			FeatureUrl : "",
			offsetX : 499484.062500,
			offsetY : 3307821.25,
			offsetZ : 0.0,
			scaleX : 1.0,
			scaleY : 1.0,
			scaleZ : 1.0,
			angle : -20
		};

		var boxLayerID;
		var box1ID;
		function Test_AddContainer() {

			if (boxLayerID == null) {
				//boxLayerID = BaseLayerOpObj.Create("集装箱图层", "");
				var layer_config = BaseLayerOpObj.GetTemplateLayerConfig();
				layer_config.name = "集装箱图层";
				layer_config.id = "集装箱图层";
				layer_config.Reflect = true;
				boxLayerID = BaseLayerOpObj.CreateLayer(layer_config);
			}

			var featureID = 1;

			FeatureParam.FeatureID = 10086;
			FeatureParam.FeatureName = featureID;
			FeatureParam.scaleX = 1.0;
			FeatureParam.scaleY = 1.0;
			FeatureParam.scaleZ = 1.0;
			FeatureParam.offsetX = 480164;
			FeatureParam.offsetY = 3318126;
			FeatureParam.offsetZ = 0;

			FeatureParam.LayerID = boxLayerID;
			FeatureParam.FeatureUrl = "global://nbhg/youlun.ive";

			box1ID = BaseLayerOpObj.CreateFeature(JSON.stringify(FeatureParam));

			FeatureParam.angle = -20;

			var str = "90%";
			var label = new Hope3DLabel();
			label.OffsetX = 0;
			label.OffsetY = 0;
			label.OffsetZ = 13.0;
			label.Text = str;
			label.Url = "label://" + str;
			label.FontColor = 0x000000FF;

			BaseLayerOpObj.ShowFeatureLabel(box1ID, boxLayerID, JSON.stringify(label));
		}

		function Test_Container(flag){
			if (flag == 0) {
				BaseLayerOpObj.Remove(boxLayerID);
				boxLayerID = null;
			}
		}


		var containerShowOrHide = true;

		function Test_ShowHideFeature()
		{
			if(containerShowOrHide == false)
			{
				containerShowOrHide = true;
				BaseLayerOpObj.SetFeatureVisible(box1ID,boxLayerID,"true");
			}
			else
			{
				BaseLayerOpObj.SetFeatureVisible(box1ID,boxLayerID,"false");
				containerShowOrHide = false;
			}
		}

		function Test_HighLightContainer()
		{
			//获取位置
			var featurePos = BaseLayerOpObj.GetFeaturePositionEx(box1ID,boxLayerID,"","");

			var posX = featurePos.coordinate.x;
			var posY = featurePos.coordinate.y;
			var posZ = featurePos.coordinate.z;

			//要素在焦点位置，z = posZ
			//距离焦点
			var range = 500;

			//跳转
			NaviOpObj.SetViewPoint(posX, posY, posZ, 20, -45, range, 1.0);

			//高亮
			//BaseLayerOpObj.SetHightLightOn(box1ID,boxLayerID,"","");
			BaseLayerOpObj.SetScaleAnime(box1ID,boxLayerID);
		}

		function Test_TransparentLayer()
		{
			BaseLayerOpObj.SetLayerTransparent(boxLayerID,0.5);
		}

		function Test_ColorLayer()
		{
			BaseLayerOpObj.SetLayerColor(boxLayerID,"255,0,0,125");
		}

		function Test_ClearLayerEffect()
		{
			BaseLayerOpObj.ClearLayerEffect(boxLayerID);
		}

		var car1ID = null;
		var car2ID = null;

		var RouteParam = {
			route : null,
			times : 1,
			finish : "Stay_End_Point" //结束时候要素的状态Stay_Feature_Position,Stay_Start_Point,Stay_End_Point,Disappear
		};

		function Test_CreateFeautreAnimePath() {
			var z = 3.7;
			var x1 = 480450.919325;
			var y1 = 3317815.17;
			var x2 = 479633.973356;
			var y2 = 3317692.304635;

			var p1 = [x1, y1, z];
			var p2 = [x2, y2, z];
			var p3 = [x2 + 10, y2, z];

			//
			var layerID = BaseLayerOpObj.GetTempFeatureLayer();

			if(car1ID == null)
			{
				FeatureParam.LayerID = layerID;
				FeatureParam.FeatureName = "集卡1";
				FeatureParam.FeatureUrl = "global://fbx/lichking.fbx";
				//FeatureParam.FeatureUrl = "http://192.168.8.231:8081/nbg/dragon.fbx";
				FeatureParam.offsetX = p1[0];
				FeatureParam.offsetY = p1[1];
				FeatureParam.offsetZ = p1[2];
				FeatureParam.angle = 160.0;
				var result = BaseLayerOpObj.CreateMultiFeature(JSON.stringify(FeatureParam));
				car1ID = result[0].Feature.FeatureID;
			}

			RouteParam.FaceDirection = "0 -1 0";
			RouteParam.route = new Array;
			RouteParam.route[0] = {route : {path:[p1,p2],speed: 60.0,anime:"run"}};
			RouteParam.times = 1;
			RouteParam.finish = "Stay_End_Point";
			//RouteParam.finish = "Disappear";

			//
			BaseLayerOpObj.CreateFeautreAnimePath(car1ID,layerID,JSON.stringify(RouteParam));
			//BaseLayerOpObj.CreateFeautreAnimePath(box1ID, boxLayerID, JSON.stringify(RouteParam));

			var str = "<font face=\"宋体\" size=\"12\" color=\"black\">ID<font color='red' size=12>字体定义</font></font>";

			//
			var label = new Hope3DLabel();
			label.OffsetX = 0;
			label.OffsetY = 0;
			label.OffsetZ = z + 4.0;
			label.Text = str;
			label.Url = "label://" + str;

			BaseLayerOpObj.ShowFeatureLabel(car1ID,layerID,JSON.stringify(label));

			if(car2ID == null)
			{
				FeatureParam.LayerID = layerID;
				FeatureParam.FeatureName = "集卡2";
				FeatureParam.FeatureUrl = "global://nbhg/NJK.ive";
				FeatureParam.offsetX = p1[0];
				FeatureParam.offsetY = p1[1];
				FeatureParam.offsetZ = p1[2];
				FeatureParam.angle = -20.0;
				FeatureParam.FeatureUrl = "http://192.168.8.231:8081/nbg/NJK.ive";

				car2ID = BaseLayerOpObj.CreateFeature(JSON.stringify(FeatureParam));
			}

			RouteParam.route = new Array;
			RouteParam.route[0] = {route:{path:[p1],time: 2.0,anime:"stand"}};
			RouteParam.route[1] = {route:{path:[p1, p2], speed: 54, anime: "walk"} };
			RouteParam.route[2] = {route:{path:[p2],time: 2.0,anime:"stand"}};
			RouteParam.route[3] = {route:{path:[p2,p3],speed: 14.0,anime:"walk"}};
			RouteParam.route[4] = {route:{path:[p3, p2, p1], speed: 52.5, anime: "walk"} };
			RouteParam.route[5] = {route:{path:[p1],time: 1,anime:"stand"}};
			RouteParam.times = 1;
			RouteParam.finish = "Stay_Start_Point";
			//RouteParam.finish = "Disappear";

			//
			RouteParam.FaceDirection = "0 -1 0";
			BaseLayerOpObj.CreateFeautreAnimePath(car2ID,layerID,JSON.stringify(RouteParam));
		}

		//
		var TestFeatureAnimationFlag = 0;
		function TestFeatureAnimation(flag) {
			if(flag == 0){
				if (car1ID != null) {
					var layerID = BaseLayerOpObj.GetTempFeatureLayer();

					var x2 = 479633.973356;
					var y2 = 3317692.304635;
					var p1 = [x2 + 1000, y2, 3.7];

					if (TestFeatureAnimationFlag == 0) {
						TestFeatureAnimationFlag = 1;
					}
					else {
						p1 = [x2 - 1000, y2, 3.7];
						TestFeatureAnimationFlag = 0;
					}

					var AppendRoute = { route: { path: [p1], speed: 200} };
					BaseLayerOpObj.AppendFeatureAnimeRoute(car1ID, layerID,JSON.stringify(AppendRoute));
				}
			}

		}

		function Test_AddFeautreLabel(id){
			var featureID;
			var layerID = BaseLayerOpObj.GetTempFeatureLayer();
			if(id==1)
			{
				featureID = car1ID;
			}
			else
			{
				featureID = car2ID;
			}

			var str = "<font face=\"黑体\" size=\"12\" color=\"blue\">文字1\n   \n<br>文字2<br>文字3<font color='red' size=12>字体定义</font><p>分段222</p></font>";
			var label = new Hope3DLabel();
			label.OffsetX = 0;
			label.OffsetY = 0;
			label.OffsetZ = 4.0;
			label.Text = "集卡1";
			label.Url = "global://placemark32.png";
			label.Scale = 0.5;
			label.FontSize = 25;
//			label.Url = "label://" + str;

			BaseLayerOpObj.ShowFeatureLabel(featureID, layerID, JSON.stringify(label));
		}

		function Test_RemoveFeautreLabel(id)
		{
			var featureID;
			var layerID = BaseLayerOpObj.GetTempFeatureLayer();
			if(id==1)
			{
				featureID = car1ID;
			}
			else
			{
				featureID = car2ID;
			}

			BaseLayerOpObj.RemoveFeatureLabel(featureID,layerID);
		}

		function Test_RemoveFeature(id)
		{
			var featureID;
			var layerID = BaseLayerOpObj.GetTempFeatureLayer();
			if(id==1)
			{
				featureID = car1ID;
				car1ID = null;
			}
			else
			{
				featureID = car2ID;
				car2ID = null;
			}

			var p = {FeatureID:"",LayerID:""}
			p.FeatureID = featureID;
			p.LayerID = layerID;

			var jsStr = JSON.stringify(p);

			BaseLayerOpObj.RemoveFeature(jsStr);
		}

		function Test_UpdateFeatureAnimeObj(id)
		{
			var featureID;
			var layerID = BaseLayerOpObj.GetTempFeatureLayer();
			if(id==1)
			{
				featureID = car1ID;
			}
			else
			{
				featureID = car2ID;
			}

			var p = {FeatureID:"",LayerID:"",FeatureUrl:""}
			p.FeatureID = featureID;
			p.LayerID = layerID;
			p.FeatureUrl = "global://box-red.osgb";

			var jsStr = JSON.stringify(p);

			BaseLayerOpObj.UpdateFeatureAnimeModel(jsStr);
		}

		function Test_PauseFeautreAinime(id)
		{
			var featureID;
			var layerID = BaseLayerOpObj.GetTempFeatureLayer();
			if(id==1)
			{
				featureID = car1ID;
			}
			else
			{
				featureID = car2ID;
			}

			BaseLayerOpObj.PauseFeatureAnimePath(featureID,layerID);
		}

		function Test_ResumeFeautreAinime(id)
		{
			var featureID;
			var layerID = BaseLayerOpObj.GetTempFeatureLayer();
			if(id==1)
			{
				featureID = car1ID;
			}
			else
			{
				featureID = car2ID;
			}

			BaseLayerOpObj.ResumeFeatureAnimePath(featureID,layerID);
		}

		function Test_EndFollowFeautre(id)
		{
			BaseLayerOpObj.EndTrace();
		}

		function Test_StopFeautreAnimePath()
		{
			var layerID = BaseLayerOpObj.GetTempFeatureLayer();
			if(car1ID != null)
			{
				BaseLayerOpObj.StopFeautreAnimePath(car1ID,layerID);
			}
			if(car2ID != null)
			{
				BaseLayerOpObj.StopFeautreAnimePath(car2ID,layerID);
			}
		}

		function Test_RemoveFeautreAnimePath()
		{
			var layerID = BaseLayerOpObj.GetTempFeatureLayer();
			if(car1ID != null)
			{
				BaseLayerOpObj.RemoveFeatureAnime(car1ID,layerID);
			}
			if(car2ID != null)
			{
				BaseLayerOpObj.RemoveFeatureAnime(car2ID,layerID);
			}
		}

		function Test_FollowFeautre(id)
		{
			var layerID = BaseLayerOpObj.GetTempFeatureLayer();

			if(id == 1)
			{
				NaviOpObj.TraceFeature(car1ID,layerID);
			}
			else
			{
				NaviOpObj.TraceFeature(car2ID,layerID);
			}
		}

		function Test_EndFollowFeautre()
		{
			NaviOpObj.EndTrace();
		}

		function on_clickLabel(labelInfo)
		{
			var obj = eval('(' + labelInfo + ')');
			alert(labelInfo);
		}

		function Test_SetLabelListener()
		{
			var labelLayerID = BaseLayerOpObj.GetTempLabelLayer()
			BaseLayerOpObj.SetLabelListener(labelLayerID,"on_clickLabel");
		}

		var jumpToLabel = null;
		function Test_JumpTo() {
			var x = 489673.125;
			var y = 3312986.75;
			var z = 20;

			var heading = 0;
			var tile = -89;
			var range = 300;

			x = 3413.7234;
			y = 797299.24;
			z = 0;
			heading = -131.14511;
			tile = -9.1900969;
			range = 72.767698;

			NaviOpObj.SetViewPoint(x, y, z, heading, tile, range, 2);
			if (jumpToLabel == null) {
				var layerID = LabelOpObj.GetTempLayer();
				jumpToLabel = new Hope3DLabel();
				jumpToLabel.LayerID = layerID;
				jumpToLabel.OffsetX = x;
				jumpToLabel.OffsetY = y;
				jumpToLabel.OffsetZ = z;

				jumpToLabel.FontSize = 12;

				var str1;
				var unknown = "未知";

				str = "<font size=\"12\" color=\"white\">场馆名称:"+ unknown+
						"<br>场馆所属单位:"+ unknown +
						"<br>联系人:"+ unknown +"<br>联系电话:"+ unknown +
						"<br>场馆容量:"+ unknown +"<br>地址:"+ unknown +
						"<br>备注:"+ unknown +
						"</font>"+"<br><a  href=\"javascript:ShowNearQueryExp("+ unknown +","+ unknown +");\">"+"<font size=\"12\">周边查询</font></a>";

//				var fsize = 12;
//				var str;
//				str = "<font size=\"" + fsize + "\" color=\"white\">场馆名称:" + unknown +
//				"<br>场馆所属单位:" + "<font size=\"" + fsize + "\" color=\"blue\">未知未知未知<br>未知</font>" +
//				"<br>联系人:" + unknown + "<br>联系电话:" + unknown +
//				"<br>场馆容量:" + unknown + "<br>地址:" + unknown +
//				"<br>备注:" + unknown +
//				"</font>";


				jumpToLabel.BackGroundColor = 0xFF00FFFF;
				jumpToLabel.Text = str;
				jumpToLabel.Url = "label://" + str;
				jumpToLabel.FontColor = 0xFF00FFFF;
				//jumpToLabel.Text = "宁波港";
				//jumpToLabel.Url = "global://placemark32.png";
				jumpToLabel.LabelID = 10086;
				jumpToLabel.Show();
				jumpToLabel.OffsetX = jumpToLabel.OffsetY = jumpToLabel.OffsetZ = 0.0;
				//jumpToLabel.OffsetZ = 10.0;

				var RQlayerID = BaseLayerOpObj.GetLayerByName("天然气_点");
				var RQ_lin_layerID = BaseLayerOpObj.GetLayerByName("天然气_线");
				var JZlayerID = BaseLayerOpObj.GetLayerByName("建筑");

				//alert(JSON.stringify(jumpToLabel));
				//BaseLayerOpObj.SelectFeatureAndEffect(RQlayerID, "gid = 16961 and layername = 'glrq_nod'", "effect:high-light;color1:0.0 1.0 0.0 1.0;color2:0 0 1 1.0;interval:500;loop:99;");
				//BaseLayerOpObj.SelectFeatureAndEffect(RQlayerID, "gid <= 16961 and gid >= 16961 and layername = 'glrq_nod'", "effect:attach_node;type:feature;offset:0 0 2;url:global://fbx/arrow.fbx");
				//BaseLayerOpObj.SelectFeatureAndEffect(RQlayerID, "gid = 16961 and layername = 'glrq_nod'", "effect:attach_node;type:label;offset:0 0 2;url:" + JSON.stringify(jumpToLabel));
				//BaseLayerOpObj.SelectFeatureAndEffect(RQ_lin_layerID, "gid <= 3000 and gid >= 2000 and layername = 'glrq_lin'", "effect:attach_node;type:label;offset:0 0 0;url:" + JSON.stringify(jumpToLabel));

				//BaseLayerOpObj.SelectFeatureAndEffect(JZlayerID, "id = 9", "effect:attach_node;type:feature;scale:10 10 10;url:global://fbx/arrow.fbx");
				BaseLayerOpObj.SelectFeatureAndEffect(JZlayerID, "id = 9", "effect:attach_node;type:label;url:" + JSON.stringify(jumpToLabel));
			}
		}

		var locationLabel = null;
		var SampleLabelLayer = null;

		function Test_AddLocationLabel() {
			if (SampleLabelLayer == null) {
				SampleLabelLayer = LabelOpObj.CreateLayer("");
			}
			if(locationLabel == null)
			{
				locationLabel = new Hope3DLabel();
				locationLabel.LabelID = 10010;
				locationLabel.LayerID = SampleLabelLayer;
				locationLabel.FontColor = 0xFF00FFFF;
				locationLabel.OffsetX = 489773.125;
				locationLabel.OffsetY = 3312986.75;
				locationLabel.OffsetZ = 0;

				if (UseTestHG) {
					locationLabel.OffsetX = 480300.25;
					locationLabel.OffsetY = 3317873;
					locationLabel.OffsetZ = GlobalVectorOffsetHeight;
				}
				else {
					locationLabel.OffsetX = 468523.5009878912;
					locationLabel.OffsetY = 2584789.740020059;
				}



				//方式一
				//locationLabel.Text = "高空作业";
//			    locationLabel.Url = "global://placemark32.png";
				//locationLabel.Url = "E:\\项目数据\\1.avi";

				//方式二
				//locationLabel.Text = "高空作业";
				//locationLabel.Url = "label://高空作业.png";

				//locationLabel.Url = "http://img.zcool.cn/community/01d9b15541bb21000001e78c6478c5.jpg";
				locationLabel.Scale = 0.5;

				var fsize = 28;
				locationLabel.FontSize = fsize;
				locationLabel.BackGroundColor = 0xFF00FFFF;
				var unknown = "未知";
				var str;
				str = "<font size=\"" + fsize + "\" color=\"white\">场馆名称:" + unknown +
						"<br>场馆所属单位:" + "<font size=\"" + fsize + "\" color=\"blue\">未知未知未知<br>未知</font>" +
						"<br>联系人:" + unknown + "<br>联系电话:" + unknown +
						"<br>场馆容量:" + unknown + "<br>地址:" + unknown +
						"<br>备注:" + unknown +
						"</font>";

				locationLabel.Text = str;
				locationLabel.Url = "label://" + str;
				locationLabel.BubbleTipStyle = "bw:4.2;aw:20;ah:40;cr:8";

				locationLabel.Show();
			}
		}

		function Test_RemoveLocationLabel(flag) {
			if (flag == 0) {
				//删除对象
				if (locationLabel != null) {
					locationLabel.Remove();
					locationLabel = null;
				}
			}
			else if (flag == 1) {
				//清除图层所有对象
				LabelOpObj.RemoveAll(SampleLabelLayer);
				locationLabel = null;
			}
			else if (flag == 2) {
				//删除图层
				BaseLayerOpObj.Remove(SampleLabelLayer);
				locationLabel = null;
				SampleLabelLayer = null;
			}
		}

		var FeatureLabelFlag = 1;
		function Test_HighLightLabel(flag) {
			if (flag == 0) {
				if (locationLabel != null) {
					locationLabel.HighLight();
				}
			}
			else if (flag == 1) {
				var layerID = BaseLayerOpObj.GetLayerByName("整体储罐");
				var result = BaseLayerOpObj.SelectFeature(layerID, "name != ''");
				var obj = eval("(" + result + ")");

				var fsize = 28;

				var label = new Hope3DLabel();
				label.OffsetX = 0;
				label.OffsetY = 0;
				label.OffsetZ = 20.0;
				label.Scale = 1.0;
				label.FontSize = fsize;
				label.BackGroundColor = 0xFF00FFFF;
				label.VisibleDistance = 800;
				var unknown = "未知";
				var str;
				str = "<font size=\"" + fsize + "\" color=\"white\">场馆名称:" + unknown +
						"<br>场馆所属单位:" + "<font size=\"" + fsize + "\" color=\"blue\">未知未知未知<br>未知</font>" +
						"<br>联系人:" + unknown + "<br>联系电话:" + unknown +
						"<br>场馆容量:" + unknown + "<br>地址:" + unknown +
						"<br>备注:" + unknown +
						"</font>";

				label.Text = str;
				label.Url = "label://" + str;
//		        label.Url = "http://img.zcool.cn/community/01d9b15541bb21000001e78c6478c5.jpg";

				if (FeatureLabelFlag == 1) {
					FeatureLabelFlag = 2;
					for (var i = 0; i < obj.length; i++)
						BaseLayerOpObj.ShowFeatureLabel(obj[i].Feature.FeatureID, layerID, JSON.stringify(label));
				}
				else {
					FeatureLabelFlag = 1;
					for (var i = 0; i < obj.length; i++)
						BaseLayerOpObj.RemoveFeatureLabel(obj[i].Feature.FeatureID, layerID);
				}


			}
		}

		var modelVisible = false;
		function ChangeTravelRole(flag)
		{
			if(flag == 1)
			{
				NaviOpObj.SetCarPlayer();
			}
			else if(flag == 2)
			{
				NaviOpObj.SetPlanePlayer();
			}
			else if(flag == 3)
			{
				NaviOpObj.SetPersonPlayer();
			}
			else if(flag == 4)
			{
				modelVisible = !modelVisible;
				alert(modelVisible);
				NaviOpObj.SetModelVisible(modelVisible);
			}
		}

		function measureBeeline()
		{
			MTOpObj.MeasureBeeLine();
		}

		function measureHorline()
		{

			MTOpObj.MeasureHorLine();
		}

		function measureVerline()
		{
			MTOpObj.MeasureVerLine();
		}

		function Test_AddRegionEvent()
		{
			var a = {
				name: "集卡2路线点①",
				x: 499497.6875,
				y: 3307910.5,
				z: 0,
				r: 5
			};

			var b= {
				name: "集卡2路线点②",
				x: 499681.25,
				y: 3307848.5,
				z: 0,
				r: 5
			};

			//var obj = eval('(' + region + ')');

			BaseLayerOpObj.AddRegionEvent(JSON.stringify(a));
			BaseLayerOpObj.AddRegionEvent(JSON.stringify(b));
		}

		function Test_SetRegionCallback()
		{
			BaseLayerOpObj.SetRegionEventCallback("TestOnMoveInRegion");
		}

		function TestOnMoveInRegion(regionID)
		{
			var obj = eval('(' + regionID + ')');
			alert("FeatureID:" + obj.FeatureID
					+ "\r\nFeatureName:" + obj.FeatureName
					+ "\r\nLayerID:" + obj.LayerID
					+ "\r\nRegionName:" + obj.RegionName);
			//Test_StopFeautreAnimePath();
			//Test_RemoveFeature(2);
		}

		function Test_RemoveAllFeatureLabel()
		{
			BaseLayerOpObj.HideFeatureLabel();
		}

		var Box_Car_LayerID = null;
		function Test_CreateModelFeature(box_type)
		{
			if(Box_Car_LayerID == null)
			{
				Box_Car_LayerID = BaseLayerOpObj.Create("自动集装箱建模图层", "");

				var LayerConfig = {
					LayerID: "",
					Config: ""
				};
				LayerConfig.LayerID = Box_Car_LayerID;
				LayerConfig.Config = "PickEnable:false;RangeMax:200;";
//			    BaseLayerOpObj.SetLayerConfig(JSON.stringify(LayerConfig));
			}

//			var ModelParam = {
//					ModelType: "",
//					width : 2.2,
//					height : 2.37,
//					length : 5.0,
//					color : "color_1",
//					code : "10086",
//					Box2_Color : "color_8",
//					Box2_Code: "未知",
//					Icon: "Image:1_3.png;HorizonAlign:right;VerticalAlign:top;size:1;",
//					Icon2: " ",
//					PipeGeom: ""
//	            };

			var ModelParam = {
				ModelType: "",
				ContainerStyle1: "Width:2.2;Height:2.37;Length:5.0;Color:color_1;Code:10068;",
				ContainerStyle2: "Width:2.2;Height:2.37;Length:5.0;Color:color_7;Code:UNKNOWN未知",
				Icon: "Image:1_3.png;HorizonAlign:right;VerticalAlign:top;size:1;",
				Icon2: " ",
				PipeGeom: ""
			};

			var upImage = encodeURI("global://images/color_1_up.jpg");
			var sideImage = encodeURI("global://images/color_1_side.jpg");

			upImage = "http://192.168.8.231:8081/nbg/color_2_up.jpg";
			sideImage = "http://192.168.8.231:8081/nbg/color_2_side.jpg";
			sideImage = "http://192.168.8.231:8081/nbg/color_1_side.jpg";


			ModelParam.ContainerStyle1 += "up:" + upImage + ";";
			ModelParam.ContainerStyle1 += "down:" + upImage + ";";
			ModelParam.ContainerStyle1 += "left:" + sideImage + ";";
			ModelParam.ContainerStyle1 += "right:" + sideImage + ";";
			ModelParam.ContainerStyle1 += "backward:" + upImage + ";";
			ModelParam.ContainerStyle1 += "forward:" + upImage;


			var boxID;
			FeatureParam.offsetZ = GlobalVectorOffsetHeight;

			ModelParam.ModelType = "Box_Only";
			FeatureParam.FeatureName = ModelParam.ModelType;
			FeatureParam.offsetX = 489710;
			FeatureParam.offsetY = 3312563.5;

			if (UseTestHG) {
				FeatureParam.offsetX = 480418;
				FeatureParam.offsetY = 3317813.75;
			}

			FeatureParam.scaleX = 1.0;
			FeatureParam.scaleY = 1.0;
			FeatureParam.scaleZ = 1.0;
			FeatureParam.angle = -20;
			FeatureParam.LayerID = Box_Car_LayerID;
			FeatureParam.FeatureUrl = "model://" + JSON.stringify(ModelParam);
			boxID = BaseLayerOpObj.CreateFeature(JSON.stringify(FeatureParam));

			var FeatureConfig = {
				FeatureID: "",
				LayerID: "",
				Config: ""
			};

			FeatureConfig.FeatureID = boxID;
			FeatureConfig.LayerID = Box_Car_LayerID;
			FeatureConfig.Config = "PickEnable:false;RangeMax:200;";

			BaseLayerOpObj.SetFeatureConfig(JSON.stringify(FeatureConfig));

			//
			ModelParam.ModelType = "Car1_Only";
			FeatureParam.offsetX += 10;
			FeatureParam.offsetY += 10;
			FeatureParam.FeatureUrl = "model://" + JSON.stringify(ModelParam);
			BaseLayerOpObj.CreateFeature(JSON.stringify(FeatureParam));

			//
			ModelParam.ModelType = "Car2_Only";
			FeatureParam.offsetX += 10;
			FeatureParam.offsetY += 10;
			FeatureParam.FeatureUrl = "model://" + JSON.stringify(ModelParam);
			BaseLayerOpObj.CreateFeature(JSON.stringify(FeatureParam));


			//
			ModelParam.ModelType = "Car1_With_Box";
			FeatureParam.offsetX += 10;
			FeatureParam.offsetY += 10;
			FeatureParam.FeatureUrl = "model://" + JSON.stringify(ModelParam);
			BaseLayerOpObj.CreateFeature(JSON.stringify(FeatureParam));

			//
			ModelParam.ModelType = "Car2_With_Box";
			FeatureParam.offsetX += 10;
			FeatureParam.offsetY += 10;
			FeatureParam.FeatureUrl = "model://" + JSON.stringify(ModelParam);
			BaseLayerOpObj.CreateFeature(JSON.stringify(FeatureParam));

			ModelParam.ModelType = "Pipe";
			FeatureParam.offsetX += 10;
			FeatureParam.offsetY += 10;


			var p1 = [0, 0, 0];
			var p2 = [0, 0, 2];
			var p3 = [0, 10, 2];

			VectorRegionParam.coordinates = new Array;
			VectorRegionParam.coordinates[0] = new Array;
			VectorRegionParam.coordinates[0][0] = p1;
			VectorRegionParam.coordinates[0][1] = p2;
			VectorRegionParam.coordinates[0][2] = p3;
			VectorRegionParam.PipeRadius = 0.20;
			VectorRegionParam.PipeColor = 0x00FFFFFF;

			ModelParam.PipeGeom = JSON.stringify(VectorRegionParam);
			FeatureParam.FeatureUrl = "model://" + JSON.stringify(ModelParam);
			BaseLayerOpObj.CreateFeature(JSON.stringify(FeatureParam));
		}

		var EffectLayerID = null;
		function Test_AddParticleFeature(effect_type)
		{
			if(EffectLayerID == null)
			{
				EffectLayerID = BaseLayerOpObj.Create("特效粒子图层","");
			}

			var EffectParam = {
				type: "",
				width : 0,
				height : 0,
				length : 0,
				configFileName:""
			};

			//Effect Type :
			//light_fire
			//severe_fire
			//smoke
			//water_spout

			if(effect_type == 1)
			{
				EffectParam.type = "light_fire";
				EffectParam.configFileName = "LightFire.txt";
				// test effect
				FeatureParam.FeatureName = "火";
				FeatureParam.offsetX = 364914.3302274955;
				FeatureParam.offsetY = 2946865.484154674;
				FeatureParam.offsetZ = 93.58694512567035;
				FeatureParam.scaleX = 1.0;
				FeatureParam.scaleY = 1.0;
				FeatureParam.scaleZ = 1.0;
				FeatureParam.angle = -20;
				FeatureParam.LayerID = EffectLayerID;
				FeatureParam.FeatureUrl = "effect://" + JSON.stringify(EffectParam);
				BaseLayerOpObj.CreateFeature(JSON.stringify(FeatureParam));
			}
			else if(effect_type == 2)
			{
				EffectParam.type = "water_spout";
				EffectParam.configFileName = "WaterSpout.txt";
				// test effect
				FeatureParam.FeatureName = "水";
				FeatureParam.offsetX = 489540.6254375;
				FeatureParam.offsetY = 3312865.75;
				FeatureParam.offsetZ = 2.40;
				FeatureParam.scaleX = 1.0;
				FeatureParam.scaleY = 1.0;
				FeatureParam.scaleZ = 1.0;
				FeatureParam.angle = -20;
				FeatureParam.LayerID = EffectLayerID;
				FeatureParam.FeatureUrl = "effect://" + JSON.stringify(EffectParam);
				BaseLayerOpObj.CreateFeature(JSON.stringify(FeatureParam));
			}
			else if(effect_type == 3)
			{
				EffectParam.type = "smoke";
				EffectParam.configFileName = "smokeDiffuse.txt";
				// test effect
				FeatureParam.FeatureName = "烟";
				FeatureParam.offsetX = 489520.6254375;
				FeatureParam.offsetY = 3312865.75;
				FeatureParam.offsetZ = 2.40;
				FeatureParam.scaleX = 1.0;
				FeatureParam.scaleY = 1.0;
				FeatureParam.scaleZ = 1.0;
				FeatureParam.angle = -20;
				FeatureParam.LayerID = EffectLayerID;
				FeatureParam.FeatureUrl = "effect://" + JSON.stringify(EffectParam);
				BaseLayerOpObj.CreateFeature(JSON.stringify(FeatureParam));
			}
			else{
			}
		}

		var textFlag = 1;
		var sizeFlag = 1;
		var fontSize0 = 20;
		var fontSize1 = 20;
		var fontSize2 = 12;
		function Test_ShowUI(flag) {
			var text;
			if (textFlag == 1) {
				text = "全球约5亿人在使用的天气APP，支持196个国家70多万个城市及地区的天气查询，分钟级、公里级天气预报，实时预报雨雪。提供15天天气预报，5天空气质量预报，实时空气质量及空气质量等级预报。特殊天气提前发送预警信息，帮助用户更好做出生活决策。";
				textFlag = 2;
			}
			else {
				text = "12·25俄国防部飞机失踪事件是指2016年12月25日，一架俄国防部图－154飞机从索契起飞后从雷达上坠毁。据军队部门所得到的确切消息，图-154飞机上共有91人，其中包括媒体从业人员与音乐工作者，其中包括国防部亚历山大洛娃歌舞团的工作者们。";
				textFlag = 1;
			}

			//Infomation Bar
			var IndicateContent = {
				NameAndValues: null
			};
			IndicateContent.NameAndValues = new Array;
			if (sizeFlag == 1) {
				IndicateContent.NameAndValues[0] = { n: "indicate/main_card_box1.png", v: "indicate/卡片_汽油桶_big.png" };
				IndicateContent.NameAndValues[1] = { n: "indicate/main_card_box2.png", v: "indicate/卡片_作业船_big.png" };
				IndicateContent.NameAndValues[2] = { n: "indicate/main_card_box3.png", v: "indicate/卡片_在港车辆_big.png" };
				fontSize0 = 45;
				sizeFlag = 2;
			}
			else {
				IndicateContent.NameAndValues[0] = { n: "indicate/main_card_box1.png", v: "indicate/卡片_汽油桶_big.png" };
				IndicateContent.NameAndValues[1] = { n: "indicate/main_card_box2.png", v: "indicate/卡片_作业船_big.png" };
				fontSize0 = 20;
				sizeFlag = 1;
			}

			//Text Dialog
			var TipContent = {
				NameAndValues: null
			};
			TipContent.NameAndValues = new Array;
			TipContent.NameAndValues[0] = { n: "[colour='FFFFFFFF'][ font = 'msyh-" + fontSize0 + "']名称0", v: "[colour='FF00FFFF'][ font = 'msyh-" + fontSize0 + "']字段值1" };
			TipContent.NameAndValues[1] = { n: "[colour='FFFFFFFF'][ font = 'msyh-" + fontSize0 + "']字段2", v: "[colour='FF00FFFF'][ font = 'msyh-" + fontSize0 + "']属性值2" };
			TipContent.NameAndValues[2] = { n: "[colour='FFFFFFFF'][ font = 'msyh-" + fontSize0 + "']字段3", v: "[colour='FF00FFFF'][ font = 'msyh-" + fontSize0 + "']属性值3" };
			TipContent.NameAndValues[3] = { n: "[colour='FFFFFFFF'][ font = 'msyh-" + fontSize0 + "']字段3", v: "[colour='FF00FFFF'][ font = 'msyh-" + fontSize0 + "']属性值3" };
			TipContent.NameAndValues[4] = { n: "[colour='FFFFFFFF'][ font = 'msyh-" + fontSize0 + "']字段3", v: "[colour='FF00FFFF'][ font = 'msyh-" + fontSize0 + "']属性值3" };
			TipContent.NameAndValues[5] = { n: "[colour='FFFFFFFF'][ font = 'msyh-" + fontSize0 + "']字段3", v: "[colour='FF00FFFF'][ font = 'msyh-" + fontSize0 + "']属性值3" };
			TipContent.NameAndValues[6] = { n: "[colour='FFFFFFFF'][ font = 'msyh-" + fontSize0 + "']字段3", v: "[colour='FF00FFFF'][ font = 'msyh-" + fontSize0 + "']一二三四五\n六七八九十" };
			TipContent.NameAndValues[7] = { n: "[colour='FFFFFFFF'][ font = 'msyh-" + fontSize0 + "']字段3", v: "[colour='FF00FFFF'][ font = 'msyh-" + fontSize0 + "']一二三四五\n六七八九十" };
			TipContent.NameAndValues[8] = { n: "[colour='FFFFFFFF'][ font = 'msyh-" + fontSize0 + "']字段3", v: "[colour='FF00FFFF'][ font = 'msyh-" + fontSize0 + "']一二三四五\n六七八九十" };
			TipContent.NameAndValues[9] = { n: "[colour='FFFFFFFF'][ font = 'msyh-" + fontSize0 + "']字段3", v: "[colour='FF00FFFF'][ font = 'msyh-" + fontSize0 + "']一二三四五\n六七八九十" };

			//no header
			TipContent.NameAndValues[0].n = '';
			TipContent.NameAndValues[0].v = '';

			if(flag == 0)
			{
				CommonOpObj.ShowUI("Hope3D_UI_QH.xml");
			}
			else if (flag == 1) {
				CommonOpObj.InvokeGUI("target:dialog;oper:showtooltip;alpha:0.8;x:100;y:100;width:200;height:400;FontColor:0xFF0000FF;Text:" + text);
			}
			else if (flag == 2) {
				if (sizeFlag == 1) {
					var ColumnStyle = {size: "390 530",position: "5 0"};
					var buttons = new Array;
					buttons[0] = { size: "79 22", position: "200 540", command: "command1", staticImage: "indicate/checkout-button01.PNG", hoverImage: "indicate/checkout-button02.png", clickImage: "indicate/checkout-button03.png" };
					buttons[1] = { size: "79 22", position: "300 540", command: "command2", staticImage: "indicate/checkout-button01.PNG", hoverImage: "indicate/checkout-button02.png", clickImage: "indicate/checkout-button03.png" };
					CommonOpObj.InvokeGUI("target:dialog;oper:showtooltip_table;alpha:0.8;x:100;y:100;width:400;height:600;Text:" + JSON.stringify(TipContent) + ";buttonInfo:" + JSON.stringify(buttons) + ";MultiColumnList:" + JSON.stringify(ColumnStyle));
				}
				else {
					var ColumnStyle = { size: "870 700",position: "5 0" };
					var buttons = new Array;
					buttons[0] = { size: "158 45", position: "350 700", command: "command1", staticImage: "indicate/checkout-button01.PNG", hoverImage: "indicate/checkout-button02.png", clickImage: "indicate/checkout-button03.png" };
					buttons[1] = { size: "158 45", position: "580 700", command: "command2", staticImage: "indicate/checkout-button01.PNG", hoverImage: "indicate/checkout-button02.png", clickImage: "indicate/checkout-button03.png" };
					CommonOpObj.InvokeGUI("target:dialog;oper:showtooltip_table;VerticalScrollBarSize:64;alpha:0.8;x:30;y:30;width:880;height:800;Text:" + JSON.stringify(TipContent) + ";buttonInfo:" + JSON.stringify(buttons) + ";MultiColumnList:" + JSON.stringify(ColumnStyle));
				}
			}
			else if (flag == 3) {
				CommonOpObj.InvokeGUI("target:dialog;oper:ShowEmptyFrame;CloseButton:yes;alpha:0.5;x:100;y:100;width:200;height:400");
			}
			else if (flag == 4) {
				CommonOpObj.InvokeGUI("target:indicate;oper:hide");
				CommonOpObj.InvokeGUI("target:dialog;oper:hide");
			}
			else if (flag == 5) {
				if (sizeFlag == 1) {
					fontSize1 = 20;
					fontSize2 = 12;
					CommonOpObj.InvokeGUI("target:indicate;oper:Create;ElementSize:300 80;IconPosition:20 0;IconSize:60 60;LabelSize:200 70;LabelPosition:100 0;alpha:0.8;HorizonAligh:right;VerticalAligh:top;Offset:-100 100;Content:" + JSON.stringify(IndicateContent));
				}
				else {
					fontSize1 = 45;
					fontSize2 = 30;
					CommonOpObj.InvokeGUI("target:indicate;oper:Create;ElementSize:1100 240;IconPosition:40 0;IconSize:200 200;LabelSize:800 200;LabelPosition:280 0;alpha:0.7;HorizonAligh:right;VerticalAligh:top;Offset:-30 30;Content:" + JSON.stringify(IndicateContent));
				}

				CommonOpObj.InvokeGUI("target:indicate;oper:settext;FontColor:0xFF0000FF;index:0;text:[colour='FFFF0000'][ font = 'msyh-" + fontSize1 + "']25.05[colour='FFFFFFFF'][ font = 'msyh-" + fontSize2 + "'][vert-alignment='centre']（万吨）");
				CommonOpObj.InvokeGUI("target:indicate;oper:settext;FontColor:0x00FF00FF;index:1;text:[colour='FF00FFFF'][ font = 'msyh-" + fontSize1 + "']17[colour='FFFFFFFF'][font='msyh-" + fontSize2 + "'][vert-alignment='centre']（个）");
				CommonOpObj.InvokeGUI("target:indicate;oper:settext;FontColor:0xFF0000FF;index:2;text:[colour='FF00FFFF'][ font = 'msyh-" + fontSize1 + "']1[colour='FFFFFFFF'][font='msyh-" + fontSize2 + "'][vert-alignment='centre']（个）");
			}
			else if (flag == 6) {
				if (textFlag == 1) {
					CommonOpObj.InvokeGUI("target:indicate;oper:settext;FontColor:0xFF0000FF;index:0;text:[colour='FFFF0000'][ font = 'msyh-" + fontSize1 + "']26.05[colour='FFFFFFFF'][font='msyh-" + fontSize2 + "'][vert-alignment='centre']（万吨）");
					CommonOpObj.InvokeGUI("target:indicate;oper:settext;FontColor:0xFFFF0000;index:1;text:[colour='FF00FFFF'][ font = 'msyh-" + fontSize1 + "']17[colour='FFFFFFFF'][font='msyh-" + fontSize2 + "'][vert-alignment='centre']（个）");
					CommonOpObj.InvokeGUI("target:indicate;oper:settext;FontColor:0xFFFF0000;index:2;text:[colour='FF00FFFF'][ font = 'msyh-" + fontSize1 + "']0[colour='FFFFFFFF'][font='msyh-" + fontSize2 + "'][vert-alignment='centre']（辆）");
				}
				else {
					CommonOpObj.InvokeGUI("target:indicate;oper:settext;FontColor:0xFF0000FF;index:0;text:[colour='FFFF0000'][ font = 'msyh-" + fontSize1 + "']25.05[colour='FFFFFFFF'][font='msyh-" + fontSize2 + "'][vert-alignment='centre']（万吨）");
					CommonOpObj.InvokeGUI("target:indicate;oper:settext;FontColor:0x00FF00FF;index:1;text:[colour='FF00FFFF'][ font = 'msyh-" + fontSize1 + "']177[colour='FFFFFFFF'][font='msyh-" + fontSize2 + "'][vert-alignment='centre']（个）");
					CommonOpObj.InvokeGUI("target:indicate;oper:settext;FontColor:0xFF0000FF;index:2;text:[colour='FF00FFFF'][ font = 'msyh-" + fontSize1 + "']0[colour='FFFFFFFF'][font='msyh-" + fontSize2 + "'][vert-alignment='centre']（个）");
				}
			}
			else if (flag == 7) {
				var barStyle = "GridDimension:2 3;HasCloseButton:yes;BackGroundImage:indicate/bd1.jpg;IconSize:32 32;IconMargin:12 14 12 14;";

				//Control Toolbar
				var ControlBarContent = {
					Elements: null
				};
				ControlBarContent.Elements = new Array;
				ControlBarContent.Elements[0] = { command: "element1", staticImage: "indicate/c1.png", hoverImage: "indicate/c1.png", clickImage: "indicate/c1.png" };
				ControlBarContent.Elements[1] = { command: "element2", staticImage: "indicate/c2.png", hoverImage: "indicate/c2.png", clickImage: "indicate/c2.png" };
				ControlBarContent.Elements[2] = { command: "element3", staticImage: "indicate/c3.png", hoverImage: "indicate/c3.png", clickImage: "indicate/c3.png" };
				ControlBarContent.Elements[3] = { command: "element4", staticImage: "indicate/c4.png", hoverImage: "indicate/c4.png", clickImage: "indicate/c4.png" };
				CommonOpObj.InvokeGUI("target:control;oper:Create;" + barStyle + "HorizonAligh:center;VerticalAligh:center;Offset:0 -100;Content:" + JSON.stringify(ControlBarContent));

			}
			else if (flag == 8) {
				CommonOpObj.InvokeGUI("target:capture;oper:hide");
			}
			else
			{
				CommonOpObj.HideUI();
			}
		}

		var water1 = null;
		var water2 = null;
		var water3 = null;
		function Test_WaterColume(flag) {
			var layerID = "储罐";
			if (flag == 0) {

				var x = 480609.8528540035;
				var y = 3317805.01692489;

				//方式1
				//BaseLayerOpObj.SetLayerTransparent(layerID, 0.3);

				var layerID = BaseLayerOpObj.GetLayerByName("ZHAACG");
				var featureIDS = BaseLayerOpObj.SelectFeatureAndEffect(layerID, "name != ''", "effect:transparent;color:0.5 0.5 0.5 0.6;texture:yes;");

				var label = new Hope3DLabel();
				label.OffsetX = 0;
				label.OffsetY = 0;
				label.OffsetZ = 20.0;
				label.Text = "集卡1";
				label.Url = "global://placemark32.png";
				label.Scale = 1.0;
				label.FontSize = 16;

				var obj = eval('(' + featureIDS + ')');
				BaseLayerOpObj.ShowFeatureLabel(obj[0].Feature.FeatureID, layerID, JSON.stringify(label));
//		        BaseLayerOpObj.ShowFeatureLabel(1, layerID, JSON.stringify(label));
//		        BaseLayerOpObj.ShowFeatureLabel(25, layerID, JSON.stringify(label));

				var ModelParam = {
					ModelType: "liquid_cylinder",
					LiquidStyle: "height: 15.0;radius: 7.5;speed:2.0;loop:0"
				}

				{
//		            var layerID = BaseLayerOpObj.GetLayerByName("整体储罐");
//		            featureIDS = BaseLayerOpObj.SelectNearFeature(layerID, x + " " + y, 5.0);
//		            var obj = eval('(' + featureIDS + ')');
//		            BaseLayerOpObj.SetFeatureVisible(obj[0].Feature.FeatureID, layerID, false);
				}


				//layerID = BaseLayerOpObj.Create("液位展示图层", "");
				layerID = BaseLayerOpObj.GetTempFeatureLayer();
				FeatureParam.offsetX = x;
				FeatureParam.offsetY = y;
				FeatureParam.offsetZ = 3.8;
				FeatureParam.scaleX = 1.0;
				FeatureParam.scaleY = 1.0;
				FeatureParam.scaleZ = 1.0;
				FeatureParam.angle = -20;
				FeatureParam.LayerID = layerID;
				FeatureParam.FeatureUrl = "model://" + JSON.stringify(ModelParam);

				//
				FeatureParam.FeatureName = "水位1";

				if (water1 == null) {
					water1 = BaseLayerOpObj.CreateFeature(JSON.stringify(FeatureParam));
				}
			}
			else if (flag == 2) {
				var layerID = BaseLayerOpObj.GetLayerByName("储罐");
				var featureIDS = BaseLayerOpObj.SelectFeature(layerID, "name != '' or name = 'D_1707'");
				var obj = eval('(' + featureIDS + ')');

				var label = new Hope3DLabel();
				label.OffsetX = 0;
				label.OffsetY = 0;
				label.OffsetZ = 30.50;
				label.FontColor = 0x000000FF;

				label.VisibleDistance = 2500;
				for (var i = 0; i < obj.length; i++) {
					var featureID = obj[i].Feature.FeatureID;
					var str = "FeatureID:" + featureID;
					label.Text = str;
					label.Url = "label://" + str;
					BaseLayerOpObj.ShowFeatureLabel(featureID, layerID, JSON.stringify(label));
				}
			}
			else {
				//方式1
				//BaseLayerOpObj.ClearLayerEffect("储罐");

				//BaseLayerOpObj.SetHightLightOff();
				BaseLayerOpObj.ClearFeatureEffect(11, layerID, "", "");
				BaseLayerOpObj.ClearFeatureEffect(1, layerID, "", "");
				BaseLayerOpObj.ClearFeatureEffect(25, layerID, "", "");


				var p = { FeatureID: "", LayerID: "" }
				p.LayerID = BaseLayerOpObj.GetTempFeatureLayer();
				if (water1 != null) {
					p.FeatureID = water1;
					BaseLayerOpObj.RemoveFeature(JSON.stringify(p));
					water1 = null;
				}

				if (water2 != null) {
					p.FeatureID = water2;
					BaseLayerOpObj.RemoveFeature(JSON.stringify(p));
					water2 = null;
				}

				if (water3 != null) {
					p.FeatureID = water3;
					BaseLayerOpObj.RemoveFeature(JSON.stringify(p));
					water3 = null;
				}

			}
		}

		function Test_Simulate(flag) {

			FeatureParam.LayerID = BaseLayerOpObj.GetTempFeatureLayer();

			var Hope3DFireEffect1 = "Type:LightFireEffect;\
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
			FeatureParam.offsetX = 480699.7666880274;
			FeatureParam.offsetY = 3317723.310329716;
			FeatureParam.offsetZ = 25;
			FeatureParam.FeatureUrl = "effect://" + Hope3DFireEffect1;

			//火焰
			var effectID = BaseLayerOpObj.CreateFeature(JSON.stringify(FeatureParam));

			//第一辆车与喷水
			FeatureParam.FeatureName = "消防车1";
			FeatureParam.offsetX = 480677.8125;
			FeatureParam.offsetY = 3317715.25;
			FeatureParam.offsetZ = 3.7;
			FeatureParam.angle = -160;

			FeatureParam.FeatureUrl = "global://nbhg/XFC.ive";
			var car1ID = BaseLayerOpObj.CreateFeature(JSON.stringify(FeatureParam));

			FeatureParam.angle = 0;
			var Hope3DWaterSpoutEffect1 = "Type:WaterSpout;\
                ParticleSizeRange:0.2 0.2;\
                ParticleRateRange:500 600;\
                ParticleLifeTime:3;\
                ParticleInitialSpeedRange:25 28;\
                ParticleRadiusRange:0.1 0.1;\
                PhiRange:0 0;\
                ThetaRange:35 37;\
                DomainPlaneVector:0 0 -1 -1;";
			FeatureParam.FeatureUrl = "effect://" + Hope3DWaterSpoutEffect1;
			FeatureParam.offsetZ = 5.0;
			FeatureParam.angle = -70;
			var effectID1 = BaseLayerOpObj.CreateFeature(JSON.stringify(FeatureParam));


			//第二辆车与喷水
			var Hope3DWaterSpoutEffect2 = "Type:WaterSpout;\
                ParticleSizeRange:0.2 0.2;\
                ParticleRateRange:500 600;\
                ParticleLifeTime:3;\
                ParticleInitialSpeedRange:27 30;\
                ParticleRadiusRange:0.1 0.1;\
                PhiRange:0 0;\
                ThetaRange:35 37;\
                DomainPlaneVector:0 0 -1 -1;";
			FeatureParam.FeatureUrl = "global://nbhg/XFC.ive";
			FeatureParam.offsetX = 480732.375;
			FeatureParam.offsetY = 3317686;
			FeatureParam.offsetZ = 3.7;
			FeatureParam.angle = -90;
			var car2ID = BaseLayerOpObj.CreateFeature(JSON.stringify(FeatureParam));

			FeatureParam.offsetZ = 5.0;
			FeatureParam.angle = 40;
			FeatureParam.FeatureUrl = "effect://" + Hope3DWaterSpoutEffect2;
			var effectID2 = BaseLayerOpObj.CreateFeature(JSON.stringify(FeatureParam));
		}


		var roleID = null;
		var fireID = null;
		var Test_SubShelfAPI_Layer = null;
		var Test_SubShelf_View_Flag = 0;
		var Test_SubShelf_Label = null;
		function Test_SubShelfAPI(flag) {
			if (flag == 0 || flag == 5 || flag == 6) {
//		        var z = 21.2;
//		        var x1 = 535015.77000000002;
//		        var y1 = 3418069.5070000002;
//		        var x2 = 534738.12899999996;
//		        var y2 = 3418018.2349999999;

				var z = 18.7;
				var x1 = 534457.2822388343;
				var y1 = 3417925.541790958;
				var x2 = 535477.0378669414;
				var y2 = 3418161.048055397;

				var roleUrl = "http://192.168.8.231:8081/nbg/HopeMap3DMaterials/human4.fbx";



				var p1 = [x1, y1, z];
				var p2 = [x2, y2, z];
				var p3 = [x2 + 10, y2, z];

				//当角色行走到该地发生事件
				var region1 = {
					name: "触发着火事件①",
					x: 0,
					y: 0,
					z: 0,
					r: 4
				};

//		        if (Test_SubShelf_Label == null) {
//		            Test_SubShelf_Label = new Hope3DLabel();
//		            Test_SubShelf_Label.LayerID = LabelOpObj.GetTempLayer();
//		            Test_SubShelf_Label.OffsetX = p2[0];
//		            Test_SubShelf_Label.OffsetY = p2[1];
//		            Test_SubShelf_Label.OffsetZ = p2[2];
//		            Test_SubShelf_Label.Text = "模拟点";
//		            Test_SubShelf_Label.Url = "label://模拟点";
//		            Test_SubShelf_Label.FontColor = 0x000000FF;
//		            Test_SubShelf_Label.BubbleTipStyle = "bw:1.2;aw:5;ah:10;cr:4";
//		            Test_SubShelf_Label.Show();
//		        }


				region1.name = "起始点重置，删除模拟火焰";
				region1.x = p1[0];
				region1.y = p1[1];
				region1.z = p1[2];
				BaseLayerOpObj.AddRegionEvent(JSON.stringify(region1));

				region1.name = "触发着火事件①";
				region1.x = p2[0];
				region1.y = p2[1];
				region1.z = p2[2];
				BaseLayerOpObj.AddRegionEvent(JSON.stringify(region1));

				BaseLayerOpObj.SetRegionEventCallback("Test_SubShelfAPI_Region");


				//构建要素图层
				if (Test_SubShelfAPI_Layer == null) {
					Test_SubShelfAPI_Layer = BaseLayerOpObj.GetTempFeatureLayer();
				}

				//创建人物
				if (roleID == null) {
					FeatureParam.LayerID = Test_SubShelfAPI_Layer;
					FeatureParam.FeatureName = "集卡1";
					FeatureParam.FeatureUrl = roleUrl;
					FeatureParam.offsetX = p1[0];
					FeatureParam.offsetY = p1[1];
					FeatureParam.offsetZ = p1[2];
					FeatureParam.angle = 160.0;
					var result = BaseLayerOpObj.CreateMultiFeature(JSON.stringify(FeatureParam));
					roleID = result[0].Feature.FeatureID;
				}

				RouteParam.FaceDirection = "0 -1 0";
				RouteParam.route = new Array;
				RouteParam.route[0] = { route: { path: [p1], time: 2.0, anime: "stand"} };
				RouteParam.route[1] = { route: { path: [p1, p2], speed: 3.0, anime: "walk"} };
				RouteParam.route[2] = { route: { path: [p2], time: 2.0, anime: "stand"} };
				RouteParam.route[3] = { route: { path: [p2, p1], speed: 13.0, anime: "run"} };
				RouteParam.route[4] = { route: { path: [p1], time: 3.0, anime: "stand"} };
				RouteParam.times = 10000;
				RouteParam.finish = "Stay_End_Point";
				//RouteParam.finish = "Disappear";

				//人物沿着指定路径行走
				BaseLayerOpObj.CreateFeautreAnimePath(roleID, Test_SubShelfAPI_Layer, JSON.stringify(RouteParam));

				//wait();

				//摄像机跟随人物
				setTimeout(function () {
					NaviOpObj.TraceFeature(roleID, Test_SubShelfAPI_Layer);
				}, 1000);
			}
			else if (flag == 1 && roleID != null) {
				BaseLayerOpObj.RemoveFeatureAnime(roleID, Test_SubShelfAPI_Layer);
			}
			else if (flag == 2) {
				var effect;
				if (Test_SubShelf_View_Flag == 0) {
					effect = "effect:transparent;texture:enable;color:1.0 1.0 1.0 0.7";
					Test_SubShelf_View_Flag = 1;
				}
				else {
					effect = "";
					Test_SubShelf_View_Flag = 0;
				}
				var layerID = BaseLayerOpObj.GetLayerByName("管廊壁");
				BaseLayerOpObj.SetFeatureEffect("", layerID, "", "", effect);
				layerID = BaseLayerOpObj.GetLayerByName("ZH干线_体");
				BaseLayerOpObj.SetFeatureEffect("", layerID, "", "", effect);
			}
			else if (flag == 3) {
				BaseLayerOpObj.PauseFeatureAnimePath(roleID, Test_SubShelfAPI_Layer);
			}
			else if (flag == 4) {
				BaseLayerOpObj.ResumeFeatureAnimePath(roleID, Test_SubShelfAPI_Layer);
			}
		}

		function Test_SubShelfAPI_Region(regionID) {
			var obj = eval('(' + regionID + ')');
//            alert("FeatureID:" + obj.FeatureID
//			 + "\r\nFeatureName:" + obj.FeatureName
//			 + "\r\nLayerID:" + obj.LayerID
//			 + "\r\nRegionName:" + obj.RegionName);

			if ("触发着火事件①" == obj.RegionName) {

				var Hope3DFireEffect1 = "Type:LightFireEffect;\
                SmokeParticleStartColor:0.6 0.6 0.6 0.2;\
                SmokeParticleEndColor:0.7 0.7 0.7 0.0;\
                FireParticleStartColor:1 0.643 0 0.4;\
                FireParticleEndColor:1 0.2 0.0 0.0;\
                FireParticleSizeRange:1.0 2.0;\
                SmokeParticleSizeRange:5.0 7.0;\
                FireParticleRateRange:15.0 20.0;\
                SmokeParticleRateRange:10.0 15.0;\
                FireParticleRadiusRange:0.5 1;\
                SmokeParticleRadiusRange:0.5 0.5;\
                FireParticleLifeTime:2.0;\
                SmokeParticleLifeTime:5.0;\
                SmokeOffsetPosition:0 0 5";

				FeatureParam.LayerID = Test_SubShelfAPI_Layer;
				FeatureParam.FeatureName = "火焰1";
				FeatureParam.offsetX = 534728.3713033816;
				FeatureParam.offsetY = 3418016.043512571;
				FeatureParam.offsetZ = 21.2;
				FeatureParam.FeatureUrl = "effect://" + Hope3DFireEffect1;

				//火焰
				if (fireID == null) {
					fireID = BaseLayerOpObj.CreateFeature(JSON.stringify(FeatureParam));
				}
			}
			else if ("起始点重置，删除模拟火焰" == obj.RegionName) {
				if (fireID != null) {
					var p = {FeatureID:"",LayerID:""}
					p.FeatureID = fireID;
					p.LayerID = Test_SubShelfAPI_Layer;
					BaseLayerOpObj.RemoveFeature(JSON.stringify(p));
					fireID = null;
				}
			}
		}


		var TestFireID = null;
		var TestRoleID = null;
		var TestRunRoute = null;
		function TestSubshelfFire() {
			var firePoint = [534754.316649646, 3418065.314728538, 19.58263718449093];
			var FeatureParam = {
				LayerID: "",
				FeatureName: "",
				FeatureUrl: "",
				offsetX: 0.0,
				offsetY: 0.0,
				offsetZ: 0.0,
				scaleX: 1.0,
				scaleY: 1.0,
				scaleZ: 1.0,
				angle: -20
			};
			var Hope3DFireEffect1 = "Type:LightFireEffect;\
                SmokeParticleStartColor:0.6 0.6 0.6 0.2;\
                SmokeParticleEndColor:0.7 0.7 0.7 0.0;\
                FireParticleStartColor:1 0.643 0 0.4;\
                FireParticleEndColor:1 0.2 0.0 0.0;\
                FireParticleSizeRange:1.0 2.0;\
                SmokeParticleSizeRange:5.0 7.0;\
                FireParticleRateRange:15.0 20.0;\
                SmokeParticleRateRange:10.0 15.0;\
                FireParticleRadiusRange:0.5 1;\
                SmokeParticleRadiusRange:0.5 0.5;\
                FireParticleLifeTime:2.0;\
                SmokeParticleLifeTime:5.0;\
                SmokeOffsetPosition:0 0 5";

			FeatureParam.LayerID = BaseLayerOpObj.GetTempFeatureLayer();
			FeatureParam.FeatureName = "火焰1";
			FeatureParam.offsetX = firePoint[0];
			FeatureParam.offsetY = firePoint[1];
			FeatureParam.offsetZ = firePoint[2];
			FeatureParam.FeatureUrl = "effect://" + Hope3DFireEffect1;

			if (TestFireID == null) {
				TestFireID = BaseLayerOpObj.CreateFeature(JSON.stringify(FeatureParam));
				NaviOpObj.SetViewPoint(534805, 3418072.5, 26, 84.2076, 4.84845, 66.8217, 2.0);

				var p1 = [534751.669771046, 3418067.034489588, 18.72160565933385];
				var p2 = [534520, 3418067, 18.72160565933385];

				if (TestRoleID == null) {
					FeatureParam.LayerID = BaseLayerOpObj.GetTempFeatureLayer();
					FeatureParam.FeatureName = "集卡1";
					FeatureParam.FeatureUrl = "global://fbx/human2.amxml";
					FeatureParam.offsetX = p1[0];
					FeatureParam.offsetY = p1[1];
					FeatureParam.offsetZ = p1[2];
					var result = BaseLayerOpObj.CreateMultiFeature(JSON.stringify(FeatureParam));
					TestRoleID = result[0].Feature.FeatureID;
				}

				setTimeout(function () {
					var RouteParam = {
						route: null,
						times: 1,
						finish: "Stay_End_Point"
					};
					RouteParam.FaceDirection = "0 -1 0";
					RouteParam.route = new Array;
					RouteParam.route[0] = { route: { path: [p1], time: 2.0, anime: "stand"} };
					RouteParam.route[1] = { route: { path: [p1, p2], speed: 25.0, anime: "run"} };
					RouteParam.times = 1;
					RouteParam.finish = "Stay_End_Point";

					//人物沿着指定路径行走
					BaseLayerOpObj.CreateFeautreAnimePath(TestRoleID, BaseLayerOpObj.GetTempFeatureLayer(), JSON.stringify(RouteParam));

					//路线

					TestRunRoute = vectorMultiArrowDrawCallback(p1,p2);

					//相机跟随
					setTimeout(function () {
						NaviOpObj.TraceFeature(TestRoleID, BaseLayerOpObj.GetTempFeatureLayer());
					}, 1000);
				}, 4000);
			}
		}

		function TestSubshelfFireEnd() {
			if (TestFireID != null) {
				var p = {FeatureID:"",LayerID:""}
				p.FeatureID = TestFireID;
				p.LayerID = BaseLayerOpObj.GetTempFeatureLayer();
				BaseLayerOpObj.RemoveFeature(JSON.stringify(p));

				p.FeatureID = TestRoleID;
				BaseLayerOpObj.RemoveFeature(JSON.stringify(p));


				TestFireID = null;
				TestRoleID = null;
			}

			if (TestRunRoute != null) {
				for (var i = 0; i < TestRunRoute.length; i++) {
					TestRunRoute[i].Remove();
				}
				TestRunRoute = null;
			}

		}

		function vectorMultiArrowDrawCallback(p1,p2) {

			var unit = 5.0;
			var arrowLength = 3.0;

			var dir = [];
			var length;

			{
				dir.push(p2[0] - p1[0]);
				dir.push(p2[1] - p1[1]);
				length = Math.sqrt(Math.pow(dir[0], 2) + Math.pow(dir[1], 2));
				dir[0] /= length;
				dir[1] /= length;
			}

			var arrows = [];

			for (var i = 0; i < Math.floor(length / unit); i++) {
				VectorRegionParam.type = "arrow";
				VectorRegionParam.coordinates = new Array;
				VectorRegionParam.coordinates[0] = new Array;
				//VectorRegionParam.coordinates = geometry;

				var startPoint = [];
				startPoint[0] = p1[0] + unit * i * dir[0];
				startPoint[1] = p1[1] + unit * i * dir[1];

				var midPoint = [];
				midPoint[0] = startPoint[0] + arrowLength * 0.5 * dir[0];
				midPoint[1] = startPoint[1] + arrowLength * 0.5 * dir[1];

				var endPoint = [];
				endPoint[0] = startPoint[0] + arrowLength * dir[0];
				endPoint[1] = startPoint[1] + arrowLength * dir[1];

				VectorRegionParam.coordinates[0].push(startPoint);
				VectorRegionParam.coordinates[0].push(midPoint);
				VectorRegionParam.coordinates[0].push(endPoint);

				var vectorArrow = new Hope3DVector;
				var layerID = VectorDrawOpObj.CreateVectorLayer("", "");
				vectorArrow.LayerID = layerID; //VectorDrawOpObj.GetTempVectorLayer();
				vectorArrow.Geom = JSON.stringify(VectorRegionParam);
				vectorArrow.LineColor = 0xFF0000FF;
				vectorArrow.FillColor = 0xFF000083;
				vectorArrow.OffsetHeight = 19;
				vectorArrow.Show();
				arrows.push(vectorArrow);
			}

			return arrows;
		}

		function onsetgrubterrain(info) {

		}

		var StereoMode = 0;
		function Test_Stereo(flag) {
			if (StereoMode == 0) {
				StereoMode++;
				CommonOpObj.SetStereoMode("ANAGLYPHIC");
			}
			else if (StereoMode == 1) {
				StereoMode++;
				CommonOpObj.SetStereoMode("HORIZONTAL_SPLIT");
			}
			else if (StereoMode == 2) {
				StereoMode++;
				CommonOpObj.SetStereoMode("VERTICAL_SPLIT");
			}
			else{
				CommonOpObj.SetStereoMode("OFF");
				StereoMode = 0;
			}
		}

		var OptionsFlag = 1;
		var WeatherMode = 0;
		function Test_SetScece(flag) {
			if (flag == 0) {
				if (StereoMode == 0) {
					StereoMode++;
					CommonOpObj.SetWeather("rain", 0.2);
				}
				else if (StereoMode == 1) {
					StereoMode++;
					CommonOpObj.SetWeather("rain", 0.8);
				}
				else if (StereoMode == 2) {
					StereoMode++;
					CommonOpObj.SetWeather("snow", 0.2);
				}
				else {
					CommonOpObj.SetWeather("off", 0);
					StereoMode = 0;
				}
			}
			else if (flag == 1) {
				CommonOpObj.SetFullScreen();
			}
			else if (flag == 2) {
				if (OptionsFlag == 1) {
					CommonOpObj.SetDeclutteringOptions("MinAnimationAlpha:0.0");
					OptionsFlag = 2;
				}
				else {
					CommonOpObj.SetDeclutteringOptions("MinAnimationAlpha:0.35");
					OptionsFlag = 1;
				}
			}
		}

		var House_LayerID = null;

		function Test_HouseWithParameter() {
			var geometry =
					{
						rings: [
							[859.728875453104, -36.763941453589],
							[878.756614839341, -36.763941453589],
							[878.756614839341, -55.0443491225742],
							[859.728875453104, -55.0443491225742],
							[859.728875453104, -36.763941453589]
						],
						spatialReference: { latestWkid: 0, wkid: 0 },
						type: "polygon"
					};

			var house =
					{
						storeyHeight: [6, 3, 3, 3, 4],
						wallThickness: 0.3,
						elevation: 0,
						crossSectionData: geometry.rings,
						surfaceMaterial:
								{
									Ambient: [0.250000, 0.250000, 0.250000, 0.100000],
									Diffuse: [0.400000, 0.400000, 0.400000, 0.100000],
									Specular: [0.774597, 0.774597, 0.774597, 0.100000],
									Shininess: 20.8
								},
						sideMaterial:
								{
									Ambient: [0.250000, 0.250000, 0.250000, 0.200000],
									Diffuse: [0.400000, 0.400000, 0.400000, 0.200000],
									Specular: [0.774597, 0.774597, 0.774597, 0.200000],
									Shininess: 20.8
								},
						light: "on"
					}

			buildHouse(house);
		}

		function buildHouse(houseData) {
			if (House_LayerID == null) {
				House_LayerID = BaseLayerOpObj.Create("建筑物建模图层", "");
			}

			var ModelParam = {
				ModelType: "house",
				HouseGeom: ""
			};

			FeatureParam.offsetX = houseData.crossSectionData[0][0] + 5;
			FeatureParam.offsetY = houseData.crossSectionData[0][1] - 9;
			for (var i = 0; i < houseData.crossSectionData.length; i++) {
				houseData.crossSectionData[i][0] -= FeatureParam.offsetX;
				houseData.crossSectionData[i][1] -= FeatureParam.offsetY;
			}

			var heightArray = houseData.storeyHeight;
			//var baseElevation = houseData.elevation;

			for (var i = 0; i < heightArray.length; ++i) {
				houseData.storeyHeight = [heightArray[i]];
				if (i > 0) {
					houseData.elevation += heightArray[i - 1];
				}
				ModelParam.HouseGeom = JSON.stringify(houseData);
				FeatureParam.scaleX = 1.0;
				FeatureParam.scaleY = 1.0;
				FeatureParam.scaleZ = 1.0;
				FeatureParam.FeatureName = ModelParam.ModelType;
				FeatureParam.LayerID = House_LayerID;
				FeatureParam.FeatureUrl = "model://" + JSON.stringify(ModelParam);
				BaseLayerOpObj.CreateFeature(JSON.stringify(FeatureParam));
				//BaseLayerOpObj.SetFeatureEffect(FeatureParam.FeatureID, FeatureParam.LayerID, "", "", "effect:transparent;color:1.0 0.0 0.0 " + 0.4);
			}
		}

		function AIRoute(path,p) {
			path.push(p);
		}

		function CreateRouteAnimetion(FeatureParam,RouteParam,url,direction) {
			FeatureParam.FeatureUrl = url;
			var carID = BaseLayerOpObj.CreateFeature(JSON.stringify(FeatureParam));
			RouteParam.FaceDirection = direction;
			BaseLayerOpObj.CreateFeautreAnimePath(carID, FeatureParam.LayerID, JSON.stringify(RouteParam));
			return carID;
		}

		function LoadRouteAnimetion(FeatureParam, xml_file, url, direction) {
			FeatureParam.FeatureUrl = url;
			var carID = BaseLayerOpObj.CreateFeature(JSON.stringify(FeatureParam));
			BaseLayerOpObj.LoadFeautreAnimePath(JSON.stringify({ FeatureID: carID, LayerID: FeatureParam.LayerID, Url: xml_file, FaceDirection: direction }));
			return carID;
		}
		function AISystem() {

			var layerID = BaseLayerOpObj.GetTempFeatureLayer();
			BaseLayerOpObj.SetLayerConfig(JSON.stringify({ LayerID: layerID, Config: "RangeMax:200000" }));

			var FeatureParam = { LayerID:layerID,FeatureUrl: ""};

			//路线0
			{
				setTimeout(function () { LoadRouteAnimetion(FeatureParam, "路线0.xml", "global://nbhg/JC.ive", "0 1 0"); }, 5 * 1000);
				setTimeout(function () { LoadRouteAnimetion(FeatureParam, "路线0.xml", "global://nbhg/JC.ive", "0 1 0"); }, 15 * 1000);
				setTimeout(function () { LoadRouteAnimetion(FeatureParam, "路线0.xml", "global://nbhg/YGC.ive", "0 -1 0"); }, 20 * 1000);
				setTimeout(function () { LoadRouteAnimetion(FeatureParam, "路线0.xml", "global://nbhg/WJK.ive", "0 1 0"); }, 25 * 1000);

			}

			//路线1
			{
				setTimeout(function () { LoadRouteAnimetion(FeatureParam, "路线1.xml", "global://model/car.ive", "0 -1 0"); }, 5 * 1000);
				setTimeout(function () { LoadRouteAnimetion(FeatureParam, "路线1.xml", "global://nbhg/WJK.ive", "0 1 0"); }, 10 * 1000);
				setTimeout(function () { LoadRouteAnimetion(FeatureParam, "路线1.xml", "global://model/car.ive", "0 -1 0"); }, 15 * 1000);
				setTimeout(function () { LoadRouteAnimetion(FeatureParam, "路线1.xml", "global://fbx/flying-machine.fbx", "0 -1 0"); }, 20 * 1000);
			}

			//路口1
			{
				setTimeout(function () {LoadRouteAnimetion(FeatureParam, "路口1.xml", "global://model/car.ive", "0 -1 0");}, 5 * 1000);
				setTimeout(function () {LoadRouteAnimetion(FeatureParam, "路口1.xml", "global://model/car.ive", "0 -1 0");}, 10 * 1000);
				setTimeout(function () {LoadRouteAnimetion(FeatureParam, "路口1.xml", "global://nbhg/YGC.ive", "0 -1 0");}, 15 * 1000);
				setTimeout(function () {LoadRouteAnimetion(FeatureParam, "路口1.xml", "global://nbhg/YGC.ive", "0 -1 0");}, 20 * 1000);
				setTimeout(function () {LoadRouteAnimetion(FeatureParam, "路口1.xml", "global://nbhg/NJK.ive", "0 1 0");}, 25 * 1000);
			}

			//路口1 南向
			{
				setTimeout(function () {LoadRouteAnimetion(FeatureParam, "路口1南向.xml", "global://model/car.ive", "0 -1 0"); }, 5 * 1000);
				setTimeout(function () {LoadRouteAnimetion(FeatureParam, "路口1南向.xml", "global://model/car.ive", "0 -1 0"); }, 10 * 1000);
				setTimeout(function () {LoadRouteAnimetion(FeatureParam, "路口1南向.xml", "global://nbhg/YGC.ive", "0 -1 0"); }, 15 * 1000);
				setTimeout(function () {LoadRouteAnimetion(FeatureParam, "路口1南向.xml", "global://nbhg/YGC.ive", "0 -1 0"); }, 20 * 1000);
				setTimeout(function () {LoadRouteAnimetion(FeatureParam, "路口1南向.xml", "global://nbhg/NJK.ive", "0 1 0"); }, 25 * 1000);
			}

			//路口1 东向
			{
				setTimeout(function () {LoadRouteAnimetion(FeatureParam, "路口1东向.xml", "global://model/car.ive", "0 -1 0"); }, 5 * 1000);
				setTimeout(function () {LoadRouteAnimetion(FeatureParam, "路口1东向.xml", "global://model/car.ive", "0 -1 0"); }, 10 * 1000);
				setTimeout(function () {LoadRouteAnimetion(FeatureParam, "路口1东向.xml", "global://nbhg/YGC.ive", "0 -1 0"); }, 15 * 1000);
				setTimeout(function () {LoadRouteAnimetion(FeatureParam, "路口1东向.xml", "global://nbhg/YGC.ive", "0 -1 0"); }, 20 * 1000);
				setTimeout(function () {LoadRouteAnimetion(FeatureParam, "路口1东向.xml", "global://nbhg/NJK.ive", "0 1 0"); }, 25 * 1000);
			}

			//门站附近1
			{
				setTimeout(function () {LoadRouteAnimetion(FeatureParam, "门站附近1.xml", "global://model/car.ive", "0 -1 0"); }, 5 * 1000);
				setTimeout(function () {LoadRouteAnimetion(FeatureParam, "门站附近1.xml", "global://model/car.ive", "0 -1 0"); }, 10 * 1000);
				setTimeout(function () {LoadRouteAnimetion(FeatureParam, "门站附近1.xml", "global://nbhg/YGC.ive", "0 -1 0"); }, 15 * 1000);
				setTimeout(function () {LoadRouteAnimetion(FeatureParam, "门站附近1.xml", "global://nbhg/YGC.ive", "0 -1 0"); }, 20 * 1000);
				setTimeout(function () {LoadRouteAnimetion(FeatureParam, "门站附近1.xml", "global://nbhg/NJK.ive", "0 1 0"); }, 25 * 1000);
			}

			//门站附近2
			{
				setTimeout(function () {LoadRouteAnimetion(FeatureParam, "门站附近2.xml", "global://model/car.ive", "0 -1 0"); }, 5 * 1000);
				setTimeout(function () {LoadRouteAnimetion(FeatureParam, "门站附近2.xml", "global://model/car.ive", "0 -1 0"); }, 10 * 1000);
				setTimeout(function () {LoadRouteAnimetion(FeatureParam, "门站附近2.xml", "global://nbhg/YGC.ive", "0 -1 0"); }, 15 * 1000);
				setTimeout(function () {LoadRouteAnimetion(FeatureParam, "门站附近2.xml", "global://nbhg/YGC.ive", "0 -1 0"); }, 20 * 1000);
				setTimeout(function () {LoadRouteAnimetion(FeatureParam, "门站附近2.xml", "global://nbhg/NJK.ive", "0 1 0"); }, 25 * 1000);
			}
		}

		function AutoTravel() {

			var layerID = BaseLayerOpObj.GetTempFeatureLayer();
			BaseLayerOpObj.SetLayerConfig(JSON.stringify({ LayerID: layerID, Config: "RangeMax:200000" }));

			var FeatureParam = { LayerID: layerID, FeatureUrl: "" };

			var carID = LoadRouteAnimetion(FeatureParam, "gl_path_0.xml", "global://fbx/flying-machine.fbx", "0 -1 0");

			NaviOpObj.TraceFeature(carID, layerID);
		}

		function Test_Start_Tool(name) {
			CommonOpObj.StartTool(name);
		}

		function Test_Show_Dialog(name) {
			CommonOpObj.ShowDialog(name);
		}

		function Test_Show_Tool(name) {
			CommonOpObj.ShowTool(name);
		}

	</script>--%>
</head>
<body>
<iframe src="${ctx}/static/WebAPI/HopeMap3D-GIS%20Sample.jsp" style="height: 100%;width: 100%;" scrolling="no" frameborder="0">
</iframe>
<%--<table style="width:100%; height:100%;margin:0px;padding:0px;" border="0" cellspacing="0" cellpadding="0" onclick="">
	<tr>
		<td id="LeftTD" style="width:200px;" valign="top">
			<div id="treed2" class="dtree" style="width:200px;height:600px;"></div>
		</td>

		<td id="MiddleTD" style="width:100%;height:100%">
			<div id="Scene3D" class="dtree" style="width:100%;height:100%;z-index:1;">
				<object id="Web3DCtrl" classid="clsid:A111D79A-2879-45C4-92BA-E72B23029EBB"
						width="100%" height="100%" standby="正在加载请稍后...">
				</object>
			</div>
		</td>

		<td>
			<div id="treed" class="dtree" style="width:202px;">
				<script type="text/javascript">

					ToolTree = new dTree('ToolTree');
					ToolTree.add(0,-1,'功能');

					//
					ToolTree.add(68,0,'场景设置','');
					ToolTree.add(1, 68, '球面模式', 'javascript: EarthMode()');
					ToolTree.add(2,68,'平面模式','javascript: SpaceMode()');
					ToolTree.add(11,68,'地形透明设置','javascript: SetTerrainOpacity()');
					ToolTree.add(12,68,'开启天空盒','javascript: SkyBoxON()');
					ToolTree.add(13,68,'关闭天空盒','javascript: SkyBoxOFF()');
					ToolTree.add(44,68,'地下浏览','javascript: Test_SetUnderGround()');
					ToolTree.add(45, 68, '关闭 地下浏览', 'javascript: Test_CloseUnderGround()');
					ToolTree.add(124, 68, '设置立体模式', 'javascript: Test_Stereo(0)');
					ToolTree.add(125, 68, '设置天气', 'javascript: Test_SetScece(0)');
					ToolTree.add(126, 68, '全屏', 'javascript: Test_SetScece(1)');
					ToolTree.add(129, 68, '设置标注拥挤参数', 'javascript: Test_SetScece(2)');

					//
					ToolTree.add(3,0,'拾取模型','javascript: Pick()');
					ToolTree.add(4,0,'停止拾取','javascript: EndPick()');

					//
					ToolTree.add(5,0,'量测','');
					ToolTree.add(6,5,'距离量测','javascript: MeasureDistacne()');
					ToolTree.add(33,5,'面积量测','javascript: MeasureArea()');
					ToolTree.add(34,5,'结束量测','javascript: endmeasure()');
					ToolTree.add(69,5,'------','');
					ToolTree.add(65,5,'直线量测','javascript: measureBeeline()');
					ToolTree.add(66,5,'水平量测','javascript: measureHorline()');
					ToolTree.add(67,5,'垂直量测','javascript: measureVerline()');


					//
					ToolTree.add(7, 0, '图形绘制', '');
					ToolTree.add(46, 7, '线段', 'javascript: startdraw(\'segment\')');
					ToolTree.add(31,7,'折线线','javascript: startdraw(\'line\')');
					ToolTree.add(32,7,'矩形','javascript: startdraw(\'rectangle\')');
					ToolTree.add(8, 7, '多边形', 'javascript: startdraw(\'polygon\')');
					ToolTree.add(120, 7, '圆', 'javascript: startdraw(\'circle\')');
					ToolTree.add(9, 7, '清除', 'javascript: cleardraw()');
					ToolTree.add(10,7,'停止绘制','javascript: enddraw()');

					ToolTree.add(39,7,'测试添加矢量图形','');
					ToolTree.add(40,39,'添加线','javascript: Test_AddLine()');
					ToolTree.add(41,39,'添加矩形','javascript: Test_AddRect()');
					ToolTree.add(42,39,'添加多边形','javascript: Test_AddPolygon()');
					ToolTree.add(43,39,'移除矢量图形','javascript: Test_RemoveVector()');
					ToolTree.add(104,39,'绘制箭头','javascript: Test_AddArrow()');
					ToolTree.add(105,39,'---','javascript: Test_AddArrow()');

					//
					ToolTree.add(14,0,'二三维联动','');
					ToolTree.add(15,14,'获取摄像机信息','javascript: GetViewInfo()');
					ToolTree.add(30,14,'注册场景移动事件','javascript: RegisterOnMoveEvent()');

					//三维分析
					ToolTree.add(50,0,'三维分析','');
					ToolTree.add(18,50,'开始地形开挖','javascript: StartTerrainGrub()');
					ToolTree.add(19,50,'结束地形开挖','javascript: EndTerrainGrub()');
					ToolTree.add(35,50,'爆管水花特效','javascript: Test_WaterEffect()');
					ToolTree.add(36,50,'清除水花特效','javascript: ClearWaterEffect()');
					ToolTree.add(51,50,'管网透明','javascript: Test_NetOpacity()');
					ToolTree.add(52,50,'关闭透明','javascript: Test_NetOpacity_OFF()');
					ToolTree.add(46,50,'流向分析','javascript: TestTextureFeatureOn()');
					ToolTree.add(47,50,'设置图层透明度','javascript: Test_SetLayerOpac()');
					ToolTree.add(48, 50, '获取图层透明度', 'javascript: Test_GetLayerOpac()');
					ToolTree.add(143, 50, '视域分析', 'javascript: Test_Start_Tool(\'vision_analyst\')');
					ToolTree.add(144, 50, '视频融合', 'javascript: Test_Show_Dialog(\'video_on_terrain:layerid\')');
					ToolTree.add(145, 50, '漫游', 'javascript: Test_Show_Tool(\'travel\')');

					//三维漫游
					ToolTree.add(49,0,'三维漫游','');
					ToolTree.add(16,49,'显示漫游菜单','javascript: ShowTravelTool()');
					ToolTree.add(20,49,'#预定义路径漫游','');
					ToolTree.add(21,20,'创建路径','javascript: CreateTravel()');
					ToolTree.add(22,20,'开始漫游','javascript: StartStravel()');
					ToolTree.add(23,20,'显示路径','javascript: TravelRouteVisible()');
					ToolTree.add(24,20,'结束漫游','javascript: EndStravel()');
					ToolTree.add(25,20,'自由视角','javascript: FreeView()');
					ToolTree.add(25,20,'暂停','javascript: PauseStravel()');
					ToolTree.add(26,20,'继续','javascript: ResumeStravel()');
					ToolTree.add(70,20,'车','javascript: ChangeTravelRole(1)');
					ToolTree.add(71,20,'飞机','javascript: ChangeTravelRole(2)');
					ToolTree.add(72,20,'人','javascript: ChangeTravelRole(3)');
					ToolTree.add(73,20,'模型可视','javascript: ChangeTravelRole(4)');

					//
					ToolTree.add(27,0,'控制三维要素','');
					ToolTree.add(28,27,'通过GID获取三维要素ID','javascript: GetFeatureByGID()');
					ToolTree.add(29, 27, '获取要素位置', 'javascript: GetFeaturePos()');
					ToolTree.add(110, 27, '查询要素FeatureID', 'javascript: TestSelectFeature(0)');
					ToolTree.add(111, 27, '查询要素且高亮', 'javascript: TestSelectFeature(1)');
					ToolTree.add(117, 27, '查询最近的要素', 'javascript: TestSelectFeature(2)');

					ToolTree.add(63,0,'注记','');
					ToolTree.add(37,63,'添加定位图标','javascript: Test_AddLocationLabel()');
					ToolTree.add(38,63,'移除定位图标','javascript: Test_RemoveLocationLabel(0)');
					ToolTree.add(61,63,'设置注记点击回调','javascript: Test_SetLabelListener()');
					ToolTree.add(62, 63, '快速定位', 'javascript: Test_JumpTo()');
					ToolTree.add(110, 63, '清除注记图层', 'javascript: Test_RemoveLocationLabel(1)');
					ToolTree.add(112, 63, '删除注记图层', 'javascript: Test_RemoveLocationLabel(2)');
					ToolTree.add(118, 63, '高亮注记', 'javascript: Test_HighLightLabel(0)');
					ToolTree.add(121, 63, '显示要素图层注记', 'javascript: Test_HighLightLabel(1)');
					ToolTree.add(142, 63, '拾取添加标注', 'javascript: PickAndLabel()');



					ToolTree.add(53,0,'集装箱','');
					ToolTree.add(54,53,'添加集装箱','javascript: Test_AddContainer()');
					ToolTree.add(55,53,'高亮集装箱','javascript: Test_HighLightContainer()');

					ToolTree.add(56,53,'设置透明度','javascript: Test_TransparentLayer()');
					ToolTree.add(57,53,'设置图层颜色','javascript: Test_ColorLayer()');
					ToolTree.add(58,53,'清除图层效果','javascript: Test_ClearLayerEffect()');
					ToolTree.add(59,53,'集卡移动','javascript: Test_CreateFeautreAnimePath()');

					ToolTree.add(77,53,'暂停集卡1','javascript: Test_PauseFeautreAinime(1)');
					ToolTree.add(78,53,'继续集卡1','javascript: Test_ResumeFeautreAinime(1)');

					ToolTree.add(79,53,'暂停集卡2','javascript: Test_PauseFeautreAinime(2)');
					ToolTree.add(80,53,'继续集卡2','javascript: Test_ResumeFeautreAinime(2)');

					ToolTree.add(60,53,'停止移动','javascript: Test_StopFeautreAnimePath()');
					ToolTree.add(99,53,'删除移动','javascript: Test_RemoveFeautreAnimePath()');
					ToolTree.add(74,53,'跟随集卡一','javascript: Test_FollowFeautre(1)');
					ToolTree.add(75,53,'跟随集卡二','javascript: Test_FollowFeautre(2)');
					ToolTree.add(76,53,'停止跟随集卡','javascript: Test_EndFollowFeautre()');

					ToolTree.add(81,53,'设置范围事件回调','javascript: Test_SetRegionCallback()');
					ToolTree.add(82,53,'添加事件范围','javascript: Test_AddRegionEvent()');
					ToolTree.add(83,53,'集卡2添加标注','javascript: Test_AddFeautreLabel(2)');
					ToolTree.add(84,53,'集卡2移除标注','javascript: Test_RemoveFeautreLabel(2)');
					ToolTree.add(85,53,'隐藏所有要素标注','javascript: Test_RemoveAllFeatureLabel()');

					ToolTree.add(86,53,'删除集卡1','javascript: Test_RemoveFeature(1)');
					ToolTree.add(87,53,'删除集卡2','javascript: Test_RemoveFeature(2)');

					ToolTree.add(88,53,'更新集卡1动画对象','javascript: Test_UpdateFeatureAnimeObj(1)');
					ToolTree.add(89,53,'更新集卡2动画对象','javascript: Test_UpdateFeatureAnimeObj(2)');

					ToolTree.add(103,53,'显隐集装箱','javascript: Test_ShowHideFeature()');
					ToolTree.add(109, 53, '删除集装箱图层', 'javascript: Test_Container(0)');
					ToolTree.add(119, 53, '集卡一添加路线点', 'javascript: TestFeatureAnimation(0)');

					ToolTree.add(90,0,'添加粒子节点','');
					ToolTree.add(91,90,'火','javascript: Test_AddParticleFeature(1)');
					ToolTree.add(92,90,'水柱','javascript: Test_AddParticleFeature(2)');
					ToolTree.add(93,90,'烟雾','javascript: Test_AddParticleFeature(3)');

					ToolTree.add(94,0,'集装箱建模','');
					ToolTree.add(95,94,'参数构建集装箱模型','javascript: Test_CreateModelFeature(0)');

					ToolTree.add(96,0,'GUI','');
					ToolTree.add(97, 96, '显示', 'javascript: Test_ShowUI(0)');
					ToolTree.add(98, 96, 'invoke(显示Tip)', 'javascript: Test_ShowUI(1)');
					ToolTree.add(98, 96, 'invoke(显示Tip表格)', 'javascript: Test_ShowUI(2)');
					ToolTree.add(98, 96, 'invoke(显示背景)', 'javascript: Test_ShowUI(3)');
					ToolTree.add(98, 96, 'invoke(隐藏背景)', 'javascript: Test_ShowUI(4)');
					ToolTree.add(122, 96, 'invoke(显示面板)', 'javascript: Test_ShowUI(5)');
					ToolTree.add(123, 96, 'invoke(设置面板文字)', 'javascript: Test_ShowUI(6)');
					ToolTree.add(127, 96, 'invoke(显示控制面板)', 'javascript: Test_ShowUI(7)');
					ToolTree.add(128, 96, 'invoke(隐藏控制面板)', 'javascript: Test_ShowUI(8)');
					ToolTree.add(114, 96, '隐藏', 'javascript: Test_ShowUI()');

					ToolTree.add(100,0,'添加屏幕图片','');
					ToolTree.add(101,100,'添加','javascript: Test_ScreenImage(0)');
					ToolTree.add(102,100,'移除','javascript: Test_ScreenImage(1)');

					ToolTree.add(106,0,'储罐测试','');
					ToolTree.add(107, 106, '液位展示', 'javascript: Test_WaterColume(0)');
					ToolTree.add(108, 106, '关闭展示', 'javascript: Test_WaterColume(1)');
					ToolTree.add(113, 106, '储罐标注', 'javascript: Test_WaterColume(2)');

					ToolTree.add(115, 0, '应急模拟', '');
					ToolTree.add(116, 115, '模拟储罐消防', 'javascript: Test_Simulate(0)');

					ToolTree.add(130, 0, '地下管廊示例接口', '');
					ToolTree.add(131, 130, '漫游', 'javascript: Test_SubShelfAPI(0)');
					ToolTree.add(132, 130, '暂停', 'javascript: Test_SubShelfAPI(3)');
					ToolTree.add(133, 130, '继续', 'javascript: Test_SubShelfAPI(4)');
					ToolTree.add(134, 130, '结束', 'javascript: Test_SubShelfAPI(1)');
					ToolTree.add(135, 130, '视角', 'javascript: Test_SubShelfAPI(2)');
					ToolTree.add(136, 130, '火灾模拟', 'javascript: TestSubshelfFire()');
					ToolTree.add(137, 130, '停止模拟', 'javascript: TestSubshelfFireEnd()');

					ToolTree.add(138, 0, '角度地形开挖', '');
					ToolTree.add(139, 138, '开始地形开挖', 'javascript: TestGrubTerrain(0)');
					ToolTree.add(140, 138, '设置地形开挖', 'javascript: TestGrubTerrain(1)');
					ToolTree.add(141, 138, '执行地形开挖', 'javascript: TestGrubTerrain(2)');

					//145
					treed.innerHTML = ToolTree.toString();

					ToolTree.openAll();
				</script>
			</div>
		</td>
	</tr>
</table>

<div style = "z-index:0;">
	<iframe id="Hope3DToolTip" name="Hope3DToolTip" src="r_AttributeShow.htm" style="display:none;position:absolute;
	    left: 0px; top: 0px;height:200px ;width:320px;background-color: green;background:none;" scrolling="no" frameborder="0">
	</iframe>
</div>--%>
</body>
</html>