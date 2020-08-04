<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/webpage/include/taglib.jsp"%>
<html>
<head>
<title>管廊管道信息</title>
<meta name="decorator" content="default"/>
<script type="text/javascript" src="${ctx}/static/model/js/gggl/glgdxx/index.js?v=1.0"></script>
<script type="text/javascript">
var ctx='${ctx}';
var usertype='${usertype}';
</script>
</head>
<body>
	<div id="tb" style="padding:5px;height:auto">
		<div>
			<form id="searchFrom" style="margin-bottom: 8px;" action="" class="form-inline">
				<%--<input class="easyui-textbox" name="m1" style="height: 30px;" data-options="editable:true,prompt: '公司名称' " />
				<span class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="search()"><i class="fa fa-search"></i> 查询</span>
                <span class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="clearA()"><i class="fa fa-refresh"></i> 全部</span>
				<div class="pull-right"></div>--%>
			</form>
			<span>
				<button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" onclick="tb()" title="同步"> <i class="fa fa-trash-o"></i> 同步 </button>
				<button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" onclick="view()" title="查看"> <i class="fa fa-search-plus"></i> 查看 </button>
				<button class="btn btn-white btn-sm " data-toggle="tooltip" data-placement="left" onclick="refresh()" title="刷新"> <i class="glyphicon glyphicon-repeat"></i> 刷新 </button>
			</span>
		</div>
	</div>
	<table id="dg"></table>

</body>
</html>