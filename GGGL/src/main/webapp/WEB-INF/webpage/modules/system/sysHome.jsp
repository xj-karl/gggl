<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/webpage/include/taglib.jsp"%>
<html>
<head>
<title>首页</title>
<meta name="decorator" content="default" />
<script type="text/javascript" src="${ctxStatic}/echarts/echarts.js"></script>
<%--  <script type="text/javascript" src="${ctxStatic}/model/js/qyxx/qyjbxx/qyfbmapindex.js"></script>  --%>
<%-- <script type="text/javascript" src="${ctxStatic}/model/js/home/bootstrap.min.js"></script> --%>
<script type="text/javascript" src="${ctxStatic}/model/js/home/jquery.liMarquee.js"></script>
<%--  <script type="text/javascript" src="${ctxStatic}/model/js/zxjkyj/dtfxyt/mapindex.js?v=1.2"></script> --%>
<link href="${ctxStatic}/model/css/home/styles.css" rel="stylesheet" />
<link href="${ctxStatic}/model/css/home/liMarquee.css" rel="stylesheet" />
<style type="text/css">
.BMap_cpyCtrl {
	display: none;
}

.anchorBL {
	display: none;
}

.imgdiv {
	text-align: left;
	float: right;
	width: 50%;
	font-size: 12px;
}

.imgsty {
	width: 13px;
	height: 13px;
}

.mr {
	margin-left: 20px;
}

.titlediv {
	float: left;
	margin-left: -45px;
	margin-top: -25px;
	font-size: 15px
}

