package com.coolle.repository;

import com.coolle.entity.MALL_VALUE;
import com.coolle.entity.MODEL_MALL_VALUE;
import com.coolle.entity.OBJECT_MALL_ATTR;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AttrRepository {

    void insert_attr(@Param("flbh2") int flbh2, @Param("attr") OBJECT_MALL_ATTR attr);

    void insert_values(@Param("attr_id") int attr_id, @Param("list_value")List<MALL_VALUE> list_value);

    List<OBJECT_MALL_ATTR> select_attr_list(int flbh2);

    void delete_attr(int id);

    void delete_values(int id);

    void delete_values_by_shxzh(String old_shxzh);

    void update_value(MODEL_MALL_VALUE model_mall_value);

    void addValue(MALL_VALUE mall_value);
}
