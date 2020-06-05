package com.coolle.service;

import com.coolle.entity.MALL_VALUE;
import com.coolle.entity.MODEL_MALL_VALUE;
import com.coolle.entity.OBJECT_MALL_ATTR;

import java.util.List;

public interface AttrService {
    void save_attr(int flbh2, List<OBJECT_MALL_ATTR> list_attr);

    List<OBJECT_MALL_ATTR> get_attr_list(int flbh2);

    void delete_attr_by_id(int id);

    void delete_value_by_shxzh(String old_shxzh);


    void update_value(MODEL_MALL_VALUE model_mall_value);

    void add_attr_value(MALL_VALUE mall_value);
}
