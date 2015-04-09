package com.xyj.manage.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * @classDescription:菜单对象
 * @author:xiayingjie
 * @createTime:2010-7-5
 */
@Entity
@Table(name = "menu")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Menu extends IdEntity  implements java.io.Serializable{
	
	private static final long serialVersionUID = -4522259504634124036L;
	
	@Column(name="menuName",length=50,nullable=false)
	private  String menuName;//显示名称
	@Column(name="parentId",nullable=false)
	private  int parentId=0;//父id,如果为顶级菜单则为0
	@Column(name="url",length=200,nullable=false)
	private  String url;//链接url
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="createTime",nullable=false)
	private Date createTime;//创建时间
	@Column(name="orders")
	private String orders ;//排序
	
	@Transient
	private List<Menu> childList = new ArrayList<Menu>();//子菜单
	
	
	/**
	 * @return the childList
	 */
	public List<Menu> getChildList() {
		return childList;
	}
	/**
	 * @param childList the childList to set
	 */
	public void setChildList(List<Menu> childList) {
		this.childList = childList;
	}

	/**
	 * @return the menuName
	 */
	public String getMenuName() {
		return menuName;
	}
	/**
	 * @param menuName the menuName to set
	 */
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	/**
	 * @return the parentId
	 */
	public int getParentId() {
		return parentId;
	}
	/**
	 * @param parentId the parentId to set
	 */
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	/**
	 * @return the url
	 */
	public String getUrl() {
		return url;
	}
	/**
	 * @param url the url to set
	 */
	public void setUrl(String url) {
		this.url = url;
	}


	/**
	 * @return the createTime
	 */
	public Date getCreateTime() {
		return createTime;
	}
	/**
	 * @param createTime the createTime to set
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	/**
	 * @return the orders
	 */
	public String getOrders() {
		return orders;
	}
	/**
	 * @param orders the orders to set
	 */
	public void setOrders(String orders) {
		this.orders = orders;
	}

	

}
