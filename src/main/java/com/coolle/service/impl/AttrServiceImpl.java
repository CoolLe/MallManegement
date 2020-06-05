package com.coolle.service.impl;

import com.coolle.entity.MALL_VALUE;
import com.coolle.entity.MODEL_MALL_VALUE;
import com.coolle.entity.OBJECT_MALL_ATTR;
import com.coolle.repository.AttrRepository;
import com.coolle.service.AttrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AttrServiceImpl implements AttrService {

    @Autowired
    AttrRepository attrRepository;

    @Override
    public void save_attr(int flbh2, List<OBJECT_MALL_ATTR> list_attr) {
        for (int i = 0; i < list_attr.size(); i++) {
            //插入属性返回主键
            OBJECT_MALL_ATTR attr = list_attr.get(i);
            attrRepository.insert_attr(flbh2,attr);
            //获得返回主键批量插入属性值
            attrRepository.insert_values(attr.getId(),attr.getList_value());
        }
    }

    @Override
    public List<OBJECT_MALL_ATTR> get_attr_list(int flbh2) {
        List<OBJECT_MALL_ATTR> list_attr = attrRepository.select_attr_list(flbh2);
        return list_attr;
    }

    @Override
    public void delete_attr_by_id(int id) {
        attrRepository.delete_attr(id);
        attrRepository.delete_values(id);
    }

    @Override
    public void delete_value_by_shxzh(String old_shxzh) {
        attrRepository.delete_values_by_shxzh(old_shxzh);
    }

    @Override
    public void update_value(MODEL_MALL_VALUE model_mall_value) {
        attrRepository.update_value(model_mall_value);
    }

    @Override
    public void add_attr_value(MALL_VALUE mall_value) {
        attrRepository.addValue(mall_value);
    }


}