.afont {
	font-size: 15px;
   font-weight:600;
}
</style>
</head>
<body id="win">
   <div class="container-fluid">
      <div class="toptips mgt10">
         <div class="weather" style="height:30px;">
            <a id="weather" href="javascript:" style="display:block;margin-top:5px;font-size:15px;"> </a>
         </div>
      </div>
      <div class="col-lg-8 col-md-8 col-xs-12  bs-example mgt10 mgl10">
         <div class="ajtitle">
            统计信息
            <a class="pull-right" href="#"></a>
         </div>
         <div class="col-lg-3 col-md-4 col-xs-6 ">
            <div class="tjbox1">
               <div class="tjicon"></div>
               <div class="tjtext">
                  <div class="titlediv">企业概况</div>
                  <a href="#" style="color:white;line-height:50px" onclick="openPage('/bis/qyjbxx/index','一企一档')">企业数：<span class="afont"></span></a>
               </div>
            </div>
         </div>
         <div class="col-lg-3 col-md-4 col-xs-6">
            <div class="tjbox2">
               <div class="tjicon"></div>
               <div class="tjtext" style="margin-top:-20px">
                  <div class="titlediv">两重点一重大(企业数)</div>
                  <span style="font-size:12px;letter-spacing:0.1em;height:4px"> <br>
                  <a href="#" style="color:white" onclick="openPage('/bis/wlxx/index2','重点监管化学品')">监管化学品：<span class="afont"></span></a><br>
                  <a href="#" style="color:white" onclick="openPage('/bis/gwgy/index','高危工艺')">高危工艺：<span class="afont"></span></a><br>
                  <a href="#" style="color:white" onclick="openPage('/bis/hazard/index','重大危险源')">重大危险源：<span class="afont"></span></a></span>

               </div>
            </div>
         </div>
         <div class="col-lg-3 col-md-4 col-xs-6">
            <div class="tjbox4">
               <div class="tjicon"></div>
               <div class="tjtext">
                  <div class="titlediv">自查自报</div>
                  <br> 
                  <a href="#" style="color:white"onclick="openPage('/aqjd/jcjl/index','检查记录', 2)">初查：<span class="afont"></span></a><br>
                  <a href="#" style="color:white"onclick="openPage('/aqjd/jcjl/index','检查记录', 1)">复查：<span class="afont"></span></a>
               </div>
            </div>
         </div>

         <div class="col-lg-3 col-md-4 col-xs-6">
            <div class="tjbox5">
               <div class="tjicon"></div>
               <div class="tjtext">
                  <div class="titlediv">隐患排查</div>
                  <br>
                  <a href="#" style=" color:white" onclick="openPage('/yhpc/yhpcjl/index','隐患排查',1)">已整改：<span class="afont"></span></a><br>
                  <a href="#" style=" color:white" onclick="openPage('/yhpc/yhpcjl/index','隐患排查','0')">未整改：<span class="afont"></span></a>
               </div>
            </div>
         </div>
         <div class="col-lg-3 col-md-4 col-xs-6">
            <div class="tjbox3">
               <div class="tjicon"></div>
               <div class="tjtext" >
                  <div class="titlediv">网格监管</div>
                  <br> 
                  <a href="#" style="color:white" onclick="openPage('/wghgl/wgd/index','网格点数')">网格点：<span class="afont"></span></a><br>
                  <a href="#" style="color:white" onclick="openPage('/wghgl/xjjlzg/syindex','未整改数')">未整改：<span class="afont"></span></a></span>
               </div>
            </div>
         </div>
         <div class="col-lg-3 col-md-4 col-xs-6">
            <div class="tjbox6">
               <div class="tjicon"></div>
               <div class="tjtext">
                  <div class="titlediv">危险作业报备</div>
                  <br>
                  <a href="#" style=" color:white" onclick="openPage('/dw/zysp/index','危险作业报备',2)">本厂：<span class="afont"></span></a><br>
                  <a href="#" style=" color:white" onclick="openPage('/dw/zysp/index','危险作业报备',1)">外包：<span class="afont"></span></a>
               </div>
            </div>
         </div>
         <div class="col-lg-3 col-md-4 col-xs-6">
            <div class="tjbox7">
               <div class="tjicon"></div>
               <div class="tjtext" style="margin-top:-20px">
                  <div class="titlediv">到期提醒</div>
                  <br> <span style="font-size:12px;letter-spacing:-0.1em;height:4px">
                  <a href="#" style=" color:white" onclick="openPage('/bis/aqpxxx/index','安全培训')">安全培训：<span class="afont"></span></a><br>
                  <a href="#" style=" color:white" onclick="openPage('/bis/tzsbxx/index','特种设备')">特种设备：<span class="afont"></span></a><br>
                  <a href="#" style=" color:white" onclick="openPage('/bis/occupharmreport/index','检测计划')">职业病危害检测：<span class="afont"></span></a></span>
               </div>
            </div>
         </div>
         <div class="col-lg-3 col-md-4 col-xs-6">
            <div class="tjbox8">
          
                  <div class="titlediv" style="margin-left:-20px">风险管控</div>
                  <br>
                  <div style="margin:0 auto">
                     <div class="imgdiv">
                        <a  style="color:white" onclick="openPage('/fxgk/fxjg/index','风险点分级管控',2)">
                           <img class="imgsty" style="background-color: #FFA042;" /> <span class="afont"></span>
                           </a>
                     </div>
                     <div class="imgdiv">
                        <a style="color:white" onclick="openPage('/fxgk/fxjg/index','风险点分级管控',1)">
                           <img class="imgsty" style="background-color: #FF5151;" /> <span class="afont"></span>
                        </a>
                     </div>
                     <div class="imgdiv">
                        <a href='#' style="color:white" onclick="openPage('/fxgk/fxjg/index','风险点分级管控',4)">
                           <img class="imgsty" style="background-color: #2894FF;" /> <span class="afont"></span></a>
                     </div>
                     <div class="imgdiv">
                        <a href='#' style="color:white" onclick="openPage('/fxgk/fxjg/index','风险点分级管控',3)">
                           <img class="imgsty" style="background-color: #F9F900;" /> <span class="afont"></span></a>
                     </div>
               </div>
               </div>
            </div>
         </div>
      
      <div class="col-lg-4 col-md-4 col-xs-12">
         <div class="bs-example mgt10">
            <div class="ajtitle">
               预警信息
               <%-- <a class="pull-right" onclick='top.openTab("${ctx}/fmew/bj/cgindex","储罐报警数据", false)' href="#">更多+&nbsp;&nbsp;</a> --%>
            </div>
            <div class="dowebok bgw">
               <ul class="clearpd" id="bjxx">
               </ul>
            </div>
         </div>
      </div>
      <div class="col-lg-6 col-md-6 col-xs-12 bs-example mgt10">
         <div class="ajtitle">
            最新文件
            <a class="pull-right" onclick='openPage("/issue/aqwjfb/index/","安全文件管理")' href="#"> 更多+&nbsp;&nbsp;</a>
         </div>
         <div class="listnews">
            <ul class="clearpd" id="xdt" style="height:300px">
            </ul>
         </div>
      </div>
      <div class="col-lg-6 col-md-6 col-xs-12">
         <div class="bs-example mgt10">
            <div class="ajtitle">
               最新动态
               <a class="pull-right" onclick='openPage("/issue/aqscdt/index","安全生产动态")' href="#"> 更多+&nbsp;&nbsp;</a>
            </div>
            <div class="listnews">
               <ul class="clearpd" id="zxdt" style="height:300px">
               </ul>
            </div>
         </div>
      </div>
      <!--    <div class="col-lg-6 col-md-6 col-xs-12 bs-example mgt10">
        <div class="ajtitle">
        风险地图分布 <a class="pull-right" href="#"></a>
        </div>
        <div class="mgt10" style="height:400px">
          	<div id="container" style="height: 100%;width: 100%"></div>
        </div>

    </div> -->
      <div class="col-lg-12 col-md-12 col-xs-12 bs-example mgt10">
         <div class="bs-example mgt10">
            <div class="ajtitle">
               地图分布
               <a class="pull-right" href="#"></a>
            </div>
            <div class="mgt10" style="height:550px">
               <iframe frameborder=0 width=100% height=100% marginheight=0 marginwidth=0 scrolling=no src="${ctx}/bis/qyjbxx/onemap"></iframe>
            </div>
         </div>
      </div>
      <div class="col-lg-12 col-xs-12 bs-example mgt10">
         <div class="ajtitle">
            物料储量历史图
            <a class="pull-right" href="#"></a>
         </div>
         <div class="mgt10" style="height:400px">

            <div class="ibox-content" style="height:400px">
               <div id="main" style="height:400px"></div>
            </div>
         </div>
      </div>
   </div>
   <script>
  var mappoint='${mappoint}';
  var forbidscrollflg='${forbidScroll}';
  $(function(){
	  //调用天气插件
	  $.getScript('http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js',function(){
		  var citytq=remote_ip_info.city;
	  	$.ajax({
			type:'get',
			url:url = "http://wthrcdn.etouch.cn/weather_mini?city=" + citytq,
			scriptCharset: "gbk",
			dataType:'json',
			success: function(data){
				   var _w0 = data.data.forecast;
				   var date= new Date();
			       var html="";
		           var r = /\[.+\[(.+?)\]/;
		           for(var i=0;i<_w0.length;i++){
		        	      html+=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+" "+"星期"+"日一二三四五六".charAt(date.getDay());
		        		  if(i==0){
		        		     html+=" 今日天气：";
		        		  }
		        		  else if (i==1)
		        			  html+= " 明天天气: ";
		        		  else
		        			  html+=" "+"天气: ";
		        		  html+=_w0[i].type+"; ";
		        		  html+=_w0[i].high+"~"+_w0[i].low+";&nbsp"+_w0[i].fengxiang+_w0[i].fengli.match(r)[1]+";&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
		        		  date.setDate(date.getDate()+1);
		          }
		          $("#weather").html(html);
		   	      $('.weather').liMarquee({});
			}
		});
	  });
/* 	    $.get('http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js',function(){
				var citytq=remote_ip_info.city;
				var url = "http://wthrcdn.etouch.cn/weather_mini?city==" + citytq
				$.ajax({
				  url: url,
				  dataType: "script",
				  scriptCharset: "gbk",
				  success: function (data) {
					  console.log(data);
					var _w0 = window.SWther.w[citytq];
				   var date= new Date();
			       var html="";
		           for(var i=0;i<_w0.length;i++){
		        	      html+=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+" "+"星期"+"日一二三四五六".charAt(date.getDay());
		        		  if(i==0){
		        		     html+=" 今日天气：";
		        		  }
		        		  else if (i==1)
		        			  html+= " 明天天气: ";
		        		  else
		        			  html+=" 后天天气: ";
		        		  if(_w0[i].s1==_w0[i].s2)
		        			  html+=_w0[i].s1;
		        		  else
		        			  html+=_w0[i].s1+"转"+_w0[i].s2+"";
		        		  html+=_w0[i].t2+"~"+_w0[i].t1+"℃  "+_w0[i].d1+_w0[i].p1+";&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
		        		  date.setDate(date.getDate()+1);
		          }
		          $("#weather").html(html);
		   	      $('.weather').liMarquee({
		   	     });
				  }
				});
		   }); */ 
  });
 $.ajax({
		url : ctx + '/syshome/zxdt',
		type : "POST",
		success : function(data) {
			//$("#xdt").append(data);
			var html="";
			for (var i = 0; i < data.length; i++) {
				var date=new Date(data[i].s1);
				html+= "<li><a onclick=\"opendt("+data[i].id+")\" href=\"#\" >"+(data[i].m1.length>25?data[i].m1.substring(0,30)+"...":data[i].m1) 
					 + "</a><span class=\"pull-right\">"+date.format('yyyy-MM-dd')+"</span></li>";
			}
			$("#zxdt").append(html);
		}
	});
$.ajax({
	url : ctx + '/syshome/issue',
	type : "POST",
	success : function(data) {
		//$("#xdt").append(data);
		var html="";
		for (var i = 0; i < data.length; i++) {
			var date=new Date(data[i].S2);
			html+= "<li><a onclick=\"openwj("+data[i].ID+")\" href=\"#\" >"+ (data[i].M1.length>25?data[i].M1.substring(0,30)+"...":data[i].M1) 
				 + "</a><span  class=\"pull-right\">"+date.format('yyyy-MM-dd')+"</span></li>";
		}
		$("#xdt").append(html);
	}
});
//报警信息
$.ajax({
	url : ctx + '/syshome/bjxx',
	type : "POST",
	success : function(data) {
		//$("#xdt").append(data);
		var html="";
		for(var i=0;i<data.length;i++){
			var arry=data[i].situation.split(";");
			var bjname=arry[arry.length-1];
		   if(data[i].type=='1')
			 html+="<li><span class=\"label label-info\">储罐</span><a onclick='openPage(\"\/fmew\/bj\/cgindex\",\"储罐报警数据\")\'>";
			else if(data[i].type=='2')
			 html+="<li><span class=\"label label-warning\">浓度</span><a onclick='openPage(\"\/fmew\/bj\/qtindex\",\"浓度报警数据\")\'>";
			 else
			 html+="<li><span class=\"label label-danger\">高危工艺</span><a onclick='openPage(\"\/fmew\/bj\/gyindex\",\"高危工艺报警数据\")\'>";
			 html+=(new Date(data[i].colltime)).format("yyyy-MM-dd hh:mm")+"  "+data[i].qyname+":"+bjname+"</a></li>";
		}
		   $("#bjxx").append(html);
		   $('.dowebok').liMarquee({direction: 'up',scrollamount: 40});
	}
});
$.ajax({
	url : ctx + '/syshome/sjzs',
	type : "POST",
	success : function(data) {
		var sj=eval(data);
		var afont= $(".afont");
		for(var i=0;i<afont.length;i++){
			afont[i].innerText=sj[i];
		}
	}
});

function openwj(id){
	window.open(ctx + "/issue/aqwjfb/view/" +id, "信息查看");
}
function opendt(id){
	window.open(ctx+"/issue/aqscdt/view/"+id,"生产动态信息查看");
}
function openPage(url,title,mflag){
	url='${ctx}'+url+"?sys=1";
	if(mflag!=null&&mflag!='')
		url+="&mflag="+mflag;
	layer.open({
	    type: 2,  
	    area: ['100%', '100%'],
	    title: title,
        maxmin: true, 
	    content: url,
	    btn: ['关闭'],
	    yes: function(index, layero){	
	    	layer.close(index);
			},
	cancel: function(index){}
	});
}

// 路径配置
require.config({
	paths : {
		echarts : '${ctxStatic}/echarts'
	}
});


var y = [];//y轴
var legend = [];//legend值
var x = [];//x轴
$(function(){
	$.ajax({
		url : ctx + "/zxjkyj/dsjfx/getlinejson",
		type : "POST",
		dataType : "json",
		success : function(data) {
			y = [];//y轴
			legend = [];//legend值
			x = [];//x轴
		    x = data.date;
			for (key in data) {
				if (key != "date") {
					y.push({
						"name" : key,
						"type" : "line",
						"data" : data[key]
					});
					legend.push(key);
				}
			}
			loadEcharts();
		}
});
});
 
function loadEcharts() {
	require([ 'echarts', 'echarts/chart/bar', 'echarts/chart/line' ], function(ec) {
		var myChart = ec.init(document.getElementById('main'));
		myChart.showLoading();
				myChart.hideLoading();
				myChart.setOption({

					tooltip : {
						trigger : 'axis'
					},
					legend : {
						data : legend
					},
					toolbox : {
						show : true,
						feature : {
							magicType : {
								show : true,
								type : [ 'line', 'bar' ]
							},
							restore : {
								show : true
							},
							saveAsImage : {
								show : true
							}
						}
					},
					xAxis : [ {
						type : 'category',
						boundaryGap : false,
						data : x
					} ],
					yAxis : [ {
						type : 'value',
						'name':'m³',
					} ],
					series : y
				});

			});
	}
  </script>
</body>
</html>