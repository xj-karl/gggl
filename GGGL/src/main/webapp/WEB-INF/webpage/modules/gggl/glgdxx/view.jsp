<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/webpage/include/taglib.jsp"%>
<html>
<head>
	<title>管廊管道信息</title>
	<meta name="decorator" content="default"/>
</head>
<body>
     <form id="inputForm" class="form-horizontal" >
		 <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
			 <tbody>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">编号：</label></td>
					 <td class="width-35">${entity.gid }</td>
					 <td class="width-15 active"><label class="pull-right">geom：</label></td>
					 <td class="width-35">${entity.geom }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">hasAttachment：</label></td>
					 <td class="width-35">${entity.hasAttachment }</td>
					 <td class="width-15 active"><label class="pull-right">dno：</label></td>
					 <td class="width-35">${entity.dno }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">flow：</label></td>
					 <td class="width-35">${entity.flow }</td>
					 <td class="width-15 active"><label class="pull-right">crttime：</label></td>
					 <td class="width-35">${entity.crttime }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">modtime：</label></td>
					 <td class="width-35">${entity.modtime }</td>
					 <td class="width-15 active"><label class="pull-right">crtuser：</label></td>
					 <td class="width-35">${entity.crtuser }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">moduser：</label></td>
					 <td class="width-35">${entity.moduser }</td>
					 <td class="width-15 active"><label class="pull-right">guid：</label></td>
					 <td class="width-35">${entity.guid }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">ogid：</label></td>
					 <td class="width-35">${entity.ogid }</td>
					 <td class="width-15 active"><label class="pull-right">stnod：</label></td>
					 <td class="width-35">${entity.stnod }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">ednod：</label></td>
					 <td class="width-35">${entity.ednod }</td>
					 <td class="width-15 active"><label class="pull-right">pipeid：</label></td>
					 <td class="width-35">${entity.pipeid }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">长度：</label></td>
					 <td class="width-35">${entity.m1 }</td>
					 <td class="width-15 active"><label class="pull-right">管段名称：</label></td>
					 <td class="width-35">${entity.m2 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">管径：</label></td>
					 <td class="width-35">${entity.m3 }</td>
					 <td class="width-15 active"><label class="pull-right">材质：</label></td>
					 <td class="width-35">${entity.m4 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">保温层厚：</label></td>
					 <td class="width-35">${entity.m5 }</td>
					 <td class="width-15 active"><label class="pull-right">外管径：</label></td>
					 <td class="width-35">${entity.m6 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">伴热管根数：</label></td>
					 <td class="width-35">${entity.m7 }</td>
					 <td class="width-15 active"><label class="pull-right">备注：</label></td>
					 <td class="width-35">${entity.m8 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">管长：</label></td>
					 <td class="width-35">${entity.m9 }</td>
					 <td class="width-15 active"><label class="pull-right">管段编号：</label></td>
					 <td class="width-35">${entity.m10 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">起始端节点：</label></td>
					 <td class="width-35">${entity.m11 }</td>
					 <td class="width-15 active"><label class="pull-right">终止端节点：</label></td>
					 <td class="width-35">${entity.m12 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">管道名称：</label></td>
					 <td class="width-35">${entity.m13 }</td>
					 <td class="width-15 active"><label class="pull-right">管道编号：</label></td>
					 <td class="width-35">${entity.m14 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">管段类型：</label></td>
					 <td class="width-35">${entity.m15 }</td>
					 <td class="width-15 active"><label class="pull-right">管道级别：</label></td>
					 <td class="width-35">${entity.m16 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">环焊缝类型：</label></td>
					 <td class="width-35">${entity.m17 }</td>
					 <td class="width-15 active"><label class="pull-right">使用单位：</label></td>
					 <td class="width-35">${entity.m18 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">壁厚_mm：</label></td>
					 <td class="width-35">${entity.m19 }</td>
					 <td class="width-15 active"><label class="pull-right">制管焊缝类型：</label></td>
					 <td class="width-35">${entity.m20 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">外防腐层材料：</label></td>
					 <td class="width-35">${entity.m21 }</td>
					 <td class="width-15 active"><label class="pull-right">绝热层材料：</label></td>
					 <td class="width-35">${entity.m22 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">绝热层厚度：</label></td>
					 <td class="width-35">${entity.m23 }</td>
					 <td class="width-15 active"><label class="pull-right">外防腐层预制厂商：</label></td>
					 <td class="width-35">${entity.m24 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">外防腐层安装地点：</label></td>
					 <td class="width-35">${entity.m25 }</td>
					 <td class="width-15 active"><label class="pull-right">外防腐层生产单位：</label></td>
					 <td class="width-35">${entity.m26 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">外防腐层监理单位：</label></td>
					 <td class="width-35">${entity.m27 }</td>
					 <td class="width-15 active"><label class="pull-right">外防腐层检测单位：</label></td>
					 <td class="width-35">${entity.m28 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">外防腐层厚度_mm：</label></td>
					 <td class="width-35">${entity.m29 }</td>
					 <td class="width-15 active"><label class="pull-right">外涂刷方式：</label></td>
					 <td class="width-35">${entity.m30 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">防腐号：</label></td>
					 <td class="width-35">${entity.m31 }</td>
					 <td class="width-15 active"><label class="pull-right">检漏电压_V：</label></td>
					 <td class="width-35">${entity.m32 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">补口防腐类型：</label></td>
					 <td class="width-35">${entity.m33 }</td>
					 <td class="width-15 active"><label class="pull-right">操作压力_MPa：</label></td>
					 <td class="width-35">${entity.m34 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">设计压力_MPa：</label></td>
					 <td class="width-35">${entity.m35 }</td>
					 <td class="width-15 active"><label class="pull-right">许用压力_MPa：</label></td>
					 <td class="width-35">${entity.m36 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">设计温度_C：</label></td>
					 <td class="width-35">${entity.m37 }</td>
					 <td class="width-15 active"><label class="pull-right">操作温度_C：</label></td>
					 <td class="width-35">${entity.m38 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">许用温度_C：</label></td>
					 <td class="width-35">${entity.m39 }</td>
					 <td class="width-15 active"><label class="pull-right">设计介质：</label></td>
					 <td class="width-35">${entity.m40 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">操作介质：</label></td>
					 <td class="width-35">${entity.m41 }</td>
					 <td class="width-15 active"><label class="pull-right">许用介质：</label></td>
					 <td class="width-35">${entity.m42 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">管道当前状态：</label></td>
					 <td class="width-35">${entity.m43 }</td>
					 <td class="width-15 active"><label class="pull-right">巡线方式：</label></td>
					 <td class="width-35">${entity.m44 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">巡线周期：</label></td>
					 <td class="width-35">${entity.m45 }</td>
					 <td class="width-15 active"><label class="pull-right">管道失效记录：</label></td>
					 <td class="width-35">${entity.m46 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">管道维修记录：</label></td>
					 <td class="width-35">${entity.m47 }</td>
					 <td class="width-15 active"><label class="pull-right">年度检查报告编号：</label></td>
					 <td class="width-35">${entity.m48 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">年度检查问题与处理：</label></td>
					 <td class="width-35">${entity.m49 }</td>
					 <td class="width-15 active"><label class="pull-right">下次年度检查日期：</label></td>
					 <td class="width-35">${entity.m50 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">全面检验报告编号：</label></td>
					 <td class="width-35">${entity.m51 }</td>
					 <td class="width-15 active"><label class="pull-right">全面检验问题与处理：</label></td>
					 <td class="width-35">${entity.m52 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">安全等级：</label></td>
					 <td class="width-35">${entity.m53 }</td>
					 <td class="width-15 active"><label class="pull-right">下次全面检验日期：</label></td>
					 <td class="width-35">${entity.m54 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">使用登记证编号：</label></td>
					 <td class="width-35">${entity.m55 }</td>
					 <td class="width-15 active"><label class="pull-right">是否事故后果严重区：</label></td>
					 <td class="width-35">${entity.m56 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">事故后果严重区分值：</label></td>
					 <td class="width-35">${entity.m57 }</td>
					 <td class="width-15 active"><label class="pull-right">地区等级：</label></td>
					 <td class="width-35">${entity.m58 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">防腐层等级：</label></td>
					 <td class="width-35">${entity.m59 }</td>
					 <td class="width-15 active"><label class="pull-right">裂纹处数量：</label></td>
					 <td class="width-35">${entity.m60 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">凹陷处数量：</label></td>
					 <td class="width-35">${entity.m61 }</td>
					 <td class="width-15 active"><label class="pull-right">金属损失处数量：</label></td>
					 <td class="width-35">${entity.m62 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">应力超标处数量：</label></td>
					 <td class="width-35">${entity.m63 }</td>
					 <td class="width-15 active"><label class="pull-right">失效可能性得分：</label></td>
					 <td class="width-35">${entity.m64 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">失效后果得分：</label></td>
					 <td class="width-35">${entity.m65 }</td>
					 <td class="width-15 active"><label class="pull-right">第三方破坏得分：</label></td>
					 <td class="width-35">${entity.m66 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">损伤得分：</label></td>
					 <td class="width-35">${entity.m67 }</td>
					 <td class="width-15 active"><label class="pull-right">管理安全得分：</label></td>
					 <td class="width-35">${entity.m68 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">管体本质安全得分：</label></td>
					 <td class="width-35">${entity.m69 }</td>
					 <td class="width-15 active"><label class="pull-right">风险相对等级：</label></td>
					 <td class="width-35">${entity.m70 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">风险绝对等级：</label></td>
					 <td class="width-35">${entity.m71 }</td>
					 <td class="width-15 active"><label class="pull-right">风险值：</label></td>
					 <td class="width-35">${entity.m72 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">风险评估单位：</label></td>
					 <td class="width-35">${entity.m73 }</td>
					 <td class="width-15 active"><label class="pull-right">风险评估日期：</label></td>
					 <td class="width-35">${entity.m74 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">HAZOP等级：</label></td>
					 <td class="width-35">${entity.m75 }</td>
					 <td class="width-15 active"><label class="pull-right">管线编码：</label></td>
					 <td class="width-35">${entity.m76 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">输出方编码：</label></td>
					 <td class="width-35">${entity.m77 }</td>
					 <td class="width-15 active"><label class="pull-right">输送物质：</label></td>
					 <td class="width-35">${entity.m78 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">管道所有者：</label></td>
					 <td class="width-35">${entity.m79 }</td>
					 <td class="width-15 active"><label class="pull-right">管道走向：</label></td>
					 <td class="width-35">${entity.m80 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">输出单位：</label></td>
					 <td class="width-35">${entity.m81 }</td>
					 <td class="width-15 active"><label class="pull-right">输入单位：</label></td>
					 <td class="width-35">${entity.m82 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">建造单位：</label></td>
					 <td class="width-35">${entity.m83 }</td>
					 <td class="width-15 active"><label class="pull-right">管道规格：</label></td>
					 <td class="width-35">${entity.m84 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">建造年份：</label></td>
					 <td class="width-35">${entity.m85 }</td>
					 <td class="width-15 active"><label class="pull-right">管道材质：</label></td>
					 <td class="width-35">${entity.m86 }</td>
				 </tr>
				 <tr>
					 <td class="width-15 active"><label class="pull-right">设计温度：</label></td>
					 <td class="width-35">${entity.m87 }</td>
					 <td class="width-15 active"><label class="pull-right">设计压力：</label></td>
					 <td class="width-35">${entity.m88 }</td>
				 </tr>
			 </tbody>
		 </table>
	 </form>
</body>
</html>