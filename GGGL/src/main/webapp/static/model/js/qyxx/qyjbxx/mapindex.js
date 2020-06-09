	function reloadMap(v){
		addMarker(v);
		createPolygon();
	}
	//创建多边形图
    function createPolygon(){
    	if(mappoint!=""){
		var arry = mappoint.split("||");//lat，lnt
		var maparry = [];//坐标数组
		var narry;
		var m;
		for (var i = 0; i < arry.length; i++) {
			narry = arry[i].split(",");
			m = new BMap.Point(narry[0], narry[1]);
			maparry.push(m);
		}
		 polygon = new BMap.Polygon(maparry, {
			strokeColor : "red",
			strokeWeight : 2,
			strokeOpacity : 0.5,
			fillOpacity : 0.3
		}); //创建多边形
		map.addOverlay(polygon); //增加多边形
		map.setViewport(polygon.getPath());
	}}
 // 创建海量点
    function pointCollection(data,type) {
   	var color;
   	if(type==1) color="#FF5151";
   	if(type==2) color="#FFA042";
   	if(type==3) color="#F9F900";
   	if(type==4) color="#2894FF";
       if (document.createElement('canvas').getContext) {  // 判断当前浏览器是否支持绘制海量点
           var points = [];  // 添加海量点数据
           for (var i = 0; i < data.length; i++) {
             points.push(new BMap.Point(data[i].pointx, data[i].pointy));
           }
           var options = {
               size: BMAP_POINT_SIZE_NORMAL,
               shape: BMAP_POINT_SHAPE_CIRCLE,
               color: color,
           }
           var pointCollection = new BMap.PointCollection(points, options);  // 初始化PointCollection
           pointCollection.addEventListener('click', function (e) {
           	var d=getJsonByPoint(e);
   			var iw=createInfoWindow(d);
   			map.openInfoWindow(iw,e.point);
           });
           map.addOverlay(pointCollection);  // 添加Overlay
       } else {
           alert('当前浏览器不支持海量点查看，请在chrome、safari、IE8+以上浏览器查看地图');
       } 
   }
    //点击marker点 根据经纬度确定企业返回信息
    function getJsonByPoint(e){
    	var d;
    	$.ajax({
    		type : "POST",
    		url : ctx+"/bis/qyjbxx/findpoint?lng="+e.point.lng+"&lat="+e.point.lat,
    		dataType : 'json',
    		async:false,
    		success : function(data) {
    			if (data) {
    				d=data;
    			}
    		}
    	});
    	return d;
    }

