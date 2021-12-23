package com.soecode.lyf.service.impl;

import com.soecode.lyf.dao.carItemDao;
import com.soecode.lyf.entity.carItem;
import com.soecode.lyf.service.carItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class carItemServiceImpl implements carItemService {
    @Autowired
    private carItemDao carItemDao;
    @Override
    public void add(carItem c) {
        carItemDao.add(c);
    }

    @Override
    public void update(carItem c) {
        carItemDao.update(c);
    }

    @Override
    public List<carItem> listOne(int uid) {
        return carItemDao.listOne(uid);
    }

    @Override
    public void delete(int id) {
        carItemDao.delete(id);
    }

    @Override
    public int listCount(int uid) {

        return  carItemDao.listCount(uid);
    }

    @Override
    public carItem getByPid(int pid) {
        return carItemDao.getByPid(pid);
    }

    @Override
    public carItem getByoId(int id) {
        return carItemDao.getByoId(id);
    }
}
