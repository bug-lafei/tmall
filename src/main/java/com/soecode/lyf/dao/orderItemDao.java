package com.soecode.lyf.dao;

import com.soecode.lyf.entity.orderItem;

import java.util.List;

public interface orderItemDao extends baseDao{
    @Override
    <orderItem> void add(orderItem t);

    void delete(String id);
    @Override
    <orderItem> void update(orderItem t);
    <orderItem> List<orderItem> listAll(int oid);
    <orderItem> List<orderItem> listAllO();
    <orderItem> List<orderItem> listByOid(String oid);
    public orderItem selectByPid(orderItem o);
    public void update(orderItem o);
}
