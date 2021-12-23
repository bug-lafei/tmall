package com.soecode.lyf.service.impl;

import com.soecode.lyf.dao.addressDao;
import com.soecode.lyf.entity.address;
import com.soecode.lyf.service.addressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class addressServiceImpl implements addressService {
    @Autowired
    private addressDao addressDao;
    @Override
    public void add(address a) {
        addressDao.add(a);
    }

    @Override
    public List<address> listAll(int uid) {
        return addressDao.listAll(uid);
    }

    @Override
    public void delete(int id) {
            addressDao.delete(id);
    }

    @Override
    public void update(address a) {
            addressDao.update(a);
    }

    @Override
    public address getAid(int aid) {
        return addressDao.getAid(aid);
    }
}
