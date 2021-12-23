<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>首页</title>
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap/3.3.6/bootstrap.min.css">
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/header_nav.css">
    <link rel="stylesheet" href="css/header_search.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/content_carousel.css">
    <link rel="stylesheet" href="css/product_list.css">
</head>
<body style="background-image:url('images/背景3.png')">
    <!--头部导航-->
   <jsp:include page="header_nav.jsp"></jsp:include>

    <!--头部搜索栏-->
    <div>
        <a href="#"><img src="images/site/logo.gif" alt="" id="logo"></a>

        <div class="searchDiv">
            <form action="<%=request.getContextPath()%>/pageSelect?pageNo=1" method="post">
                <input type="hidden" name="pageNo" value="1">
                <input type="text" name="keyword" placeholder="包治百病 新款来袭">
                <button type="submit" class="searchButton">搜索</button>
            </form>
            <div class="searchBelow">
                <span><a href="#">衬衫男</a>   <span>|</span> </span>
                <span><a href="#">连衣裙</a>   <span>|</span> </span>
                <span><a href="#">四件套</a>   <span>|</span> </span>
                <span><a href="#">笔记本电脑</a>   <span>|</span> </span>
                <span><a href="#">奶粉</a>   <span>|</span> </span>
                <span><a href="#">运动鞋</a>    </span>
            </div>
        </div>
    </div>



    <!--产品列表-->
     <script>
        $(function () {
            $("div.rightMenu span").mouseenter(function () {
                var left = $(this).position().left;
                var top = $(this).position().top;
                var width = $(this).css("width");
                var destLeft = parseFloat(left) + parseFloat(width)/2;
                $("img#catear").css("left", destLeft);
                $("img#catear").css("top", top+150);
                $("img#catear").fadeIn(500);
            });
            $("div.rightMenu span").mouseleave(function () {
                $("img#catear").hide();
            });
        });
    </script>

    <img src="images/site/catear.png" id="catear" class="catear" />


    <script>
        function showProductsAsideCategorys(cid){
            $("div.eachCategory[cid="+cid+"]").css("background-color","white");
            $("div.eachCategory[cid="+cid+"] a").css("color","#87CEFA");
            $("div.productsAsideCategorys[cid="+cid+"]").show();
        }

        function hideProductsAsideCategorys(cid) {
            $("div.eachCategory[cid="+cid+"]").css("background-color","#e2e2e3");
            $("div.eachCategory[cid="+cid+"] a").css("color","#000");
            $("div.productsAsideCategorys[cid="+cid+"]").hide();
        }

        $(function () {
            $("div.eachCategory").mouseenter(function () {
                var cid=$(this).attr("cid");
                showProductsAsideCategorys(cid);
            });
            $("div.eachCategory").mouseleave(function () {
                var cid=$(this).attr("cid");
                hideProductsAsideCategorys(cid);
            });
            $("div.productsAsideCategorys").mouseenter(function () {
                var cid=$(this).attr("cid");
                showProductsAsideCategorys(cid);
            });
            $("div.productsAsideCategorys").mouseleave(function () {
                var cid=$(this).attr("cid");
                hideProductsAsideCategorys(cid);
            });
        });
    </script>

    <div class="categoryWithCarousel">
        <!--导航条-->
        <div class="headbar">
            <div class="head">
                <span class="glyphicon glyphicon-th-list" style="margin-left:10px;"></span>
                <span style="margin-left:10px">商品分类</span>
            </div>

            <div class="rightMenu">
                <span><a href="#"><img src="<%=request.getContextPath()%>/images/site/chaoshi.png" alt=""></a></span>
                <span><a href="#"><img src="images/site/guoji.png" alt=""></a></span>
                <span><a href="#">平板电视</a></span>
                <span><a href="#">电热水器</a></span>
            </div>
        </div>
        <div style="position: relative;left: 0;top: 0;">
            <div class="categoryMenu" style="background-color: white">
                <c:forEach items="${categories}" var="category">
                    <div class="eachCategory" cid="${category.id}">
                        <span class="glyphicon glyphicon-link"></span>
                        <a href="#">
                            ${category.name}
                        </a>
                    </div>
                </c:forEach>

            </div>
        </div>
        <div style="position: relative;left: 0;top: 0;">

            <script>
                $(function () {
                    $("div.productsAsideCategorys div.row a").each(function () {
                        var v=Math.round(Math.random()*6);
                        if(v==1){
                            $(this).css("color","#87CEFA");
                        }
                    });
                });
            </script>
            <c:forEach items="${categories}" var="category">
                <div class="productsAsideCategorys" cid="${category.id}" style="display:none;">
                    <div class="row ">
                        <c:forEach items="${products}" var="product">
                            <c:if test="${category.id eq product.cid}">
                                <a href="<%=request.getContextPath()%>/detail?pid=${product.id}">
                                        ${product.name}
                                </a>
                            </c:if>
                        </c:forEach>
                        <div class="seperator"></div>
                    </div>
                </div>
            </c:forEach>

        </div>


        <!--轮播-->
        <div data-ride="carousel" class="carousel-of-product carousel slide" id="carousel-of-product">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li class="active" data-slide-to="0" data-target="#carousel-of-product"></li>
                <li data-slide-to="1" data-target="#carousel-of-product" class=""></li>
                <li data-slide-to="2" data-target="#carousel-of-product" class=""></li>
                <li data-slide-to="3" data-target="#carousel-of-product" class=""></li>
            </ol>
            <!-- Wrapper for slides -->
            <div role="listbox" class="carousel-inner">
                <div class="item active">
                    <a href="#"><img src="images/lunbo/1.jpg" class="carousel carouselImage"></a>
                </div>
                <div class="item">
                    <a href="#"><img src="images/lunbo/2.jpg" class="carouselImage"></a>
                </div>
                <div class="item">
                    <a href="#"><img src="images/lunbo/3.jpg" class="carouselImage"></a>
                </div>
                <div class="item">
                    <a href="#"><img src="images/lunbo/4.jpg" class="carouselImage"></a>
                </div>
            </div>
        </div>

    
    </div>
    <div class="homepageCategoryProducts" style="background-color: lavenderblush">
        <C:forEach items="${categories}" var="category">
            <div class="eachHomepageCategoryProducts">
                <div class="left-mark"></div>
                <span class="categoryTitle">${category.name}</span>
                <br>
                <c:forEach items="${products}" var="product">
                    <c:if test="${product.cid eq category.id}">
                        <div class="productItem">
                            <c:forEach items="${listProductImages}" var="productImage">
                            <c:if test="${productImage.type eq 0}">
                                <c:if test="${productImage.pid eq product.id}">
                                <a href="<%=request.getContextPath()%>/detail?pid=${product.id}"><img width="100px" src="../../../image/${productImage.image}"></a>
                                <a href="#" class="productItemDescLink">
                                    </c:if>
                            </c:if>
                            </c:forEach>
                    <span class="productItemDesc">[热销]
                           ${product.tittle}
                            </span>
                            </a>
                            <span class="productPrice">
                            ￥${product.nprice}
                        </span>
                        </div>
                    </c:if>
                </c:forEach>
                <div style="clear:both"></div>
            </div>
        </C:forEach>
        <img src="images/site/end.png" class="endpng" id="endpng">
    </div>
    <!--页脚-->
    <div class="footer" id="footer">
        <div class="footer_ensure" id="footer_ensure">
            <a><img src="images/site/ensure.png" alt=""></a>
        </div>

        <div class="footer_desc" id="footer_desc">
            <div class="descColumn">
                <span class="descColumnTitle">购物指南</span>
                <a href="#">免费注册</a>
                <a href="#">开通支付宝</a>
                <a href="#">支付宝充值</a>
            </div>
            <div class="descColumn">
                <span class="descColumnTitle">天猫保障</span>
                <a href="#">发票保障</a>
                <a href="#">售后规则</a>
                <a href="#">缺货赔付</a>
            </div>
            <div class="descColumn">
                <span class="descColumnTitle">支付方式</span>
                <a href="#">快捷支付</a>
                <a href="#">信用卡</a>
                <a href="#">蚂蚁花呗</a>
                <a href="#">货到付款</a>
            </div>
            <div class="descColumn">
                <span class="descColumnTitle">商家服务</span>
                <a href="#">商家入驻</a>
                <a href="#">商家中心</a>
                <a href="#">天猫智库</a>
                <a href="#">天猫规则</a>
                <a href="#">物流服务</a>
                <a href="#">喵言喵语</a>
                <a href="#">运营服务</a>
            </div>

            <div class="descColumn">
                <span class="descColumnTitle">手机天猫</span>
                <a href="#"><img src="images/site/ma.png"></a>
            </div>
        </div>
        <div style="clear:both"></div>
    </div>


    <div class="footer">
        <img src="images/site/cateye.png" class="cateye" id="cateye">
        <div class="copyright" id="copyright">
            <div class="white_link">
                <a href="#">关于天猫</a>
                <a href="#">帮助中心</a>
                <a href="#">开放平台</a>
                <a href="#">诚聘英才</a>
                <a href="#">联系我们</a>
                <a href="#">网站合作</a>
                <a href="#">法律声明</a>
                <a href="#">知识产权</a>
                <a href="#">廉政举报</a>
            </div>

            <div class="white_link">
                <a href="#"> 阿里巴巴集团</a><span class="slash">|</span>
                <a href="#"> 淘宝网</a><span class="slash">|</span>
                <a href="#">天猫 </a><span class="slash">|</span>
                <a href="#">  聚划算</a><span class="slash">|</span>
                <a href="#">全球速卖通</a><span class="slash">|</span>
                <a href="#">阿里巴巴国际交易市场</a><span class="slash">|</span>
                <a href="#">1688</a><span class="slash">|</span>
                <a href="#">阿里妈妈</a><span class="slash">|</span>
                <a href="#">  阿里旅行·去啊  </a><span class="slash">|</span>
                <a href="#">  阿里云计算    </a><span class="slash">|</span>
                <a href="#">  阿里通信     </a><span class="slash">|</span>
                <a href="#">  YunOS    </a><span class="slash">|</span>
                <a href="#">  阿里旅行·去啊  </a><span class="slash">|</span>
                <a href="#">   万网  </a><span class="slash">|</span>
                <a href="#">  高德   </a><span class="slash">|</span>
                <a href="#"> 优视    </a><span class="slash">|</span>
                <a href="#">  友盟   </a><span class="slash">|</span>
                <a href="#">  虾米   </a><span class="slash">|</span>
                <a href="#">  天天动听 </a><span class="slash">|</span>
                <a href="#">  来往   </a><span class="slash">|</span>
                <a href="#">  钉钉   </a><span class="slash">|</span>
                <a href="#">  支付宝      </a>
            </div>

            <div class="license">
                <span>增值电信业务经营许可证： 浙B2-20110446</span>
                <span>网络文化经营许可证：浙网文[2015]0295-065号</span>
                <div>互联网药品信息服务资质证书编号：浙-（经营性）-2012-0005</div>
                <div class="copyRightYear">© 2003-2017 TMALL.COM 版权所有</div>
                <div>
                    <img src="images/site/copyRight1.jpg">
                    <img src="images/site/copyRight2.jpg">
                </div>
            </div>

        </div>
    </div>


</body>
</html>