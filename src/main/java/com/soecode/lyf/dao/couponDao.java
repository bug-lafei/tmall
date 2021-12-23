package com.soecode.lyf.dao;

import java.util.List;

public interface couponDao extends baseDao{
    //增删改查
    @Override
    <coupon> void add(coupon t);
    @Override
    void delete(int id);
    <coupon> List<coupon> listCoupon(int uid);
}
