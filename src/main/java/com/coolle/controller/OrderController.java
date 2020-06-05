package com.coolle.controller;

import com.coolle.entity.MALL_ORDER;
import com.coolle.entity.MALL_PRODUCT;
import com.coolle.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class OrderController {

    @Autowired
    private OrderService orderService;

    @RequestMapping("update_order")
    @ResponseBody
    public boolean update_order(HttpServletRequest request){
        MALL_ORDER mall_order = new MALL_ORDER();
        String id = request.getParameter("id");
        String state = request.getParameter("state");
        if(state != null) {
            mall_order.setId(Integer.parseInt(id));
            mall_order.setState(state);
            orderService.update_order(mall_order);
            return true;
        }
        return false;
    }

    @RequestMapping("delete_order")
    @ResponseBody
    public boolean delete_order(HttpServletRequest request){
        String id = request.getParameter("id");
        if(id!=null) {
            orderService.delete_order_by_id(Integer.parseInt(id));
            return true;
        }
        return false;
    }

    @RequestMapping("select_order")
    @ResponseBody
    public List<MALL_ORDER> select_order(){
        List<MALL_ORDER> list_order = orderService.select_order();
        return list_order;
    }
}
