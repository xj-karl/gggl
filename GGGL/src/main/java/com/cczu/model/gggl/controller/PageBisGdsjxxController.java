package com.cczu.model.gggl.controller;

import com.cczu.model.gggl.entity.BIS_FwqyxxEntity;
import com.cczu.model.gggl.entity.BIS_GdsjxxEntity;
import com.cczu.model.gggl.service.BisFwqyxxService;
import com.cczu.model.gggl.service.BisGdjsxxService;
import com.cczu.sys.comm.controller.BaseController;
import com.cczu.sys.system.service.ShiroRealm;
import com.cczu.sys.system.utils.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * @ClassName PageBisGlgdjbxxController @Author wangmeng @Description 管道数据信息----分发器 @Data 2020-06-12
 * 19:37 @Version 1.0
 */
@Controller
@RequestMapping("gggl/gdsjxx")
public class PageBisGdsjxxController extends BaseController {

  @Autowired private BisGdjsxxService bisGdjsxxService;

  @Autowired private BisFwqyxxService bisFwqyxxService;

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

  /*
   * @Description      : 添加管道信息
   * @Author           : WangMeng
   * @Date             : 2020-06-15 22:01
   * @Param            : [entity, model]
   * @Return           : java.lang.String
   **/
  @RequestMapping(value = "create")
  @ResponseBody
  public String create(BIS_GdsjxxEntity entity, HttpServletRequest request) {
    ShiroRealm.ShiroUser sessionuser = UserUtil.getCurrentShiroUser();
    String datasuccess = "success";
    entity.setId2(Long.parseLong(request.getParameter("id2")));
    if (request.getParameter("id2") != null && request.getParameter("id2") != "") {
      BIS_FwqyxxEntity fwqyxxEntity =
          bisFwqyxxService.findById(Long.parseLong(request.getParameter("id2")));
      entity.setFwqyName(fwqyxxEntity.getM1());
    }
    entity.setId1(sessionuser.getQyid());
    bisGdjsxxService.addInfo(entity);
    // 返回结果
    return datasuccess;
  }

  /*
   * @Description      : 删除管道信息
   * @Author           : WangMeng
   * @Date             : 2020-06-16 21:59
   * @Param            : [ids]
   * @Return           : java.lang.String
   **/
  @RequestMapping(value = "delete/{ids}")
  @ResponseBody
  public String delete(@PathVariable("ids") String ids) {
    String datasuccess = "删除成功";
    // 可以批量删除
    String[] arrids = ids.split(",");
    for (int i = 0; i < arrids.length; i++) {
      bisGdjsxxService.deleteInfo(Long.parseLong(arrids[i]));
    }
    return datasuccess;
  }

  /*
   * @Description      : 修改页面跳转
   * @Author           : WangMeng
   * @Date             : 2020-06-16 20:44
   * @Param            : [id, model]
   * @Return           : java.lang.String
   **/
  @RequestMapping(value = "update/{id}", method = RequestMethod.GET)
  public String update(@PathVariable("id") Long id, Model model) {
    // 查询选择的资质信息信息
    BIS_GdsjxxEntity entity = bisGdjsxxService.findById(id);
    model.addAttribute("entity", entity);
    // 返回页面
    model.addAttribute("action", "update");
    model.addAttribute("usertype", UserUtil.getCurrentShiroUser().getUsertype());
    return "gggl/gdsjxx/form";
  }

  /*
   * @Description      : 修改保存信息
   * @Author           : WangMeng
   * @Date             : 2020-06-16 20:49
   * @Param            : [fwqyxx, model]
   * @Return           : java.lang.String
   **/
  @RequestMapping(value = "update")
  @ResponseBody
  public String update(BIS_GdsjxxEntity gdsjxx, HttpServletRequest request) {
    String datasuccess = "success";

    BIS_GdsjxxEntity entity = bisGdjsxxService.findById(gdsjxx.getID());
    if (request.getParameter("id2") != null && request.getParameter("id2") != "") {
      BIS_FwqyxxEntity fwqyxxEntity =
          bisFwqyxxService.findById(Long.parseLong(request.getParameter("id2")));
      entity.setFwqyName(fwqyxxEntity.getM1());
    }
    entity.setId2(gdsjxx.getId2());
    entity.setName(gdsjxx.getName());
    entity.setConveyingMedium(gdsjxx.getConveyingMedium());
    entity.setFlow(gdsjxx.getFlow());
    entity.setMaterial(gdsjxx.getMaterial());
    entity.setNumber(gdsjxx.getNumber());
    entity.setPipeDiameter(gdsjxx.getPipeDiameter());
    entity.setPressure(gdsjxx.getPressure());
    entity.setTemperature(gdsjxx.getTemperature());
    entity.setThickness(gdsjxx.getThickness());
    bisGdjsxxService.updateInfo(entity);
    // 返回结果
    return datasuccess;
  }

  /*
   * @Description      : 查看页面跳转
   * @Author           : WangMeng
   * @Date             : 2020-06-16 21:34
   * @Param            : [id, model]
   * @Return           : java.lang.String
   **/
  @RequestMapping(value = "view/{id}", method = RequestMethod.GET)
  public String view(@PathVariable("id") Long id, Model model) {
    BIS_GdsjxxEntity entity = bisGdjsxxService.findById(id);

    model.addAttribute("entity", entity);
    // 返回页面
    model.addAttribute("action", "view");
    return "gggl/gdsjxx/view";
  }

  /*
   * @Description      : 查询企业数据 id text
   * @Author           : WangMeng
   * @Date             : 2020-06-15 22:03
   * @Param            : [request]
   * @Return           : java.lang.String
   **/
  @RequestMapping(value = "/qyjson")
  @ResponseBody
  public String qyjson(HttpServletRequest request) {
    Map<String, Object> map = new HashMap<String, Object>();
    return bisFwqyxxService.getQyIdjson(map);
  }
}
