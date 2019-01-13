package com.xyg.mall.service.impl;

import com.xyg.mall.mapper.OrderMapper;
import com.xyg.mall.mapper.UserMapper;
import com.xyg.mall.pojo.Order;
import com.xyg.mall.pojo.OrderExample;
import com.xyg.mall.pojo.OrderItem;
import com.xyg.mall.pojo.User;
import com.xyg.mall.service.OrderItemService;
import com.xyg.mall.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    OrderMapper orderMapper;
    @Autowired
    UserMapper userMapper;
    @Autowired
    OrderItemService orderItemService;

    @Override
    public void add(Order order) {
        orderMapper.insert(order);
    }

    @Override
    //增加订单删除订单项目，application需要开启事务
    @Transactional(propagation= Propagation.REQUIRED,rollbackForClassName="Exception")
    public float add(Order c, List<OrderItem> ois) {
        float total=0;
        add(c);
        for (OrderItem oi : ois) {
            oi.setOid(c.getId());
            orderItemService.update(oi);
            total +=oi.getProduct().getPromotePrice()*oi.getNumber();
        }
        return total;
    }

    @Override
    public void delete(int id) {
        orderMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void update(Order order) {
        orderMapper.updateByPrimaryKeySelective(order);
    }

    @Override
    public List<Order> list() {
        OrderExample example = new OrderExample();
        example.setOrderByClause("id desc");
        List<Order> os = orderMapper.selectByExample(example);
        setUser(os);
        return os;
    }

    @Override
    public Order get(int id) {
        return orderMapper.selectByPrimaryKey(id);
    }

    public void setUser(Order order) {
        User u = userMapper.selectByPrimaryKey(order.getUid());
        order.setUser(u);
    }

    public void setUser(List<Order> os) {
        for (Order e : os) {
            setUser(e);
        }
    }
}
