<%--
  Created by IntelliJ IDEA.
  User: warframe
  Date: 2017/9/13
  Time: 8:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@include file="header_nav.jsp"%>
<!--结算页面-->
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
    .radio-sex {
        position: relative;
        display: inline-block;
        margin-right: 12px;
    }

    .radio-sex input {
        vertical-align: middle;
        margin-top: -2px;
        margin-bottom: 1px;
        /* 前面三行代码是为了让radio单选按钮与文字对齐 */
        width: 20px;
        height: 20px;
        appearance: none;/*清楚默认样式*/
        -webkit-appearance: none;
        opacity: 0;
        outline: none;
        /* 注意不能设置为display:none*/
    }

    .radio-sex label {
        position: absolute;
        left: 0;
        top: 0;
        z-index: -1;
        /*注意层级关系，如果不把label层级设为最低，会遮挡住input而不能单选*/
        width: 20px;
        height: 20px;
        border: 1px solid #3582E9;
        border-radius: 100%;
    }

    .radio-sex input:checked+label {
        background: #3582E9;
    }

    .radio-sex input:checked+label::after {
        content: "";
        position: absolute;
        left: 8px;
        top: 2px;
        width: 5px;
        height: 12px;
        border-right: 1px solid #fff;
        border-bottom: 1px solid #fff;
        transform: rotate(45deg);
    }
</style>
<div class="buyPageDiv">
    <!--结算页面标题图片-->
    <div class="buyFlow">
        <!--也可以用bootstrap中的pull-left和pull-right-->
        <img src="images/site/simpleLogo.png" alt="图片加载失败">
        <img src="images/site/buyflow.png" alt="图片加载失败" style="float: right;">
        <!--样式清除-->
        <div style="clear: both"></div>
    </div>

    <!--提交表单要进行的表单信息填写-->
    <form id="orderCommitForm" action="<%=request.getContextPath()%>/pageSubmit" method="post">
        <!--收货地址div-->
        <p>收货地址：</p>
        <c:forEach items="${addresses}" var="address">
            <div class="radio-sex" style="font-size: 15px">
                <input type="radio" id="sex1" name="aid" checked="1" value="${address.id}">
                <label for="sex1"></label>
                <span>${address.receiver}/${address.tel}/${address.address}/${address.detailAddress}</span>
            </div>
            <br>
        </c:forEach>
        <br>
        <p style="font-size: 20px;cursor: pointer" class="coupon-p" onclick="">优惠卷﹀</p>
        <div class="container-coupon" style="display: none">
            <c:forEach items="${coupons}" var="coupon">
                <div class="coupon" style=" margin-left: 50px">
                    <div class="stamp stamp04">
                        <input type="hidden" name="cuId" value="${coupon.id}">
                        <div class="par"><p>XXXXXX折扣店</p><sub class="sign">￥</sub><span id="cash">${coupon.cash}</span><sub>优惠券</sub><p>无门槛</p></div>
                        <div class="copy">副券<p>2015-08-13<br>2016-08-13</p></div>
                        <p id="selectC"style="font-size: 20px">使用<input id="radioC" type="radio" value="1" checked="1"></p>
                    </div>
                </div>
            </c:forEach>
        </div>

        <!--购买商品列表-->
        <div class="productList">
            <div class="productListTitle">确认订单信息</div>
            <!--结算页面只有当前的一个订单所以只会有一个表-->
            <table class="productListTable">
                <thead>
                <tr>
                    <th class="productListTableFirstColumn" colspan="2">
                        <img width="15px" src="images/site/orderItemTmall.png" alt="图片加载失败">
                        <a href="#nowhere" class="marketLink"><span>店铺：天猫店铺</span></a>
                        <a href="#nowhere"><span class="wangwangLink"></span></a>
                    </th>
                    <th>单价</th>
                    <th>数量</th>
                    <th>小计</th>
                    <th>配送方式</th>
                </tr>
                <tr class="rowBoder">
                    <td colspan="2"></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                </thead>

                <tbody class="productListTableTBody">
                <c:forEach items="${list}" var="carItem">
