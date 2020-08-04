var dg;
$(function(){
	dg=$('#dg').datagrid({
	method: "post",
    url:ctx+'/gggl/glgdxx/list',
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
		{field:'gid',title : 'gid',checkbox : true,width : 50,align : 'center'},
		{field:'m13',title:'管道名称',sortable:false,width:150},
		{field:'m10',title:'管段编号',sortable:false,width:150},
        {field:'m4',title:'材质',sortable:false,width:150,align:'center' },
        {field:'m1',title:'长度',sortable:false,width:100,align:'center' },
        {field:'m3',title:'管径',sortable:false,width:100,align:'center' },
        {field:'m78',title:'输送物质',sortable:false,width:100,align:'center' },
        {field:'m79',title:'管道所有者',sortable:false,width:100,align:'center' },
        {field:'m80',title:'管道走向',sortable:false,width:100,align:'center' },
        {field:'m81',title:'输出单位',sortable:false,width:100,align:'center' },
        {field:'m82',title:'输入单位',sortable:false,width:100,align:'center' },
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

//删除
function tb(){
	top.layer.confirm('开始同步管廊管道信息？', {icon: 3, title:'提示'}, function(index){
		$.ajax({
			type:'get',
			url:ctx+"/gggl/glgdxx/tb",
			success: function(data){
				if(data=='success')
					layer.alert('同步成功', {icon:1,offset: 'rb',shade: 0,time: 2000});
				else
					layer.alert('同步失败', {icon:1,offset: 'rb',shade: 0,time: 2000});
				top.layer.close(index);
				dg.datagrid('reload');
				dg.datagrid('clearChecked');
				dg.datagrid('clearSelections');
			}
		});
	});
 
}


//查看
function view(){
	var row = dg.datagrid('getSelected');
	if(row==null) {
		layer.msg("请选择一行记录！",{time: 1000});
		return;
	}
	openDialogView("查看管廊管道信息",ctx+"/gggl/glgdxx/view/"+row.gid,"85%", "85%","");
}
