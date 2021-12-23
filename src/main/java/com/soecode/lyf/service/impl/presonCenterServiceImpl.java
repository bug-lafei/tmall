package com.soecode.lyf.service.impl;

import com.soecode.lyf.dao.presonCenterDao;
import com.soecode.lyf.entity.presoncenter;
import com.soecode.lyf.service.presonCenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class presonCenterServiceImpl implements presonCenterService {
    @Autowired
    private presonCenterDao presonCenterDao;
    @Override
    public presoncenter selectOne(int uid) {
        return presonCenterDao.selectOne(uid);
    }

    @Override
    public void add(presoncenter p) {
        presonCenterDao.add(p);
    }

    @Override
    public void update(presoncenter p) {
        presonCenterDao.update(p);
    }

    @Override
    public presoncenter selectByName(String uname) {
        return presonCenterDao.selectByName(uname);
    }

    @Override
    public List<presoncenter> selectByNameByEmail(presoncenter p) {
        return presonCenterDao.selectByNameByEmail(p);
    }
}
