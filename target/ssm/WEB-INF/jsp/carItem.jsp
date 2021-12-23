<%--
  Created by IntelliJ IDEA.
  User: 皓
  Date: 2021/12/9
  Time: 9:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header_nav.jsp" %>
<c:choose>
    <c:when test="${cartItemNumber != 0}">
        <!--购物车的一系列div-->
        <div class="cartDiv">
            <!--购物车右上方的价格显示div-->
            <div class="cartTitle">
                <div class="cartTitlePrice pull-right">
                    <span>已选商品(不含运费)<span class="cartProductSumPrice">0.00</span></span>
                    <!--点击结算按钮-->
                    <button class="createOrderButton" disabled="disabled">结算</button>
                </div>
            </div>

            <!--订单项-->
            <div class="cartProductItemList">
                <table id="cartProductItemTable" class="cartProductItemTable">
                    <!--列名信息-->
                    <thead>
                    <th class="selectAll"><img class="selectAllProduct" src="images/site/cartNotSelected.png"
                                               selectit="false"/>全选
                    </th>
                    <th>商品信息</th>
                    <th>单价</th>
                    <th>数量</th>
                    <th>金额</th>
                    <th>操作</th>
                    </thead>
                    <!--表信息-->
                    <tbody>
                    <c:forEach items="${cartItemList}" var="carItem">
                        <!--一行就表明是一个商品信息-->
                        <tr class="cartProductItemTR" oiid="${carItem.id}" pid="${carItem.pid}">
                            <!--全选框和商品图片-->
                            <td id="img" width="140px">
                                <img class="productIfSelect" src="images/site/cartNotSelected.png" selectit="false"
                                     oiid="${carItem.id}" pid="${carItem.pid}"/>
                                <c:forEach items="${productImages}" var="productImage">
                                    <c:if test="${productImage.pid eq carItem.pid}">
                                        <c:if test="${productImage.type eq 0}">
                                            <img class="productImage" pid="${carItem.pid}"
                                                 src="../../../image/${productImage.image}"/>
                                        </c:if>
                                    </c:if>
                                </c:forEach>
                            </td>
                            <!--商品信息-->
                            <c:forEach items="${listProduct}" var="product">
                                <c:if test="${carItem.pid eq product.id}">
                            <td class="pName">
                                <div class="cartProductLinkOutDiv">
                                    <a href="#" id="cartProductLink"
                                       class="cartProductLink" target="_blank" pid="${product.id}">${product.name}</a>
                                    <!--商品信息下方的承诺-->
                                    <div class="cartProductLinkInnerDiv">
                                        <a href="#nowhere"><img src="images/site/creditcard.png" alt="图片加载失败"
                                                                title="支持信用卡支付"></a>
                                        <a href="#nowhere"><img src="images/site/promise.png" alt="图片加载失败"
                                                                title="消费者保障服务 卖家承诺如实描述"></a>
                                    </div>
                                </div>
                            </td>
                            <!--商品单价-->
                            <td>
                                <span  class="originalPrice">￥${product.oprice}</span>
                                <span id="promotePrice" class="promotePrice">￥${product.nprice}</span>
                            </td>
                            <!--商品数量设置-->
                            <!--商品数量设置中，每次只要进行商品数量的改变，数据库中的orderItem记录也要进行相应的update-->
                            <td>
                                <div class="cartProductAmountSetting">

                                    <span class="cartProductPromotePrice hidden" oiid="${cartItem.id}"
                                          pid="${cartItem['product']['id']}">${cartItem['product']['promotePrice']}</span>
                                            <input type="hidden" id="name" value="${carItem.pid}">
                                    <span class="stock hidden" oiid="${cartItem.id}"
                                          pid="${cartItem.pid}">${product.store}</span>
                                    <!--具体对商品购买数量的设置-->
                                    <input  id="count" count="${carItem.count}" type="number"  pid="${product.id}"value="${carItem.count}" class="cartProductItemAmount"/>
                                </div>
                            </td>
                            <!--单类产品小计价格-->
                            <td>
                                <span class="cartProductItemSmallSumPrice" pid="${product.id}"
                                      oiid="${cartItem.id}">￥${product.nprice * carItem.count}</span>
                            </td>
                            <!--删除操作-->
                            <!--pid商品id,oiid(OrderItemId)订单项(购物车)id，删除需要知道订单号和商品号即哪个订单中的哪个产品-->
                            <td class="deleteCartProduct">
                                <!--通过ajax删除指定的订单项-->
                                <a href="" id="deleteA" pid="${carItem.pid}" oiid="${cartItem.id}">删除</a>
                            </td>
                        </tr>
                                </c:if>
                            </c:forEach>
                    </c:forEach>


                    </tbody>
                </table>
            </div>


            <!--购物车下方的结算-->
            <div class="cartFoot">

                <img src="images/site/cartNotSelected.png" alt="图片加载失败" class="selectAllProduct" selectit="false"
                     oiid="${cartItem.id}">
                <span>全选</span>
                <a href="#nowhere" class="deleteAllProduct" oiid="${cartItem.id}">删除</a>
                <div class="cartFootPrice pull-right">
                    <span>已选商品 <span class="cartProductSumNumber">0</span> 件</span>·
                    <span>合计(不含运费):<span class="cartProductSumPrice">0.00</span></span>
                    <a href="<%=request.getContextPath()%>/cartOrder" id="createOrderLink" class="createOrderLink">
                        <button id="createOrderButton" class="createOrderButton" disabled="disabled">结算</button>
                    </a>
                </div>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <div class="cartIsEmpty">
            <h2>您的购物车还是空的，赶紧行动吧！</h2>
        </div>
    </c:otherwise>
