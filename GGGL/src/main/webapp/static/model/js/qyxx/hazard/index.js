var dg;
var d;
$(function(){   
	dg=$('#dg').datagrid({    
	method: "post",
    url:ctx+'/bis/hazard/list', 
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
	singleSelect:true,
	checkOnSelect:false,
	selectOnCheck:false,
    columns:[[    
        {field:'ID',title:'id',checkbox:true,width:50,align:'center'},    
        {field:'m1',title:'重大危险源级别',sortable:false,width:100,
        	formatter : function(value, row, index){
        		if(value=='1') return value='一级';
        		if(value=='2') return value='二级';
        		if(value=='3') return value='三级';
        		if(value=='4') return value='四级';
        	}
        },    
        {field:'m2',title:'R值',sortable:false,width:100},
        {field:'m3',title:'厂区人数',sortable:false,width:100},
        {field:'m4',title:'是否有安全监控预警系统',sortable:false,width:100,
        	formatter : function(value, row, index){
        		if(value=='0') return value='否';
        		if(value=='1') return value='是';
        	}
        },
        {field:'m5',title:'主要危险性',sortable:false,width:100},
        {field:'m6',title:'联系人',sortable:false,width:100},
        {field:'m7',title:'联系电话',sortable:false,width:100}
    ]],
    onDblClickRow: function (rowdata, rowindex, rowDomElement){
    	 view();
    },
    enableHeaderClickMenu: true,
    enableRowContextMenu: false,
    toolbar:'#tb'
	});
});


//弹窗增加
function add() {
	d=$("#bis_index_dlg").dialog({   
	    title: '添加企业基本信息',    
	    width: 380,    
	    height: 380,    
	    href:ctx+'/bis/hazard/create',
	    maximizable:true,
	    modal:true,
	    buttons:[{
			text:'确认',
			handler:function(){
				$("#mainform").submit(); 
			}
		},{
			text:'取消',
			handler:function(){
					d.panel('close');
				}
		}]
	});
}


//修改
function upd(){
	var row = dg.datagrid('getSelected');
	if(rowIsNull(row)) return;
	d=$("#bis_index_dlg").dialog({   
	    title: '修改企业基本信息',    
	    width: 380,    
	    height: 340,    
	    href:ctx+'/bis/hazard/update/'+row.id,
	    maximizable:true,
	    modal:true,
	    buttons:[{
			text:'修改',
			handler:function(){
				$("#bis_hazard_form_savebt").bind('click',function(){
					$('#mainform').submit(); 
				});
			}
		},{
			text:'取消',
			handler:function(){
					d.panel('close');
				}
		}]
	});
}


function view(){
	url=ctx+"/bis/hazardIdentity/index";
	window.location.href=url;
}
}