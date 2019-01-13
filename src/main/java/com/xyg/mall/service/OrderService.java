package com.xyg.mall.service;

import com.xyg.mall.pojo.Order;
import com.xyg.mall.pojo.OrderItem;
import com.xyg.mall.pojo.User;

import java.util.List;

public interface OrderService {
    String waitPay = "waitPay";
    String waitDelivery = "waitDelivery";
    String waitConfirm = "waitConfirm";
    String waitReview = "waitReview";
    String finish = "finish";
    String delete = "delete";

    void add(Order order);

    float add(Order c,List<OrderItem> ois);

    void delete(int id);

    void update(Order order);

    List<Order> list();

    Order get(int id);
}
