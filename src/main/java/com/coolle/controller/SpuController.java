package com.coolle.controller;

import com.coolle.entity.MALL_PRODUCT;
import com.coolle.service.SpuService;
import com.coolle.tool.MyFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class SpuController {

    @Autowired
    private SpuService spuService;

    @RequestMapping("get_spu_list")
    @ResponseBody
    public List<MALL_PRODUCT> get_spu_list(int pp_id,int flbh2){
        List<MALL_PRODUCT> list_spu = spuService.get_spu_list(pp_id,flbh2);
        return list_spu;
    }

    @RequestMapping("goto_spu_add")
    public String goto_spu_add(ModelMap map, MALL_PRODUCT spu){

        map.put("spu",spu);
        return "spuAdd";
    }

    @RequestMapping("spu_add")
    public ModelAndView spu_add(@RequestParam("files")MultipartFile[] files,MALL_PRODUCT spu){

        //上传图片
        List<String> list_image = null;
        list_image = MyFileUpload.upload_image(files);
        //保存信息
        spuService.save_spu(list_image,spu);

        ModelAndView modelAndView = new ModelAndView("redirect:/goto_spu_add.do");
        modelAndView.addObject("flbh1",spu.getFlbh1());
        modelAndView.addObject("flbh2",spu.getFlbh2());
        modelAndView.addObject("pp_id",spu.getPp_id());

        return modelAndView;
    }
}
