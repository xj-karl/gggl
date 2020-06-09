<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/webpage/include/taglib.jsp"%>
<html>
<head>
<title></title>
<meta name="decorator" content="default" />
<style type="text/css">
html,body {
	margin: 0;
	padding: 0;
}
 
body,html,#allmap {
	width: 100%;
	height: 100%;
	overflow: hidden;
}

 
#dituContent {
	height: 100%;
	width: 100%;
	 
}
 .BMap_cpyCtrl{ display:none; }  
 .anchorBL{ display:none;}   
 #dituContent label{max-width:none;}
</style>
<script type="text/javascript">
	var ctx = '${ctx}';
	var mappoint='${mappoint}'
</script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=OTVG2uzqudiovwoHlFIs0P8Z3T7ID4K2"></script>
<script type="text/javascript" src="${ctxStatic}/model/js/qyxx/qyjbxx/mapindex.js?v=1.7"></script>
<script type="text/javascript" src="${ctx}/static/common/initmap.js?v=1.1"></script> 
</head>
<body>
   <div id="r-result" style="margin:10px auto;" >
		&nbsp;&nbsp;
		<!-- <input id="keyword" type="text" class="easyui-textbox" style="width:150px;" value="" data-options="prompt: '企业名称' " />
          <button type="button" class="btn btn-info btn-xs" onclick="search('keyword')" style="width:50px" >搜索</button> -->
          <button type="button" class="btn btn-info btn-xs" id="qyfb" style="width:70px">企业分布</button>
          <button type="button" class="btn btn-info btn-xs" id="fxxx" style="width:70px">风险点信息</button>
          <button type="button" class="btn btn-info btn-xs" id="cgxx" style="width:70px" >储罐信息</button>
          <button type="button" class="btn btn-info btn-xs" id="spjk" style="width:70px" >视频监控</button>
          <!-- <button type="button" class="btn btn-info btn-xs" onclick="reset()" style="width:70px">全部数据</button> -->
	</div>
	<div id="dituContent"></div>
     <div id="select_type" style="display:none;height:350px"  >
       <table id="areadata"></table> 
      </div>
  <script type="text/javascript">
   var ctx = '${ctx}';
   var mappoint='${mappoint}';
   var type="qyfb";//类型全局变量
   initMap("dituContent");
   map.disableScrollWheelZoom();
   $(function() {
	   //根据风险等级返回企业信息，并用海量点创建marker点
	   function getJson(type){
			var d;
			$.ajax({
				type : "POST",
				url : ctx+"/bis/qyjbxx/maplist?type="+type,
				async:false,
				dataType : 'json',
				success : function(data) {
					d=data.data;
					if (d) {
						pointCollection(data.data,type);//向地图中添加marker
					}
				}
			});
			return d;
		}
   	function getData(url){
   		var d1;
   		$.ajax({
   			type : "POST",
   			//url : ctx + "/bis/qyjbxx/maplist/",
   			url : ctx + url,
   			async:false,
   			dataType : 'json',
   			success : function(data) {
   				d1= data;
   			}
   		});
   		return d1;
   	}
   	getQyfbJson();
   	function getQyfbJson(){
   		map.clearOverlays();
   		createPolygon();
   		getJson(4);
   		getJson(3);
   		getJson(2);
   		getJson(1);
   	}
   	$("#fxxx").click(function(){
   		type='fxxx';
   		$.jBox.tip("请稍等...",'loading',{opacity:0});
   		getQyfbJson();
   		$.jBox.closeTip();
   	});
   	$("#cgxx").click(function(){
   		type='cgxx';
   		$.jBox.tip("请稍等...",'loading',{opacity:0});
   	var data=getData("/bis/cgxx/cgmapjson");
   	if (data != undefined) {
   		reloadMap(data);// 创建和初始化地图
   	}
   	$.jBox.closeTip();
   	});
   	$("#spjk").click(function(){
   		type='spjk';
   		$.jBox.tip("请稍等...",'loading',{opacity:0});
   		var data=getData("/zxjkyj/spjk/qymaplist");
   		if (data != undefined) {
   			markerArr = eval(data);
   			reloadMap(data);// 创建和初始化地图
   		}
   		$.jBox.closeTip();
   	});

   	$("#qyfb").click(function(){
   		type='qyfb';
   		$.jBox.tip("请稍等...",'loading',{opacity:0});
   		getQyfbJson();
   		$.jBox.closeTip();
   	});
   });
   </script>
</body>
</html>