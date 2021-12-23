package com.soecode.lyf.service.impl;

import com.soecode.lyf.dao.evaluationDao;
import com.soecode.lyf.entity.evaluation;
import com.soecode.lyf.service.evaluationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class evaluationServiceImpl implements evaluationService {
    @Autowired
    private evaluationDao evaluationDao;
    @Override
    public void add(evaluation e) {
        evaluationDao.add(e);
    }

    @Override
    public List<evaluation> list() {
        return evaluationDao.list();
    }

    @Override
    public List<evaluation> listPid(int pid) {
        return evaluationDao.listPid(pid);
    }
}
