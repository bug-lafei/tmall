<%--
  Created by IntelliJ IDEA.
  User: warframe
  Date: 2017/6/7
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!--静态include，不会检查文件的变化-->
<%@include file="adminHeader.jsp" %>
<%@include file="adminNav.jsp" %>


<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=utf-8");
%>


<div class="contentDiv">
    <!--面包树结构的标题导航-->
    <h1 class="label label-info">分类管理</h1>
    <!--表格的样式使用了bootstrap中的表格样式包括带斑马线的、有边框的、有鼠标悬停状态的、更加紧凑的-->
    <table class="table table-striped table-bordered table-hover  table-condensed">
        <!--表头信息-->
        <thead>
        <tr class="listTableTH">
            <th>ID</th>
            <th>分类名称</th>
            <th>属性管理</th>
            <th>产品管理</th>
            <th>编辑</th>
            <th>删除</th>
        </tr>
        </thead>
        <!--具体信息-->
        <tbody>
        <c:forEach items="${listAllCategory}" var="category">
            <tr class="categoryListTableContentTR" cid="${category.id}">
                <td>${category.id}</td>
                <td>${category.name}</td>
                <td>
                    <a href="<%=request.getContextPath()%>/admin/property/admin_property_list.do?cid=${category.id}"><span
                            class="glyphicon glyphicon-th-list"></span></a></td>
                <td><a href="<%=request.getContextPath()%>/admin/product/listAll?cid=${category.id}"><span
                        class="glyphicon glyphicon-shopping-cart"></span></a></td>
                <td>
                    <a href="<%=request.getContextPath()%>/admin/category/updatePage?cid=${category.id}"><span
                            class="glyphicon glyphicon-edit"></span></a>
                    <!--实现模态窗口的编辑-->
                </td>
                <td>
                    <a href=<%=request.getContextPath()%>/admin/category/delete?id=${category.id}
                       deleteLink="true"><span class="glyphicon glyphicon-trash"></span></a>
                    <br>
                    <button cid="${category.id}" class="deleteRecord"><span class="glyphicon glyphicon-trash"></span>
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <%@ include file="adminPage.jsp" %>
</div>
<!--分类增加-->
<div class="panel panel-warning addDiv">
    <div class="panel-heading">新增分类</div>
    <div class="panel-body">
        <!--如果表单中存在文件上传的话，需要设置enctype为multipart/form-data-->
        <form id="addForm" method="post" action="<%=request.getContextPath()%>/admin/category/add">
            <table class="addTable">
                <tr>
                    <td>分类名称</td>
                    <td><input type="text" id="name" name="name" class="form-control"></td>
                </tr>

                <tr class="submitTR">
                    <td colspan="2" align="center">
                        <button type="submit" class="btn btn-success">提交</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>

</div>
<script>
    $(function () {
        $("button.deleteRecord").click(function () {
            var cid = $(this).attr("cid");
            $.ajax({
                url: "admin/category/detele",
                data: "cid=" + cid,
                type: "post",
                dataType: "json",
                success: function (data) {
                    //删除指定的标签
                    $("tr.categoryListTableContentTR[cid=" + cid + "]").remove();
                },
                error: function () {
                    alert("error:删除出错！！");
                }
            });
        })

        /*非空判断*/
        $("form#addForm").submit(function () {
            if (!checkEmpty("name", "分类名称")) {
                return false;
            }
            return true;
        })


    })

</script>
<%@include file="adminFooter.jsp" %>

