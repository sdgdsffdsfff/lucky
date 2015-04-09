package com.ttpod.lucky.entity;

import com.xyj.manage.entity.IdEntity;

import javax.persistence.*;
import java.util.Date;

/**
 * @classDescription:中奖信息
 * @author:xiayingjie
 * @createTime:14-4-2
 */
@Entity
@Table(name = "winprize")
public class Winprize  extends IdEntity implements java.io.Serializable {

    //多对一
    @ManyToOne(fetch = FetchType.LAZY,cascade={CascadeType.REFRESH,CascadeType.MERGE} ,optional = true)
    @JoinColumn(name = "prizeId")
    private Prize prize; //奖品类型
    private String taid ;//唯一用户标示
    private String content;//中奖人信息
    private String userName;//中奖人姓名
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="createTime",nullable=false)
    private Date createTime;//创建时间

    private String phone;//手机

    public Prize getPrize() {
        return prize;
    }

    public void setPrize(Prize prize) {
        this.prize = prize;
    }

    public String getTaid() {
        return taid;
    }

    public void setTaid(String taid) {
        this.taid = taid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
