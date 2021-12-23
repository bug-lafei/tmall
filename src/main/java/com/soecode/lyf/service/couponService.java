package com.soecode.lyf.service;

import com.soecode.lyf.entity.coupon;

import java.util.List;

public interface couponService {
    void add(coupon c);
    List<coupon> listAll(int uid);
    void delete(int id);
}
