package com.cczu.model.gggl.controller;

import com.cczu.model.gggl.entity.BIS_GdsjxxEntity;
import com.cczu.model.gggl.service.BisGdjsxxService;
import com.cczu.sys.comm.controller.BaseController;
import com.cczu.sys.system.service.ShiroRealm;
import com.cczu.sys.system.utils.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * @ClassName PageBisGlgdjbxxController @Author wangmeng @Description 管道数据信息----分发器 @Data 2020-06-12
 * 19:37 @Version 1.0
 */
@Controller
@RequestMapping("gggl/gdsjxx")
public class PageBisGdsjxxController extends BaseController {

  @Autowired private BisGdjsxxService bisGdjsxxService;

  /*
   * @Description      : 管道数据信息--index页面
   * @Author           : WangMeng
   * @Date             : 2020-06-12 23:17
   * @Param            : []
   * @Return           : java.lang.String
   **/
  @RequestMapping(value = "index")
  public String index() {
    return "gggl/gdsjxx/index";
  }

  /*
   * @Description      : index页面中的表格数据
   * @Author           : WangMeng
   * @Date             : 2020-06-12 23:38
   * @Param            : [request]
   * @Return           : java.util.Map<java.lang.String,java.lang.Object>
   **/
  @RequestMapping(value = "list")
  @ResponseBody
  public Map<String, Object> getData(HttpServletRequest request) {
    Map<String, Object> map = getPageMap(request);
    map.putAll(getAuthorityMap());
    map.put("name", request.getParameter("name"));
    return bisGdjsxxService.dataGrid(map);
  }

  /*
   * @Description      : 添加页面跳转
   * @Author           : WangMeng
   * @Date             : 2020-06-12 23:45
   * @Param            : [model, request]
   * @Return           : java.lang.String
   **/
  @RequestMapping(value = "create", method = RequestMethod.GET)
  public String create(Model model, HttpServletRequest request) {
    model.addAttribute("action", "create");
    model.addAttribute("usertype", UserUtil.getCurrentShiroUser().getUsertype());
    return "gggl/gdsjxx/form";
  }

  /**
   * 添加信息
   *
   * @param model
   */
  @RequestMapping(value = "create")
  @ResponseBody
  public String create(BIS_GdsjxxEntity entity, Model model) {
    ShiroRealm.ShiroUser sessionuser = UserUtil.getCurrentShiroUser();
    String datasuccess = "success";
    entity.setId1(sessionuser.getQyid());
    bisGdjsxxService.addInfo(entity);
    // 返回结果
    return datasuccess;
  }
}
