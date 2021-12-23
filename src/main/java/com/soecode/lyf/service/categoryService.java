package com.soecode.lyf.service;

import com.soecode.lyf.entity.category;
import com.soecode.lyf.entity.page;
import com.soecode.lyf.entity.user;

import java.util.List;

public interface categoryService {
    void add(category t);
    category getById(int id);
    void delete(int id);
    void update(category t);
    List<category> listAll();
    List<category> likeSelect(String keyword);
    List<page> page(String keyword, int stat, int count);
}
