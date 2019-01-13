package com.xyg.mall.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xyg.mall.pojo.Category;
import com.xyg.mall.pojo.Property;
import com.xyg.mall.service.CategoryService;
import com.xyg.mall.service.PropertyService;
import com.xyg.mall.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("")
public class PeopertyController {
    @Autowired
    PropertyService propertyService;
    @Autowired
    CategoryService categoryService;

    @RequestMapping("adminpropertylist")
    public String list(int cid, Model model, Page page) {
        Category c = categoryService.get(cid);
        PageHelper.offsetPage(page.getStart(), page.getCount());
        List<Property> pts = propertyService.list(cid);
        int total = (int) new PageInfo<>(pts).getTotal();
        page.setTotal(total);
        page.setParam("&cid=" + c.getId());
        model.addAttribute("pts", pts);
        model.addAttribute("page", page);
        return "admin/listProperty";
    }

    @RequestMapping("propertyedit")
    public String edit(int id, Model model) {
        Property pt = propertyService.get(id);
        model.addAttribute("pt", pt);
        return "admin/editProperty";
    }

    @RequestMapping("propertyupdate")
    public String update(Property pt) {
        propertyService.update(pt);
        return "redirect:adminpropertylist?cid=" + pt.getCid();
    }

    @RequestMapping("propertydel")
    public String delete(int id) {
        Property pt = propertyService.get(id);
        propertyService.delete(id);
        return "redirect:adminpropertylist?cid=" + pt.getCid();
    }
}
