package com.soecode.lyf.service.impl;

import com.soecode.lyf.dao.userDao;
import com.soecode.lyf.entity.user;
import com.soecode.lyf.service.userService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class userServiceImpl implements userService {
    @Autowired
    private userDao userdao;
    @Override
    public void add(user t) {
        userdao.add(t);
    }

    @Override
    public user getById(int id) {
        return null;
    }

    @Override
    public void delete(int id) {
        userdao.delete(id);
    }

    @Override
    public user login(String username, String password) {
       return userdao.login(username,password);
    }

    @Override
    public int isExit(String username) {
        return userdao.isExist(username);
    }

    @Override
    public user selectByName(String uname) {
        return userdao.selectByName(uname);
    }

    @Override
    public void update(user u) {
        userdao.update(u);
    }
}
