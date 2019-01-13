package com.xyg.mall.service;

import com.xyg.mall.pojo.Category;
import com.xyg.mall.pojo.Product;

import java.util.List;

public interface ProductService {
    void add(Product product);

    void delete(int id);

    void update(Product product);

    List<Product> list(int cid);

    Product get(int id);

    void fill(Category category);

    void fill(List<Category> cs );

    void setFirstProductImage(Product p);
}
