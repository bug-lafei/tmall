package com.soecode.lyf.web;

import com.google.gson.Gson;
import com.soecode.lyf.entity.category;
import com.soecode.lyf.service.categoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("admin/category")
public class categoryController {
    @Autowired
    private categoryService categoryService;
    @RequestMapping("listAll")
    public ModelAndView listAll(){
        ModelAndView modelAndView=new ModelAndView();
        List<category> categories = categoryService.listAll();
        modelAndView.addObject("listAllCategory",categories);
        modelAndView.setViewName("admin/listCategory");
        return modelAndView;
    }
    @RequestMapping(value = "add",method = RequestMethod.POST)
    public ModelAndView add(@RequestParam("name") String name) throws UnsupportedEncodingException {
        category c=new category();
        c.setName(name);
        ModelAndView modelAndView=new ModelAndView();
        categoryService.add(c);
        modelAndView.setViewName("redirect:/admin/category/listAll");
        return modelAndView;
    }
    @RequestMapping(value = "updatePage")
    public ModelAndView updatePage(@RequestParam("cid") int cid) throws IOException {
        ModelAndView modelAndView=new ModelAndView("/admin/categoryPreEdit");
        category byId = categoryService.getById(cid);
        modelAndView.addObject("category",byId);
        return modelAndView;
    }
    @RequestMapping(value = "updateCategory")
    public ModelAndView updateCategory(@RequestParam("cid") int cid,@RequestParam("name") String name) throws IOException {
        ModelAndView modelAndView=new ModelAndView("redirect:/admin/category/listAll");
        category c=new category();
        c.setName(name);
        c.setId(cid);
        categoryService.update(c);
        return modelAndView;
    }

    @RequestMapping(value = "delete",method = RequestMethod.GET)
    public void delete(@RequestParam("id") int id,HttpServletRequest req, HttpServletResponse resp) throws IOException {
        boolean flag=true;
        ModelAndView modelAndView=new ModelAndView();
        Map map=new HashMap();
        categoryService.delete(id);
        map.put("flag",flag);
        Gson gson=new Gson();
        String s = gson.toJson(map);
        resp.getWriter().write(s);
    }
}
