package com.ttpod.lucky.entity;

import com.xyj.manage.entity.IdEntity;

import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * @classDescription:奖品
 * @author:xiayingjie
 * @createTime:14-4-2
 */
@Entity
@Table(name = "prize")
public class Prize extends IdEntity implements java.io.Serializable {

    private String prizeName;//奖品名称

    private int allCount;//奖品数量

    private int remainCount;//剩余数量

    private String pic;//图片

    private int type;//类型，1为彩票，2为奖品



    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "createTime", nullable = false)
    private Date createTime;//创建时间

    @OneToMany(
            cascade = CascadeType.ALL,
            mappedBy = "prize",
            fetch = FetchType.LAZY

    )
    private Set<Winprize> winprizes = new HashSet<Winprize>(0);


    public Set<Winprize> getWinprizes() {
        return winprizes;
    }

    public void setWinprizes(Set<Winprize> winprizes) {
        this.winprizes = winprizes;
    }

    public String getPrizeName() {
        return prizeName;
    }

    public void setPrizeName(String prizeName) {
        this.prizeName = prizeName;
    }

    public int getAllCount() {
        return allCount;
    }

    public void setAllCount(int allCount) {
        this.allCount = allCount;
    }

    public int getRemainCount() {
        return remainCount;
    }

    public void setRemainCount(int remainCount) {
        this.remainCount = remainCount;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

}
