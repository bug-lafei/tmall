package com.soecode.lyf.entity;

import java.io.Serializable;

public class product {
    private int id;
    private String name;
    private String tittle;
    private float oprice;
    private float nprice;
    private int store;
    private int cid;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTittle() {
        return tittle;
    }

    public void setTittle(String tittle) {
        this.tittle = tittle;
    }

    public float getOprice() {
        return oprice;
    }

    public void setOprice(float oprice) {
        this.oprice = oprice;
    }

    public float getNprice() {
        return nprice;
    }

    public void setNprice(float nprice) {
        this.nprice = nprice;
    }

    public int getStore() {
        return store;
    }

    public void setStore(int store) {
        this.store = store;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }
}
