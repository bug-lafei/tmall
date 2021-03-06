<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>登录界面</title>
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap/3.3.6/bootstrap.min.css">
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/footer.css">
</head>
<body>
    <!--登录-->
    <div id="loginDiv">
        <div class="simpleLogo">
            <img src="images/site/simpleLogo.png">
        </div>
        <img src="images/site/loginBackground.jpg" class="loginBackgroundImg" id="loginBackgroundImg">
        <div class="loginSmallDiv" id="loginSamllDiv">
            <div class="login_acount_text">账号登录</div>

            <form method="post" id="form1">
                <div class="loginInput">
                <span class="loginInputIcon">
                    <span class="glyphicon glyphicon-user"></span>
                </span>
                    <input type="text" placeholder="手机/会员名/邮箱" name="username" id="name">
                </div>
                <div class="loginInput">
                <span class="loginInputIcon">
                    <span class="glyphicon glyphicon-lock"></span>
                </span>
                    <input type="password" placeholder="密码" name="password" id="password">
                    <label id="error" style="color: red"></label>
                </div>
            </form>
            <div style="margin-top:20px">
                <button type="button" class="btn btn-block redButton" id="loginButton">登录</button>
            </div>

            <div>
                <a href="<%=request.getContextPath()%>/forgetP" class="forgetPassword">忘记密码</a>
                <a href="<%=request.getContextPath()%>/registerPage" class="freeRegister">免费注册</a>
            </div>

        </div>

    </div>


        <!--页脚-->
        <div class="footer" id="footer">
        <div class="footer_ensure" id="footer_ensure">
            <a><img src="images/site/ensure.png" alt=""></a>
        </div>

        <div class="footer_desc" id="footer_desc">
            <div class="descColumn">
                <span class="descColumnTitle">购物指南</span>
                <a href="#">免费注册</a>
                <a href="#">开通支付宝</a>
                <a href="#">支付宝充值</a>
            </div>
            <div class="descColumn">
                <span class="descColumnTitle">天猫保障</span>
                <a href="#">发票保障</a>
                <a href="#">售后规则</a>
                <a href="#">缺货赔付</a>
            </div>
            <div class="descColumn">
                <span class="descColumnTitle">支付方式</span>
                <a href="#">快捷支付</a>
                <a href="#">信用卡</a>
                <a href="#">蚂蚁花呗</a>
                <a href="#">货到付款</a>
            </div>
            <div class="descColumn">
                <span class="descColumnTitle">商家服务</span>
                <a href="#">商家入驻</a>
                <a href="#">商家中心</a>
                <a href="#">天猫智库</a>
                <a href="#">天猫规则</a>
                <a href="#">物流服务</a>
                <a href="#">喵言喵语</a>
                <a href="#">运营服务</a>
            </div>

            <div class="descColumn">
                <span class="descColumnTitle">手机天猫</span>
                <a href="#"><img src="images/site/ma.png"></a>
            </div>
        </div>
        <div style="clear:both"></div>
    </div>


    <div class="footer">
        <img src="images/site/cateye.png" class="cateye" id="cateye">
        <div class="copyright" id="copyright">
            <div class="white_link">
                <a href="#">关于天猫</a>
                <a href="#">帮助中心</a>
                <a href="#">开放平台</a>
                <a href="#">诚聘英才</a>
                <a href="#">联系我们</a>
                <a href="#">网站合作</a>
                <a href="#">法律声明</a>
                <a href="#">知识产权</a>
                <a href="#">廉政举报</a>
            </div>

            <div class="white_link">
                <a href="#"> 阿里巴巴集团</a><span class="slash">|</span>
                <a href="#"> 淘宝网</a><span class="slash">|</span>
                <a href="#">天猫 </a><span class="slash">|</span>
                <a href="#">  聚划算</a><span class="slash">|</span>
                <a href="#">全球速卖通</a><span class="slash">|</span>
                <a href="#">阿里巴巴国际交易市场</a><span class="slash">|</span>
                <a href="#">1688</a><span class="slash">|</span>
                <a href="#">阿里妈妈</a><span class="slash">|</span>
                <a href="#">  阿里旅行·去啊  </a><span class="slash">|</span>
                <a href="#">  阿里云计算    </a><span class="slash">|</span>
                <a href="#">  阿里通信     </a><span class="slash">|</span>
                <a href="#">  YunOS    </a><span class="slash">|</span>
                <a href="#">  阿里旅行·去啊  </a><span class="slash">|</span>
                <a href="#">   万网  </a><span class="slash">|</span>
                <a href="#">  高德   </a><span class="slash">|</span>
                <a href="#"> 优视    </a><span class="slash">|</span>
                <a href="#">  友盟   </a><span class="slash">|</span>
                <a href="#">  虾米   </a><span class="slash">|</span>
                <a href="#">  天天动听 </a><span class="slash">|</span>
                <a href="#">  来往   </a><span class="slash">|</span>
                <a href="#">  钉钉   </a><span class="slash">|</span>
                <a href="#">  支付宝      </a>
            </div>

            <div class="license">
                <span>增值电信业务经营许可证： 浙B2-20110446</span>
                <span>网络文化经营许可证：浙网文[2015]0295-065号</span>
                <div>互联网药品信息服务资质证书编号：浙-（经营性）-2012-0005</div>
                <div class="copyRightYear">© 2003-2017 TMALL.COM 版权所有</div>
                <div>
                    <img src="images/site/copyRight1.jpg">
                    <img src="images/site/copyRight2.jpg">
                </div>
            </div>

        </div>
    </div>

</body>
<script>
    $(function (){
        $("#loginButton").click(function () {
            $.getJSON("http://localhost:8080/ssm_war_exploded/ajaxLogin",$("#form1").serialize(),function (data) {
                if(data.flag==true){
                    window.location.href="http://localhost:8080/ssm_war_exploded/index";
                }
                else {
                    $("#error").text("用户名或者密码错误");
                }

            })
        });
    });
</script>
</html>