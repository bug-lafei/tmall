package com.soecode.lyf.service.impl;

import com.soecode.lyf.dao.orderItemDao;
import com.soecode.lyf.entity.orderItem;
import com.soecode.lyf.service.orderItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class orderItemServiceImpl implements orderItemService {
    @Autowired
    private orderItemDao orderItemDao;
    @Override
    public void add(orderItem a) {
        orderItemDao.add(a);
    }

    @Override
    public List<orderItem> listAll(int oid) {
        return orderItemDao.listAll(oid);
    }

    @Override
    public List<orderItem> listByOid(String oid) {
        return orderItemDao.listByOid(oid);
    }

    @Override
    public void delete(String oid) {
        orderItemDao.delete(oid);
    }

    @Override
    public List<orderItem> listAllO() {
        return orderItemDao.listAllO();
    }

    @Override
    public orderItem selectByPid(orderItem o) {
        return orderItemDao.selectByPid(o);
    }

    @Override
    public void update(orderItem o) {
        orderItemDao.update(o);
    }
}
