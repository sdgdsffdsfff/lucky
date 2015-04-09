package com.xyj.manage.service;

import com.xyj.manage.dao.UserInfoDAO;
import com.xyj.manage.entity.UserInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @classDescription:账号管理service
 * @author:xiayingjie
 * @createTime:13-10-15 下午3:27
 */
@Service
@Transactional
public class AccountService {
    private static Logger logger = LoggerFactory.getLogger(AccountService.class);

    @Autowired
    private UserInfoDAO userInfoDAO;

    /**
     * 根据用户名密码进行登陆
     *
     * @param userName
     * @param password
     * @return
     */
    public UserInfo login(String userName, String password) {
        UserInfo u = this.userInfoDAO.findByUserName(userName);
        if (null != u) {
            if (u.getUserPassword().equals(password)) {
                return u;
            }
        }
        return null;
    }

    /**
     * 根据用户名查找到相关的用户
     *
     * @param userName
     * @return
     */
    public UserInfo findByUsername(String userName) {
        return this.userInfoDAO.findByUserName(userName);
    }


    /**
     * 条件分页查询相关结果
     *
     * @param specification
     * @param pageRequest
     * @return
     */
    public Page<UserInfo> findAllUsers(Specification specification, PageRequest pageRequest) {
        return this.userInfoDAO.findAll(specification, pageRequest);
    }

    /**
     * 删除
     *
     * @param id
     * @return
     */
    public void deleteUserById(int id) {
        this.userInfoDAO.delete(id);
    }

    /**
     * 根据id查找用户对象
     *
     * @param id
     * @return
     */
    public UserInfo findUserById(int id) {
        return this.userInfoDAO.findOne(id);
    }

    /**
     * 增加或修改
     *
     * @param userInfo
     * @return
     */
    public void saveUser(UserInfo userInfo) {
        this.userInfoDAO.save(userInfo);
    }
}
