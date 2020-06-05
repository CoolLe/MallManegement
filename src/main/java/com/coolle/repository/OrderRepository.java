package com.coolle.repository;

import com.coolle.entity.MALL_ORDER;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderRepository {

    List<MALL_ORDER> select_all_order();

    void deleteById(int id);

    void updateState(MALL_ORDER mall_order);
}
