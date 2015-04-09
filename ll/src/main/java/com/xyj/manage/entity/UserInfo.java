package com.xyj.manage.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

/**
 * @classDescription:用户类
 * @author:xiayingjie
 * @createTime:2010-7-5
 */
@Entity
@Table(name = "userinfo")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class UserInfo  extends IdEntity implements java.io.Serializable{

	private static final long serialVersionUID = 6749326735019568778L;
	
	@Column(name="userName",length=50,nullable=false)
	private String userName;//用户名
	@Column(name="userPassword",length=50,nullable=false)
	private String userPassword;//用户密码
	@Column(name="email",length=100)
	private String email;//email
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="createTime",nullable=false)
	private Date createTime;//注册时间
    
	//多对多
	@ManyToMany
	@JoinTable(name="userrole",inverseJoinColumns={@JoinColumn(name="roleId")},joinColumns={@JoinColumn(name="userId")})
	//Fecth策略定义
	@Fetch(FetchMode.SUBSELECT)
	//集合按id排序.
	@OrderBy("id")
	//集合中对象id的缓存
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private Set<Role> roles=new HashSet<Role>(0);

	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * @return the userPassword
	 */
	public String getUserPassword() {
		return userPassword;
	}

	/**
	 * @param userPassword the userPassword to set
	 */
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}


	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
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
	 * @return the roles
	 */
	public Set<Role> getRoles() {
		return roles;
	}

	/**
	 * @param roles the roles to set
	 */
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}




	

 


}