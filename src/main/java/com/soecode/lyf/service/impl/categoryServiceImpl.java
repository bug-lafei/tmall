package com.soecode.lyf.service.impl;

import com.soecode.lyf.dao.categoryDao;
import com.soecode.lyf.dao.productDao;
import com.soecode.lyf.entity.category;
import com.soecode.lyf.entity.page;
import com.soecode.lyf.entity.product;
import com.soecode.lyf.service.categoryService;
import com.soecode.lyf.service.productService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service
public class categoryServiceImpl implements categoryService {
    @Autowired
    private categoryDao categoryDao;
    @Autowired
    private productDao productDao;
    @Autowired
    private productService productService;
    @Override
    public void add(category t) {
        categoryDao.add(t);
    }

    @Override
    public category getById(int id) {
        return categoryDao.getById1(id);
    }

    @Override
    public void delete(int id) {
        categoryDao.delete(id);
    }

    @Override
    public void update(category t) {
        categoryDao.update(t);
    }

    @Override
    public List<category> listAll() {
        return categoryDao.listAll();
    }

    @Override
    public List<category> likeSelect(String keyword) {
        return categoryDao.likeSelect(keyword);
    }

    @Override
    public List<page> page(String keyword, int stat, int count) {
        List list=new ArrayList();

        List<category> categoryList = categoryDao.pageSelect(keyword, 0,count);
        int sum=0;
        for (int i = 0; i < categoryList.size(); i++) {
            List<product> byId1 = productDao.getIdPage(categoryList.get(i).getId(),stat,count);
            sum=categoryList.get(i).getId();
            for (int j = 0; j < byId1.size(); j++) {
                list.add(byId1.get(j));
            }
        }
        page page=new page();
        page.setPageNo(stat);

        if(sum%count==0){
            page.setPageSum((sum/count));
        }
        else {
            page.setPageSum((sum/count));
        }
        page.setListItem(list);
        page.setPageCountItem(list.size());
        List<page> pageList=new ArrayList<>();
        pageList.add(page);
        return pageList;
    }
}
