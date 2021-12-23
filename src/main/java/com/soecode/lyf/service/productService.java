package com.soecode.lyf.service;

import com.soecode.lyf.entity.category;
import com.soecode.lyf.entity.page;
import com.soecode.lyf.entity.product;

import java.util.List;

public interface productService {
    void add(product t);
    List<product> getById1(int id);
    product getById(int id);
    void delete(int id);
    void update(product t);
    List<product> listAll();
    List<product> likeSelect(String keyword);
    List<page> page(String keyword,int stat,int count);
    List<page> getIdPage(int cid,int stat,int count);
    product listByPOne(int pid);
}
