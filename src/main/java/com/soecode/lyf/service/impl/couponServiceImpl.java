package com.soecode.lyf.service.impl;

import com.soecode.lyf.dao.couponDao;
import com.soecode.lyf.entity.coupon;
import com.soecode.lyf.service.couponService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class couponServiceImpl implements couponService {
    @Autowired
    private couponDao couponDao;
    @Override
    public void add(coupon c) {
        couponDao.add(c);
    }
    @Override
    public List<coupon> listAll(int uid) {
        return couponDao.listCoupon(uid);
    }

    @Override
    public void delete(int id) {
        couponDao.delete(id);
    }
}
