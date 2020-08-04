package com.cczu.model.gggl.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cczu.model.gggl.entity.GlgdxxEntity;
import com.cczu.model.gggl.service.GlgdxxService;
import com.cczu.sys.comm.controller.BaseController;
import com.cczu.sys.system.utils.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;
import java.util.Map;

/**
 * 管廊管道信息
 * @author YZH
 */
@Controller
@RequestMapping("gggl/glgdxx")
public class PageGlgdxxController extends BaseController {

	@Autowired
	private GlgdxxService glgdxxService;

	/**
	 * 列表显示页面
	 * @param model
	 */
	@RequestMapping(value="index")
	public String index(Model model) {
		String usertype = UserUtil.getCurrentShiroUser().getUsertype();
		model.addAttribute("usertype", usertype);
		return "gggl/glgdxx/index";
	}

	/**
	 * 数据list
	 * @param request
	 */
	@RequestMapping(value="list")
	@ResponseBody
	public Map<String, Object> getData(HttpServletRequest request) {
		Map<String, Object> map = getPageMap(request);
		map.putAll(getAuthorityMap());
		map.put("m1", request.getParameter("m1"));
		return glgdxxService.dataGrid(map);
	}


	/**
	 * 查看页面跳转
	 * @param id,model
	 */
	@RequestMapping(value = "view/{id}", method = RequestMethod.GET)
	public String view(@PathVariable("id") Long id, Model model) {
		GlgdxxEntity entity = glgdxxService.findById(id);

		model.addAttribute("entity", entity);
		return "gggl/glgdxx/view";
	}


