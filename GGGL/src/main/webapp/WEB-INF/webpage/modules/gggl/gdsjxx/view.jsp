<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/webpage/include/taglib.jsp" %>
<html>
<head>
    <title>管道数据信息</title>
    <meta name="decorator" content="default"/>
</head>
<body>
<form id="inputForm" class="form-horizontal">
    <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
        <tbody>
        <tr>
            <td class="width-14 active"><label class="pull-right">管道编号：</label></td>
            <td class="width-14">${entity.number }</td>
            <td class="width-14 active"><label class="pull-right">管道名称：</label></td>
            <td class="width-14">${entity.name }</td>
        </tr>

        <tr>
            <td class="width-14 active"><label class="pull-right">管径(/mm)：</label></td>
            <td class="width-14">${entity.pipeDiameter }</td>
            <td class="width-14 active"><label class="pull-right">壁厚：</label></td>
            <td class="width-14">${entity.thickness}</td>
        </tr>
        <tr>
            <td class="width-14 active"><label class="pull-right">材质：</label></td>
            <td class="width-14">${entity.material }</td>
            <td class="width-14 active"><label class="pull-right">输送介质：</label></td>
            <td class="width-14">${entity.conveyingMedium }</td>
        </tr>
        <tr>
            <td class="width-14 active"><label class="pull-right">温度(℃)：</label></td>
            <td class="width-14">${entity.temperature }</td>
            <td class="width-14 active"><label class="pull-right">压力(/Mpa)：</label></td>
            <td class="width-14">${entity.pressure }</td>
        </tr>
        <tr>
            <td class="width-14 active"><label class="pull-right">流量(kg/s)：</label></td>
            <td class="width-14">${entity.flow }</td>
            <td class="width-14 active"><label class="pull-right">公司：</label></td>
            <td class="width-14">${entity.fwqyName}</td>
        </tr>
        </tbody>
    </table>
</form>
</body>
</html>