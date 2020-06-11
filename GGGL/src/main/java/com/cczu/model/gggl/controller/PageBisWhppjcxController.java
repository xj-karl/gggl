package com.cczu.model.gggl.controller;

import com.cczu.sys.system.utils.UserUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ClassName PageBisWhppjcxController
 * @Author wangmeng
 * @Description  危化品扑救程序
 * @Data 2020-06-11 22:55
 * @Version 1.0
 */
@Controller
@RequestMapping("gggl/whppjcx")
public class PageBisWhppjcxController {

    /**
     * 列表显示页面
     */
    @RequestMapping(value="index")
    public String index() {
        return "gggl/whppjcx/index";
    }

}
