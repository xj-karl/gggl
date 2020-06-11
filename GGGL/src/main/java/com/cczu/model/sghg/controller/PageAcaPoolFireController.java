package com.cczu.model.sghg.controller;

import com.cczu.model.entity.BIS_EnterpriseEntity;
import com.cczu.model.service.impl.BisQyjbxxServiceImpl;
import com.cczu.model.sghg.entity.ACA_PoolFireEntity;
import com.cczu.model.sghg.service.AcaPoolFireService;
import com.cczu.sys.comm.controller.BaseController;
import com.cczu.sys.system.utils.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;

/**
 * 事故后果计算controller
 * @author jason
 */
@Controller
@RequestMapping("sghgjs/poolfire")
public class PageAcaPoolFireController extends BaseController {

	@Autowired
	private AcaPoolFireService acaPoolFireService;
	@Autowired
	private BisQyjbxxServiceImpl bisQyjbxxService;
	
	/**
	 * 默认页面
	 */
	@RequestMapping(value="index")
	public String index(Model model) {
		BIS_EnterpriseEntity be = bisQyjbxxService.findInfoById(UserUtil.getCurrentShiroUser().getQyid());
		String lng = be.getM16();//企业所在位置的经度
		String lat = be.getM17();//企业所在位置的纬度
		model.addAttribute("qylng", lng);
		model.addAttribute("qylat", lat);
		return "sghg/poolfire/index";
	}
	
	/**
	 * @param model
	 */
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String create(Model model){
//		model.addAttribute("list", new ACA_PoolFireEntity());
		return "sghg/poolfire/form";
	}
	
	/**
	 * @param model
	 */
	@RequestMapping(value = "create")
	@ResponseBody
	public String create(@Valid ACA_PoolFireEntity aca , Model model) throws Exception{
		return acaPoolFireService.countSave(aca);
	}
	
}
