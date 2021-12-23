package com.soecode.lyf.web;

import com.google.gson.Gson;
import com.soecode.lyf.entity.*;
import com.soecode.lyf.service.*;
import com.soecode.lyf.util.anonymity;
import com.soecode.lyf.util.email1;
import org.apache.commons.mail.EmailException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;



@Controller
public class userController {
    String s="";
    String forgets="";
    @Autowired
    private userService userService;
    @Autowired
    private categoryService categoryService;
    @Autowired
    private productService productService;
    @Autowired
    private productImageService productImageService;
    @Autowired
    private couponService couponService;
    @Autowired
    private addressService addressService;
    @Autowired
    private orderService orderService;
    @Autowired
    private orderItemService orderItemService;
    @Autowired
    private carItemService carItemService;
    @Autowired
    private presonCenterService presonCenterService;
    @Autowired
    private evaluationService evaluationService;
    @RequestMapping("/registerPage")
    public ModelAndView regist(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("registerPage");
        return modelAndView;
    }
    //。。。。。。。。。。。。。。。。。。。。。。。。。。用户登录注册功能。。。。。。。。。。。。。。。。。。。。。。。。。。。
    @RequestMapping(value = "/registerPage",method = RequestMethod.POST)
    public ModelAndView registSuccess(@RequestParam("username") String username,@RequestParam("password") String password){
        ModelAndView modelAndView=new ModelAndView();
        user user1=new user();
        user1.setUsername(username);
        user1.setPassword(password);
        userService.add(user1);
        modelAndView.setViewName("login");
        return modelAndView;
    }
    @RequestMapping(value = "/ajaxCheck")
    public void ajaxCheck(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        boolean flag=true;
        ModelAndView modelAndView=new ModelAndView();
        String username = req.getParameter("username");
        int exit = userService.isExit(username);
        Map<String,Object> map=new HashMap<>();
        if(exit!=0){
            flag=true;
        }
        else {
            flag=false;
        }
        map.put("flag",flag);
        Gson gson=new Gson();
        String s = gson.toJson(map);
        resp.getWriter().write(s);
    }
    @RequestMapping("/index")
    public ModelAndView index(){
        ModelAndView modelAndView=new ModelAndView();
        List<product> products = productService.listAll();
        List<category> categories = categoryService.listAll();
        List<productImage> listProductImages = productImageService.listAll();
        modelAndView.addObject("products",products);
        modelAndView.addObject("categories",categories);
        modelAndView.addObject("listProductImages",listProductImages);
        modelAndView.setViewName("index");
        return modelAndView;
    }
    @RequestMapping("/login")
    public ModelAndView login(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("login");
        return modelAndView;
    }
    @RequestMapping(value = "/ajaxLogin")
    public void loginSuccess(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        boolean flag=true;
        String contextPath = req.getContextPath();
        System.out.println(contextPath);
        String username = req.getParameter("username");
        System.out.println(username);
        String password = req.getParameter("password");
        user login = userService.login(username, password);
        Map<String, Boolean> map=new HashMap<>();
        if(login!=null){
            flag=true;
            req.getSession().setAttribute("login",login);
        }else {
            flag=false;
        }
        map.put("flag",flag);
        Gson gson=new Gson();
        String s = gson.toJson(map);
        resp.getWriter().write(s);
    }
    @RequestMapping("/checkOut")
    public ModelAndView checkOut(HttpServletRequest req) throws IOException {
        req.getSession().invalidate();
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("redirect:/index");
        return modelAndView;
    }
    //。。。。。。。。。。。。。。。。。。。。。。。前台展示功能。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。
    @RequestMapping("detail")
    public ModelAndView detail(@RequestParam("pid") int pid){
        ModelAndView modelAndView=new ModelAndView();
        List<productImage> oneListImage = productImageService.getById(pid);
        product oneProduct = productService.getById(pid);
        modelAndView.addObject("oneProduct",oneProduct);
        modelAndView.addObject("oneListImage",oneListImage);
        List<evaluation> evaluations = evaluationService.listPid(pid);

        modelAndView.addObject("evaluations",evaluations);
        modelAndView.setViewName("productPage");
        return modelAndView;
    }
    @RequestMapping("likeSelect")
    public ModelAndView likeSelect(@RequestParam("keyword") String keyword){
        List<product> list =new ArrayList<>();
        ModelAndView modelAndView=new ModelAndView();
        List<category> categories = categoryService.likeSelect(keyword);
        List<productImage> productImages = productImageService.listAll();
        if(categories.size()<=0){
            List<product> products = productService.likeSelect(keyword);
            modelAndView.addObject("list",products);
        }
        else{
            for (int i = 0; i < categories.size(); i++) {
                List<product> byId1 = productService.getById1(categories.get(i).getId());
                for (int j = 0; j < byId1.size(); j++) {
                    list.add(byId1.get(j));
                }
            }
            modelAndView.addObject("list",list);
        }

        modelAndView.addObject("productImage",productImages);

        modelAndView.setViewName("searchByCategoryResult");

        return modelAndView;
    }
    @RequestMapping("pageSelect")
    public ModelAndView pageSelect(@RequestParam("pageNo") int pageNo,@RequestParam("keyword") String keyword){
        ModelAndView modelAndView=new ModelAndView("searchByCategoryResult2");
        List<page> categories = categoryService.page(keyword, pageNo-1, 4);
        System.out.println(categories.size());
        if(categories.get(0).getListItem().size()<=0){
            List<page> page = productService.page(keyword, pageNo-1,4);
            modelAndView.addObject("lists",page);
        }
        else {
            modelAndView.addObject("lists",categories);
        }
        List<productImage> productImages = productImageService.listAll();
        modelAndView.addObject("productImage",productImages);
        modelAndView.addObject("keyword",keyword);
        return modelAndView;
    }
    //。。。。。。。。。。。。。。。。。。。。。。。优惠卷增加和查看所有。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。
    @RequestMapping("selectCoupon")
    public ModelAndView selectCoupon(HttpServletRequest req){
        ModelAndView modelAndView=new ModelAndView("couponPage");
        user login = (user)req.getSession().getAttribute("login");
        if(login==null){
            modelAndView.setViewName("login");
        }
        List<coupon> coupons = couponService.listAll(login.getId());
        modelAndView.addObject("coupons",coupons);
        return modelAndView;
    }
    //抽取优惠卷
    @RequestMapping("radomCoupon")
    public ModelAndView radomCoupon(HttpServletRequest req){
        ModelAndView modelAndView=new ModelAndView();
        Random random=new Random();
        int i = random.nextInt(100);
        user user1 = (user)req.getSession().getAttribute("login");
        coupon c=new coupon();
        c.setCash(i);
        c.setUid(user1.getId());
        couponService.add(c);
        modelAndView.setViewName("redirect:/selectCoupon");
        return modelAndView;
    }
    //。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。收货地址页面。。。。。。。。。。。。。。。。。。。。。。。。。。。。
    @RequestMapping(value = "/addAddress",method = RequestMethod.POST)
    public ModelAndView addAddress(HttpServletRequest req,@RequestParam("reciver")String reciver,@RequestParam("tel")String tel,
                                   @RequestParam("detailAddress")String detailAddress,@RequestParam("address")String address){
        ModelAndView modelAndView=new ModelAndView("redirect:/address");
        user user1 = (user)req.getSession().getAttribute("login");
        address a=new address();
        a.setAddress(address);
        a.setDetailAddress(detailAddress);;
        a.setUid(user1.getId());
        a.setReceiver(reciver);
        a.setTel(tel);
        addressService.add(a);
        return modelAndView;
    }
    @RequestMapping(value = "/deleteAddress",method = RequestMethod.POST)
    @ResponseBody
    public String deleteAddress(HttpServletRequest req,@RequestParam("aid")int aid){
        user login = (user)req.getSession().getAttribute("login");
        if(login==null){
            return "no user";
        }else {
            addressService.delete(aid);
            return "success";
        }

    }
    @RequestMapping("address")
    public ModelAndView address(HttpServletRequest req){
        ModelAndView modelAndView=new ModelAndView("address");
        user login = (user)req.getSession().getAttribute("login");
        if(login==null){
            modelAndView.setViewName("login");
        }else {
            List<address> addresses = addressService.listAll(login.getId());
            modelAndView.addObject("addresses",addresses);
        }
        return modelAndView;
    }
    //。。。。。。。。。。。。。。。。。。。。。。。为了测试优惠卷和地址，先写订单生成。。。。。。。。。。。。。。。。。。。。。。。。。。。。。
    @RequestMapping("order")//生成订单需要商品的图片信息，图片名称，图片标题，数量，
    public ModelAndView order(HttpServletRequest req,@RequestParam("count")int count,
    @RequestParam("tittle") String tittle,@RequestParam("nprice")float nprice,

    @RequestParam("pid") int pid){
        product byId = productService.getById(pid);

        ModelAndView modelAndView=new ModelAndView("confirmOrder");
        user login = (user)req.getSession().getAttribute("login");
        if(login==null){
            modelAndView.setViewName("login");
        }
        else{
            List<productImage> byIdImage = productImageService.getById(pid);
            List<coupon> coupons = couponService.listAll(login.getId());
            List<address> addresses = addressService.listAll(login.getId());
            modelAndView.addObject("coupons",coupons);
            modelAndView.addObject("addresses",addresses);
            modelAndView.addObject("byIdImage",byIdImage);
            product p=new product();
            p.setNprice(nprice);
            p.setTittle(tittle);
            p.setStore(count);
            p.setId(pid);
            List<product> list=new ArrayList<>();
            list.add(p);
            float total=nprice*count;
            modelAndView.addObject("totalPrice",total);
            modelAndView.addObject("list",list);
        }
        return modelAndView;
    }
    //........................生成订单和付款。。。。。。。。。。。。。。。。。。。。。。。。。。。。
    @RequestMapping(value = "payPage",method = RequestMethod.POST)
    public ModelAndView payPage(@RequestParam("total") String total,@RequestParam("number")int number,
                                @RequestParam("aid")int aid,HttpServletRequest req,@RequestParam("pid")int pid){
        String status="未付款";
        ModelAndView modelAndView=new ModelAndView("payPage");
        user login = (user)req.getSession().getAttribute("login");
        if(login==null){
            modelAndView.setViewName("login");
        }else {
            System.out.println(total);
            order o=new order();
            orderItem oI=new orderItem();
            Date d=new Date();
            o.setAddressId(aid);
            o.setStatus(status);
            o.setUid(login.getId());
            o.setTotalPrice(Float.valueOf(total));
            o.setCreateDate(new Date());
            o.setOrderCode(String.valueOf(d.hashCode()));
            oI.setPid(pid);
            oI.setUid(login.getId());
            oI.setOid(o.getOrderCode());
            oI.setNumber(number);
            oI.setIsEvaluation("否");
            orderService.add(o);
            orderItemService.add(oI);
            modelAndView.addObject("total",total);
            modelAndView.addObject("byOrderCode",o);
            modelAndView.addObject("OrderCode",o.getOrderCode());
        }
        return modelAndView;
    }
    @RequestMapping("payPage1")
    public ModelAndView payPage1(@RequestParam("orderCode")String orderCode){
        ModelAndView modelAndView=new ModelAndView("payPage");
        order byOrderCode = orderService.getByOrderCode(orderCode);
        modelAndView.addObject("byOrderCode",byOrderCode);
        modelAndView.addObject("total",byOrderCode.getTotalPrice());
        return modelAndView;
    }
    //....................................订单付款完成。。。。。。。。。。。。。。。。。。。。。。。。。。。
    @RequestMapping("payComplete")
    public ModelAndView payComplete(@RequestParam("OrderCode")String OrderCode){
        ModelAndView modelAndView=new ModelAndView("redirect:/myOrder");
        String status="已付款";
        order o=new order();
        order byOrderCode = orderService.getByOrderCode(OrderCode);
        if(byOrderCode==null){
            modelAndView.setViewName("index");
        }
        else {
            o.setOrderCode(OrderCode);
            o.setStatus(status);
            o.setPayDate(new Date());
            orderService.update(o);
        }
        return modelAndView;
    }
    //....................................显示用户的订单。。。。。。。。。。。。。。。。。。。。。。。。。。
    @RequestMapping("myOrder")
    public ModelAndView myorder(HttpServletRequest request){
        ModelAndView modelAndView=new ModelAndView("myOrder");
        user login = (user) request.getSession().getAttribute("login");
        if(login==null){
            modelAndView.setViewName("login");
        }
        else{
            List<order> myOrder = orderService.listAll(login.getId());
            modelAndView.addObject("myOrder",myOrder);
            List<productImage> productImages = productImageService.listAll();
            modelAndView.addObject("productImages",productImages);
            List<orderItem> orderItems = orderItemService.listAll(login.getId());
            List<product> product = productService.listAll();
            modelAndView.addObject("product",product);
            modelAndView.addObject("orderItems",orderItems);
        }
        return modelAndView;
    }
    //.................................购物车.............................................................
    @RequestMapping("/myCart")
    public ModelAndView JumpCart(HttpServletRequest req){
        ModelAndView modelAndView=new ModelAndView("carItem");
        user login = (user) req.getSession().getAttribute("login");
        if(login==null){
            modelAndView.setViewName("login");
        }
        else {
            List<product> products=new ArrayList<>();
            List<carItem> carItems = carItemService.listOne(login.getId());
            List<productImage> productImages = productImageService.listAll();
            for (int i = 0; i < carItems.size(); i++) {
                product product = productService.listByPOne(carItems.get(i).getPid());
                products.add(product);
            }
            int i = carItemService.listCount(login.getId());
            modelAndView.addObject("listProduct",products);
            modelAndView.addObject("cartItemList",carItems);
            modelAndView.addObject("carItemNumber",i);
            modelAndView.addObject("productImages",productImages);
        }
        return modelAndView;
    }
    @RequestMapping(value = "/addCart",method = RequestMethod.POST)
    @ResponseBody
    public String addCart(@RequestParam("count")int count1,@RequestParam("pid")int pid,HttpServletRequest req){
        ModelAndView modelAndView=new ModelAndView();
        user login = (user) req.getSession().getAttribute("login");
        if(login==null){
            return "no user";
        }
        else {
            carItem byPid = carItemService.getByPid(pid);
            if(byPid==null){
                List<carItem> carItems = carItemService.listOne(login.getId());
                carItem c=new carItem();
                c.setCount(count1);
                c.setPid(pid);
                c.setUid(login.getId());
                carItemService.add(c);
            }
            else {
                byPid.setCount(byPid.getCount()+count1);
                carItemService.update(byPid);
            }
        }
        return "success";
    }
    @RequestMapping(value = "/deleteCart",method = RequestMethod.POST)
    @ResponseBody
    public String deleteCart(@RequestParam("pid")int pid,HttpServletRequest req){
        user login = (user) req.getSession().getAttribute("login");
        if(login==null){
            return "no user";
        }
        else {
            carItem byPid = carItemService.getByPid(pid);
            if(byPid==null){
                return "no pid";
            }else {
                carItemService.delete(byPid.getId());
                return "success";
            }
        }
    }
    @RequestMapping(value = "/updateCart",method = RequestMethod.POST)
    @ResponseBody
    public String updateCart(@RequestParam("count")int count1,@RequestParam("pid")int pid,HttpServletRequest req){
        user login = (user) req.getSession().getAttribute("login");
        if(login==null){
            return "no user";
        }
        else {
            carItem byPid = carItemService.getByPid(pid);
            if(byPid==null){
                return "no pid";
            }else {
                byPid.setCount(count1);
                carItemService.update(byPid);
                return "success";
            }
        }
    }
    //......................................购物车的结算订单........................................
    //因为可以选自定义个商品去结算，所有有亿点点不一样^-^
    @RequestMapping("cartOrder")//生成订单需要商品的图片信息，图片名称，图片标题，数量，
    public ModelAndView cartOrder(HttpServletRequest req,@RequestParam("oiid")List<Integer> oiid){
        ModelAndView modelAndView=new ModelAndView("confirmOrderCart");
        user login = (user)req.getSession().getAttribute("login");
        if(login==null){
            modelAndView.setViewName("login");
        }
        else {
            int totalPrice=0;
            List<carItem> list=new ArrayList<>();
            List<product> productList=new ArrayList<>();
            for (int i = 0; i < oiid.size(); i++) {
                carItem byoId = carItemService.getByoId(oiid.get(i));
                product byId = productService.getById(byoId.getPid());
                list.add(byoId);
                productList.add(byId);
                totalPrice+=byoId.getCount()*byId.getNprice();
            }
            List<productImage> byIdImage = productImageService.listAll();
            List<coupon> coupons = couponService.listAll(login.getId());
            List<address> addresses = addressService.listAll(login.getId());
            modelAndView.addObject("coupons",coupons);
            modelAndView.addObject("addresses",addresses);
            modelAndView.addObject("byIdImage",byIdImage);
            modelAndView.addObject("list",list);
            modelAndView.addObject("producrList",productList);
            modelAndView.addObject("totalPrice",totalPrice);
            req.getSession().setAttribute("oiid",oiid);
        }
        return modelAndView;
    }
    @RequestMapping("pageSubmit")
    public ModelAndView payPageCart(HttpServletRequest req,
                                    @RequestParam("aid") int aid,@RequestParam(value = "cuId",required = false,defaultValue = "0")String cuid){
        ModelAndView modelAndView=new ModelAndView("payPage");
        user login = (user)req.getSession().getAttribute("login");
        if(login==null){
            modelAndView.setViewName("login");
        }else{
            List<Integer> oiid = (List<Integer>) req.getSession().getAttribute("oiid");
            float totalPrice=0;
            for (int i = 0; i < oiid.size(); i++) {
                carItem byoId = carItemService.getByoId(oiid.get(i));
                product byId = productService.getById(byoId.getPid());
                totalPrice+=byoId.getCount()*byId.getNprice();
            }
            String status="未付款";
            order o=new order();
            Date d=new Date();
            o.setAddressId(aid);
            o.setStatus(status);
            o.setUid(login.getId());
            o.setTotalPrice(Float.valueOf(totalPrice));
            o.setCreateDate(new Date());
            o.setOrderCode(String.valueOf(d.hashCode()));
            orderService.add(o);
            for (int i = 0; i < oiid.size(); i++) {
                carItem byoId = carItemService.getByoId(oiid.get(i));
                orderItem oI=new orderItem();
                oI.setNumber(byoId.getCount());
                oI.setUid(login.getId());
                oI.setPid(byoId.getPid());
                oI.setOid(o.getOrderCode());
                oI.setIsEvaluation("否");
                orderItemService.add(oI);
                carItemService.delete(byoId.getId());
            }
            if(Integer.valueOf(cuid)!=0){
                couponService.delete(Integer.valueOf(cuid));
            }
            modelAndView.addObject("total",totalPrice);
            modelAndView.addObject("byOrderCode",o);
        }
        return modelAndView;
    }

