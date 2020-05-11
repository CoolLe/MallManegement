package com.coolle.service;

import com.coolle.entity.MALL_PRODUCT;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;


public interface SpuService {
    public void save_spu(List<String> list_image, MALL_PRODUCT spu);
}
