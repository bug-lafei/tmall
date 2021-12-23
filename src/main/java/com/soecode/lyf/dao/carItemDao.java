package com.soecode.lyf.dao;

import com.soecode.lyf.entity.carItem;

import java.util.List;

public interface carItemDao extends baseDao{
    @Override
    <carItem> void add(carItem t);
    @Override
    void delete(int id);
    @Override
    <carItem> void update(carItem t);
    @Override
    <carItem> List<carItem> listAll();
    <carItem> List<carItem> listOne(int uid);
    int listCount(int uid);
    carItem getByPid(int pid);
    carItem getByoId(int id);

}
