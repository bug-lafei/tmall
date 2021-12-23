package com.soecode.lyf.web;

import com.google.gson.Gson;
import com.soecode.lyf.entity.category;
import com.soecode.lyf.entity.page;
import com.soecode.lyf.entity.product;
import com.soecode.lyf.entity.productImage;
import com.soecode.lyf.service.categoryService;
import com.soecode.lyf.service.productImageService;
import com.soecode.lyf.service.productService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller//产品的增删改查和图片的管理
@RequestMapping("admin/product")
public class productController {
    @Autowired
    private productImageService productImageService;
    @Autowired
    private productService productService;
    @Autowired
    private categoryService categoryService;
    @RequestMapping(value = "add",method = RequestMethod.POST)
    public ModelAndView add(@RequestParam("name") String name
                            ,@RequestParam("tittle") String tittle
                            ,@RequestParam("oprice") float oprice
                            ,@RequestParam("nprice") float nprice
                            ,@RequestParam("store") int store
                            ,@RequestParam("cid") int cid
    ){
        category byId = categoryService.getById(cid);
        ModelAndView modelAndView=new ModelAndView();
        product p=new product();
        p.setName(name);
        p.setTittle(tittle);
        p.setOprice(oprice);
        p.setNprice(nprice);
        p.setStore(store);
        p.setCid(cid);
        productService.add(p);
        modelAndView.setViewName("redirect:/admin/product/listAll?cid="+byId.getId());
        return modelAndView;
    }
    @RequestMapping("listAll")
    public ModelAndView listAll( @RequestParam("cid") int cid){
        ModelAndView modelAndView=new ModelAndView();
        List<product> products = productService.getById1(cid);
        modelAndView.addObject("products",products);
        modelAndView.addObject("cid",cid);
        modelAndView.setViewName("admin/listProduct");
        return modelAndView;
    }
    @RequestMapping(value = "updateProduct",method = RequestMethod.POST)
    public ModelAndView updateProduct(@RequestParam("name") String name
            ,@RequestParam("tittle") String tittle
            ,@RequestParam("oprice") float oprice
            ,@RequestParam("nprice") float nprice
            ,@RequestParam("store") int store
            ,@RequestParam("pid") int pid){
        ModelAndView modelAndView=new ModelAndView();
        product p=new product();
        p.setName(name);
        p.setTittle(tittle);
        p.setOprice(oprice);
        p.setNprice(nprice);
        p.setStore(store);
        p.setId(pid);
        productService.update(p);
        product byId = productService.getById(pid);
        modelAndView.setViewName("redirect:/admin/product/listAll?cid="+byId.getCid());
        return modelAndView;
    }
    @RequestMapping("updatePage")
    public ModelAndView updatePage(@RequestParam("pid") int pid){
        ModelAndView modelAndView=new ModelAndView("admin/productPreEdit");
        product byId = productService.getById(pid);
        modelAndView.addObject("product",byId);
        return modelAndView;
    }
    @RequestMapping("delete")
    public void delete(@RequestParam("pid") int pid,HttpServletResponse resp) throws IOException {
        Map map=new HashMap();
        productService.delete(pid);
        map.put("pid",pid);
        Gson gson=new Gson();
        String s = gson.toJson(map);
        resp.getWriter().write(s);

    }
    @RequestMapping("listImage")
    public ModelAndView listImage(@RequestParam("pid") int pid){
        ModelAndView modelAndView=new ModelAndView();
        List<productImage> productImages = productImageService.getById(pid);
        modelAndView.setViewName("admin/listProductImage");
        modelAndView.addObject("pid",pid);
        modelAndView.addObject("productImages",productImages);
        return modelAndView;
    }
    @RequestMapping(value = "addImage",method = RequestMethod.POST)
    public ModelAndView addImage(@RequestParam("pid") int pid,MultipartFile filePath) throws IOException {
        ModelAndView modelAndView=new ModelAndView();
        productImage productImage=new productImage();
        String oldFileName = filePath.getOriginalFilename(); //获取上传文件的原名
        // 2.存储图片的物理路径
        String file_path = "D:/javaImage";
        // 3.上传图片
        if(filePath!=null && oldFileName!=null && oldFileName.length()>0){
            // 4.新的图片名称
            String newFileName = UUID.randomUUID() + oldFileName.substring(oldFileName.lastIndexOf("."));
            // 5.新图片
            File newFile = new File(file_path+"/"+newFileName);
            // 6.将内存中的数据写入磁盘
            filePath.transferTo(newFile);
            productImage.setImage(newFileName);
            productImage.setPid(pid);
            productImage.setType(0);
            productImageService.add(productImage);
        }
        modelAndView.setViewName("redirect:/admin/product/listImage?pid="+productImage.getPid());
        return modelAndView;
    }
    @RequestMapping(value = "addImage2",method = RequestMethod.POST)
    public ModelAndView addImage2(@RequestParam("pid") int pid,MultipartFile filePath) throws IOException {
        ModelAndView modelAndView=new ModelAndView();
        productImage productImage=new productImage();
        String oldFileName = filePath.getOriginalFilename(); //获取上传文件的原名
        // 2.存储图片的物理路径
        String file_path = "D:/javaImage";
        // 3.上传图片
        if(filePath!=null && oldFileName!=null && oldFileName.length()>0){
            // 4.新的图片名称
            String newFileName = UUID.randomUUID() + oldFileName.substring(oldFileName.lastIndexOf("."));
            // 5.新图片
            File newFile = new File(file_path+"/"+newFileName);
            // 6.将内存中的数据写入磁盘
            filePath.transferTo(newFile);
            productImage.setImage(newFileName);
            productImage.setPid(pid);
            productImage.setType(1);
            productImageService.add(productImage);
        }
        modelAndView.setViewName("redirect:/admin/product/listImage?pid="+productImage.getPid());
        return modelAndView;
    }
    @RequestMapping(value = "deleteImage",method = RequestMethod.GET)
    public void delete(@RequestParam("id") int id, HttpServletRequest req, HttpServletResponse resp) throws IOException {
        boolean flag=true;
        Map map=new HashMap();
        productImageService.delete(id);
        map.put("flag",flag);
        Gson gson=new Gson();
        String s = gson.toJson(map);
        resp.getWriter().write(s);
    }
}
