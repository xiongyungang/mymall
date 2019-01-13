package com.xyg.mall.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xyg.mall.pojo.Category;
import com.xyg.mall.service.CategoryService;
import com.xyg.mall.util.ImageUtil;
import com.xyg.mall.util.Page;
import com.xyg.mall.util.UploadedImageFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("")
public class CategoryController {
    @Autowired
    CategoryService categoryService;

    @RequestMapping("admin_category_list")
    public String list(Model model, Page page) {
        PageHelper.offsetPage(page.getStart(), page.getCount());
        List<Category> cs = categoryService.list();
        int total = (int) new PageInfo<>(cs).getTotal();
        page.setTotal(total);
        model.addAttribute("cs", cs);
        model.addAttribute("page", page);
        return "admin/listCategory";
    }

    @RequestMapping("admin_category_add")
    public String add(Category c, UploadedImageFile uploadedImageFile, HttpSession session) throws IOException {
        categoryService.add(c);
        File imageFolder = new File(session.getServletContext().getRealPath("img/category"));
        File file = new File(imageFolder, c.getId() + ".jpg");
        if (!file.getParentFile().exists())
            file.getParentFile().mkdirs();
        uploadedImageFile.getImage().transferTo(file);
        BufferedImage img = ImageUtil.change2jpg(file);
        ImageIO.write(img, "jpg", file);
        return "redirect:/admin_category_list";
    }

    @RequestMapping("admin_category_delete")
    public String delete(int id, HttpSession session) {
        File imageFolder = new File(session.getServletContext().getRealPath("img/category"));
        File image = new File(imageFolder, id + ".jpg");
        image.delete();
        categoryService.delete(id);
        return "redirect:/admin_category_list";
    }

    @RequestMapping("admin_category_edit")
    public String edit(int id, Model model) {
        Category c = categoryService.get(id);
        model.addAttribute("c", c);
        return "admin/editCategory";
    }

    @RequestMapping("admin_category_update")
    public String update(Category c,HttpSession session,UploadedImageFile uploadedImageFile) throws IOException {
        MultipartFile image = uploadedImageFile.getImage();
        if (image != null && !image.isEmpty()) {
            File imageFolder = new File(session.getServletContext().getRealPath("img/category"));
            File file = new File(imageFolder, c.getId() + ".jpg");
            if (!file.getParentFile().exists())
                file.getParentFile().mkdirs();
            uploadedImageFile.getImage().transferTo(file);
            BufferedImage img = ImageUtil.change2jpg(file);
            ImageIO.write(img, "jpg", file);
        }
        return "redirect:/admin_category_list";
    }
}