</c:choose>


<script>
    var arry=[];
    var maxSum=0;
    var count1=[];
    var name1=[];
    var pid1=[];
    var image=[];
   <%--$("#createOrderLink").click(function () {--%>
   <%--    var price=JSON.stringify(arry);--%>
   <%--    var price2=price.trim();--%>
   <%--    var page="<%=request.getContextPath()%>/cartOrder"--%>
   <%--    window.location.href="<%=request.getContextPath()%>/cartOrder";--%>
   <%--    window.event.returnValue=false;--%>
   <%--})--%>
    $("a.createOrderLink").click(function () {
        var param = "?";
        //获取总价格
        $("img.productIfSelect").each(function () {
            if ("selectit" == $(this).attr("selectit")) {
                var oiid = $(this).attr("oiid");
                param += "&oiid=" + oiid;
            }
        })
        param = param.substring(0,1)+param.substring(2,param.length);

        location.href = $("a.createOrderLink").attr("href") + param;

        //alert(param);

        return false;

    });

    function syncOderButton() {
        var selectProduct = false;
        /*进行判断*/
        //遍历所有商品勾选框
        $("img.productIfSelect").each(function () {
            var selectit = $(this).attr("selectit");
            if ("selectit" == selectit) selectProduct = true;
        });
        /*只要有任意商品被选中，就将结算按钮激活*/
        if (selectProduct) {
            $("button.createOrderButton").removeAttr("disabled");
            $("button.createOrderButton").css("background-color", "rgb(196, 0, 0)");
        } else {
            $("button.createOrderButton").attr("disabled", "disabled");
            $("button.createOrderButton").css("background-color", "#B0B0B0");
        }

    }

    /*同步全选*/
    /*判断是否全选只需要找到一个商品没有被选中那么就表示没有全选*/
    function syncSelectAll() {
        var selectAll = true;
        var len = $("img.productIfSelect").length;
        console.log(len);
        if (len > 0) {
            $("img.productIfSelect").each(function () {
                var selectit = $(this).attr("selectit");
                if ("false" == selectit) selectAll = false;
            });
            if (selectAll) {
                $("img.selectAllProduct").attr("selectit", "selectit");
                $("img.selectAllProduct").attr("src", "images/site/cartSelected.png");
            } else {
                $("img.selectAllProduct").attr("selectit", "false");
                $("img.selectAllProduct").attr("src", "images/site/cartNotSelected.png");
            }
        } else {
            $("img.selectAllProduct").attr("selectit", "false");
            $("img.selectAllProduct").attr("src", "images/site/cartNotSelected.png");
        }
    }
    function calcSmallPrice(pid, price, num) {
        $("input.cartProductItemAmount").val(num);
        var smallPrice = price * num;
        smallPrice = smallPrice.toFixed(2);
        $("span.cartProductItemSmallSumPrice").html("￥" + smallPrice);
        //重新计算总价格和总数目

    }
    /*事件响应*/
    //1.选中一个商品
    $("img.productIfSelect").click(function () {
        var sum = 0;
        var number = 0;

        var price="";
        var pid = $(this).attr("pid");
        var oiid = $(this).attr("oiid");
        var many=$("span.cartProductItemSmallSumPrice").text();
        var selectit = $(this).attr("selectit");
        if ("selectit" == selectit) {
            $("span.cartProductItemSmallSumPrice").each(function () {
            var pid1=$(this).attr("pid");
            if(pid1==pid){
                maxSum-=$(this).text().replace(/￥/g, "");
            }
            });

            $(".productIfSelect[pid=" + pid + "]").attr("selectit", "false");
            $(".productIfSelect[pid=" + pid + "]").attr("src", "images/site/cartNotSelected.png");
            $(".productIfSelect[pid=" + pid + "]").parents("tr.cartProductItemTR").css("background-color", "#FCFCFC");
                }
         else {
            $("a.cartProductLink").each(function () {//获取名称
                var pid2=$(this).attr("pid");
                if(pid2==pid){
                    name1.push($(this).text());
                }
            });
            $("span.cartProductItemSmallSumPrice").each(function () {//获取价格
                var pid2=$(this).attr("pid");
                if(pid2==pid){
                    pid1.push(pid2);
                    arry.push(new Number($(this).text().replace(/￥/g, "")));
                    maxSum+=new Number($(this).text().replace(/￥/g, ""));
                }
            });
            $("input.cartProductItemAmount").each(function () {//获取名称
                var pid2=$(this).attr("pid");
                if(pid2==pid){
                    count1.push($(this).val());
                }
            });
            $("img.productImage").each(function () {//获取名称
                var pid2=$(this).attr("pid");
                if(pid2==pid){
                    image.push($(this).attr("src"));
                }
            });
            var num = $("input.cartProductItemAmount").val();
            number += new Number(num);
            sum = sum.toFixed(2);
            /*将得到的信息进行响应的显示*/
            $(".productIfSelect[pid=" + pid + "]").attr("selectit", "selectit");
            $(".productIfSelect[pid=" + pid + "]").attr("src", "images/site/cartSelected.png");
            $(".productIfSelect[pid=" + pid + "]").parents("tr.cartProductItemTR").css("background-color", "#FFF8E1");
        }
        $("span.cartProductSumNumber").html(number);
        $("span.cartProductSumPrice").html("￥" + maxSum);
        syncSelectAll()
        syncOderButton();
    });
    //2.全选
    $("img.selectAllProduct").click(function () {
        var sum = 0;
        var number = 0;
        var arry=[];
        var price="";
        //var oiid = $(this).attr("oiid");并不需要没有意义
        var selectit = $(this).attr("selectit");
        if ("selectit" == selectit) {
            $(this).attr("selectit", "false");
            $(this).attr("src", "images/site/cartNotSelected.png");
            $("img.productIfSelect").each(function () {
                $(this).attr("selectit", "false");
                $(this).parents("tr.cartProductItemTR").css("background-color", "#FCFCFC");
                $(this).attr("src", "images/site/cartNotSelected.png");
            });
        } else {
            $("span.cartProductItemSmallSumPrice").each(function () {
                        arry.push($(this).text().replace(/￥/g, ""));
            });
            for (let i = 0; i < arry.length; i++) {
                maxSum += new Number(arry[i]);
            }
            var num = $("input.cartProductItemAmount").val();
            number += new Number(num);
            console.log(arry.toString());
            sum = sum.toFixed(2);
            $(this).attr("selectit", "selectit");
            $(this).attr("src", "images/site/cartSelected.png");
            $("img.productIfSelect").each(function () {
                $(this).attr("selectit", "selectit");
                $(this).parents("tr.cartProductItemTR").css("background-color", "#FFF8E1");
                $(this).attr("src", "images/site/cartSelected.png");
                $("span.cartProductSumNumber").html(number);
                $("span.cartProductSumPrice").html("￥" + maxSum);
            });
        }
        syncSelectAll();
        syncOderButton();

    });
    //对input添加事件
    $("input.cartProductItemAmount").bind('inputpropertychange', function () {
        var number = $(this).val();
        var oiid = $(this).attr("oiid");
        console.log("nnumber:" + number);
        console.log("oiid:" + oiid);
        updateOrderItemNumber(oiid, number);
    });
    $("input.cartProductItemAmount").change(function () {
        var number = $(this).val();
        var oiid = $(this).attr("oiid");
        console.log("nnumber:" + number);
        console.log("oiid:" + oiid);
        updateOrderItemNumber(oiid, number);
    });

    //删除勾选的商品(只有前台，没有后端的交互，所以是假的)这个以后进行完善
    $("a.deleteAllProduct").click(function () {
        var oiid = $(this).attr("oiid");
        //只要选中的就删除
        var selectAny = false;
        $("img.productIfSelect").each(function () {
            if ("selectit" == $(this).attr("selectit")) {
                $(this).parents("tr.cartProductItemTR").remove();
                selectAny = true;
            }
        });
        if (!selectAny) {
            alert("请选择宝贝");
        }

        syncSelectAll();
        syncOderButton();


    });
    $("#count").blur(function (){
        var number=$(this).val();
        var pid=$(this).attr("pid");
        var page="<%=request.getContextPath()%>/updateCart";
        if(number<=0){
            alert("请输入正确的数量");
        }
        else {
            $.post(
                page,
                {"count":number,"pid":pid},
                function (data){
                    if(data=="success"){
                        alert("修改成功");
                    }
                    else{
                        alert("修改失败");
                    }
                }
            )
        }
    })
    $("td.deleteCartProduct").click(function (){
        var pid3=$("#deleteA").attr("pid");
        console.log(pid3)
        var page="<%=request.getContextPath()%>/deleteCart";
        $.post(
            page,
            {"pid":pid3},
            function (data){
                if(data=="success"){
                    alert("删除成功！");
                }
                else {
                    alert(data);
                }
            }


        )
    })

</script>


<%@include file="footer.jsp" %>
