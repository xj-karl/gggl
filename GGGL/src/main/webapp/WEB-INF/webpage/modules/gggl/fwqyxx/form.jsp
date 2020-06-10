<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/webpage/include/taglib.jsp"%>
<html>
<head>
	<title>服务企业信息</title>
	<meta name="decorator" content="default"/>
</head>
<body>

     <form id="inputForm" action="${ctx}/gggl/fwqyxx/${action}"  method="post" class="form-horizontal" >
			<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer" >
			  <tbody>
			  <tr>
				  <td class="width-30 active"><label class="pull-right">公司名称：</label></td>
				  <td class="width-70"><input name="m1" style="width: 100%;height: 30px;" class="easyui-textbox" value="${entity.m1 }"
											  data-options="required:true,validType:'length[0,250]'" /></td>
			  </tr>
			  <tr>
				  <td class="width-30 active"><label class="pull-right">地址：</label></td>
				  <td class="width-70"><input name="m2" class="easyui-textbox" style="width: 100%;height: 30px;" value="${entity.m2 }"
											  data-options="required:true,validType:'length[0,250]'" /></td>
			  </tr>
			  <tr>
				  <td class="width-30 active"><label class="pull-right">安全负责人：</label></td>
				  <td class="width-70"><input name="m3" class="easyui-textbox" style="width: 100%;height: 30px;" value="${entity.m3 }"
											  data-options="required:true,validType:'length[0,50]'" /></td>
			  </tr>
			  <tr>
				  <td class="width-30 active"><label class="pull-right">安全员电话：</label></td>
				  <td class="width-70"><input name="m4" class="easyui-textbox" style="width: 100%;height: 30px;" value="${entity.m4 }"
											  data-options="required:true,validType:'mobileAndTel'" /></td>
			  </tr>

				<c:if test="${not empty entity.ID}">
					<input type="hidden" name="ID" value="${entity.ID}" />
				</c:if>
				</tbody>
			</table>
		  	
       </form>
 
<script type="text/javascript">
	var usertype=${usertype};

	var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
	var validateForm;

	function doSubmit(){
		$("#inputForm").submit();
	}

	$(function(){
		$('#inputForm').form({
			onSubmit: function(){
				var isValid = $(this).form('validate');
				return isValid;	// 返回false终止表单提交
			},
			success:function(data){
				if(data=='success')
					parent.layer.open({icon:1,title: '提示',offset: 'rb',content: '操作成功！',shade: 0 ,time: 2000 });
				else
					parent.layer.open({icon:2,title: '提示',offset: 'rb',content: '操作失败！',shade: 0 ,time: 2000 });
				parent.dg.datagrid('reload');
				parent.layer.close(index);//关闭对话框。
			}
		});

	});
</script>
</body>
</html>