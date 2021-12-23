package com.soecode.lyf.service;

import com.soecode.lyf.entity.user;

public interface userService {
    void add(user t);
    user getById(int id);
    void delete(int id);
    user login(String username,String password);
    int isExit(String username);
    public user selectByName(String uname);
    public void update(user u);
}
