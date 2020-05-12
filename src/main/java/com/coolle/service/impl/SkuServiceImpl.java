package com.coolle.service.impl;

import com.coolle.entity.MALL_PRODUCT;
import com.coolle.entity.MALL_SKU;
import com.coolle.entity.MALL_SKU_ATTR_VALUE;
import com.coolle.repository.SkuRepository;
import com.coolle.service.SkuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SkuServiceImpl implements SkuService {

    @Autowired
    private SkuRepository skuRepository;

    @Override
    public void save_sku(MALL_SKU sku, MALL_PRODUCT spu, List<MALL_SKU_ATTR_VALUE> list_attr) {
        //保存sku，返回sku主键
        sku.setShp_id(spu.getId());
        skuRepository.insert_sku(sku);

        //根据返回sku主键插入属性关联表
        Map<Object,Object> map = new HashMap<Object, Object>();
        map.put("shp_id",spu.getId());
        map.put("sku_id",sku.getId());
        map.put("list_av",list_attr);
        skuRepository.insert_sku_av(map);
    }
}
