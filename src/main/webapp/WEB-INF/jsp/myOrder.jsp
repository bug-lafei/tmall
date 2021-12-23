<%--
  Created by IntelliJ IDEA.
  User: warframe
  Date: 2017/9/25
  Time: 19:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@include file="header_nav.jsp" %>



<!--这里面使用mybatis中的分页-->
<!--包含整个订单-->
<div class="orderDiv">
    <!--订单类型-->
    <div class="orderType">
        <div class="orderTypeSelected"><a href="#" orderStatus="all">所有订单</a></div>
        <div class="" href="#nowhere"><a href="#" orderStatus="waitPay">待付款</a></div>
        <div class="" href="#nowhere"><a href="#" orderStatus="waitDelivery">待发货</a></div>
        <div class="" href="#nowhere"><a href="#" orderStatus="waitConfirm">待收货</a></div>
        <div class="" href="#nowhere"><a class="noRightBorder" href="#" orderStatus="waitReview">待评价</a></div>
        <div class="orderTypeLastOne"></div>
    </div>
    <!--订单详情的表头包含宝贝，数量，单价，实付款，交易操作-->
    <div class="orderTitle">
        <!--订单表头的信息-->
        <table class="orderTitleTable">
            <tbody>
            <tr>
                <td>宝贝</td>
                <td width="100px">单价</td>
                <td width="100px">数量</td>
                <td width="120px">实付款</td>
                <td width="100px">交易操作</td>
            </tr>
            </tbody>
        </table>
    </div>
    <!--订单详细信息列表-->
    <div class="orderList" id="orderList">
        <c:choose>
            <c:when test="${myOrder==null}">
                <div class="orderIsNull" id="orderIsNull">
                    <img src="<%=request.getContextPath()%>/images/site/orderIsNull.png" alt="图片加载失败">
                    <span style="font-size: 14px;">没有符合条件的宝贝，请尝试其他搜索条件。</span>
                </div>

            </c:when>
            <c:otherwise>
                <c:forEach items="${myOrder}" var="order">
                    <!--这里一个订单就是一个表-->
                    <table class="orderListItemTable" oid="${order.id}" orderStatus="${order.status}">
                        <!--第一行显示订单编号以及订单创建时间-->
                        <tr class="orderListItemFirstTR">
                            <td colspan="2">
                                <b><fmt:formatDate value="${order.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></b>
                                <span>订单号:${order.orderCode}</span>
                            </td>
                            <td colspan="2">
                                    <%--TODO--%>
                                <img width="13px" src="<%=request.getContextPath()%>/images/site/tmallbuy.png"
                                     alt="图片加载失败">天猫商场
                            </td>
                            <td colspan="1">
                                <a href="#" class="wangwangLink">
                                    <div class="orderItemWangWangGif"></div>
                                </a>
                            </td>
                            <td class="orderItemDeleteTD">
                                <a class="deleteOrderLink" oid="${order.orderCode}" href="">
                                    <span class="glyphicon glyphicon-trash"></span>
                                </a>
                            </td>
                        </tr>
                        <!--第二行表示具体的订单项内容-->

                        <c:forEach items="${orderItems}" var="orderItem">
                            <c:if test="${order.orderCode eq orderItem.oid}">
                            <c:forEach items="${product}" var="product">
                                <c:if test="${orderItem.pid eq product.id}">
                                    <c:forEach items="${productImages}" var="productImage">
                                        <c:if test="${productImage.pid eq product.id and productImage.type eq 0}">
                            <tr class="orderListItemDetailTR">
                                <td class="orderListItemDetailTD" width="120px">
                                    <a href="#"><img
                                            width="80px" height="80px"
                                            src="/image/${productImage.image}"
                                            alt="图片加载失败"></a>
                                </td>
                                <td class="orderListItemDetailTD">
                                    <div class="orderListItemDetailLinkOutDiv">
                                        <a href="#">${product.name}</a>
                                        <div class="orderListItemDetailLinkInnerDiv">

                                            <img src="images/site/creditcard.png" alt="图片加载失败" title="相信我">
                                            <img src="images/site/promise.png" alt="图片加载失败" title="我保证">
                                        </div>
                                    </div>
                                </td>
                                <td width="100px" valign="top"
                                    class="orderListItemDetailOriginalAndPromotePrice orderListItemDetailTD">
                                    <div class="orderListItemDetailOriginalPrice">
                                <span style="text-decoration: line-through">
                                ￥${product.oprice}
                                </span>
                                    </div>
                                    <div class="orderListItemDetailPromotePrice">￥
                                            ${product.nprice}</div>
                                </td>
                                <td valign="top" width="100px" class="orderListItemDetailNumberTD orderListItemDetailTD"
                                    rowspan="1">
                                    <span class="orderListItemDetailNumber">${orderItem.number}</span>
                                </td>
                                <td width="120px" valign="top" class="orderListItemDetailPriceTD orderListItemDetailTD">
                                    <div class="orderListItemDetailRealPrice">￥${product.nprice*orderItem.number}</div>
                                    <div class="orderListItemDetailPriceWithTransport">(含运费:￥0.00)</div>
                                </td>
                                <td width="100px" valign="top"
                                    class="orderListItemDetailReviewTD orderListItemDetailTD">
                                    <!--对于订单的不同交易状态，提供不同的提示按钮-->
                                    <c:choose>
                                        <c:when test="${order.status == '未付款'}">
                                            <form action="<%=request.getContextPath()%>/payPage1" method="post">
                                            <a href="<%=request.getContextPath()%>/payPage1">
                                                <input type="hidden" name="orderCode" value="${order.orderCode}">
                                                <button type="submit" class="btn btn-primary btn-xs orderListItemConfirmBtn">付款
                                                </button>
                                                <p style="color: red">券后￥${order.totalPrice}</p>
                                            </a>
                                            </form>
                                        </c:when>
                                        <c:when test="${order.status == '已发货'}">
                                            <span>已发货</span>
                                            <a href="<%=request.getContextPath()%>/confirmDate?orderCode=${order.orderCode}">
                                                <button class="btn btn-primary btn-xs orderListItemConfirmBtn"
                                                        oid="${order.id}">确认收货
                                                </button>
                                            </a>
                                        </c:when>
                                        <c:when test="${order.status == '已付款'}">
                                            <span>待发货</span>
                                            <button class="btn btn-primary btn-xs callToDelivery" oid="${order.id}">
                                                催卖家发货
                                            </button>
                                        </c:when>
                                        <c:when test="${orderItem.isEvaluation == '否'}">
                                            <a href="<%=request.getContextPath()%>/evaluation?pid=${orderItem.pid}">
                                                <button class="orderListItemReviewBtn">评价</button>
                                            </a>
                                        </c:when>
                                        <c:when test="${'finish'==order.status}">
                                            <span>订单已完成</span>
                                        </c:when>
                                    </c:choose>
                                </td>
                            </tr>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                            </c:forEach>
                            </c:if>
                        </c:forEach>

                    </table>
                </c:forEach>

            </c:otherwise>

        </c:choose>


    </div>
