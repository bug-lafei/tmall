package com.soecode.lyf.web;

import com.soecode.lyf.entity.order;
import com.soecode.lyf.entity.orderItem;
import com.soecode.lyf.entity.product;
import com.soecode.lyf.entity.productImage;
import com.soecode.lyf.service.orderItemService;
import com.soecode.lyf.service.orderService;
import com.soecode.lyf.service.productImageService;
import com.soecode.lyf.service.productService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("admin/order")
public class orderController {
    @Autowired
    private orderService orderService;
    @Autowired
    private orderItemService orderItemService;
    @Autowired
    private productImageService productImageService;
    @Autowired
    private productService productService;
    @RequestMapping("/listAll")
    public ModelAndView listAll(){
        List<order> orders = orderService.listAllO();
        List<orderItem> list = orderItemService.listAllO();
        List<productImage> productImages = productImageService.listAll();

        for (int i = 0; i < list.size(); i++) {
            product byId = productService.getById(list.get(i).getPid());

        }
        List<product> productList = productService.listAll();
        ModelAndView modelAndView=new ModelAndView("admin/listOrder");
        modelAndView.addObject("productList",productList);
        modelAndView.addObject("orders",orders);
        modelAndView.addObject("list",list);
        modelAndView.addObject("productImages",productImages);
        return modelAndView;
    }
    @RequestMapping("/delivery")
    public ModelAndView delivery(@RequestParam("orderCode")String orderCode){
        ModelAndView modelAndView=new ModelAndView("redirect:/admin/order/listAll");
        order byOrderCode = orderService.getByOrderCode(orderCode);
        byOrderCode.setDeliveryDate(new Date());
        byOrderCode.setStatus("已发货");
        orderService.updateDelivey(byOrderCode);
        return modelAndView;
    }
}
