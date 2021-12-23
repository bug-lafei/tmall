package com.soecode.lyf.service.impl;

import com.soecode.lyf.dao.productImageDao;
import com.soecode.lyf.entity.productImage;
import com.soecode.lyf.service.productImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class productImageServiceImpl implements productImageService {
    @Autowired
    private productImageDao productImageDao;
    @Override
    public void add(productImage t) {
        productImageDao.add(t);
    }

    @Override
    public List<productImage> getById(int id) {
        return productImageDao.getById1(id);
    }

    @Override
    public void delete(int id) {
        productImageDao.delete(id);
    }

    @Override
    public void update(productImage t) {
        productImageDao.update(t);
    }

    @Override
    public List<productImage> listAll() {
        return productImageDao.listAll();
    }
}
