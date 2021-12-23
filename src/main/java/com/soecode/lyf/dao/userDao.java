package com.soecode.lyf.dao;

import com.soecode.lyf.entity.user;
import org.apache.ibatis.annotations.Param;

public interface userDao extends baseDao{
    @Override
    <user> void add(user t);

    @Override
    void delete(int id);

    @Override
    <user> void getById(int id);

    @Override
    <user> void update(user t);
    int isExist(String name);
    user login(@Param("username") String username, @Param("password")String password);
    public user selectByName(String uname);
}
