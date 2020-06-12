<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/webpage/include/taglib.jsp" %>
<html>
<head>
    <title>管道数据信息</title>
    <meta name="decorator" content="default"/>
</head>
<body>

<form id="inputForm" action="${ctx}/gggl/gdsjxx/${action}" method="post" class="form-horizontal">
    <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
        <tbody>
        <tr>
            <td class="width-30 active"><label class="pull-right">管道编号：</label></td>
            <td class="width-70"><input name="number" style="width: 100%;height: 30px;" class="easyui-textbox"
                                        value="${entity.number }"
                                        data-options="required:true,validType:'length[0,250]'"/></td>
        </tr>
        <tr>
            <td class="width-30 active"><label class="pull-right">管道名称：</label></td>
            <td class="width-70"><input name="name" class="easyui-textbox" style="width: 100%;height: 30px;"
                                        value="${entity.name }"
                                        data-options="required:true,validType:'length[0,250]'"/></td>
        </tr>
        <tr>
            <td class="width-30 active"><label class="pull-right">管径(/mm)：</label></td>
            <td class="width-70"><input name="pipeDiameter" class="easyui-textbox" style="width: 100%;height: 30px;"
                                        value="${entity.pipeDiameter }"
                                        data-options="required:true,validType:'length[0,50]'"/></td>
        </tr>
        <tr>
            <td class="width-30 active"><label class="pull-right">材质：</label></td>
            <td class="width-70"><input name="material" class="easyui-textbox" style="width: 100%;height: 30px;"
                                        value="${entity.material }"
                                        data-options="required:true,validType:'length[0,250]'"/></td>
        </tr>
        <tr>
            <td class="width-30 active"><label class="pull-right">输送介质：</label></td>
            <td class="width-70"><input name="conveyingMedium" class="easyui-textbox" style="width: 100%;height: 30px;"
                                        value="${entity.conveyingMedium }"
                                        data-options="required:true,validType:'length[0,250]'"/></td>
        </tr>
        <tr>
            <td class="width-30 active"><label class="pull-right">温度(℃)：</label></td>
            <td class="width-70"><input name="temperature" class="easyui-textbox" style="width: 100%;height: 30px;"
                                        value="${entity.temperature }"
                                        data-options="required:true,validType:'length[0,250]'"/></td>
        </tr>
        <tr>
            <td class="width-30 active"><label class="pull-right">压力(/Mpa)：</label></td>
            <td class="width-70"><input name="pressure" class="easyui-textbox" style="width: 100%;height: 30px;"
                                        value="${entity.pressure }"
                                        data-options="required:true,validType:'length[0,250]'"/></td>
        </tr>
        <tr>
            <td class="width-30 active"><label class="pull-right">流量(kg/s)：</label></td>
            <td class="width-70"><input name="flow" class="easyui-textbox" style="width: 100%;height: 30px;"
                                        value="${entity.flow }"
                                        data-options="required:true,validType:'length[0,250]'"/></td>
        </tr>

        <c:if test="${not empty entity.ID}">
            <input type="hidden" name="ID" value="${entity.ID}"/>
        </c:if>
        </tbody>
    </table>

</form>

<script type="text/javascript">
    var usertype =${usertype};

    var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
    var validateForm;

    function doSubmit() {
        $("#inputForm").submit();
    }

    $(function () {
        $('#inputForm').form({
            onSubmit: function () {
                var isValid = $(this).form('validate');
                return isValid;	// 返回false终止表单提交
            },
            success: function (data) {
                if (data == 'success')
                    parent.layer.open({icon: 1, title: '提示', offset: 'rb', content: '操作成功！', shade: 0, time: 2000});
                else
                    parent.layer.open({icon: 2, title: '提示', offset: 'rb', content: '操作失败！', shade: 0, time: 2000});
                parent.dg.datagrid('reload');
                parent.layer.close(index);//关闭对话框。
            }
        });

    });
</script>
</body>
</html>