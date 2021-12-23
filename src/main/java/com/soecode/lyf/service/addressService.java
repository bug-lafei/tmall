package com.soecode.lyf.service;

import com.soecode.lyf.entity.address;

import java.util.List;

public interface addressService {
    public void add(address a);
    public List<address> listAll(int uid);
    public void delete(int id);
    public void update(address a);
    public address getAid(int aid);
}