<%--                    <c:forEach items="${producrList}" var="product">--%>
                    <tr class="orderItemTR">
                        <td class="orderItemFirstTD" width="60px">
                            <c:forEach items="${byIdImage}" var="productImage">
                                <c:if test="${carItem.pid eq productImage.pid}">
                                    <c:if test="${productImage.type eq 0}">
                                        <a href=""><img class="orderItemImg"src="../../../image/${productImage.image}" alt="图片加载失败" /></a>
                                    </c:if>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td class="orderItemProductInfo">
                            <c:forEach items="${producrList}" var="product">
                            <c:if test="${carItem.pid eq product.id}">
                            <a class="orderItemProductLink" href="<%=request.getContextPath()%>/detail?pid=${product.id}">${product.name}</a>
                            </c:if>
                            </c:forEach>
                            <img src="images/site/creditcard.png" alt="图片加载失败" title="支持信用卡">
                            <img src="images/site/promise.png" alt="图片加载失败" title="7天保障">
                        </td>
                        <c:forEach items="${producrList}" var="product">
                        <c:if test="${product.id eq carItem.pid}">
                        <td>
                                <span class="orderItemProductPromotePrice">${product.nprice}</span>
                        </td>
                        <td>
                            <span class="orderItemProductNumber">${carItem.count}</span></td>
                        <input type="hidden" value="${carItem.count}" name="number">
                        <input type="hidden" value="${carItem.pid}" name="pid">
                        <td><span id="orderItemProductSumPrice" class="orderItemProductSumPrice">
                                ${carItem.count * product.nprice}
                        </span>

                        </td>
                        </c:if>
                        </c:forEach>
                        <!--最后一列是订单中所有商品的配送是统一的所以rowspan=5-->
                        <c:if test="${product.store==1}">
                            <td rowspan="5"  class="orderItemLastTD">
                                <label class="orderItemDeliveryLabel">
                                    <input type="radio" value="" checked="checked">
                                    普通配送
                                </label>

                                <select class="orderItemDeliverySelect" class="form-control">
                                    <option>快递 免邮费</option>
                                </select>

                            </td>
                        </c:if>
                    </tr>
                    </c:forEach>
<%--                </c:forEach>--%>
                </tbody>
            </table>

            <!--订单总计-->
            <div class="orderItemSumDiv">
                <div class="pull-left">
                    <span class="leaveMessageText">给卖家留言:</span>
                    <span>
                        <img src="images/site/leaveMessage.png" alt="图片加载失败" class="leaveMessageImg">
                    </span>
                    <span class="leaveMessageTextareaSpan" style="display: none">
                        <textarea class="leaveMessageTextarea" name="userMessage"></textarea>
                        <div style="margin-left:70px;">
                            <span>还可以输入200个字符</span>
                        </div>
                    </span>
                </div>
                <span class="pull-right">
                    店铺合计(含运费):<span clsss="orderItemSumPrice">${totalPrice}</span>
                </span>
            </div>

        </div>
        <body>

        </body>
        <div class="orderItemTotalSumDiv">
            <div class="pull-right">
                <span>红包抵扣:</span>
                <span class="orderItemTotalSumSpan1" style="color: red;font-size: 20px">
                ￥
            </span><br>
                <span>实付款:</span>
                <input class="total" name="total" value="${totalPrice}" type="hidden">
                <span class="orderItemTotalSumSpan">
                ￥${totalPrice}
            </span>
            </div>
        </div>
        <!--提交订单-->
        <div class="submitOrderDiv">
            <a href="" class="backToCartLink">返回购物车</a>
            <a id="a1" class="submitOrderLink"><button class="submitOrderButton" type="sub">提交订单</button></a>
        </div>
    </form>

</div>

<script>
    $(function () {
        //TODO
        $("img.leaveMessageImg").click(function () {
            $(this).css("display","none");
            $("span.leaveMessageTextareaSpan").css("display","inline-block");

        })

        $("#radioC").click(function (){
            var cash=$('#cash').text();
            console.log( $("input.total").val());
            var sum=$("#orderItemProductSumPrice").text();
            if($("input.total").val()-cash<0){
                alert("这个卷太大，换一个试试");
            }
            else {
                console.log($("#radioC").attr("value"))
                if($("#radioC").attr("value")=="1"){
                    var ca=$("input.total").val()-cash;
                    console.log($("input.total").val()-cash);
                    $("input.total").attr({"value": $("input.total").val()-cash});
                    $("span.orderItemTotalSumSpan1").text(cash);
                    $("span.orderItemTotalSumSpan").text(ca);
                    $("#radioC").attr("value","0");
                }
            }

        })
        $("p.coupon-p").click(function (){
            var  css = $("div.container-coupon").css("display");
            if(css=='none'){
                $("div.container-coupon").css("display","block");
            }
            else if(css=='block'){
                $("div.container-coupon").css("display","none");
            }

        })
        $("#sex1").click(function (){
            $("#sex1").attr("checked","0");
        })
        //点击提交订单

        $("a.submitOrderLink").click(function () {
            //点击提交订单是进行表单验证
            var address = $("#sex1").val();
            var check=$("#sex1").attr("checked");
            var post = $("#post").val();
            var receiver = $("#receiver").val();
            var mobile = $("#mobile").val();
            /*表单验证错误先简单写写，这不是重点*/
                $("#orderCommitForm").submit();
        });
    });
</script>





