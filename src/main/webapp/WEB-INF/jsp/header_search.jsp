<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>顶部搜索栏</title>
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap/3.3.6/bootstrap.min.css">
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/header_search.css">
    <link rel="stylesheet" href="css/searchByCategoryResult.css">
</head>

<body>
    <div>
        <a href="#"><img src="images/site/logo.gif" alt="" id="logo"></a>

        <div class="searchDiv">
            <form action="<%=request.getContextPath()%>/likeSelect" method="post">
                <input type="text" name="keyword" placeholder="包治百病 新款来袭">
                <button type="submit" class="searchButton">搜索</button>
            </form>
            <div class="searchBelow">
                <span><a href="#">衬衫男</a>   <span>|</span> </span>
                <span><a href="#">连衣裙</a>   <span>|</span> </span>
                <span><a href="#">四件套</a>   <span>|</span> </span>
                <span><a href="#">笔记本电脑</a>   <span>|</span> </span>
                <span><a href="#">奶粉</a>   <span>|</span> </span>
                <span><a href="#">运动鞋</a>    </span>
            </div>
        </div>
    </div>
</body>

</html>