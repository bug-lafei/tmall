package com.soecode.lyf.service;

import com.soecode.lyf.entity.order;
import com.soecode.lyf.entity.orderItem;

import java.util.List;

public interface orderItemService {
    public void add(orderItem a);
    public List<orderItem> listAll(int oid);
    public List<orderItem> listByOid(String oid);
    public void delete(String oid);
    public List<orderItem> listAllO();
    public orderItem selectByPid(orderItem o);
    public void update(orderItem o);
}