	/**
	 * 同步
	 */
	@RequestMapping(value = "tb")
	@ResponseBody
	public String tb() {
		String datasuccess = "success";

		String result = sendGet("http://180.166.244.14:8686/ServiceEngine/rest/services/NetServer/shgl/table/THS_lin/query", "f=json");

		Map<String, Object> jsonMap = (Map) JSONObject.parse(result);
		List<Map> features = JSONArray.parseArray(jsonMap.get("features").toString(), Map.class);
		for (Map fea: features) {
			Map attributes = (Map) JSONObject.parse(fea.get("attributes").toString());

			GlgdxxEntity entity = new GlgdxxEntity();

			entity.setGid(Long.valueOf(attributes.get("gid").toString()));
			entity.setGeom(attributes.get("geom").toString());
			entity.setHasAttachment(attributes.get("hasAttachment").toString());
			entity.setDno(attributes.get("dno").toString());
			entity.setFlow(attributes.get("flow").toString());
			entity.setCrttime(attributes.get("crttime").toString());
			entity.setModtime(attributes.get("modtime").toString());
			entity.setCrtuser(attributes.get("crtuser").toString());
			entity.setModuser(attributes.get("moduser").toString());
			entity.setGuid(attributes.get("guid").toString());
			entity.setOgid(attributes.get("ogid").toString());
			entity.setStnod(attributes.get("stnod").toString());
			entity.setEdnod(attributes.get("ednod").toString());
			entity.setPipeid(attributes.get("pipeid").toString());
			entity.setM1(attributes.get("长度").toString());
			entity.setM2(attributes.get("管段名称").toString());
			entity.setM3(attributes.get("管径").toString());
			entity.setM4(attributes.get("材质").toString());
			entity.setM5(attributes.get("保温层厚").toString());
			entity.setM6(attributes.get("外管径").toString());
			entity.setM7(attributes.get("伴热管根数").toString());
			entity.setM8(attributes.get("备注").toString());
			entity.setM9(attributes.get("管长").toString());
			entity.setM10(attributes.get("管段编号").toString());
			entity.setM11(attributes.get("起始端节点").toString());
			entity.setM12(attributes.get("终止端节点").toString());
			entity.setM13(attributes.get("管道名称").toString());
			entity.setM14(attributes.get("管道编号").toString());
			entity.setM15(attributes.get("管段类型").toString());
			entity.setM16(attributes.get("管道级别").toString());
			entity.setM17(attributes.get("环焊缝类型").toString());
			entity.setM18(attributes.get("使用单位").toString());
			entity.setM19(attributes.get("壁厚_mm").toString());
			entity.setM20(attributes.get("制管焊缝类型").toString());
			entity.setM21(attributes.get("外防腐层材料").toString());
			entity.setM22(attributes.get("绝热层材料").toString());
			entity.setM23(attributes.get("绝热层厚度").toString());
			entity.setM24(attributes.get("外防腐层预制厂商").toString());
			entity.setM25(attributes.get("外防腐层安装地点").toString());
			entity.setM26(attributes.get("外防腐层生产单位").toString());
			entity.setM27(attributes.get("外防腐层监理单位").toString());
			entity.setM28(attributes.get("外防腐层检测单位").toString());
			entity.setM29(attributes.get("外防腐层厚度_mm").toString());
			entity.setM30(attributes.get("外涂刷方式").toString());
			entity.setM31(attributes.get("防腐号").toString());
			entity.setM32(attributes.get("检漏电压_V").toString());
			entity.setM33(attributes.get("补口防腐类型").toString());
			entity.setM34(attributes.get("操作压力_MPa").toString());
			entity.setM35(attributes.get("设计压力_MPa").toString());
			entity.setM36(attributes.get("许用压力_MPa").toString());
			entity.setM37(attributes.get("设计温度_C").toString());
			entity.setM38(attributes.get("操作温度_C").toString());
			entity.setM39(attributes.get("许用温度_C").toString());
			entity.setM40(attributes.get("设计介质").toString());
			entity.setM41(attributes.get("操作介质").toString());
			entity.setM42(attributes.get("许用介质").toString());
			entity.setM43(attributes.get("管道当前状态").toString());
			entity.setM44(attributes.get("巡线方式").toString());
			entity.setM45(attributes.get("巡线周期").toString());
			entity.setM46(attributes.get("管道失效记录").toString());
			entity.setM47(attributes.get("管道维修记录").toString());
			entity.setM48(attributes.get("年度检查报告编号").toString());
			entity.setM49(attributes.get("年度检查问题与处理").toString());
			entity.setM50(attributes.get("下次年度检查日期").toString());
			entity.setM51(attributes.get("全面检验报告编号").toString());
			entity.setM52(attributes.get("全面检验问题与处理").toString());
			entity.setM53(attributes.get("安全等级").toString());
			entity.setM54(attributes.get("下次全面检验日期").toString());
			entity.setM55(attributes.get("使用登记证编号").toString());
			entity.setM56(attributes.get("是否事故后果严重区").toString());
			entity.setM57(attributes.get("事故后果严重区分值").toString());
			entity.setM58(attributes.get("地区等级").toString());
			entity.setM59(attributes.get("防腐层等级").toString());
			entity.setM60(attributes.get("裂纹处数量").toString());
			entity.setM61(attributes.get("凹陷处数量").toString());
			entity.setM62(attributes.get("金属损失处数量").toString());
			entity.setM63(attributes.get("应力超标处数量").toString());
			entity.setM64(attributes.get("失效可能性得分").toString());
			entity.setM65(attributes.get("失效后果得分").toString());
			entity.setM66(attributes.get("第三方破坏得分").toString());
			entity.setM67(attributes.get("损伤得分").toString());
			entity.setM68(attributes.get("管理安全得分").toString());
			entity.setM69(attributes.get("管体本质安全得分").toString());
			entity.setM70(attributes.get("风险相对等级").toString());
			entity.setM71(attributes.get("风险绝对等级").toString());
			entity.setM72(attributes.get("风险值").toString());
			entity.setM73(attributes.get("风险评估单位").toString());
			entity.setM74(attributes.get("风险评估日期").toString());
			entity.setM75(attributes.get("HAZOP等级").toString());
			entity.setM76(attributes.get("管线编码").toString());
			entity.setM77(attributes.get("输出方编码").toString());
			entity.setM78(attributes.get("输送物质").toString());
			entity.setM79(attributes.get("管道所有者").toString());
			entity.setM80(attributes.get("管道走向").toString());
			entity.setM81(attributes.get("输出单位").toString());
			entity.setM82(attributes.get("输入单位").toString());
			entity.setM83(attributes.get("建造单位").toString());
			entity.setM84(attributes.get("管道规格").toString());
			entity.setM85(attributes.get("建造年份").toString());
			entity.setM86(attributes.get("管道材质").toString());
			entity.setM87(attributes.get("设计温度").toString());
			entity.setM88(attributes.get("设计压力").toString());

			glgdxxService.add(entity);
		}

		return datasuccess;
	}

	public static String sendGet(String url, String param) {
		String result = "";
		BufferedReader in = null;
		try {
			String urlNameString = url + "?" + param;
			URL realUrl = new URL(urlNameString);
			// 打开和URL之间的连接
			URLConnection connection = realUrl.openConnection();
			// 设置通用的请求属性
			connection.setRequestProperty("accept", "*/*");
			connection.setRequestProperty("connection", "Keep-Alive");
			connection.setRequestProperty("user-agent",
					"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
			// 建立实际的连接
			connection.connect();
			// 获取所有响应头字段
			Map<String, List<String>> map = connection.getHeaderFields();
			// 遍历所有的响应头字段
			for (String key : map.keySet()) {
				System.out.println(key + "--->" + map.get(key));
			}
			// 定义 BufferedReader输入流来读取URL的响应
			in = new BufferedReader(new InputStreamReader(
					connection.getInputStream()));
			String line;
			while ((line = in.readLine()) != null) {
				result += line;
			}
		} catch (Exception e) {
			System.out.println("发送GET请求出现异常！" + e);
			e.printStackTrace();
		}
		// 使用finally块来关闭输入流
		finally {
			try {
				if (in != null) {
					in.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}
}
