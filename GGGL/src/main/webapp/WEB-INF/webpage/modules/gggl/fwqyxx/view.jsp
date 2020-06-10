<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/webpage/include/taglib.jsp"%>
<html>
<head>
	<title>服务企业信息</title>
	<meta name="decorator" content="default"/>
</head>
<body>
     <form id="inputForm" class="form-horizontal" >
		 <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
			 <tbody>
				 <tr>
					 <td class="width-30 active"><label class="pull-right">公司名称：</label></td>
					 <td class="width-70">${entity.m1 }</td>
				 </tr>
				 <tr>
					 <td class="width-30 active"><label class="pull-right">地址：</label></td>
					 <td class="width-70">${entity.m2 }</td>
				 </tr>
				 <tr>
					 <td class="width-30 active"><label class="pull-right">安全负责人：</label></td>
					 <td class="width-70">${entity.m3 }</td>
				 </tr>
				 <tr>
					 <td class="width-30 active"><label class="pull-right">安全员电话：</label></td>
					 <td class="width-70">${entity.m4 }</td>
				 </tr>
			 </tbody>
		 </table>
	 </form>
</body>
</html>