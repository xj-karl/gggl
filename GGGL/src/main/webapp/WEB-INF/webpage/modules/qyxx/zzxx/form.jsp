<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/webpage/include/taglib.jsp"%>
<html>
<head>
	<title>公司证照信息管理</title>
	<meta name="decorator" content="default"/>
</head>
<body>

     <form id="inputForm" action="${ctx}/bis/zzxx/${action}"  method="post" class="form-horizontal" >
			<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer" >
			  <tbody>
			  <tr>
				  <td class="width-30 active"><label class="pull-right">证照名称：</label></td>
				  <td class="width-70"><input value="${zz.m1 }" name="M1" style="width: 100%;height: 30px;"
											  class="easyui-textbox"
											  data-options="required:'true',validType:'length[0,20]'" /></td>
			  </tr>

			  <tr>
				  <td class="width-30 active"><label class="pull-right">发证机关：</label></td>
				  <td class="width-70"><input name="M2" class="easyui-textbox" style="width: 100%;height: 30px;"
											  value="${zz.m2 }"
											  data-options="required:'true',multiline:true,validType:'length[0,500]'" /></td>
			  </tr>

              <tr>
                  <td class="width-30 active"><label class="pull-right">初次领证日期：</label></td>
                  <td class="width-70"><input id="M3" name="M3"
                                              class="easyui-datebox" value="${zz.m3 }" style="width: 100%;height: 30px;" editable="false"
                                              data-options="required:'true',validType:'length[0,20]'" /></td>
              </tr>

			  	<tr>
					<td class="width-30 active"><label class="pull-right">有效期起：</label></td>
					<td class="width-70"><input id="M4" name="M4"
								class="easyui-datebox" value="${zz.m4 }" style="width: 100%;height: 30px;" editable="false"
								data-options="required:'true',validType:'length[0,20]'" /></td>
				</tr>
				
				<tr>
					<td class="width-30 active"><label class="pull-right">有效期止：</label></td>
					<td class="width-70"><input name="M5" class="easyui-datebox" value="${zz.m5 }"
								style="width: 100%;height: 30px;"  editable="false"
								data-options="required:'true',validType:'compareDate[\'#aqjg_dsf_zz_form_mainform_M4\',\'到期时间不能早于备案时间!\' ]'" /></td>
				</tr>
				
				<tr>
					<td class="width-30 active"><label class="pull-right">上传文件：</label></td>
					<td class="width-70">
						<div id="uploader_ws_m6">
					    <div id="m6fileList" class="uploader-list" ></div>
					    <div id="filePicker">选择文件</div>
					</div> 
					</td>
				</tr>

				<c:if test="${not empty zz.ID}">
					<input type="hidden" name="ID1" value="${zz.ID1 }" />
					<input type="hidden" name="S3" value="${zz.s3 }" />
					<input type="hidden" name="S1" value="<fmt:formatDate value="${zz.s1}" pattern="yyyy-MM-dd HH:mm:ss"  />" />
					<input type="hidden" name="ID" value="${zz.ID}" />
				</c:if>
				</tbody>
			</table>
		  	
       </form>
 
<script type="text/javascript">
	var usertype=${usertype};
	var $ = jQuery,
	$list2 = $('#m6fileList'); //文件上传
	
	var fileuploader = WebUploader.create({

	    auto: true,

	    swf:  '${ctxStatic}/webuploader-0.1.5/Uploader.swf',

	    server: '${ctx}/kindeditor/upload?dir=newfile',
	    		
	    pick: {
	    	id:'#filePicker',
	    	multiple : false,
	    },
	    duplicate :true  
	});
	
	fileuploader.on( 'uploadProgress', function( file, percentage ) {
		$.jBox.tip("正在上传，请稍等...",'loading',{opacity:0});
	});
	
	// 文件上传成功 
	fileuploader.on( 'uploadSuccess', function( file ,res) {
		$.jBox.closeTip();
		if(res.error==0){
			var $li = $(
		            "<div id=\"" + file.id + "\" style=\"margin-bottom: 10px;\">" +
		            	"<a style=\"color:#337ab7;text-decoration:none;cursor:pointer;margin-right:20px;\" onclick=\"window.open('"+res.url+"')\">"+res.fileName+"</a>"+
		            	"<span class=\"ss\" onClick=\"removeFile('"+file.id+"')\" style=\"cursor: pointer\">删除</span>"+
		            "</div>"
		            );
	
		    
		    $list2.append( $li );
	 
			var newurl=res.url+"||"+res.fileName;
			
			var $input = $('<input id="input_'+file.id+'" type="hidden" name="M6" value="'+newurl+'"/>');
			
			$('#uploader_ws_m6').append( $input );
		}else{
			layer.msg(res.message,{time: 3000});
		}
	});
	
	// 负责预览图的销毁
    function removeFile(fileid) {
    	$("#"+fileid).remove();
    	$("#input_"+fileid).remove();
    };
    
	if('${action}' == 'update'){
		var fjUrl = '${zz.m6}';
		if(fjUrl!=null&&fjUrl!=''){
			arry =fjUrl.split(",");
			for(var i=0;i<arry.length;i++){
				var arry2 =arry[i].split("||");
				var id="ws_fj_"+i;
				var $li = $(
			            "<div id=\"" + id + "\" style=\"margin-bottom: 10px;\">" +
			            	"<a style=\"color:#337ab7;text-decoration:none;cursor:pointer;margin-right:20px;\" onclick=\"window.open('"+arry2[0]+"')\">"+arry2[1]+"</a>"+
			            	"<span class=\"ss\" onClick=\"removeFile('"+id+"')\" style=\"cursor: pointer\">删除</span>"+
			            "</div>"
			            );
			    $list2.append( $li );
			    
			    var $input = $('<input id="input_'+id+'" type="hidden" name="M6" value="'+arry[i]+'"/>');
				$('#uploader_ws_m6').append( $input );
			}
		}
	}
	
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