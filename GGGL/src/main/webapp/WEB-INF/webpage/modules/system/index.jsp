<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/webpage/include/taglib.jsp"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <title>企业智慧安全、环保、消防一体化云平台</title>

	<script src="${ctxStatic}/jquery/jquery-2.1.1.js" type="text/javascript"></script>
	<link href="${ctxStatic}/bootstrap/3.3.4/css_default/bootstrap.min.css" type="text/css" rel="stylesheet" />
	<script src="${ctxStatic}/bootstrap/3.3.4/js/bootstrap.min.js"  type="text/javascript"></script>
	<link href="${ctxStatic}/awesome/4.4/css/font-awesome.min.css" rel="stylesheet" />
	<!-- 引入layer插件 -->
	<script src="${ctxStatic}/layer-v2.0/layer/layer.js"></script>
	<script src="${ctxStatic}/layer-v2.0/layer/laydate/laydate.js"></script>
	<link href="${ctxStatic}/model/css/home/styles.css?v=1.0" rel="stylesheet" />
	<link href="${ctxStatic}/model/css/home/tabstyle.css?v=1.0" rel="stylesheet" />
	<script src="${ctxStatic}/common/tab.js?v=1.0"></script> 
	<script src="${ctxStatic}/common/common.js?v=1.0"></script> 
</head>
 <%
 	String logotitle="企业智慧安全、环保、消防一体化云平台";
 	if(session.getAttribute("logotitle")!=null&&!session.getAttribute("logotitle").equals(""))
 		logotitle=(String)session.getAttribute("logotitle");
 %>
<body class="wapper">
		<header class="navbar-static-top bs-docs-nav" id="top">
		  <div class="container-fluid">
		    <div class="navbar-header">
		    <!-- style="padding-left: 120px;background: url('${ctxStatic}/model/images/home/logo_qy_xmn.png') no-repeat;background-position-y:center;" -->
		      <a href="#" class="navbar-brand" >
		      	<span style=""> </span>
		      	<span style="color: #fad998;font-size: 18px;"><%=logotitle %></span>
		      </a>
		    </div>
		    <nav id="bs-navbar" class="collapse navbar-collapse">
		      <ul class="nav navbar-nav navbar-right">
		      	<li><a href="javascript:void(0);" onclick="openDialog('消息中心','${ctx }/system/message/index')"  title="消息中心"><i class="fa fa-envelope"></i><span class="label label-warning">0</span></a></li>
		        <li><a href="javascript:void(0);" onclick="openDialog('个人信息设置','${ctx}/system/user/infor')" title="个人档案"><i class="fa fa-cogs"></i></a></li>
		        <li><a href="${ctx}/a/logout" title="退出登录"><i class="fa fa-sign-out"></i></a></li>
		        <li><a href="javascript:void(0);" onclick="location.href='${ctx}/a'" title="风格切换"><i class="fa fa-image"></i></a></li>
		      </ul>
		    </nav>
		  </div>
		</header>
		<menu class="menu1 pull-left pos" id="menu">
			
			<dl id="iconbox">
			<dd style="display:none;" class="menu">
				<a href="${ctx}/a/home" id="home">首页</a>
			</dd>
			</dl>
				<dd class="pull-left" onclick="GoBottom()" style="width: 50%;text-align: center;background-color: #5b7184;"><i class="fa fa-angle-double-down"></i></dd>
				<dd class="pull-left" onclick="GoTop()" style="width: 50%;text-align: center;background-color: #6c879e;"><i class="fa fa-angle-double-up"></i></dd>
		</menu>
		<section id="main">
			<div id="page-tab"> 
		        <button class="tab-btn" id="page-prev"></button> 
		        <nav id="page-tab-content">
		            <div id="menu-list">
		             
		            </div> 
		        </nav> 
		        <button class="tab-btn" id="page-next"></button> 
		        <div id="page-operation"> 
		            <div id="menu-all"> 
		                <ul id="menu-all-ul">
		                </ul> 
		            </div> 
		        </div> 
		    </div> 
			<div id="page-content">
			
			</div> 
			<div class="footer">
				<span class="pull-left" style="margin-left: 10px;">
					欢迎您：<shiro:principal property="name"/>
				</span>
                <div class="pull-right" style="">江苏中安联科信息技术有限公司&nbsp;&nbsp;常州大学安全研究所&nbsp;  copyright  2018</div>
            </div>
		</section>
	<script>
		$(window).resize(function(){
			setheight();
		});
		
		var html="";
		
		$(function(){
			//请求菜单数据
			$.ajax({
		        type:"POST",
		        url:"${ctx}/system/permission/i/menujson",
		        dataType: 'json', 
		        success:function(data){
		        	showMenu(data,1);
		        	$(".menu a").tab();
		    		menuaction();
		    		setheight();
		    		$("#home").trigger("click");
		 			$("#menu-list a:eq(0)").html("首页&nbsp;&nbsp;&nbsp;");
		        }
		    });
		})
		
		
		//遍历菜单生成html
		function showMenu(data,level){
		
			$.each(data, function(i, item) {
				var li="";
				html=html+'<dd><a href="javascript:void(0);"><img class="img1" src="${ctxStatic}/model/main/images/'+item.icon+'"/>'+
				'<img class="img2" src="${ctxStatic}/model/main/images/'+item.icon+'"/><div>'+item.name+'</div></a>';
				
				if(item.children!=null&&item.children.length > 0){
					html+='<ul class="menu ">';
 
					$.each(item.children, function(i, subitem) {
						if(subitem.children==null||subitem.children.length == 0){
							var iconpath = '${ctxStatic}/model/main/images/'+subitem.icon;
							li = li + '<li class="col-lg-6 col-md-6"><a href="'+subitem.href+'"><img  src="'+iconpath+'"/><div>'+subitem.name+'</div></a></li>';
						}else{
							html=html+'<li class="title"> <i class="icon-caret-right"></i> &nbsp;'+subitem.name+' </li>';
		
							$.each(subitem.children, function(i, item2) {
								var iconpath = '${ctxStatic}/model/main/images/'+item2.icon;
								html=html+ '<li class="col-lg-6 col-md-6"><a href="'+item2.href+'"><img  src="'+iconpath+'"/><div>'+item2.name+'</div></a></li>';
		  					});
							html=html+'<li class="clearfix"></li>';
						}
					});	
					
					html=html+li+'<li style="height:20px;"></li></ul>';
				} 
				
				html=html+'</dd>';
		    });		
			
			$('#menu dl').append(html);
		}
		
		function openDialog(title,url){
			layer.open({
			    type: 2,  
			    shift: 1,
			    area: ["80%", "60%"],
			    title: title,
		        maxmin: true, 
			    content: url 
			}); 	
		}
		
		function GoTop() {
	        var top = $('#iconbox').scrollTop();
	        $('#iconbox').scrollTop(top-50);
	    }
		function GoBottom() {
	        var top = $('#iconbox').scrollTop();
	        $('#iconbox').scrollTop(top+50);
	    }
	</script>
	</body>
</html>