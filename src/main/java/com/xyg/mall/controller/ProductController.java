package com.xyg.mall.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xyg.mall.pojo.Category;
import com.xyg.mall.pojo.Product;
import com.xyg.mall.service.CategoryService;
import com.xyg.mall.service.ProductService;
import com.xyg.mall.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("")
public class ProductController {
    @Autowired
    ProductService productService;
    @Autowired
    CategoryService categoryService;

    @RequestMapping("admin_product_list")
    public String list(int cid, Model model, Page page) {
        List<Category> cs = categoryService.list();
        if (cid == 0) {
            if (cs.isEmpty()) {
                return "admin/listCategory";
            }
            cid = cs.get(0).getId();
        }
        PageHelper.offsetPage(page.getStart(), page.getCount());
        List<Product> ps = productService.list(cid);
        int total = (int) new PageInfo<>(ps).getTotal();
        page.setTotal(total);
        page.setParam("&cid="+cid);
        model.addAttribute("page", page);
        model.addAttribute("cs", cs);
        model.addAttribute("ps", ps);
        model.addAttribute("cid", cid);

        return "admin/listProduct";
    }

    @RequestMapping("admin_product_add")
    public String add(Product product) {
        product.setCreateDate(new Date());
        productService.add(product);
        return "redirect:/admin_product_list?cid=" + product.getCid();
    }

    @RequestMapping("admin_product_delete")
    public String delete(int id) {
        Product p = productService.get(id);
        productService.delete(id);
        return "redirect:/admin_product_list?cid=" + p.getCid();
    }

    @RequestMapping("admin_product_edit")
    public String edit(int id, Model model) {
        Product p = productService.get(id);
        model.addAttribute("p", p);
        return "admin/editProduct";
    }

    @RequestMapping("admin_product_update")
    public String update(Product product) {
        productService.update(product);
        return "redirect:/admin_product_list?cid=" + product.getCid();
    }
}
