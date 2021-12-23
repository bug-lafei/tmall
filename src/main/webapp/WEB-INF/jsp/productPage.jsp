<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: warframe
  Date: 2017/9/8
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="header_nav.jsp"></jsp:include>
<div class="simpleLogoAndSimpleSearchDiv">
    <a href="#"><img src="images/site/simpleLogo.png" class="simpleLogo"></a>

    <div class="simpleSearchDiv pull-right">
        <form action="#">
            <input type="text" name="keyword" placeholder="平衡车 榨汁机"/>
            <button type="submit" class="searchButton">搜天猫</button>
            <div class="searchBelow">
                <span>
                    <a href="">冰箱</a><span>|</span>
                    <a href="">空调</a><span>|</span>
                    <a href="">女表</a><span>|</span>
                    <a href="">男表</a>
                </span>
            </div>
        </form>
    </div>
</div>
<link rel="icon" href="<%=request.getContextPath()%>/img/site/favicon.png" type="image/x-icon"/>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/img/site/favicon.png" type="image/x-icon" />
<!--BootStrap3-->
<script src="<%=request.getContextPath()%>/js/jquery/2.0.0/jquery.min.js"></script>
<link href="<%=request.getContextPath()%>/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/bootstrap/3.3.6/bootstrap.min.js"></script>
<link href="<%=request.getContextPath()%>/css/productPage.css" rel="stylesheet"/>
<!--产品图片和价格标题等信息的展示-->
<div class="imgAndInfo">
    <!--产品图片-->
    <div class="imgInImgAndInfo">
        <c:forEach items="${oneListImage}" var="productImage">
            <c:if test="${productImage.type eq 0}">
                <img width="100px" class="bigImg" src="../../../image/${productImage.image}"
                alt="图片加载失败">
            </c:if>
        </c:forEach>
        <div class="smallImageDiv">
            <c:forEach items="${oneListImage}" var="productImage">
                <c:if test="${productImage.type eq 1}">
                    <img width="56px" src="../../../image/${productImage.image}"
                         alt="图片加载失败" class="smallImage"
                         bigImageURL="../../../image/${productImage.image}">
                </c:if>
            </c:forEach>
        </div>
        <div class="image4load hidden"></div>
    </div>
    <!--产品详情-->
    <form action="" method="post" id="add">
    <div class="infoInImgAndInfo">
        <div class="productTitle" name="name">${oneProduct.name}</div>
        <div class="productSubTitle" >${oneProduct.tittle}</div>
        <input type="hidden" name="pid" value="${oneProduct.id}">
        <input type="hidden" name="nprice" value="${oneProduct.nprice}">
        <input type="hidden" name="tittle" value="${oneProduct.tittle}">
        <div class="productPrice">
            <div class="juhuasuan">
                <span class="juhuasuanBig">聚划算</span>
                <span>此商品即将参加聚划算，<span class="juhuasuanTime">1天19小时</span>后开始，</span>
            </div>
            <div class="productPriceDiv">
                <div class="gouwuqjuanDiv">
                    <img height="16px" src="images/site/gouwujuan.png">
                    <span>全天猫实物商品通用</span>
                </div>
                <!--原价格-->
                <div class="originalDiv">
                    <span class="originalPriceDesc">价格</span>
                    <span class="originalPriceYuan">¥</span>
                    <span class="originalPrice">
                        ${oneProduct.oprice}
                    </span>
                </div>
                <!--促销价-->
                <div class="promotionDiv">
                    <span class="promotionPriceDesc">促销价 </span>
                    <span class="promotionPriceYuan">¥</span>
                    <span class="promotionPrice">
                        ${oneProduct.nprice}
                    </span>
                </div>

            </div>
        </div>

        <div class="productSaleAndReviewNumber">
            <div>销量 <span class="redColor boldWord">${1}</span></div>
            <div>累计评价 <span class="redColor boldWord">${1}</span></div>
        </div>

        <div class="productNumber">
            <span>数量</span>
            <!--设置购买数量-->
            <span>
                    <span class="productNumberSettingSpan">
                        <input type="text" value="1" class="productNumberSetting" name="count" id="count">
                    </span>
                    <span class="arrow">
                        <a href="#" class="increaseNumber">
                            <span class="updown"><img src="images/site/increase.png"></span>
                        </a>
                        <span class="updownMiddle"> </span>
                        <a href="#" class="decreaseNumber">
                            <span class="updown"><img src="images/site/decrease.png"></span>
                        </a>
                    </span>
                    件
                </span>
            <span class="productStock" stock="${oneProduct.store}">库存${oneProduct.store}件</span>
        </div>

        <div class="serviceCommitment">
            <span class="serviceCommitmentDesc">服务承诺</span>
            <span class="serviceCommitmentLink">
                <a href="#nowhere">正品保证</a>
                <a href="#nowhere">极速退款</a>
                <a href="#nowhere">赠运费险</a>
                <a href="#nowhere">七天无理由退换</a>
            </span>
        </div>

        <div class="buyDiv">
            <!--参数为pid-->
