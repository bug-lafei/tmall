package com.soecode.lyf.service.impl;

import com.soecode.lyf.dao.productDao;
import com.soecode.lyf.entity.page;
import com.soecode.lyf.entity.product;
import com.soecode.lyf.service.productService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class productServiceImpl implements productService {
    @Autowired
    private productDao productDao;
    @Override
    public void add(product t) {
        productDao.add(t);
    }

    @Override
    public List<product> getById1(int id) {
        return productDao.getById1(id);
    }//这个是根据种类的id1查找的list集合

    @Override
    public product getById(int id) {//这个是根据产品id查找的某一个产品
        return productDao.getById2(id);
    }

    @Override
    public void delete(int id) {
        productDao.delete(id);
    }

    @Override
    public void update(product t) {
        productDao.update(t);
    }
    @Override
    public List<product> listAll() {

        return productDao.listAll();
    }

    @Override
    public List<product> likeSelect(String keyword) {
        return productDao.likeSelect(keyword);
    }


    @Override
    public List<page> page(String keyword,int stat, int count) {
        int sum = productDao.productSum(keyword);
        List<product> productPage = productDao.pageSelect(keyword, stat,count);
        page page=new page();
        page.setPageNo(stat);
        if(sum%count==0){
            page.setPageSum((sum/count));
        }
        else {
            page.setPageSum((sum/count)+1);
        }
        page.setListItem(productPage);
        page.setPageCountItem(sum);
        List<page> pageList=new ArrayList<>();
        pageList.add(page);
        return pageList;
    }

    @Override
    public List<page> getIdPage(int cid, int stat, int count) {
        int sum=productDao.cIdProductSum(cid);
        List<product> idPage = productDao.getIdPage(cid, stat, count);
        page page=new page();
        page.setPageNo(stat);
        if(sum%count==0){
            page.setPageSum((sum/count));
        }
        else {
            page.setPageSum((sum/count)+1);
        }
        page.setListItem(idPage);
        page.setPageCountItem(sum);
        List<page> pageList=new ArrayList<>();
        pageList.add(page);
        return pageList;
    }

    @Override
    public product listByPOne(int pid) {
        return productDao.listOne(pid);
    }
}
