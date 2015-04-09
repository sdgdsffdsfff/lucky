package com.xyj.manage.dao;

import com.xyj.manage.entity.Action;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;


/**
 * @classDescription:动作权限操作DAO
 * @author:xiayingjie
 * @createTime:2013-9-13
 */
public interface ActionDAO extends JpaSpecificationExecutor<Action>, PagingAndSortingRepository<Action, Integer> {
     
}