<%--            <a href="" class="buyLink">--%>
<%--                <button class="buyButton">立即购买</button>--%>
<%--            </a>--%>
            <a href="" class="buyLink">
                <button class="addCartButton" type="submit" id="buy"><span class="glyphicon glyphicon-shopping-cart"></span>立即购买</button>
            </a>
            <a href="#" class="addCartLink">
                <button class="addCartButton" type="submit" id="addCart"><span class="glyphicon glyphicon-shopping-cart"></span>加入购物车</button>
            </a>
        </div>
    </div>
    </form>
    <!--??，貌似是进行样式删除的-->
    <div style="clear:both"></div>
</div>

<!--产品详情和用户评论---并且商品详情为点击-->
<div class="productDetailDiv" style="display: block">

    <!--商品详情和用户评论选项框-->
    <div class="productDetailTopPart">
        <a href="#nowhere" class="productDetailTopPartSelectedLink selected">商品详情</a>
        <a href="#nowhere" class="productDetailTopPartReviewLink">累计评价<span
                class="productDetailTopReviewLinkNumber">${product.reviewCount}</span></a>
    </div>
    <!--产品参数div-->
    <div class="productParameterPart">
        <div class="productParameter">产品参数:</div>
        <div class="productParameterList">
            <c:forEach items="${propertyValueCustomList}" var="propertyValue">
                <span>${propertyValue.propertyName}：${propertyValue.value}</span>
            </c:forEach>
        </div>
        <div style="clear: both;"></div>
    </div>
    <!--商品详情处的图片部分-->
    <div class="productDetailImagesPart">
        <!--放图片-->
        <c:forEach items="${product.productDetailImage}" var="detailImage">
            <div>
                <img src="<%=request.getContextPath()%>/img/productImage/${detailImage.id}.jpg" alt="图片加载失败">
            </div>

        </c:forEach>
    </div>
</div>

<!--产品详情和累计评论----并且累计评论为点击 -->
<div class="productReviewDiv" style="display: block">
    <!--商品详情和用户评论选项框-->
    <div class="productReviewTopPart">
        <a href="#nowhere" class="productDetailTopPartSelectedLink">商品详情</a>
        <a href="#nowhere" class="productDetailTopPartReviewLink selected">累计评价<span
                class="productDetailTopReviewLinkNumber">${product.reviewCount}</span></a>
    </div>
    <!--累计评论所在div-->
    <div class="productReviewContentPart">
        <c:forEach items="${evaluations}" var="evaluation">
            <!--一条评论的div-->
            <div class="productReviewItem">
                <!--评论-->
                <div class="productReviewItemDesc">
                    <!--评论的具体内容-->
                    <div class="productReviewItemContent">
                            ${evaluation.message}
                    </div>
                    <!--评论的时间-->
                    <div class="productReviewItemDate">${evaluation.createDate}</div>
                </div>
                <!--评论的用户-->
                <div class="productReviewItemUserInfo">
                    <!--不显示用户的详细昵称-->

                        ${evaluation.uid}<span class="userInfoGrayPart">（匿名）</span>

                </div>

                <div style="clear: both"></div>
            </div>
        </c:forEach>
    </div>


</div>


<!--交互-->
<script>
    $(function () {
        <!--大小图片的交互-->
        $("img.smallImage").mouseenter(function () {
            //对于HTML元素本身就带有的固有属性，在处理时，使用prop方法
            //对于HTML元素我们自己自定义的DOM属性，在处理时，使用attr方法
            var bigImageURL = $(this).attr("bigImageURL");
            $("img.bigImg").attr("src", bigImageURL);

            $("img.smallImage").each(function () {
                $(this).css('border-color','white');
            });
            $(this).css('border-color','black');
        });
        $("#buy").click(function (){
            $("#add").attr('action',"<%=request.getContextPath()%>/order");
        })
        //价格的交互
        var stock = $("span.productStock").attr("stock");
        $(".productNumberSetting").keyup(function () {
            var num = $(".productNumberSetting").val();
            num = parseInt(num);
            if (isNaN(num)) {
                num = 1;
            }
            if (num <= 0) num = 1;
            if (num > stock) num = stock;
            $(".productNumberSetting").val(num);

        });

        $("a.increaseNumber").click(function () {
            var num = $(".productNumberSetting").val();
            num++;
            if (num > stock) num = stock;
            $(".productNumberSetting").val(num);
        });
        $("a.decreaseNumber").click(function () {
            var num = $(".productNumberSetting").val();
            --num;
            if (num <= 0) num = 1;
            $(".productNumberSetting").val(num);
        });


        //商品详情和累计评论的交互
        $("div.productReviewDiv").hide();
        $("a.productDetailTopPartReviewLink").click(function () {
            $("div.productDetailDiv").hide();
            $("div.productReviewDiv").show();
        });
        $("a.productDetailTopPartSelectedLink").click(function () {
            $("div.productReviewDiv").hide();
            $("div.productDetailDiv").show();
        });
        $("a.addCartLink").click(function () {
            var count=$("#count").val();
            console.log(count)
            var page="<%=request.getContextPath()%>/addCart";
            $.post(
                page,
                {pid:${oneProduct.id},count:count},
                function (data) {
                    if ("success" == data) {
                        alert("加入成功");


                    } else if("no user" == data){
                       var b=confirm("请先登录");
                       if(b==true){
                           window.location.href="<%=request.getContextPath()%>/login";
                       }
                    }
                }
            )
        })
    });

</script>