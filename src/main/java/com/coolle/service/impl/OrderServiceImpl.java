package com.coolle.service.impl;

import com.coolle.entity.MALL_ORDER;
import com.coolle.entity.MALL_PRODUCT;
import com.coolle.repository.OrderRepository;
import com.coolle.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Override
    public List<MALL_ORDER> select_order() {

        List<MALL_ORDER> list_order = orderRepository.select_all_order();
        return list_order;
    }

    @Override
    public void delete_order_by_id(int id) {
        orderRepository.deleteById(id);
    }

    @Override
    public void update_order(MALL_ORDER mall_order) {
        orderRepository.updateState(mall_order);
    }
}
