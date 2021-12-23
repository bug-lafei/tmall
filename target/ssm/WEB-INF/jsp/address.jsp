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
        <script type="text/javascript"
                src="https://api.map.baidu.com/api?v=2.0&ak=qF3jurSAccHiA36YenRi21HgAZcmuOXN"></script>
</head>
<style>
    table {
        width: 90%;
        background: #ccc;
        margin: 10px auto;
        border-collapse: collapse; /*border-collapse:collapse合并内外边距(去除表格单元格默认的2个像素内外边距*/
    }

    th, td {
        height: 25px;
        line-height: 25px;
        text-align: center;
        border: 1px solid #ccc;
    }

    th {
        background: #eee;
        font-weight: normal;
    }

    tr {
        background: #fff;
    }

    tr:hover {
        background: #cc0;
    }

    td a {
        color: #06f;
        text-decoration: none;
    }

    td a:hover {
        color: #06f;
        text-decoration: underline;
    }

    body {
        font-family: Tahoma, Roboto, Helvetica Neue, Airal, PingFang SC, Microsoft YaHei, 微软雅黑;
        font-size: 12px;
        line-height: 1.6;
    }

    body {
        font-family: Roboto, Helvetica Neue, Helvetica, Tahoma, Arial, PingFang SC, Microsoft YaHei;
        line-height: 1.28571;
        color: #333;
    }

    body, button, input, select, textarea {
        font: 12px/1.5 tahoma, arial, 'Hiragino Sans GB', '\5b8b\4f53', sans-serif;
    }

    html {
        font-size: 100%;
    }

    html {
        line-height: 1.15;
        -ms-text-size-adjust: 100%;
        -webkit-text-size-adjust: 100%;
    }

    .next-table, .next-table *, .next-table :after, .next-table :before {
        box-sizing: border-box;
    }

    *, :after, :before {
        box-sizing: border-box;
    }

    .next-table, .next-table *, .next-table :after, .next-table :before {
        box-sizing: border-box;
    }

    *, :after, :before {
        box-sizing: border-box;
    }

    .stamp {
        float: left;
        width: 150px;
        height: 140px;
        padding: 0 10px;
        position: relative;
        overflow: hidden;
    }

    .stamp:before {
        content: '';
        position: absolute;
        top: 0;
        bottom: 0;
        left: 10px;
        right: 10px;
        z-index: -1;
    }

    .stamp:after {
        content: '';
        position: absolute;
        left: 10px;
        top: 10px;
        right: 10px;
        bottom: 10px;
        box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.5);
        z-index: -2;
    }

    .stamp i {
        position: absolute;
        left: 20%;
        top: 45px;
        height: 190px;
        width: 390px;
        background-color: rgba(255, 255, 255, .15);
        transform: rotate(-30deg);
    }

    .stamp .par {
        float: left;
        padding: 16px 15px;
        width: 220px;
        border-right: 2px dashed rgba(255, 255, 255, .3);
        text-align: left;
    }

    .stamp .par p {
        color: #fff;
    }

    .stamp .par span {
        font-size: 50px;
        color: #fff;
        margin-right: 5px;
    }

    .stamp .par .sign {
        font-size: 34px;
    }

    .stamp .par sub {
        position: relative;
        top: -5px;
        color: rgba(255, 255, 255, .8);
    }

    .stamp .copy {
        display: inline-block;
        padding: 21px 14px;
        width: 100px;
        vertical-align: text-bottom;
        font-size: 30px;
        color: rgb(255, 255, 255);
    }

    .stamp .copy p {
        font-size: 16px;
        margin-top: 15px;
    }

    .stamp04 {
        width: 390px;
        background: #50ADD3;
        background: radial-gradient(rgba(0, 0, 0, 0) 0, rgba(0, 0, 0, 0) 4px, #50ADD3 4px);
        background-size: 12px 8px;
        background-position: -5px 10px;
    }

    .stamp04:before {
        background-color: #50ADD3;
        left: 5px;
        right: 5px;
    }

    .stamp04 .copy {
        padding: 10px 6px 10px 12px;
        font-size: 24px;
    }

    .stamp04 .copy p {
        font-size: 14px;
        margin-top: 5px;
        margin-bottom: 8px;
    }

    .stamp04 .copy a {
        background-color: #fff;
        color: #333;
        font-size: 14px;
        text-decoration: none;
        padding: 5px 10px;
        border-radius: 3px;
        display: block;
    }
</style>
<div class="categoryPageDiv">
    <!--对商品进行排序分类-->
    <div class="categorySortBar">
        <!--放排序按钮的table-->
        <!--放价格区间的table-->
        <h3>地址管理</h3>
        <button id="load_geolocation">获取地理位置</button>
    </div>
    <div class="categoryProducts">
        <form id="addForm" method="post" action="<%=request.getContextPath()%>/addAddress">
            <table class="addTable">

                <tbody style="text-align: center">
                <tr>
                    <td width="102">所在地区</td>
                    <td><input type="text" id="productName1" name="address" class="form-control"></td>
                </tr>
                <tr>
                    <td width="102">详情地址</td>
                    <td><input type="text" id="productName" name="detailAddress" class="form-control"></td>
                </tr>
                <tr>
                    <td>收货人</td>
                    <td><input type="text" id="subTitle" name="reciver" class="form-control"></td>
                </tr>
                <tr>
                    <td>收货人电话</td>
                    <td><input class="form-control" type="text" name="tel" id="originalPrice"></td>
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
        <table>
            <tr>

                <!-- th为表格标题栏-->

                <th>收件人</th>

                <th>所在地区</th>

                <th>详情地址</th>

                <th>联系电话</th>

                <th>操作</th>
            </tr>
            <c:forEach items="${addresses}" var="address">
                <tr>
                    <td>${address.receiver}</td>

                    <td>${address.address}</td>

                    <td>${address.detailAddress}</td>

                    <td>${address.tel}</td>
                    <td >
                        <a href=""aid="${address.id}" id="deleteAddress">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </table>

    <%--清除浮动？？！！emmmmm--%>
    <div style="clear: both"></div>

</div>



<script>
    $(function () {
        $("#deleteAddress").click(function () {
            var aid = $("#deleteAddress").attr("aid");
            console.log(aid);
            var page = "<%=request.getContextPath()%>/deleteAddress";
            $.post(
                page,
                {"aid": aid},
                function (data) {
                    if (data == "success") {
                        alert("删除成功");
                    } else {
                        alert("删除失败");
                    }
                }
            )
        });
        $("#load_geolocation").click(function (ev) {
            $(ev.currentTarget).text("正在获取位置......");
            //创建百度地图控件
            var geolocation = new BMap.Geolocation();
            geolocation.getCurrentPosition(function (r) {
                if (this.getStatus() == BMAP_STATUS_SUCCESS) {
                    //以指定的经度与纬度创建一个坐标点
                    var pt = new BMap.Point(r.point.lng, r.point.lat);
                    //创建一个地理位置解析器
                    var geoc = new BMap.Geocoder();
                    geoc.getLocation(pt, function (rs) {//解析格式：城市，区县，街道
                        var addComp = rs.addressComponents;
                        $("#productName1").val(addComp.city + ", " + addComp.district + ", " + addComp.street);
                    });
                } else {
                    alert("定位失败")
                }
            }, {enableHighAccuracy: true})//指示浏览器获取高精度的位置，默认false
        });
    });
</script>
<%@include file="footer.jsp" %>
