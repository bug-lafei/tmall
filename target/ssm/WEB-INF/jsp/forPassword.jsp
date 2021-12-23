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
        <form action="" method="post">
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
        <form action="<%=request.getContextPath()%>/PIN" method="post">
        <table align="center" class="registerTable">
            <tbody>
                <tr>
                    <td class="registerTip registerTableLeftTD">会员名</td>
                    <td></td>
                </tr>
                <tr>
                    <td class="registerTableLeftTD">登陆名</td>
                    <td class="registerTableRightTD">
                        <input type="text" placeholder="会员名" name="uname" id="uname" required>
                        <p style="color: red" id="error1"></p>
                    </td>
                </tr>
                <tr>
                    <td class="registerTip registerTableLeftTD">验证</td>
                    <td class="registerTableRightTD">该用户所绑定的邮箱<P id="emildetail"></P>
                        <input type="hidden" id="email4" value="">
                            <button type="submit" id="sendev">发送验证码</button><P id="info"></P>
                    </td>
                </tr>
                <tr>
                    <td class="registerTip registerTableLeftTD">输入验证</td>
                    <td class="registerTableRightTD">
                        <input type="text" placeholder="验证码" name="PIN" id="PIN" required>
                    </td>
                </tr>
                <tr>
                    <td class="registerButtonTD" colspan="2">
                        <button type="submit" id="bt1" >下一步</button>
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
            $("#uname").blur(function (){
                var uname=$("#uname").val();
                var page="<%=request.getContextPath()%>/selectByName";
                $.post(
                    page,
                    {"uname":uname},
                    function (data){
                        if(data=="fail"){
                            $("#emildetail").text("该用户尚未绑定邮箱，找回请联系管理");
                            $("#emildetail").css("color","red");
                        }
                        else if(data==''){
                            $("#emildetail").text("用户不存在");
                            $("#emildetail").css("color","red");
                        }
                        else {
                            $("#email4").val(data);
                            var cs=data.split('');
                            for (var  i = 5; i < data.length -5; i++) {
                                cs[i] = '*';
                            }
                            $("#emildetail").text(new String(cs.toString().replaceAll(',','')));
                            $("#emildetail").css("color","red");
                        }
                    }
                )
            })
            $("#sendev").click(function (){
                var page="<%=request.getContextPath()%>/sendInfo1";
                var email1=$("#emildetail").text();
                var uname=$("#uname").text();
               var email4= $("#email4").val();
                if(email1==("该用户尚未绑定邮箱，找回请联系管理") || email1=="用户不存在"){
                    $("#info").text("请确认邮箱存在");
                    $("#info").css("color", "red");
                }
                else{
                    if(email4!= null){
                        console.log(email4);
                        $.post(
                            page,{"email2":email4},function (data) {
                                if (data == "success") {
                                    $("#info").text("已发送");
                                    $("#info").css("color", "green");
                                }
                            }
                        )
                    }
                    else {
                        $("#info").text("邮箱不存在");
                        $("#info").css("color","red");
                    }
                }
            })
        })
    </script>
</html>