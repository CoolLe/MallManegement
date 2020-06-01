package com.coolle.repository;

import com.coolle.entity.MALL_PRODUCT;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface SpuRepository {


    void insert_spu(MALL_PRODUCT spu);

    void insert_images(Map<Object, Object> map);

    List<MALL_PRODUCT> select_spu_list(Map<Object, Object> map);

    List<MALL_PRODUCT> select_all_spu();

    void deleteById(int id);

    void update(MALL_PRODUCT mall_product);
}