function show(i,title) {
	top.layer.open({
	    type: 2,  
	    area: ['900px', '480px'],
	    title: title+'基本信息',
        maxmin: false, 
	    content: ctx+"/bis/qyjbxx/viewmain/"+i,
	    btn: ['关闭'],
	    cancel: function(index){ 
	       }
	}); 	
}
function showqyfb(i,title){
	show(i,title);
}
function showspjk(i,title) {
	top.layer.open({
		type: 2,  
		area: ['1100px', '450px'],
		title: title+'视频信息',
		maxmin: false, 
		content: ctx+"/zxjkyj/spjk/showqysp/"+i,
		btn: ['关闭'],
		cancel: function(index){ 
		}
	}); 	
}
function showfxxx(id,title) {
	layer.open({
		type: 1,  
		area: ['800px', '450px'],
		title: title+'风险信息',
		maxmin: false, 
		content: $("#select_type"),
		btn: ['关闭'],
	    success: function(layero, index){
	    	var dg =$('#areadata').datagrid({    
	    		nowrap:false,
	    		method: "post",
	    		url:ctx+'/fxgk/fxxx/tablist/'+id,
	    	    loadMsg :'正在加载',
	    	    fit : true,
	    		fitColumns : true,
	    		selectOnCheck:false,
	    		border : false,
	    		idField : 'id',
	    		striped:true,
	    		pagination:true,
	    		rownumbers:true,
	    		pageNumber:1,
	    		pageSize : 50,
	    		pageList : [ 50, 100, 150, 200, 250 ],
	    		scrollbarSize:0,
	    		selectOnCheck:false,
	    		border:false,
	    		singleSelect:true,
	    		checkOnSelect:false,
	    	    columns:[[    
			{field:'m1',title:'较大风险点名称',sortable:false,width:100,align:'center'},    
			{field:'m2',title:'风险类别',sortable:false,width:100,align:'center'},    
			{field:'m3',title:'行业',sortable:false,width:100,align:'center'},    
			{field:'m4',title:'行业类别',sortable:false,width:100,align:'center'},    
			{field:'m8',title:'事故类型',sortable:false,width:100,align:'center'},    
			{field:'m9',title:'风险分级',sortable:false,width:100,align:'center',sortable:true, 
				formatter : function(value, row, index){
					if(value=='1') return value='红';
					else if(value=='2') return value='橙';
					else if(value=='3') return value='黄';
					else if(value=='4') return value='蓝'; 
				},
				styler : function(value, row, index){
					if(value=='1')  return 'background-color:#FF0000;color:#1E1E1E';
					else if(value=='2')  return 'background-color:#FFC125;color:#1E1E1E';
					else if(value=='3')  return 'background-color:#FFFF00;color:#1E1E1E';
					else if(value=='4')  return 'background-color:#3A5FCD;color:#1E1E1E'; 
					}
			}
	    	]],
	    	/*onLoadSuccess:function(rowdata, rowindex, rowDomElement){
	    		dg.datagrid("autoMergeCells", [ 'qyname' ]);
	    	},*/
	    		checkOnSelect:true,
	    		selectOnCheck:false,
	    		});
	    	//dg.datagrid('loadData',{"rows":rydata});//datagrid加载数据
	      },
		cancel: function(index){ 
		}
	}); 	
}
function showcgxx(id,title) {
	layer.open({
	    type: 1,  
	    title: title+'储罐信息',
	    area:['800px','450px'],
	    content: $("#select_type"),
	    btn: ['关闭'],
	    success: function(layero, index){
	    	var dg =$('#areadata').datagrid({    
	    		nowrap:false,
	    		method: "post",
	    		url:ctx+'/bis/cgxx/tablist/'+id,
	    	    loadMsg :'正在加载',
	    	    fit : true,
	    		fitColumns : true,
	    		selectOnCheck:false,
	    		border : false,
	    		idField : 'id',
	    		striped:true,
	    		pagination:true,
	    		rownumbers:true,
	    		pageNumber:1,
	    		pageSize : 50,
	    		pageList : [ 50, 100, 150, 200, 250 ],
	    		scrollbarSize:0,
	    		selectOnCheck:false,
	    		border:false,
	    		singleSelect:true,
	    		checkOnSelect:false,
	    	    columns:[[    
        {field:'m1',title:'储罐名称',sortable:false,width:100},    
        {field:'M9',title:'储罐位号',sortable:false,width:100,align:'center'},   
        {field:'m2',title:'储罐类型',sortable:false,width:100,align:'center',
         	formatter : function(value, row, index) {
            	if(value=='1') return value='立式圆筒形储罐';
            	if(value=='2') return value='卧式圆筒形储罐';
				if(value=='3') return value='球形储罐';
				if(value=='4') return value='其他储罐';
        	}      
        },
        {field:'m4',title:'材质',sortable:false,width:100,align:'center',
         	formatter : function(value, row, index) {
            	if(value=='1') return value='滚塑';
            	if(value=='2') return value='玻璃钢';
				if(value=='3') return value='碳钢';
				if(value=='4') return value='陶瓷';
				if(value=='5') return value='橡胶';
				if(value=='6') return value='其他';
        	}      
       	},
        {field:'m6',title:'火灾危险性等级',sortable:false,width:100,align:'center',
         	formatter : function(value, row, index) {
            	if(value=='1') return value='甲类';
            	if(value=='2') return value='乙类';
				if(value=='3') return value='丙类';
				if(value=='4') return value='丁类';
				if(value=='5') return value='戊类';
        	}      
        },
        {field:'m7',title:'存储物料名称',sortable:false,width:100,align:'center'},
        {field:'m8',title:'CAS号',sortable:false,width:100,align:'center'}  
	    	]],
	    	onLoadSuccess:function(rowdata, rowindex, rowDomElement){
	    	},
	    		checkOnSelect:true,
	    		selectOnCheck:false,
	    		});
	    	//dg.datagrid('loadData',{"rows":rydata});//datagrid加载数据
	      },
	cancel: function(index){}
	});  	
}

