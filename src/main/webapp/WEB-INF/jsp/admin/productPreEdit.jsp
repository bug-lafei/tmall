<%--
  Created by IntelliJ IDEA.
  User: warframe
  Date: 2017/9/2
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!--静态页面引入-->

<%@ include file="adminHeader.jsp"%>
<%@ include file="adminNav.jsp"%>


<!--通用编辑样式，便于管理-->
<div class="contentDiv">
    <div class="editTitle">
        <ol class="breadcrumb">
            <li><a href="<%=request.getContextPath()%>/admin/category/listAll">所有分类</a></li>
            <li><a href="<%=request.getContextPath()%>/admin/category/admin_category_list.do">${category.name}</a></li>
            <li><a href="#">${product.name}</a></li>
            <li class="active">编辑产品</li>
        </ol>
    </div>
    <div class="panel panel-warning editDiv">
        <div class="panel-heading">编辑产品</div>
        <div class="panel-body">
            <form action="<%=request.getContextPath()%>/admin/product/updateProduct" id="editForm" class="editForm" method="post">
                <input type="hidden" name="cid" value="${category.id}">
                <input type="hidden" name="pid" value="${product.id}"/>
                <input type="hidden" name="pageNum" value="${pageNum}">
                <table class="editTable">
                    <tbody>
                    <tr>
                        <td>产品名称</td>
                        <td><input type="text" id="productName" name="name" class="form-control" value="${product.name}"/></td>
                    </tr>
                    <tr>
                        <td>产品子标题</td>
                        <td><input type="text" id="subTitle" name="tittle" class="form-control" value="${product.tittle}"/></td>

                    </tr>
                    <tr>
                        <td>原价格</td>
                        <td><input type="text" id="originalPrice" name="oprice" class="form-control" value="${product.oprice}"/></td>
                    </tr>
                    <tr>
                        <td>优惠价格</td>
                        <td><input type="text" id="promotePrice" name="nprice" class="form-control" value="${product.nprice}"/></td>
                    </tr>
                    <tr>
                        <td>库存数量</td>
                        <td><input type="text" id="stock" name="store" class="form-control" value="${product.store}"/></td>
                    </tr>

                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <button type="submit" class="btn btn-success">提交</button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </div>


</div>


<script>
    $(function () {
        //进行非空判断
        $("form#editForm").submit(function () {
            if (!checkEmpty("productName", "产品名称")) {
                return false;
            }
            if (!checkEmpty("subTitle", "产品小标题")) {
                return false;
            }
            if (!checkNumber("originalPrice", "原始价格")) {
                return false;
            }
            if (!checkNumber("promotePrice", "优惠价格")) {
                return false;
            }
            if (!checkNumber("stock", "产品库存")) {
                return false;
            }

            return true;
        })


    })

</script>


<%@ include file="adminFooter.jsp"%>

