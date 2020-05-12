package com.coolle.service;

import com.coolle.entity.MALL_PRODUCT;
import com.coolle.entity.MALL_SKU;
import com.coolle.entity.MALL_SKU_ATTR_VALUE;

import java.util.List;

public interface SkuService {
    void save_sku(MALL_SKU sku, MALL_PRODUCT spu, List<MALL_SKU_ATTR_VALUE> list_attr);
}
