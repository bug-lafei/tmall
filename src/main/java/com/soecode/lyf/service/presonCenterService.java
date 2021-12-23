package com.soecode.lyf.service;

import com.soecode.lyf.entity.presoncenter;

import java.util.List;


public interface presonCenterService {
    public presoncenter selectOne(int uid);
    public void add(presoncenter p);
    public void update(presoncenter p);
    public presoncenter selectByName(String uname);
    public List<presoncenter> selectByNameByEmail(presoncenter p);
}
