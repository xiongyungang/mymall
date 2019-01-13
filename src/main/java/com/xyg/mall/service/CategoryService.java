package com.xyg.mall.service;

import com.xyg.mall.pojo.Category;

import java.util.List;

public interface CategoryService {
    List<Category> list();

    void add(Category category);

    void delete(int id);

    void update(Category category);

    Category get(int id);
}
