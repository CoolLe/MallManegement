package com.coolle.repository;

import com.coolle.entity.MALL_SKU;

import java.util.Map;

public interface SkuRepository {

    void insert_sku(MALL_SKU sku);

    void insert_sku_av(Map<Object,Object> map);
}
