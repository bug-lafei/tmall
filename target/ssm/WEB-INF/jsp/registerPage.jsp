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
        <form action="registerPage" method="post">
        <table align="center" class="registerTable">
            <tbody>
                <tr>
                    <td class="registerTip registerTableLeftTD">设置会员名</td>
                    <td></td>
                </tr>
                <tr>
                    <td class="registerTableLeftTD">登陆名</td>
                    <td class="registerTableRightTD">
                        <input type="text" placeholder="会员名一旦设置成功，无法修改" name="username" id="username" required>
                        <p style="color: red" id="error1"></p>
                    </td>
                </tr>
                <tr>
                    <td class="registerTip registerTableLeftTD">设置登陆密码</td>
                    <td class="registerTableRightTD">登陆时验证，保护账号信息</td>
                </tr>
                <tr>
                    <td class="registerTableLeftTD">登陆密码</td>
                    <td class="registerTableRightTD">
                        <input type="password" placeholder="设置你的登陆密码" name="password" id="password" required>
                    </td>
                </tr>
                <tr>
                    <td class="registerTableLeftTD">密码确认</td>
                    <td class="registerTableRightTD">
                        <input type="password" placeholder="请再次输入你的密码" id="repeatpassword" required>
                        <p style="color: red" id="error"></p>
                    </td>
                </tr>
                <tr>
                    <td class="registerButtonTD" colspan="2">
                        <button type="submit" id="bt1" disabled="true">提 交</button>
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
        $(function (){
            $("#repeatpassword").blur(function (){
                var value=this.value;
                var value1=$("#password").val();
                if(value!=value1){
                    $("#error").text("两次密码不一致");
                    $("#bt1").attr("disabled","true");
                }
                else if(value.length<6){
                    $("#error").text("密码不可以小于6位");
                }
                else {
                    $("#error").text("");
                    $("#bt1").attr("disabled",false);
                }

            });
            $("#username").blur(function (){
                var value=this.value;
                var user = {
                    number : username
                };
                $.getJSON("http://localhost:8080/ssm_war_exploded/ajaxCheck?username="+value,function (data) {
                    if (data.flag == true) {
                        $("#error1").text("该用户名已经被注册");
                    }
                    else if(value===''){
                        $("#error1").text("用户名不可以为空");
                        $("#error1").css("color","red");
                    }
                    else {
                        $("#error1").text("该用户名可用");
                        $("#error1").css("color","green");
                        $("#bt1").attr("disabled",false);
                    }
                });
            });
        });
    </script>
</html>