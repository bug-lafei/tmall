package com.soecode.lyf.util;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import java.util.Random;
public class email1 {
    public String send1(String emailString) throws EmailException {
        HtmlEmail email=new HtmlEmail();
        email.setHostName("smtp.qq.com");
        email.setCharset("utf-8");
        email.addTo(emailString);
        email.setFrom("3066617979@qq.com","天猫商城");//发送人的邮箱为自己的，用户名可以随便填
        email.setAuthentication("3066617979@qq.com","ilivjoorkvmadffa");
        email.setSubject("天猫商城密码修改");//设置发送主题
        Random r=new Random();

        StringBuffer s=new StringBuffer();
        for (int i = 0; i < 6; i++) {
            int i1 = r.nextInt(9);
            s.append(i1);
        }
        email.setMsg("验证码为："+s);//设置发送内容
        email.send();//进行发送
        return s.toString();
    }

}
