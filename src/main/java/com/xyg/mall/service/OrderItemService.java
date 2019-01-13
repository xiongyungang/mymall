package com.xyg.mall.service;

import com.xyg.mall.pojo.Order;
import com.xyg.mall.pojo.OrderItem;

import java.util.List;

public interface OrderItemService {
    void add(OrderItem orderItem);

    void delete(int id);

    void update(OrderItem orderItem);

    List list();

    OrderItem get(int id);

    void fill(Order order);

    void fill(List<Order> os);

    List<OrderItem> listByUser(int uid);

}
