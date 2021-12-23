package com.soecode.lyf.test;

import com.soecode.lyf.entity.presoncenter;
import com.soecode.lyf.service.impl.presonCenterServiceImpl;
import com.soecode.lyf.service.presonCenterService;
import org.junit.Test;

public class daoTest {

     presonCenterService presonCenterDao=new presonCenterServiceImpl();
    @Test
    public void test(){
        presoncenter presonCenter = presonCenterDao.selectOne(1);
        System.out.println(presonCenter.toString());
    }

}
