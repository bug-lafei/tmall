package com.soecode.lyf.dao;

import com.soecode.lyf.entity.category;
import com.soecode.lyf.entity.product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface categoryDao extends baseDao{
    //增删改查
    @Override
    <category> void add(category t);
    @Override
    void delete(int id);
    @Override
    <category> void update(category t);
    <category> category getById1(int id);
    @Override
    <category> List<category> listAll();
    List<category> likeSelect(String name);
    List<category> pageSelect(@Param("keyword") String keyword, @Param("stat")int stat, @Param("count")int count);
    int productSum(String keyword);


}
