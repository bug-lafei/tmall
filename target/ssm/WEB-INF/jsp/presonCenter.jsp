<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<html lang="en">
<%--<script src="webjars/jquery/3.5.1/jquery.min.js"> </script>--%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>天猫tmall.com--理想生活上天猫</title>
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap/3.3.6/bootstrap.min.css">
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/registerPage.css">
</head>

<body>
<jsp:include page="header_nav.jsp"/>
    <!-- simpleSearchbar -->
    <div class="simpleSearchBar">
        <a href="#nowhere">
            <img id="simpleLogo" src="images/simpleLogo.png"/>
        </a>
        <form method="post">
            <div class="simpleSearchDiv pull-right">
                <input type="text" placeholder="平衡车 原汁机" name="keyword">
                <button type="submit">搜天猫</button>
                <div class="simpleSearchBelow">
                    <span>
                        <a href="#nowhere">冰箱</a> <span>|</span>
                    </span>
                    <span>
                        <a href="#nowhere">空调</a> <span>|</span>
                    </span>
                    <span>
                        <a href="#nowhere">男表</a> <span>|</span>
                    </span>
                    <span>
                        <a href="#nowhere">女表</a>
                    </span>
                </div>
            </div>
        </form>
    </div>
    <!-- 清除浮动 -->
    <div style="clear: both"></div>
    <!-- registerPage -->
    <div class="registerDiv">
        <form action="" method="post" id="formIn">
        <table align="center" class="registerTable">
            <tbody>
                <tr>
                    <td class="registerTip registerTableLeftTD">填写真实的资料，有助于好友找到你哦</td>
                </tr>
                <tr>
                    <td style="position:relative; left: 100px">头像</td>
                    <td style="position:relative; right: 50px"><img src="images/site/defaultHead.png"></td>
                </tr>
                <tr>
                    <td class="registerTip registerTableLeftTD">设置真实的信息</td>
                </tr>
                <tr>
                    <td class="registerTableLeftTD">用户姓名</td>
                    <td class="registerTableRightTD">

                        <input type="text"  name="username" id="username1" value="${presonCenter.u_name}" required/>
                    </td>
                </tr>
                <tr>
                    <td class="registerTableLeftTD">电话</td>
                    <td class="registerTableRightTD">
                        <input type="text" name="tel" value="${presonCenter.u_tel}" required>
                        <p style="color: red" id="error"></p>
                    </td>
                </tr>
                <tr>
                    <td class="registerTableLeftTD">邮箱</td>
                    <td class="registerTableRightTD">
                        <input type="text" name="email" id="email1" value="${presonCenter.u_email}"  required>
                    </td>
                    <td><a id="sendev"><button style="position:relative;right: 80px">发送验证码</button></a><p id="info"></p></td>
                </tr>
                    <tr>
                        <td class="registerTableLeftTD">验证码</td>
                        <td class="registerTableRightTD">
                            <input type="text" name="ev" required>

                        </td>
                    </tr>
                <tr>
                    <td class="registerButtonTD" colspan="2">
                        <button type="submit" id="bt1">提 交</button>
                    </td>
                </tr>
            </tbody>
        </table>
        </form>
    </div>
    <!-- pagefooter1 -->
    <div style="display: block" class="footer" id="footer">
        <div class="footer_ensure" id="footer_ensure">
            <a href="#nowhere">
                <img src="images/ensure.png">
            </a>
        </div>
        <div class="footer_desc" id="footer_desc">
            <div class="descColumn">
                <span class="descColumnTitle">购物指南</span>
                <a href="#nowhere">免费注册</a>
                <a href="#nowhere">开通支付宝</a>
                <a href="#nowhere">支付宝充值</a>
            </div>
            <div class="descColumn">
                <span class="descColumnTitle">天猫保障</span>
                <a href="#nowhere">发票保障</a>
                <a href="#nowhere">售后规则</a>
                <a href="#nowhere">缺货赔付</a>
            </div>
            <div class="descColumn">
                <span class="descColumnTitle">支付方式</span>
                <a href="#nowhere">快捷支付</a>
                <a href="#nowhere">信用卡</a>
                <a href="#nowhere">蚂蚁花呗</a>
                <a href="#nowhere">货到付款</a>
            </div>
            <div class="descColumn">
                <span class="descColumnTitle">商家服务</span>
                <a href="#nowhere">商家入驻</a>
                <a href="#nowhere">商家中心</a>
                <a href="#nowhere">天猫智库</a>
                <a href="#nowhere">天猫规则</a>
                <a href="#nowhere">物流服务</a>
                <a href="#nowhere">喵言喵语</a>
                <a href="#nowhere">运营服务</a>
            </div>
            <div class="descColumn">
                <span class="descColumnTitle">手机天猫</span>
                <a href="#nowhere">
                    <img src="images/ma.png">
                </a>
            </div>
        </div>
    </div>
    <div style="clear: both"></div>
    <!-- pagefooter2 -->
    <div class="footer" id="footer1">
        <img id="cateye" src="images/cateye.png">
        <div class="copyright" id="copyright">
            <div class="white_link">
                <a href="#nowhere">关于天猫</a>
                <a href="#nowhere">帮助中心</a>
                <a href="#nowhere">开放平台</a>
                <a href="#nowhere">诚聘英才</a>
                <a href="#nowhere">联系我们</a>
                <a href="#nowhere">网站合作</a>
                <a href="#nowhere">法律声明</a>
                <a href="#nowhere">知识产权</a>
                <a href="#nowhere">廉正举报</a>
            </div>
            <div class="white_link">
                <a href="#nowhere"> 阿里巴巴集团 </a> <span class="slash">|</span>
                <a href="#nowhere"> 淘宝网 </a> <span class="slash">|</span>
                <a href="#nowhere"> 天猫 </a> <span class="slash">|</span>
                <a href="#nowhere"> 聚划算 </a> <span class="slash">|</span>
                <a href="#nowhere"> 全球速卖通 </a> <span class="slash">|</span>
                <a href="#nowhere"> 阿里巴巴国际交易市场 </a> <span class="slash">|</span>
                <a href="#nowhere"> 1688 </a> <span class="slash">|</span>
                <a href="#nowhere"> 阿里妈妈 </a> <span class="slash">|</span>
                <a href="#nowhere"> 阿里旅行·去啊 </a> <span class="slash">|</span>
                <a href="#nowhere"> 阿里云计算 </a> <span class="slash">|</span>
                <a href="#nowhere"> 阿里通信 </a> <span class="slash">|</span>
                <a href="#nowhere"> YunOS </a> <span class="slash">|</span>
                <a href="#nowhere"> 阿里旅行·去啊 </a> <span class="slash">|</span>
                <a href="#nowhere"> 万网 </a> <span class="slash">|</span>
                <a href="#nowhere"> 高德 </a> <span class="slash">|</span>
                <a href="#nowhere"> 优视 </a> <span class="slash">|</span>
                <a href="#nowhere"> 友盟 </a> <span class="slash">|</span>
                <a href="#nowhere"> 虾米 </a> <span class="slash">|</span>
                <a href="#nowhere"> 天天动听 </a> <span class="slash">|</span>
                <a href="#nowhere"> 来往 </a> <span class="slash">|</span>
                <a href="#nowhere"> 钉钉 </a> <span class="slash">|</span>
                <a href="#nowhere"> 支付宝 </a>
            </div>
            <div class="license">
                <span>增值电信业务经营许可证： 浙B2-20110446</span>
                <span>网络文化经营许可证：浙网文[2015]0295-065号</span>
                <span>互联网医疗保健信息服务 审核同意书 浙卫网审【2014】6号</span>
                <span>互联网药品信息服务资质证书编号：浙-（经营性）-2012-0005</span>
                <div class="copyrightYear">© 2003-2016 TMALL.COM 版权所有</div>
                <div>
                </div>
            </div>
        </div>
    </div>
</body>
    <script>
        $(function () {
            $("#sendev").click(function (){
                var page="<%=request.getContextPath()%>/sendInfo";
                var email1=$("#email1").val();
                var username=$("#username1").val();
                $.post(
                    page,{"email2":email1,"username":username},function (data){
                        if(data=="success"){
                            $("#info").text("已发送");
                            $("#info").css("color","green");
                        }
                        else {
                            $("#info").text("邮箱或者姓名被注册");
                            $("#info").css("color","red");
                        }
                    }
                )
            })
            $("#bt1").click(function (){
                var page="<%=request.getContextPath()%>/addInfo";
                var data=$("#formIn").serialize();
                $.post(
                    page,
                    data,
                    function (data){
                        if(data=="success"){
                            alert("修改成功");
                            window.location.href="<%=request.getContextPath()%>/index";
                        }
                        else if(data=="exist"){
                            alert("改邮箱和姓名已被注册");
                        }
                        else {
                            alert("验证码错误");
                        }
                    }
                )
            })

        })
    </script>
</html>