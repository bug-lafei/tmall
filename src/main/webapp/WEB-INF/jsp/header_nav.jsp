<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.css" rel="stylesheet">
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href="<%=request.getContextPath()%>/css/buyPage.css" rel="stylesheet"/>
    <link href="<%=request.getContextPath()%>/css/cartItem.css" rel="stylesheet"/>
    <link href="<%=request.getContextPath()%>/css/payPage.css" rel="stylesheet"/>
    <link href="<%=request.getContextPath()%>/css/myOrder.css" rel="stylesheet"/>
    <link href="<%=request.getContextPath()%>/css/payComplete.css" rel="stylesheet"/>
    <link href="<%=request.getContextPath()%>/css/reviewProduct.css" rel="stylesheet"/>
    <link rel="stylesheet" href="css/header_nav.css">

    <title>天猫置顶导航</title>
</head>
<body>
    <nav class="top">
        <a href="<%=request.getContextPath()%>/index">
            <span class="glyphicon glyphicon glyphicon-home redColor"></span>
            天猫首页
        </a>
        <c:if test="${not empty sessionScope.login}">
            <span>喵，欢迎${sessionScope.login.username}来到天猫</span>
            <a href="<%=request.getContextPath()%>/checkOut">注销</a>
        <span class="pull-right">
            <a href="<%=request.getContextPath()%>/presonCenter">个人中心</a>
            <a href="<%=request.getContextPath()%>/myOrder">我的订单</a>
            <a href="<%=request.getContextPath()%>/selectCoupon">我的卡卷</a>
            <a href="<%=request.getContextPath()%>/address">地址管理</a>
            <a href="<%=request.getContextPath()%>/myCart">购物车</a>

        </span>
        </c:if>
        <c:if test="${empty sessionScope.login}">
            <a href="<%=request.getContextPath()%>/login">请登录</a>
            <a href="<%=request.getContextPath()%>/registerPage">免费注册</a>
            <span class="pull-right">
            <a href="<%=request.getContextPath()%>/login">我的订单</a>
            <a href="#">
                <span class="glyphicon glyphicon-shopping-cart redColor"></span>
                购物车<strong>0</strong>件
            </a>
        </span>
        </c:if>
    </nav>
</body>
</html>