// 创建InfoWindow
function createInfoWindow(json) {
	var param=json.id;
	var iw = new BMap.InfoWindow("<div style='width:280px;height:40px; cursor: pointer;' onclick=\"show"+type+"('"+ param+ "','"+json.title+"')\" ><p style='font-size:14px;'>名称：" + json.title + "</br>地址："+ json.address + "</br></p></div>");
	return iw;
}
// 创建一个Icon
function createIcon(json) {
	var icon = new BMap.Icon(ctx + json, new BMap.Size(31, 42));// , new
																// BMap.Size(23,25),{imageOffset:
																// new
																// BMap.Size(-46,-21),infoWindowOffset:new
																// BMap.Size(17,1),offset:new
																// BMap.Size(9,25)});
	return icon;
}
function SearchClass(data) {
	this.datas = data;
}

SearchClass.prototype.search = function(rule) {
	if (this.datas == null) {
		return false;
	}

	var reval = [];
	var datas = this.datas;
	var len = datas.length;
	var me = this;
	var ruleReg = new RegExp(this.trim(rule.d));
	var hasOpen = false;

	var addData = function(data, isOpen) {
		// 第一条数据打开信息窗口
		if (isOpen && !hasOpen) {
			hasOpen = true;
			data.isOpen = 1;
		} else {
			data.isOpen = 0;
		}
		reval.push(data);
	}
	var getData = function(data, key) {
		var ks = me.trim(key).split(/\./);
		var i = null, s = "data";
		if (ks.length == 0) {
			return data;
		} else {
			for (var i = 0; i < ks.length; i++) {
				s += '["' + ks[i] + '"]';
			}
			return eval(s);
		}
	}
	for (var cnt = 0; cnt < len; cnt++) {
		var data = datas[cnt];
		var d = getData(data, rule.k);
		if (rule.t == "single" && rule.d == d) {
			addData(data, true);
		} else if (rule.t != "single" && ruleReg.test(d)) {
			addData(data, true);
		} else if (rule.s == "all") {
			addData(data, false);
		}
	}
	return reval;
}
SearchClass.prototype.setData = function(data) {
	this.datas = data;
}
SearchClass.prototype.trim = function(str) {
	if (str == null) {
		str = "";
	} else {
		str = str.toString();
	}
	return str.replace(/(^[\s\t\xa0\u3000]+)|([\u3000\xa0\s\t]+$)/g, "");
}
//回车键事件
document.onkeydown=function(event){
    var e = event || window.event || arguments.callee.caller.arguments[0];
//    if(e && e.keyCode==27){ // 按 Esc 
//        //要做的事情
//      }
//    if(e && e.keyCode==113){ // 按 F2 
//         //要做的事情
//       }            
     if(e && e.keyCode==13){ // enter 键
         //要做的事情
    	 search('keyword');
    }
}; 
// ///
// 搜索方法 param{searchTypeRadio_name：搜索radio的名字,keyword_name:搜索文本框的id}
window.search = function(keyword_name) {
	// 获取页面dom
	var keyword = document.getElementById(keyword_name).value;
	if(keyword&&keyword!=null){
		// 获取dom的值
		var dd = searchClass.search({
			k : "title",
			d : keyword,
			s : ""
		});
		addMarker(dd,type);// 向地图中添加marker
	}else{
		reset();
	}
}
// 重置返回所有结果
function reset() {
	// s:{''只返回找到的结果|all返回所有的}
	$("#keyword").textbox('setValue','');
	var dd = searchClass.search({
		k : "title",
		d : "显示全部",
		s : "all"
	});
	addMarker(dd,type);// 向地图中添加marker
}
// 创建marker
window.addMarker = function(data) {
	map.clearOverlays();
	for (var i = 0; i < data.length; i++) {
		var json = data[i];// 整数据
		var p0 = json.pointx;// 经度
		var p1 = json.pointy;// 纬度
		var point = new BMap.Point(p0, p1);
		var iconImg = createIcon(json.icon);
		var marker = new BMap.Marker(point, {
			icon : iconImg
		});
		map.addOverlay(marker);
		(function() {
			var _json = json;
			var _iw = createInfoWindow(_json);
			var _marker = marker;
			_marker.addEventListener("click", function() {
				this.openInfoWindow(_iw);
			});
		})()
	}
}
