package com.soecode.lyf.util;

public class anonymity {
    public static String getAnonymousName(String userName) {
        if (userName.length() <= 1) return "*";
        if (userName.length() == 2) return userName.substring(0, 1) + "*";

        char[] cs = userName.toCharArray();
        for (int i = 5; i < userName.length() - 5; i++) {
            cs[i] = '*';
        }
        return new String(cs);
    }
}
