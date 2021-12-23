package com.soecode.lyf.dao;

import java.util.List;
import com.soecode.lyf.entity.address;
public interface addressDao extends baseDao{
    @Override
    <address> void add(address t);
    @Override
    void delete(int id);
    @Override
    <address> void update(address t);
    <address> List<address> listAll(int uid);
    <address> address getAid(int aid);
}
