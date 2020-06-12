package com.cczu.model.gggl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ClassName PageBisGlsjxxController
 * @Author wangmeng
 * @Description 管廊数据信息
 * @Data 2020-06-12 19:43
 * @Version 1.0
 */
@Controller
@RequestMapping("gggl/glsjxx")
public class PageBisGlsjxxController {

    /**
     * 列表显示页面
     */
    @RequestMapping(value="index")
    public String index() {
        return "gggl/gdsjxx/index";
    }



}
