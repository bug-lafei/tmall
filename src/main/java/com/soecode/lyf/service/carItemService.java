package com.soecode.lyf.service;

import com.soecode.lyf.entity.carItem;

import java.util.List;

public interface carItemService {
    public void add(carItem c);
    public void update(carItem c);
    public List<carItem> listOne(int uid);
    public void delete(int id);
    public int listCount(int uid);
    public carItem getByPid(int pid);
    public carItem getByoId(int id);
}
