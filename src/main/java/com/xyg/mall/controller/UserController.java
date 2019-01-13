package com.xyg.mall.controller;

import com.xyg.mall.pojo.User;
import com.xyg.mall.service.UserService;
import com.xyg.mall.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("")
public class UserController {
    @Autowired
    UserService userService;

    @RequestMapping("admin_user_list")
    public String list(Model model,Page page) {
        List<User> us = userService.list();
        model.addAttribute("us", us);
        model.addAttribute("page", page);
        return "admin/listUser";
    }
}
