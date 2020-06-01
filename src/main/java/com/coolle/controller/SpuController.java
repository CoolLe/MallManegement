package com.coolle.controller;

import com.coolle.entity.MALL_PRODUCT;
import com.coolle.service.SpuService;
import com.coolle.tool.MyFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class SpuController {

    @Autowired
    private SpuService spuService;

    @RequestMapping("update")
    @ResponseBody
    public boolean update_spu(HttpServletRequest request){
        MALL_PRODUCT mall_product = new MALL_PRODUCT();
        String id = request.getParameter("id");
        String shp_mch = request.getParameter("shp_mch");
        String shp_msh = request.getParameter("shp_msh");
        if(shp_mch != null || shp_msh != null) {
            mall_product.setShp_mch(shp_mch);
            mall_product.setShp_msh(shp_msh);
            mall_product.setId(Integer.parseInt(id));
            spuService.update_spu(mall_product);
            return true;
        }
        return false;
    }

    @RequestMapping("delete_spu")
    @ResponseBody
    public boolean delete_spu(HttpServletRequest request){
        String id = request.getParameter("id");
        if(id!=null) {
            spuService.delete_spu_by_id(Integer.parseInt(id));
            return true;
        }
        return false;
    }

    @RequestMapping("select_spu")
    @ResponseBody
    public List<MALL_PRODUCT> select_spu(){
        List<MALL_PRODUCT> list_spu = spuService.select_spu();
        return list_spu;
    }

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

        ModelAndView modelAndView = new ModelAndView("redirect:/index.do");
        modelAndView.addObject("url","goto_spu_add.do?flbh1="+spu.getFlbh1()+"&flbh2="+spu.getFlbh2()+"&pp_id="+spu.getPp_id());
        modelAndView.addObject("title","SPU添加页面");

        return modelAndView;
    }
}