    @RequestMapping("confirmDate")
    public ModelAndView confirmDate(HttpServletRequest req,@RequestParam("orderCode")String orderCode){
        user login = (user)req.getSession().getAttribute("login");
        ModelAndView modelAndView=new ModelAndView("redirect:/myOrder");
        if(login==null){
            modelAndView.setViewName("login");
        }else {
            order byOrderCode = orderService.getByOrderCode(orderCode);
            byOrderCode.setStatus("已收货");
            byOrderCode.setConfirmDate(new Date());
            orderService.updateConfirmDate(byOrderCode);
        }
        return modelAndView;
    }
    //接下来就是一个订单最后的一个功能-------评价功能------------------------------------------------------
    @RequestMapping("evaluation")
    public ModelAndView evaluation(@RequestParam("pid")int pid){
        ModelAndView modelAndView=new ModelAndView("reviewProduct");
        product product = productService.listByPOne(pid);
        List<productImage> byId = productImageService.getById(pid);
        modelAndView.addObject("product",product);
        modelAndView.addObject("byId",byId);
        return modelAndView;
    }
    @RequestMapping("addEvaluation")
    public ModelAndView addEvaluation(@RequestParam("pid")int pid,HttpServletRequest req,@RequestParam("message")String message){
        ModelAndView modelAndView=new ModelAndView("redirect:/index");
        user login = (user)req.getSession().getAttribute("login");
        if(login==null){
            modelAndView.setViewName("login");
        }
        evaluation e=new evaluation();
        e.setCreateDate(new Date());
        e.setUid(login.getId());
        e.setMessage(message);
        e.setPid(pid);
        orderItem o=new orderItem();
        o.setPid(pid);
        o.setUid(login.getId());
        orderItem orderItem = orderItemService.selectByPid(o);
        orderItem.setIsEvaluation("是");
        orderItemService.update(orderItem);
        evaluationService.add(e);
        return modelAndView;
    }
//..........................................下面订单其余功能的完善（删除订单）。。。。。。。。。。。。。。。。。。。。。。。。。。
    @RequestMapping("deleteOrder")
    @ResponseBody
    public String deleteOrder(HttpServletRequest req,@RequestParam("OrderCode")String OrderCode){
        if(orderItemService.listByOid(OrderCode)==null){
            return "该订单号不存在";
        }
        else {
            orderItemService.delete(OrderCode);
            orderService.delete(OrderCode);
            return "success";
        }
    }
    //。。。。。。。。。。。。。。。。。。。。。。。。个人中心功能。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。
    @RequestMapping("presonCenter")
    public ModelAndView presonCenter(HttpServletRequest req){
        ModelAndView modelAndView=new ModelAndView("presonCenter");
        user login = (user)req.getSession().getAttribute("login");
        if(login==null){
            modelAndView.setViewName("login");
        }
        else {
            presoncenter presonCenter = presonCenterService.selectOne(login.getId());
            modelAndView.addObject("presonCenter",presonCenter);
        }
        return modelAndView;
    }
    @RequestMapping(value = "addInfo",method = RequestMethod.POST)
    @ResponseBody
    public String addInfo(HttpServletRequest req,@RequestParam("username")String username,@RequestParam("email")String email
                                ,@RequestParam("tel")String tel,@RequestParam("ev")String ev){
        user login = (user)req.getSession().getAttribute("login");
        if(login==null){
            return "no user";
        }
        else {
            presoncenter presonCenter = presonCenterService.selectOne(login.getId());
            presoncenter p=new presoncenter();
            p.setUid(login.getId());
            p.setU_name(username);
            p.setU_email(email);
            p.setU_tel(tel);
            if(presonCenter==null){
                if(ev.equals(s)){
                    presonCenterService.add(p);
                    return "success";
                }
                else {
                    return "fail";
                }
            }
            else {
                if(ev.equals(s)) {
                    presonCenterService.update(p);
                    return "success";
                }
                else {
                    return "fail";
                }
            }
        }

    }
    @RequestMapping("sendInfo1")
    @ResponseBody
    public String sendInfo1(HttpServletRequest req,@RequestParam("email2")String email2) throws EmailException {
        email1 email1=new email1();
            s = email1.send1(email2);
            if(s!=null){
                return "success";
            }
        return null;
    }
    @RequestMapping("sendInfo")
    @ResponseBody
    public String sendInfo(HttpServletRequest req,@RequestParam("email2")String email2,@RequestParam("username")String uname) throws EmailException {
        email1 email1=new email1();
        presoncenter p=new presoncenter();
        p.setU_email(email2);
        p.setU_name(uname);
        List<presoncenter> presoncenter = presonCenterService.selectByNameByEmail(p);

        if(presoncenter.size()==0){
            s = email1.send1(email2);
            if(s!=null){
                return "success";
            }
        }
        return null;
    }
    @RequestMapping("forgetP")
    public ModelAndView forgetP(){
        ModelAndView modelAndView=new ModelAndView("forPassword");
        return modelAndView;
    }
    @RequestMapping("selectByName")
    @ResponseBody
    public String selectByName(HttpServletRequest req,@RequestParam("uname")String uname) throws EmailException {
        user user = userService.selectByName(uname);
        if(user!=null){
            presoncenter presoncenter = presonCenterService.selectOne(user.getId());
            if(presoncenter!=null){
                anonymity anonymity=new anonymity();
                req.getSession().setAttribute("emailaddress",presoncenter.getU_email());
                req.getSession().setAttribute("user",user);
                String anonymousName = anonymity.getAnonymousName(presoncenter.getU_email());
                return presoncenter.getU_email();
            }
            else {
                return "fail";
            }
        }
        else {
            return null;
        }
    }
    @RequestMapping(value = "PIN",method = RequestMethod.POST)
    public ModelAndView PIN(@RequestParam("PIN")String PIN,HttpServletRequest req){
        user userid = (user) req.getSession().getAttribute("user");
        ModelAndView modelAndView=new ModelAndView();
        if(s.equals(PIN)){
            modelAndView.addObject("passwordUser",userid);
            modelAndView.setViewName("modifyuser");
        }
        else if(userid==null){
            modelAndView.setViewName("login");
        }
        else {
            modelAndView.setViewName("redirect:/forgetP");
        }
        return modelAndView;
    }
    @RequestMapping("foundPassword")
    public ModelAndView foundPassword(@RequestParam("username")String username,@RequestParam("password")String password){
        ModelAndView modelAndView=new ModelAndView("redirect:/login");
        user user1=new user();
        user1.setPassword(password);
        user1.setUsername(username);
        userService.update(user1);
        return modelAndView;
    }

}
