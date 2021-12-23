package com.soecode.lyf.entity;

public class presoncenter {
    private int id;
    private int uid;
    private String uemail;
    private String utel;
    private String uname;

    public int getId() {
        return id;
    }

    @Override
    public String toString() {
        return "presonCenter{" +
                "id=" + id +
                ", uid=" + uid +
                ", u_email='" + uemail + '\'' +
                ", u_tel='" + utel + '\'' +
                ", u_name='" + uname + '\'' +
                '}';
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getU_email() {
        return uemail;
    }

    public void setU_email(String u_email) {
        this.uemail = u_email;
    }

    public String getU_tel() {
        return utel;
    }

    public void setU_tel(String u_tel) {
        this.utel = u_tel;
    }

    public String getU_name() {
        return uname;
    }

    public void setU_name(String u_name) {
        this.uname = u_name;
    }
}
