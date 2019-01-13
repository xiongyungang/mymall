package com.xyg.mall.service;

import com.xyg.mall.pojo.User;

import java.util.List;

public interface UserService {
    void add(User user);

    void delete(int id);

    void update(User user);

    List<User> list();

    User get(int id);

    User get(String name, String password);

    boolean isExist(String name);

}
