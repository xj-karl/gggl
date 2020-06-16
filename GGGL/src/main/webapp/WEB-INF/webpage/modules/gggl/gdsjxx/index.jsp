<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/webpage/include/taglib.jsp" %>
<html>
<head>
    <title>管道数据信息</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript" src="${ctx}/static/model/js/gggl/gdjsxx/index.js?v=1.0"></script>
</head>
<body>
<div id="tb" style="padding:5px;height:auto">
    <div>
        <form id="searchFrom" style="margin-bottom: 8px;" action="" class="form-inline">
            <input class="easyui-textbox" name="name" style="height: 30px;"
                   data-options="editable:true,prompt: '管道名称' "/>
            <span class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="search()"><i
                    class="fa fa-search"></i> 查询</span>
            <span class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="clearA()"><i
                    class="fa fa-refresh"></i> 全部</span>
            <div class="pull-right"></div>
        </form>
        <span>
				<button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" onclick="add()"
                        title="添加"> <i class="fa fa-plus"></i> 添加 </button>
				<button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" onclick="upd()"
                        title="修改"> <i class="fa fa-file-text-o"></i> 修改 </button>
				<button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" onclick="del()"
                        title="删除"> <i class="fa fa-trash-o"></i> 删除 </button>
				<button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" onclick="view()"
                        title="查看"> <i class="fa fa-search-plus"></i> 查看 </button>
				<button class="btn btn-white btn-sm " data-toggle="tooltip" data-placement="left" onclick="refresh()"
                        title="刷新"> <i class="glyphicon glyphicon-repeat"></i> 刷新 </button>
			</span>
    </div>
</div>
<table id="dg"></table>

</body>
</html>