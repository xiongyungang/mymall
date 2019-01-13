package com.xyg.mall.controller;

import com.xyg.mall.pojo.Product;
import com.xyg.mall.pojo.ProductImage;
import com.xyg.mall.service.ProductImageService;
import com.xyg.mall.service.ProductService;
import com.xyg.mall.util.ImageUtil;
import com.xyg.mall.util.UploadedImageFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("")
public class ProductImageController {
    @Autowired
    ProductImageService productImageService;
    @Autowired
    ProductService productService;

    @RequestMapping("productImageList")
    public String list(int id, Model model) {
        Product p = productService.get(id);
        List<ProductImage> pisSingle = productImageService.list(id, ProductImageService.type_single);
        List<ProductImage> pisDetail = productImageService.list(id, ProductImageService.type_detail);
        model.addAttribute("p", p);
        model.addAttribute("pisSingle", pisSingle);
        model.addAttribute("pisDetail", pisDetail);

        return "admin/listProductImage";
    }


    @RequestMapping("productImageAdd")
    public String add(UploadedImageFile uploadedImageFile, ProductImage pi, HttpSession session) {
        productImageService.add(pi);
        String FileName = pi.getId() + ".jpg";
        String imageFolder;
        String imageFolder_small = null;
        String imageFolder_middle = null;

        if (ProductImageService.type_single.equals(pi.getType())) {
            imageFolder = session.getServletContext().getRealPath("img/productSingle");
            imageFolder_small = session.getServletContext().getRealPath("img/productSingle_small");
            imageFolder_middle = session.getServletContext().getRealPath("img/productSingle_middle");
        } else {
            imageFolder = session.getServletContext().getRealPath("img/productDetail");
        }
        File f = new File(imageFolder, FileName);
        f.getParentFile().mkdirs();

        try {
            uploadedImageFile.getImage().transferTo(f);
            BufferedImage bufferedImage = ImageUtil.change2jpg(f);
            ImageIO.write(bufferedImage, "jpg", f);

            if (ProductImageService.type_single.equals(pi.getType())) {
                File fs = new File(imageFolder_small, FileName);
                File fm = new File(imageFolder_middle, FileName);

                ImageUtil.resizeImage(f, 56, 56, fs);
                ImageUtil.resizeImage(f, 127, 190, fm);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "redirect:productImageList?id=" + pi.getPid();
    }

    @RequestMapping("productImageDelete")
    public String delete(int id,HttpSession session) {
        ProductImage pi = productImageService.get(id);
        String FileName = pi.getId() + ".jpg";
        String FileFloder;
        String FileFloder_small = null;
        String FileFloder_middle = null;

        if (ProductImageService.type_single.equals(pi.getType())) {
            FileFloder = session.getServletContext().getRealPath("img/productSingle");
            FileFloder_small = session.getServletContext().getRealPath("img/productSingle_small");
            FileFloder_middle = session.getServletContext().getRealPath("img/productSingle_middle");
            File f = new File(FileFloder, FileName);
            File fs = new File(FileFloder_small, FileName);
            File fm = new File(FileFloder_middle, FileName);
            f.delete();
            fs.delete();
            fm.delete();
        } else {
            FileFloder = session.getServletContext().getRealPath("img/productDetail");
            File f = new File(FileFloder,FileName);
            f.delete();
        }
        productImageService.delete(id);
        return "redirect:productImageList?id=" + pi.getPid();
    }
}
