package com.ttpod.lucky.entity;

import com.xyj.manage.entity.IdEntity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @classDescription:
 * @author:xiayingjie
 * @createTime:14-4-8
 */
@Entity
@Table(name = "config")
public class Config extends IdEntity implements java.io.Serializable {
    private String jsonConfig;//配置
    private String aliasName;//别名

    public String getJsonConfig() {
        return jsonConfig;
    }

    public void setJsonConfig(String jsonConfig) {
        this.jsonConfig = jsonConfig;
    }

    public String getAliasName() {
        return aliasName;
    }

    public void setAliasName(String aliasName) {
        this.aliasName = aliasName;
    }
}
