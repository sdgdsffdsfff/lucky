package com.ttpod.lucky.view.dto;

/**
 * @classDescription:
 * @author:xiayingjie
 * @createTime:14-4-11
 */
public class WinUser  implements java.io.Serializable{
    private String id;
    private String userName;
    private String product;
    private String Date;
    private String phone;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }


    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    public String getDate() {
        return Date;
    }

    public void setDate(String date) {
        Date = date;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
