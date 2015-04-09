package com.xyj.manage.dao;


import com.xyj.manage.entity.Role;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;


/**
 * @classDescription:角色操作DAO
 * @author:xiayingjie
 * @createTime:2013-9-13
 */

public interface RoleDAO  extends JpaSpecificationExecutor<Role>, PagingAndSortingRepository<Role, Integer> {
   
	
}
