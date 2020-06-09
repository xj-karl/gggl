<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/webpage/include/taglib.jsp"%>
<html>
<head>
	<title>部门详细信息</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/common/contabs.js"></script> 
 
</head>
<body class="gray-bg">

<!-- 工具栏 -->
<%--<div id="tb" style="padding:5px;height:auto">
	<form id="searchFrom" action="" style="margin-bottom: 8px;" class="form-inline">
	</form>

	<div class="row">
	<div class="col-sm-12">
		<div class="pull-left">
				<button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" onclick="add()" title="添加"><i class="fa fa-plus"></i> 添加</button>
			    <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" onclick="upd()" title="修改"><i class="fa fa-file-text-o"></i> 修改</button> 
				<button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" onclick="del()" title="删除"><i class="fa fa-trash-o"></i> 删除</button> 
				<button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" onclick="appoint()" title="指定分管领导"><i class="fa fa-gear icon-white"></i> 指定分管领导</button>
		        <button class="btn btn-white btn-sm " data-toggle="tooltip" data-placement="left" onclick="refresh()" title="刷新"><i class="glyphicon glyphicon-repeat"></i> 刷新</button>
		</div>
		<div class="pull-right">
			<button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="search()" ><i class="fa fa-search"></i> 查询</button>
			<button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="reset()" ><i class="fa fa-refresh"></i> 全部</button>
		</div>
	</div>
	</div> 
	   
</div>--%>
<div id="tb" style="padding:5px;height:auto">
    <span style="width: 33%; display: -webkit-inline-box; font-size: 20px;"> &nbsp;&nbsp;部门： ${bm.bm}</span>
    <span style="width: 33%; display: -webkit-inline-box; font-size: 20px;"> &nbsp;&nbsp;上级部门： ${bm.sjbm}</span>
    <span style="width: 33%; display: -webkit-inline-box; font-size: 20px;"> &nbsp;&nbsp;分管领导： ${bm.fgld}</span>
</div>
<table id="dg"></table> 


<script type="text/javascript">
var dg;
var parentPermId=0;

$(function(){
	dg=$('#dg').datagrid({
	method: "post",
    url:'${ctx}/system/department/viewList?id='+${id},
    fit : true,
	fitColumns : true,
	border : false,
	idField : 'id',
    striped:true,
    pagination:true,
    rownumbers:true,
    nowrap:false,
    pageNumber:1,
    pageSize : 50,
    pageList : [ 50, 100, 150, 200, 250 ],
    scrollbarSize:10,
    singleSelect:true,
    columns:[[    
	    {field:'NAME',title:'姓名',sortable:true,width:100},
	    {field:'GENDER',title:'性别',sortable:true,width:100,
            formatter:function (value) {
                if(value == '1')
                    return '男';
                if(value == '0')
                    return '女';
            }
        },
	    {field:'PHONE',title:'电话',sortable:true,width:100},
	    {field:'EMAIL',title:'邮箱',sortable:true,width:100},
	    {field:'role',title:'角色',sortable:true,width:100}
    ]],
    enableHeaderClickMenu: false,
    enableHeaderContextMenu: false,
    enableRowContextMenu: false,
    dataPlain: true,
    onDblClickRow: function (rowdata, rowindex, rowDomElement){
    }
	});
	
});

//弹窗增加
function add() {
	parentPermId=0;
	var row = dg.treegrid('getSelected');
	if(row){
		parentPermId=row.id;
	}	
	openDialog("添加部门信息","${ctx}"+"/system/department/create","800px", "350px","");

}

//删除
function del(){
	var row = dg.datagrid('getSelected');
	if(row==null) {
		layer.msg("请选择一行记录！",{time: 1000});
		return;
	}
	
	top.layer.confirm('删除后无法恢复您确定要删除？', {icon: 3, title:'提示'}, function(index){
		$.ajax({
			type:'get',
			url:"${ctx}/system/department/delete/"+row.id,
			success: function(data){
				layer.alert(data, {offset: 'rb',shade: 0,time: 2000}); 
				top.layer.close(index);
				dg.datagrid('reload');
			}
		});
	});
	
}

//弹窗修改
function upd(){
	parentPermId=0;
	var row = dg.datagrid('getSelected');
	if(row==null) {
		layer.msg("请选择一行记录！",{time: 1000});
		return;
	}
		
	openDialog("修改部门信息","${ctx}/system/department/update/"+row.id,"800px", "350px","");

}

//查看
function view() {
    var row = dg.datagrid('getSelected');
    if(row==null) {
        layer.msg("请选择一行记录！",{time: 2000});
        return;
    }
    openDialogView("查看部门信息","${ctx}/system/department/view/"+row.id,"80%", "80%","");
}

//弹窗修改
function appoint(){
	parentPermId=0;
	var row = dg.datagrid('getSelected');
	if(row==null) {
		layer.msg("请选择一行记录！",{time: 1000});
		return;
	}

	openDialog("指定分管领导","${ctx}/system/department/appoint/"+row.id,"400px", "250px","");
}

//创建查询对象并查询
function search(){
	var obj=$("#searchFrom").serializeObject();
	dg.datagrid('reload',obj); 
}

//清空
function reset(){
	$("#searchFrom").form("clear");
	search();
}


</script>
</body>
</html>