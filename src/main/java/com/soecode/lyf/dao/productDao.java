package com.soecode.lyf.dao;

import com.soecode.lyf.entity.product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface productDao extends baseDao{
    //增删改查
    @Override
    <product> void add(product t);
    @Override
    void delete(int id);
    @Override
    <product> void update(product t);

    <product> List<product> getById1(int id);
    product getById2(int id);
    @Override
    <product> List<product> listAll();
    List<product> likeSelect(String name);
    product listOne(int pid);
    //分页查询结果
    List<product> pageSelect(@Param("keyword") String keyword, @Param("stat")int stat, @Param("count")int count);
    int productSum(String keyword);
    List<product> getIdPage(@Param("cid")int cid,@Param("stat")int stat,@Param("count") int count );
    int cIdProductSum(int cid);
}
