package com.coolle.entity;

import lombok.Data;

import java.util.Date;

@Data
public class MALL_ORDER {
    private int id;
    private int user_id;
    private int shp_id;
    private String order_id;
    private int count;
    private Date create_time;
    private String state;
}