</div>

<script>
    //load
    $(function () {
        $("a[orderStatus]").click(function () {
            var orderStatus = $(this).attr("orderStatus");

            var orderIsNull = document.getElementById("orderIsNull");
            if (orderIsNull != null) {
                //每次点击之前都将之前的空页面清除
                document.getElementById("orderList").removeChild(orderIsNull);
            }

            //$("div.orderList").remove($("div.orderIsNull"));

            if ("all" == orderStatus) {
                if(${orders==null}){
                    createOrderIsNullDiv();
                }else{
                    $("table.orderListItemTable").show();
                }
            } else {
                $("table.orderListItemTable").hide();
                var orderItemAccordWith = $("table.orderListItemTable[orderStatus=" + orderStatus + "]");
                if (orderItemAccordWith.length > 0) {
                    orderItemAccordWith.show();
                } else {
                    createOrderIsNullDiv();
                }

            }

            /*初始化被选中的orderType*/
            $("div.orderType div.orderTypeSelected").removeClass("orderTypeSelected");
            $(this).parent("div").addClass("orderTypeSelected");
        })
        $("a.deleteOrderLink").click(function () {
            var oid=$(this).attr("oid");
            var page="<%=request.getContextPath()%>/deleteOrder";
            $.post(
                page,
                {"OrderCode":oid},
                function (data) {
                    if(data=="success"){
                        alert("删除成功");
                    }
                    else{
                        alert(data);
                    }
                }
            )
        })


})



</script>

