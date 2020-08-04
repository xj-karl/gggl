package com.cczu.model.gggl.controller;

import com.cczu.model.gggl.service.BisGljsxxService;
import com.cczu.sys.comm.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * @ClassName PageBisGlsjxxController @Author wangmeng @Description 管廊数据信息 @Data 2020-06-12
 * 19:43 @Version 1.0
 */
@Controller
@RequestMapping("gggl/glsjxx")
public class PageBisGlsjxxController extends BaseController {

  @Autowired private BisGljsxxService bisGljsxxService;

  /** 列表显示页面 */
  @RequestMapping(value = "index")
  public String index() {
    return "gggl/glsjxx/index";
  }

  /*
   * @Description      : index页面中的表格数据
   * @Author           : WangMeng
   * @Date             : 2020-07-06 22:02
   * @Param            : [request]
   * @Return           : java.util.Map<java.lang.String,java.lang.Object>
   **/
  @RequestMapping(value = "list")
  @ResponseBody
  public Map<String, Object> getData(HttpServletRequest request) {
    Map<String, Object> map = getPageMap(request);
    map.putAll(getAuthorityMap());
    map.put("name", request.getParameter("name"));
    return bisGljsxxService.dataGrid(map);
  }
}
