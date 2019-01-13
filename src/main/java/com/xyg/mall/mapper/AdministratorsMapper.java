package com.xyg.mall.mapper;

import com.xyg.mall.pojo.Administrators;

import java.util.List;

public interface AdministratorsMapper {
    List<Administrators> list(String name,String password);
}
