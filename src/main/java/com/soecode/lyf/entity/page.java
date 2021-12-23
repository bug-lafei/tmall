package com.soecode.lyf.entity;

import java.util.List;

public class page {
    int pageCountItem;
    int pageNo;
    int pageSum;
    List ListItem;

    public int getPageCountItem() {
        return pageCountItem;
    }

    public void setPageCountItem(int pageCountItem) {
        this.pageCountItem = pageCountItem;
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getPageSum() {
        return pageSum;
    }

    public void setPageSum(int pageSum) {
        this.pageSum = pageSum;
    }

    public List getListItem() {
        return ListItem;
    }

    public void setListItem(List listItem) {
        ListItem = listItem;
    }
}
