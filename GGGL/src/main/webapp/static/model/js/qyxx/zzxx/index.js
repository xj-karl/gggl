var dg;
var count1 = 0;
var count2 = 0;
$(function(){
	dg=$('#bis_zzxx_dg').datagrid({    
	method: "post",
    url:ctx+'/bis/zzxx/list', 
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
	striped:true,
    columns:[[    
		{field:'ID',title : 'id',checkbox : true,width : 50,align : 'center'},
		{field:'m1',title:'证照名称',sortable:false,width:100},
        {field:'m2',title:'发证机关',sortable:false,width:100,align:'center' },
			{field:'m4',title:'有效期起',sortable:false,width:100,align:'center',
				formatter:function(value,row,index){
					if(value!=null){
						var datetime = new Date(value);  
						 return datetime.format('yyyy-MM-dd');   
					}  
	            }
			},
			{field:'m5',title:'有效期止',sortable:false,width:100,align:'center',
				styler: function(value, row, index){
					var nowhm=(new Date()).getTime();
					if(nowhm>=value){
					    count1 ++;
						return 'background-color:rgb(249, 156, 140);';
					}else{
						var cha=(value-nowhm)/1000/60/60/24;
						if(cha<=180) {
						    count2 ++;
                            return 'background-color:rgb(255, 228, 141);';
                        }
					}
				},   
				formatter:function(value,row,index){
					if(value!=null){
						var datetime = new Date(value);  
						 return datetime.format('yyyy-MM-dd');   
					}  
	            }
			} 
    ]],
    onDblClickRow: function (rowdata, rowindex, rowDomElement){
    	view(2);
    },
    onLoadSuccess: function(){
	    var content = '';
        if(count1 > 0)
            content += '有' + count1 + '个公司证照已到期！'
        if(count2 > 0)
            content += '有' + count2 + '个公司证照即将到期！'
        if(count1 > 0 || count2 > 0)
            layer.open({icon:1,title: '提示',offset: 'rb',content:content,shade: 0 ,time: 3000 });
        count1=0;
        count2=0;
    },
	checkOnSelect:false,
	selectOnCheck:false,
    toolbar:'#bis_zzxx_tb'
	});

    $.ajax({
        type:"GET",
        url:ctx+"/bis/zzxx/timeEnd",
        success: function(data){
            if(data!='null'){
                layer.msg(data,{time: 3000});
            }
        }
    });

});


//资质信息表查询
function search(){
	var obj=$("#bis_zzxx_searchFrom").serializeObject();
	$('#bis_zzxx_dg').datagrid('load',obj); 
}

//清空
function clearA(){
	$("#bis_zzxx_searchFrom").form("clear");
	var obj=$("#bis_zzxx_searchFrom").serializeObject();
	$('#bis_zzxx_dg').datagrid('load',obj);
}

//检查表库增加
function add() {
	openDialog("添加证照信息",ctx+"/bis/zzxx/create","400px", "450px","");
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
			url:ctx+"/bis/zzxx/delete/"+ids,
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
	openDialog("修改证照信息",ctx+"/bis/zzxx/update/"+row.id,"500px", "400px","");
}

//查看
function view(){
	var row = dg.datagrid('getSelected');
	if(row==null) {
		layer.msg("请选择一行记录！",{time: 1000});
		return;
	}
	openDialogView("查看证照信息信息",ctx+"/bis/zzxx/view/"+row.id,"500px", "300px","");
}
