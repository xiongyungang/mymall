package com.xyg.mall.service;

import com.xyg.mall.pojo.ProductImage;

import java.util.List;

public interface ProductImageService {
    String type_single = "type_single";
    String type_detail = "type_detail";

    void add(ProductImage productImage);

    void delete(int id);

    void update(ProductImage productImage);

    List<ProductImage> list(int pid,String type);

    ProductImage get(int id);
}
