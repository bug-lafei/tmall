package com.soecode.lyf.dao;

import java.util.List;

public interface productImageDao extends baseDao{
    //增删改查
    @Override
    <productImage> void add(productImage t);
    @Override
    void delete(int id);
    @Override
    <productImage> void update(productImage t);
    <productImage> List<productImage> getById1(int id);
    @Override
    <productImage> List<productImage> listAll();
}
