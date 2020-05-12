package com.coolle.controller;

import com.coolle.entity.MALL_PRODUCT;
import com.coolle.entity.MALL_SKU;
import com.coolle.entity.MODEL_MALL_SKU_ATTR_VALUE;
import com.coolle.entity.OBJECT_MALL_ATTR;
import com.coolle.service.AttrService;
import com.coolle.service.SkuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class SkuController {

    @Autowired
    private AttrService attrService;

    @Autowired
    private SkuService skuService;

    @RequestMapping("sava_sku")
    public ModelAndView sava_sku(MALL_SKU sku, MODEL_MALL_SKU_ATTR_VALUE list_attr, MALL_PRODUCT spu, ModelMap map){

        skuService.save_sku(sku,spu,list_attr.getList_attr());

        ModelAndView modelAndView = new ModelAndView("redirect:/goto_sku_add.do");
        modelAndView.addObject("flbh1",spu.getFlbh1());
        modelAndView.addObject("flbh2",spu.getFlbh2());
        return modelAndView;
    }

    @RequestMapping("goto_sku_add")
    public String goto_sku_add(int flbh1,int flbh2,ModelMap map){

        //加载列表
        List<OBJECT_MALL_ATTR> list_attr = attrService.get_attr_list(flbh2);

        //传递分类id
        map.put("flbh1",flbh1);
        map.put("flbh2",flbh2);
        map.put("list_attr",list_attr);

        return "skuAdd";
    }
}
