package com.soecode.lyf.service.impl;

import com.soecode.lyf.dao.orderDao;
import com.soecode.lyf.entity.order;
import com.soecode.lyf.service.orderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class orderServiceImpl implements orderService {
    @Autowired
    private orderDao orderDao;
    @Override
    public void add(order a) {
        orderDao.add(a);
    }

    @Override
    public List<order> listAll(int uid) {
        return orderDao.listAll(uid);
    }

    @Override
    public void update(order o) {
        orderDao.update(o);
    }

    @Override
    public order getByOrderCode(String orderCode) {
        return orderDao.getByOrderCode(orderCode);
    }

    @Override
    public void delete(String oid) {
        orderDao.delete(oid);
    }

    @Override
    public List<order> listAllO() {
        return orderDao.listAllO();
    }

    @Override
    public void updateDelivey(order o) {
        orderDao.updateDelivey(o);
    }

    @Override
    public void updateConfirmDate(order o) {
        orderDao.updateConfirmDate(o);
    }
}
