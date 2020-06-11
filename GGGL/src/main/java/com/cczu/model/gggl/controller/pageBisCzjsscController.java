package com.cczu.model.gggl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ClassName pageBisCzjsscController
 * @Author wangmeng
 * @Description 处置技术速查
 * @Data 2020-06-11 23:42
 * @Version 1.0
 */
@Controller
@RequestMapping("gggl/czjssc")
public class pageBisCzjsscController {

    /**
     * 列表显示页面
     */
    @RequestMapping(value="index")
    public String index() {
        return "gggl/czjssc/index";
    }

}
