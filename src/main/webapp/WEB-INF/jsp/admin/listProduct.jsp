<%--
  Created by IntelliJ IDEA.
  User: warframe
  Date: 2017/7/13
  Time: 19:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="adminHeader.jsp" %>
<%@ include file="adminNav.jsp" %>

<!--显示对应分类的产品信息-->
<div class="listDiv">
    <!---面包树分类(breadcrumb)-->
    <ol class="breadcrumb">
        <li><a href="<%=request.getContextPath()%>/admin/category/admin_category_list.do">所有分类</a></li>
        <li><a href="#nowhere">${category.name}</a></li>
        <li class="active">产品管理</li>
    </ol>

    <c:choose>
        <c:when test="${cidError != null}">
            <h1><b>${cidError}</b></h1>
        </c:when>
        <c:otherwise>
            <!--显示产品信息的表格-->
            <table class="table table-bordered table-hover table-striped table-condensed">
                <!--表头-->
                <thead>
                <tr class="listTableTH">
                    <th>ID</th>
                    <th width="300px">产品名称</th>
                    <th width="400px">产品小标题</th>
                    <th>原价格</th>
                    <th>优惠价格</th>
                    <th>库存数量</th>
                    <th>图片管理</th>
                    <th>设置属性</th>
                    <th>编辑</th>
                    <th>删除</th>
                </tr>
                </thead>
                <!--表内容-->
                <tbody>
                <!--动态生成的对应产品信息-->
                <!--这里的product默认保存在-->
                <c:forEach items="${products}" var="product">
                    <tr class="productListTableContentTR" pid="${product.id}">
                        <td>${product.id}</td>
                        <td>${product.name}</td>
                        <td>${product.tittle}</td>
                        <td>￥${product.oprice}</td>
                        <td>￥${product.nprice}</td>
                        <td>${product.store}</td>

                        <!--产品图片管理-->
                        <td><a href="<%=request.getContextPath()%>/admin/product/listImage?pid=${product.id}"><span class="glyphicon glyphicon-picture"></span></a></td>
                        <!--产品属性值设置管理-->
                        <td><a href="<%=request.getContextPath()%>/admin/product/updatePage?pid=${product.id}"><span class="glyphicon glyphicon-th-list"></span></a></td>
                        <!--preEdit,需要的值为pid和当前页数pageNum-->
                        <td><a href="<%=request.getContextPath()%>/admin/product/updatePage?pid=${product.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
                        <!--使用ajax来实现产品的删除-->
                        <td>
                            <button pid="${product.id}" class="deleteRecord"><span
                                    class="glyphicon glyphicon-trash"></span></button>
                        </td>

                    </tr>
                </c:forEach>


                </tbody>
            </table>


            <!--分页
            在进入listProduct.jsp之前已经对相关信息进行了相对应的操作，例如在这个页面可以直接使用名为page的存储在request中的page分页对象
            -->
            <%@ include file="adminPage.jsp" %>
        </c:otherwise>
    </c:choose>

    <div class="panel panel-warning addDiv">
        <div class="panel-heading">新增产品</div>
        <div class="panel-body">
            <!--使用表单进行数据的上传(post方法)-->
            <!--在进行表单提交前需要将当前页面一些信息进行继续的传递 exp:pageNum(添加产品时候的页数，便于在添加产品之后仍然跳转到当前的页面数)-->
            <form id="addForm" method="post" action="<%=request.getContextPath()%>/admin/product/add">
                <input type="hidden" name="pageNum" value="${page.pageNum}">
                <input type="hidden" name="cid" value="${cid}">
                <table class="addTable">
                    <tbody style="text-align: left">
                    <tr>
                        <td width="102">产品名称</td>
                        <td><input type="text" id="productName" name="name" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>产品小标题</td>
                        <td><input type="text" id="subTitle" name="tittle" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>原价格</td>
                        <td><input class="form-control" type="text" name="oprice" id="originalPrice"></td>
                    </tr>
                    <tr>
                        <td>优惠价格</td>
                        <td><input type="text" id="promotePrice" name="nprice" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>库存数量</td>
                        <td><input type="text" id="stock" name="store" class="form-control"></td>
                    </tr>

                    <!--提交表单的按钮-->
                    <tr class="submitTR">
                        <!--两列并为一列-->
                        <td colspan="2">
                            <button type="submit" class="btn btn-success">提 交</button>
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

        //点击删除按钮式触发的事件
        $("button.deleteRecord").click(function () {
            var pid = $(this).attr("pid");
            //使用jQuery封装后的ajax
            $.ajax({
                url: "delete",
                data: "pid=" + pid,
                type: "GET",
                dataType: "json",
                success:function (data) {
                    window.location.href="<%=request.getContextPath()%>/admin/product/listAll?cid=${cid}"
                },
                error:function () {
                    alert("error:请先删除对应的照片");
                }
            });


            //alert(pid);
        });


        //提交之前进行格式的检验
        $("form#addForm").submit(function () {
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

        });


    })

</script>


<%@ include file="adminFooter.jsp" %>





