package com.soecode.lyf.service;
import com.soecode.lyf.entity.productImage;
import java.util.List;
public interface productImageService {
    void add(productImage t);
    List<productImage> getById(int id);
    void delete(int id);
    void update(productImage t);
    List<productImage> listAll();
}
