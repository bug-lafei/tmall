package com.soecode.lyf.dao;

import com.soecode.lyf.entity.presoncenter;

import java.util.List;

public interface presonCenterDao {
    public void add(presoncenter p);
    public void update(presoncenter p);
    public presoncenter selectOne(int uid);
    public presoncenter selectByName(String uname);
    public List<presoncenter> selectByNameByEmail(presoncenter p);
}
