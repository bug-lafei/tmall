<%--
  Created by IntelliJ IDEA.
  User: warframe
  Date: 2017/9/30
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>


<%@include file="header_nav.jsp" %>
<!--评价页面-->
<div class="reviewDiv">
    <!--评价商品的详细信息-->
    <div class="reviewProductInfoDiv">
        <div class="reviewProductImage">
            <c:forEach items="${byId}" var="productImage">
                <c:if test="${productImage.type eq 0}">
                    <img width="460px" height="460px" src="../../../image/${productImage.image}" alt="图片加载失败">
                </c:if>
            </c:forEach>

        </div>
        <div class="reviewProductRightDiv">
            <!--商品的详细信息表-->
            <table class="reviewProductInfoTable" width="526px">
                <tr>
                    <td colspan="2"><h4>${product.tittle}</h4></td>
                </tr>
                <tr>
                    <td class="reviewProductTD" width="75px">价格</td>
                    <td><strong class="reviewProductPromotePrice">
                        ${product.nprice}</strong><span>元</span></td>
                </tr>
                <tr>
                    <td class="reviewProductTD">配送</td>
                    <td>快递：<span class="productTransportPrice">0.00</span></td>
                </tr>
                <tr>
                    <td class="reviewProductTD">月销量</td>
                    <td><strong class="reviewProductMonthSaleNumber">${product.store}</strong> 件</td>
                </tr>
            </table>
            <div class="reviewProductInfoRightBelowDiv">
                <span class="reviewProductInfoRightBelowImage"><img src="image/site/reviewLight.png"/></span>

            </div>
        </div>
        <div style="clear:both;"></div>
    </div>
    <!--评价-->
    <div class="reviewProductDiv">
        <!--显示累计评价-->
        <!--评价的标题设置-->
        <div class="reviewProductTitle">
            <div class="reviewProductTitleLeft">
                <div class="reviewProductTitleLeftTop"></div>
                <div class="reviewProductTitleContent">累计评价<span class="reviewProductCommentNumber">${product}</span></div>
                <div class="reviewProductTitleLeftFoot"></div>
            </div>
            <div class="reviewProductTitleRight">
                <div class="reviewProductTitleRightTopEmpty"></div>
                <div class="reviewProductTitleRightFoot"></div>
            </div>
        </div>
        <!--评价的具体Content-->
        <div class="reviewProductContentDiv">
            <!--表单评价内容的提交-->
            <form method="post" action="<%=request.getContextPath()%>/addEvaluation">
                <input type="hidden" name="pid" value="${product.id}">
                <input type="hidden" name="uid" value="${user.id}">
                <div class="reviewProductContentText">其他买家，需要你的建议哦！</div>
                <!--一行两列的表格：评价商品----评价内容-->
                <table class="reviewProductContentTable">
                    <tbody>
                    <tr>
                        <td width="69px">评价商品</td>
                        <td><textarea class="reviewProductTextArea" name="message"></textarea></td>
                    </tr>
                    </tbody>
                </table>
                <!--进行提交-->
                <div class="submitButtonDiv">
                    <button type="submit" class="reviewProductSubmitButton">提交评价</button>
                </div>

            </form>
        </div>

    </div>
</div>



<%@include file="footer.jsp" %>