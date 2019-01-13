package com.xyg.mall.service;

import com.xyg.mall.pojo.Property;

import java.util.List;

public interface PropertyService {
    void add(Property pt);

    void delete(int id);

    void update(Property pt);

    List<Property> list(int cid);

    Property get(int id);
}
