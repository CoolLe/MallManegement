package com.coolle.controller;

import com.coolle.entity.*;
import com.coolle.service.AttrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;


@Controller
public class AttrController {

    @Autowired
    AttrService attrService;

    @RequestMapping("add_attr_value")
    @ResponseBody
    public boolean add_attr_value(HttpServletRequest request){
        String id = request.getParameter("id");
        String shxzh = request.getParameter("shxzh");
        if(id!=null&&shxzh!=null) {
            MALL_VALUE mall_value = new MALL_VALUE();
            mall_value.setShxm_id(Integer.parseInt(id));
            mall_value.setShxzh(shxzh);
            mall_value.setShxzh_mch("");
            attrService.add_attr_value(mall_value);
            return true;
        }
        return false;
    }

    @RequestMapping("update_attr")
    @ResponseBody
    public boolean update_attr(HttpServletRequest request){
        MODEL_MALL_VALUE model_mall_value = new MODEL_MALL_VALUE();
        String id = request.getParameter("id");
        String old_shxzh = request.getParameter("old_shxzh");
        String shxzh = request.getParameter("shxzh");

        System.out.println(id+old_shxzh+" "+shxzh);
        if(old_shxzh.equals(shxzh))
            return true;
        else if(!old_shxzh.equals("")&&shxzh.equals("")) {
            attrService.delete_value_by_shxzh(old_shxzh);
            return true;
        }
        else {
            model_mall_value.setNew_shxzh(shxzh);
            model_mall_value.setShxm_id(Integer.parseInt(id));
            model_mall_value.setShxzh(old_shxzh);
            attrService.update_value(model_mall_value);
        }
        return false;
    }

    @RequestMapping("delete_attr")
    @ResponseBody
    public boolean delete_attr(HttpServletRequest request){
        String id = request.getParameter("id");
        if(id!=null) {
            attrService.delete_attr_by_id(Integer.parseInt(id));
            return true;
        }
        return false;
    }

    @RequestMapping("get_attr_list_json")
    @ResponseBody
    public List<OBJECT_MALL_ATTR> get_attr_list_json(int flbh2,ModelMap map){
        List<OBJECT_MALL_ATTR> list_attr = new ArrayList<OBJECT_MALL_ATTR>();
        list_attr = attrService.get_attr_list(flbh2);
        return list_attr;
    }

    @RequestMapping("goto_attr_add")
    public String goto_attr_add(int flbh2,ModelMap map){
        map.put("flbh2",flbh2);
        return "attrAdd";
    }

    @RequestMapping("attr_add")
    public ModelAndView attr_add(int flbh2, MODEL_MALL_ATTR list_attr){

        //保存属性
        attrService.save_attr(flbh2,list_attr.getList_attr());
        ModelAndView modelAndView = new ModelAndView("redirect:/index.do");
        modelAndView.addObject("url","goto_attr_add.do?flbh2="+flbh2);
        modelAndView.addObject("title","添加属性");
        return modelAndView;
    }
}
