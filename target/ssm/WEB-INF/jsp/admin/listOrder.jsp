<%--
  Created by IntelliJ IDEA.
  User: warframe
  Date: 2017/6/8
  Time: 8:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="adminHeader.jsp" %>
<%@include file="adminNav.jsp" %>


<div class="listDiv">
    <!--面包树结构的标题导航-->
    <h1 class="label label-info">订单管理</h1>

    <table class="table tale-hover table-bordered table-striped table-condensed">
        <!--表头信息-->
        <thead>
        <tr class="listTableTH">
            <th>ID</th>
            <th>状态</th>
            <th>金额</th>
            <th>买家名称</th>
            <th>创建时间</th>
            <th>支付时间</th>
            <th>发货时间</th>
            <th>确认收货时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <!--具体信息-->
        <tbody>
        <c:forEach items="${orders}" var="order">
            <tr class="orderListTableContentTR" style="font-size: 14px">
                <td>${order.id}</td>
                <td>${order.status}</td>
                <td>${order.totalPrice}</td>
                <td>${order.uid}</td>
                <td><fmt:formatDate value="${order.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td><fmt:formatDate value="${order.payDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td><fmt:formatDate value="${order.deliveryDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td><fmt:formatDate value="${order.confirmDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>

                <td>
                    <c:if test="${'未付款'==order.status}">
                        <button class="btn btn-primary btn-xs showDetails" oid="${order.id}">查看详情</button>
                        <button class="btn disabled btn-primary btn-xs">待买家付款</button>
                    </c:if>
                    <c:if test="${'已付款'==order.status}">
                        <button class="btn btn-primary btn-xs showDetails" oid="${order.id}">查看详情</button>
                        <a href="<%=request.getContextPath()%>/admin/order/delivery?orderCode=${order.orderCode}">
                            <button class="btn btn-primary btn-xs">发货</button>
                        </a>
                    </c:if>
                    <c:if test="${'已发货'==order.status}">
                        <button class="btn btn-primary btn-xs showDetails" oid="${order.id}">查看详情</button>
                        <button class="btn btn-primary disabled btn-xs">待买家确认收货</button>
                    </c:if>
                    <c:if test="${'已收货'==order.status}">
                        <button class="btn btn-primary btn-xs showDetails" oid="${order.id}">查看详情</button>
                        <button class="btn btn-primary disabled btn-xs">待买家评价</button>
                    </c:if>
                    <c:if test="${'已评价'==order.status}">
                        <button class="btn btn-primary btn-xs showDetails" oid="${order.id}">查看详情</button>
                        <button class="btn btn-primary disabled btn-xs">订单完成</button>
                    </c:if>

                </td>

            </tr>
            <%--默认隐藏--%>
            <%--在点击查看详请是，从隐藏状态toggle出来--%>
            <tr class="orderItemDetailTR" oid="${order.id}" style="display: none">
                <%--这里从来span为10是因为要跟上面的列td一样--%>
                <td colspan="10" align="center">
                    <div class="orderItemDetail">
                        <table width="800px" align="center" class="orderItemsTable">
                            <c:forEach items="${list}" var="orderItem">
                                <c:if test="${orderItem.uid eq order.uid}">
                                    <c:if test="${orderItem.oid eq order.orderCode}">
                                <tr>
                                    <td align="left">
                                        <c:forEach items="${productImages}" var="productImage">



                                            <c:if test="${productImage.pid eq orderItem.pid && productImage.type eq 0}">
                                                <img width="40px" height="40px" src="../../../image/${productImage.image}"
                                                     alt="图片加载失败">
                                            </c:if>

                                        </c:forEach>
                                    </td>
                                    <c:forEach items="${productList}" var="product">
                                        <c:if test="${product.id eq orderItem.pid}">
                                    <td>
<%--                                        <a href="<%=request.getContextPath()%>/getProductDetail.do?pid=${orderItem.product.id}&cid=${orderItem.product.category.id}" target="_blank">--%>
                                            <span>${product.tittle}</span>
                                        </a>
                                    </td>
                                    <td align="right">
                                        <span class="text-muted">${orderItem.number}个</span>
                                    </td>
                                    <td align="right">
                                        <span class="text-muted">单价：￥${product.nprice}</span>
                                    </td>

                                        </c:if>
                                    </c:forEach>
                                </tr>
                                    </c:if>
                            </c:if>
                            </c:forEach>
                        </table>
                    </div>
                </td>
            </tr>

        </c:forEach>

        </tbody>
    </table>


    <%@ include file="adminPage.jsp" %>
</div>

<script>
    $(function () {
        $("button.showDetails").click(function () {
            var oid = $(this).attr("oid");
            $("tr.orderItemDetailTR[oid=" + oid + "]").toggle();
        })
    })
</script>


<%@include file="adminFooter.jsp" %>
