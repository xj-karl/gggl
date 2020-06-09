<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/webpage/include/taglib.jsp"%>
<html>
<head>
	<title>部门管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
	var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
	var validateForm;

	function doSubmit(){
		$("#inputForm").submit(); 
	}
	
	$(function(){
		validateForm = $("#inputForm").validate({
			 debug:true
		});
		 
		$('#inputForm').form({    
		    onSubmit: function(){
		    	var isValid =validateForm.form();
				return isValid;	// 返回false终止表单提交
		    },
		    success:function(data){
		    	if(data=='success')
		    		parent.layer.open({icon:1,title: '提示',offset: 'rb',content: '操作成功！',shade: 0 ,time: 2000 });
		    	else
		    		parent.layer.open({icon:2,title: '提示',offset: 'rb',content: '操作失败！',shade: 0 ,time: 2000 });
		    	parent.dg.treegrid('reload');
		    	parent.layer.close(index);//关闭对话框。
		    }    
		}); 
	});
	</script>

</head>
<body>
	<form id="inputForm" class="form-horizontal" method="post" action="${ctx}/system/department/${action}">

		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
            <tbody>
                <input type="hidden" name="bmid" value="${bmid}" />
                <td class="width-35 active"><label class="pull-right">分管领导：</label></td>
                <td class="width-65">
                    <input name="ldid" style="width: 100%;height: 30px;" class="easyui-combobox" value="${ldid }"
                           data-options="required:'true',panelHeight:'120px',editable:false,valueField:'id',textField:'text',url:'${ctx}/system/user/ryjson?comprolecode=CL01'"/>
                </td>
            </tbody>
		</table>   
	</form>
	<script type="text/javascript">

		
	</script>
</body>
</html>