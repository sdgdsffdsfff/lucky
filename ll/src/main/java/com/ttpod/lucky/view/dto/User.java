package com.ttpod.lucky.view.dto;

import com.ttpod.lucky.entity.Prize;

/**
 * @classDescription:用户信息
 * @author:xiayingjie
 * @createTime:14-4-3
 */
public class User    implements java.io.Serializable{
    private String taid;//用户唯一标示
    private int count;//抽奖次数
    private int allCount;//抽奖总数
    private Prize prize=null;
    private boolean isGetPrize=false;
    private int status;//状态


    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public User(String taid, int count, int allCount ) {
        this.taid=taid;
        this.count=count;
        this.allCount=allCount;
    }

    public String getTaid() {
        return taid;
    }

    public void setTaid(String taid) {
        this.taid = taid;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getAllCount() {
        return allCount;
    }

    public void setAllCount(int allCount) {
        this.allCount = allCount;
    }

    public Prize getPrize() {
        return prize;
    }

    public void setPrize(Prize prize) {
        this.prize = prize;
    }

    public boolean isGetPrize() {
        return isGetPrize;
    }

    public void setGetPrize(boolean isGetPrize) {
        this.isGetPrize = isGetPrize;
    }
}
