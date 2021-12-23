package com.soecode.lyf.service;

import com.soecode.lyf.entity.evaluation;

import java.util.List;

public interface evaluationService {
    public void add(evaluation e);
    public List<evaluation> list();
    public List<evaluation> listPid(int pid);
}
