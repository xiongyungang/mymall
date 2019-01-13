package com.xyg.mall.service;

import com.xyg.mall.pojo.Administrators;

import java.util.List;

public interface AdminService {
    List<Administrators> list(String name,String password);
}
