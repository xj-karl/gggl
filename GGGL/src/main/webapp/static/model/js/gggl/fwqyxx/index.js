var dg;
$(function(){
	dg=$('#dg').datagrid({
	method: "post",
    url:ctx+'/gggl/fwqyxx/list',
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
	pageList : [50, 100, 150, 200, 250 ],
	scrollbarSize:5,
	singleSelect:true,
    columns:[[
		{field:'id',title : 'id',checkbox : true,width : 50,align : 'center'},
		{field:'m1',title:'公司名称',sortable:false,width:150},
        {field:'m2',title:'地址',sortable:false,width:150,align:'center' },
        {field:'m3',title:'安全负责人',sortable:false,width:100,align:'center' },
        {field:'m4',title:'安全员电话',sortable:false,width:100,align:'center' }
    ]],
    onDblClickRow: function (rowdata, rowindex, rowDomElement){
    	view();
    },
    onLoadSuccess: function(){
    },
	checkOnSelect:false,
	selectOnCheck:false,
    toolbar:'#tb'
	});

});


//查询
function search(){
	var obj=$("#searchFrom").serializeObject();
	dg.datagrid('load',obj);
}

//清空
function clearA(){
	$("#searchFrom").form("clear");
	search();
}

//增加
function add() {
	openDialog("添加服务企业信息",ctx+"/gggl/fwqyxx/create","550px", "300px","");
}

//删除
function del(){
	var row = dg.datagrid('getChecked');
	if(row==null||row=='') {
		layer.msg("请至少勾选一行记录！",{time: 1000});
		return;
	}
	var ids="";
	for(var i=0;i<row.length;i++){
		if(ids==""){
			ids=row[i].id;
		}else{
			ids=ids+","+row[i].id;
		}
	}

	top.layer.confirm('删除后无法恢复您确定要删除？', {icon: 3, title:'提示'}, function(index){
		$.ajax({
			type:'get',
			url:ctx+"/gggl/fwqyxx/delete/"+ids,
			success: function(data){
				layer.alert(data, {icon:1,offset: 'rb',shade: 0,time: 2000}); 
				top.layer.close(index);
				dg.datagrid('reload');
				dg.datagrid('clearChecked');
				dg.datagrid('clearSelections');
			}
		});
	});
 
}

//弹窗修改
function upd(){
	var row = dg.datagrid('getSelected');
	if(row==null||row=='') {
		layer.msg("请选择一行记录！",{time: 1000});
		return;
	}
	openDialog("修改服务企业信息",ctx+"/gggl/fwqyxx/update/"+row.id,"550px", "300px","");
}

//查看
function view(){
	var row = dg.datagrid('getSelected');
	if(row==null) {
		layer.msg("请选择一行记录！",{time: 1000});
		return;
	}
	openDialogView("查看服务企业信息",ctx+"/gggl/fwqyxx/view/"+row.id,"550px", "300px","");
}
