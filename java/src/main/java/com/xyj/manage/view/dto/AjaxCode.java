package com.xyj.manage.view.dto;

/**
 * @classDescription:
 * @author:xiayingjie
 * @createTime:13-10-23 下午3:40
 */
public class AjaxCode {
    private int code=1 ;//0表示失败，1表示成功
    private String msg="ok";//返回信息描述符
    private Object data; //设置返回对象

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
