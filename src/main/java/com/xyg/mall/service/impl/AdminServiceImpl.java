package com.xyg.mall.service.impl;

import com.xyg.mall.mapper.AdministratorsMapper;
import com.xyg.mall.pojo.Administrators;
import com.xyg.mall.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    AdministratorsMapper administratorsMapper;

    @Override
    public List<Administrators> list(String name,String password) {
        return administratorsMapper.list(name,password);
    }
}
