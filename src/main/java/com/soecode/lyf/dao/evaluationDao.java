package com.soecode.lyf.dao;

import com.soecode.lyf.entity.evaluation;

import java.util.List;

public interface evaluationDao {
    public void add(evaluation e);
    public List<evaluation> list();
    public List<evaluation> listPid(int pid);
}
