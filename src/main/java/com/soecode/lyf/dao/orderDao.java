package com.soecode.lyf.dao;

import com.soecode.lyf.entity.order;

import java.util.List;

public interface orderDao extends baseDao{
    @Override
    <order> void add(order t);

    void delete(String id);
    @Override
    <order> void update(order t);
    <order> List<order> listAll(int uid);
    order getByOrderCode(String orderCode);
    <order> List<order> listAllO();
    <order> void updateDelivey(order t);
    <order> void updateConfirmDate(order t);

}
