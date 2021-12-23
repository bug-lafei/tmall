package com.soecode.lyf.service;

import com.soecode.lyf.entity.address;
import com.soecode.lyf.entity.order;

import java.util.List;

public interface orderService {
    public void add(order a);
    public List<order> listAll(int uid);
    public void update(order o);
    public order getByOrderCode(String orderCode);
    public void delete(String oid);
    public List<order> listAllO();
    public void updateDelivey(order o);
    public void updateConfirmDate(order o);
}
