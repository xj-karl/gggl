package com.cczu.sys.system.controller;

import com.cczu.sys.comm.utils.Global;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * 登录选择页面controller
 * @author jason
 * @date 2017年5月31日
 */
@Controller
@RequestMapping(value = "login")
public class LoginChooseController{
	public static final String DEFAULT_SESSION_LOGINURL="loginurl";
	/**
	 * 登录页面
	 * @return
	 */
	@RequestMapping(value = "/{address}")
	public String ajLogin(@PathVariable("address") String address ) {

		Subject subject = SecurityUtils.getSubject();
		if(subject.isAuthenticated()||subject.isRemembered()){
			return "redirect:"+Global.getAdminPath();
		}
		Session session =subject.getSession();

		switch (address) {
		case "en"://英文版界面
			session.setAttribute("logotitle", "");
			session.setAttribute("loginurl", "/login/en");
			return "system/login_en";
		default:
			return "system/login";
		}


	}
	
	
	/**
	 * 企业端登录页面
	 * @return
	 */
	@RequestMapping(value = "qy",method = RequestMethod.GET)
	public String qyLogin(Model model) {
		Subject subject = SecurityUtils.getSubject();
		if(subject.isAuthenticated()||subject.isRemembered()){
			return "redirect:"+Global.getAdminPath();
		} 
		return "system/login";
	}
	
}
