<%--
  Created by IntelliJ IDEA.
  User: warframe
  Date: 2017/10/9
  Time: 16:04
  To change this template use File | Settings | File Templates.

  通过分类进行的搜索结果页面，可以对搜索结果进行按价格排序、按销量排序等排序
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="header_nav.jsp" %>
<%--搜索结果--%>
<head>
    <%--    <link href="<%=request.getContextPath()%>/css/searchByKeyword.css" rel="stylesheet"/>--%>
    <%--    <link href="<%=request.getContextPath()%>/css/searchByCategoryResult.css" rel="stylesheet">--%>
</head>
<style>
    .stamp
    { float: left; width: 150px;height: 140px;padding: 0 10px;position: relative;overflow: hidden;}
    .stamp:before {content: '';position: absolute;top:0;bottom:0;left:10px;right:10px;z-index: -1;}
    .stamp:after {content: '';position: absolute;left: 10px;top: 10px;right: 10px;bottom: 10px;box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.5);z-index: -2;}
    .stamp i{position: absolute;left: 20%;top: 45px;height: 190px;width: 390px;background-color: rgba(255,255,255,.15);transform: rotate(-30deg);}
    .stamp .par{float: left;padding: 16px 15px;width: 220px;border-right:2px dashed rgba(255,255,255,.3);text-align: left;}
    .stamp .par p{color:#fff;}
    .stamp .par span{font-size: 50px;color:#fff;margin-right: 5px;}
    .stamp .par .sign{font-size: 34px;}
    .stamp .par sub{position: relative;top:-5px;color:rgba(255,255,255,.8);}
    .stamp .copy{display: inline-block;padding:21px 14px;width:100px;vertical-align: text-bottom;font-size: 30px;color:rgb(255,255,255);}
    .stamp .copy p{font-size: 16px;margin-top: 15px;}
    .stamp04{width: 390px;background: #50ADD3;background: radial-gradient(rgba(0, 0, 0, 0) 0, rgba(0, 0, 0, 0) 4px, #50ADD3 4px);background-size: 12px 8px;background-position: -5px 10px;}
    .stamp04:before{background-color:#50ADD3;left: 5px;right: 5px;}
    .stamp04 .copy{padding: 10px 6px 10px 12px;font-size: 24px;}
    .stamp04 .copy p{font-size: 14px;margin-top: 5px;margin-bottom: 8px;}
    .stamp04 .copy a{background-color:#fff;color:#333;font-size: 14px;text-decoration:none;padding:5px 10px;border-radius:3px;display: block;}
</style>
<div class="categoryPageDiv">
    <!--对商品进行排序分类-->
    <div class="categorySortBar">
        <!--放排序按钮的table-->
        <!--放价格区间的table-->
        <h3>我的卡卷：</h3>
    </div>
    <div class="categoryProducts" >
        <c:if test="${empty coupons}">
            <div style="text-align: center;">
                <img src="images/tianmao.png">
                <div class="txt" style="font-size:20px">哦噢~小主一张券都没有，快去抢几张~</div>
                <a href="radomCoupon" style="font-size: 14px;
    height: 36px;
    line-height: 36px;
    background-color: red;
    color: white;
    color: #fff;
    text-decoration: none;
    border-radius: 3px;
    background-color: #df3033;
    display: inline-block;
    text-align: center;
    cursor: pointer;
    background-image: -moz-linear-gradient(top,#df3033,#e74649);
    background-image: -webkit-gradient(linear,left top,left bottom,color-stop(0,#df3033),color-stop(1,#e74649));

    width: 118px;
    padding: 0;">
                    抽取优惠卷
                </a>
            </div>
        </c:if>
            <c:forEach items="${coupons}" var="coupon">
                <div class="coupon" style=" margin-left: 50px">
                    <div class="stamp stamp04">
                        <div class="par"><p>XXXXXX折扣店</p><sub class="sign">￥</sub><span>${coupon.cash}</span><sub>优惠券</sub><p>无门槛</p></div>
                        <div class="copy">副券<p>2015-08-13<br>2016-08-13</p><a href="<%=request.getContextPath()%>/index">立即使用</a></div>
                        <i></i>
                    </div>
                </div>
            </c:forEach>
    </div>
    <%--清除浮动？？！！emmmmm--%>
    <div style="clear: both"></div>

</div>



<script>
    $(function () {
        $("input.sortBarPrice").keyup(function () {
            var num = $(this).val();
            if(num.length==0){
                $("div.productUnit").show();
                return;
            }

            num = parseInt(num);
            if(isNaN(num)) num=1;
            if(num<1) num=1;
            $(this).val(num);

            var begin = $("input.beginPrice").val();

            var end = $("input.endPrice").val();

            if(!isNaN(begin) && !isNaN(end)){
                $("div.productUnit").hide();

                $("div.productUnit").each(function () {
                    var price = $(this).attr("price");

                    price = new Number(price);

                    if(price<=end && price>=begin){
                        $(this).show();
                    }
                });
            }

        });
    })

</script>





<%@include file="footer.jsp" %>
