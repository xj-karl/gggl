package com.cczu.model.gggl.controller;

import com.cczu.model.gggl.entity.BIS_FwqyxxEntity;
import com.cczu.model.gggl.service.BisFwqyxxService;
import com.cczu.sys.comm.controller.BaseController;
import com.cczu.sys.system.service.ShiroRealm.ShiroUser;
import com.cczu.sys.system.utils.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * 服务企业信息
 * @author YZH
 */
@Controller
@RequestMapping("gggl/fwqyxx")
public class PageBisFwqyxxController extends BaseController {

	@Autowired
	private BisFwqyxxService bisFwqyxxService;

	/**
	 * 列表显示页面
	 * @param model
	 */
	@RequestMapping(value="index")
	public String index(Model model) {
		String usertype = UserUtil.getCurrentShiroUser().getUsertype();
		model.addAttribute("usertype", usertype);
		return "gggl/fwqyxx/index";
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
		return bisFwqyxxService.dataGrid(map);
	}

	/**
	 * 添加页面跳转
	 * @param model
	 */
	@RequestMapping(value = "create" , method = RequestMethod.GET)
	public String create(Model model, HttpServletRequest request) {
		model.addAttribute("action", "create");
		model.addAttribute("usertype", UserUtil.getCurrentShiroUser().getUsertype());
		return "gggl/fwqyxx/form";
	}

	/**
	 * 添加信息
	 * @param model
	 */
	@RequestMapping(value = "create")
	@ResponseBody
	public String create(BIS_FwqyxxEntity entity, Model model) {
		ShiroUser sessionuser = UserUtil.getCurrentShiroUser();
		String datasuccess = "success";
		entity.setId1(sessionuser.getQyid());
		bisFwqyxxService.addInfo(entity);
		// 返回结果
		return datasuccess;
	}


	/**
	 * 修改页面跳转
	 * @param id,model
	 */
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String update(@PathVariable("id") Long id, Model model) {
		//查询选择的资质信息信息
		BIS_FwqyxxEntity entity = bisFwqyxxService.findById(id);
		model.addAttribute("entity", entity);
		//返回页面
		model.addAttribute("action", "update");
		model.addAttribute("usertype", UserUtil.getCurrentShiroUser().getUsertype());
		return "gggl/fwqyxx/form";
	}

	/**
	 * 修改信息
	 * @param model
	 */
	@RequestMapping(value = "update")
	@ResponseBody
	public String update(BIS_FwqyxxEntity fwqyxx,  Model model){
		String datasuccess="success";

		BIS_FwqyxxEntity entity = bisFwqyxxService.findById(fwqyxx.getID());
		entity.setM1(fwqyxx.getM1());
		entity.setM2(fwqyxx.getM2());
		entity.setM3(fwqyxx.getM3());
		entity.setM4(fwqyxx.getM4());

		bisFwqyxxService.updateInfo(entity);
		//返回结果
		return datasuccess;
	}

	/**
	 * 删除信息
	 */
	@RequestMapping(value = "delete/{ids}")
	@ResponseBody
	public String delete(@PathVariable("ids") String ids) {
		String datasuccess="删除成功";
		//可以批量删除
		String[] arrids = ids.split(",");
		for(int i=0;i<arrids.length;i++){
			bisFwqyxxService.deleteInfo(Long.parseLong(arrids[i]));
		}
		return datasuccess;
	}

	/**
	 * 查看页面跳转
	 * @param id,model
	 */
	@RequestMapping(value = "view/{id}", method = RequestMethod.GET)
	public String view(@PathVariable("id") Long id, Model model) {
		BIS_FwqyxxEntity entity = bisFwqyxxService.findById(id);

		model.addAttribute("entity", entity);
		//返回页面
		model.addAttribute("action", "view");
		return "gggl/fwqyxx/view";
	}

}
