package com.xyj.manage.dao;

import com.xyj.manage.entity.UserInfo;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;


/**
 * @classDescription:用户操作DAO
 * @author:xiayingjie
 * @createTime:2013-9-13
 */

public interface UserInfoDAO extends JpaSpecificationExecutor<UserInfo>, PagingAndSortingRepository<UserInfo, Integer> {

    /**
     * 根据用户名查询用户
     * @param userName
     * @return
     */
    public UserInfo findByUserName(String userName);


}
