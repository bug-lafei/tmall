package com.soecode.lyf.dao;

import java.util.List;

public interface baseDao {
    //增删改查
    <T> void add(T t);

    void delete(int id);

    <T> void update(T t);

    <T> void getById(int id);

    <T> List<T> listAll();
}
