package com.coolle.service;

import com.coolle.entity.MALL_ORDER;

import java.util.List;

public interface OrderService {

    List<MALL_ORDER> select_order();

    void delete_order_by_id(int id);

    void update_order(MALL_ORDER mall_order);
}
