package com.xyj.manage.dao;


import com.xyj.manage.entity.Module;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;


/**
 * @classDescription:用户操作DAO
 * @author:xiayingjie
 * @createTime:2013-9-13
 */

public interface ModuleDAO  extends JpaSpecificationExecutor<Module>, PagingAndSortingRepository<Module, Integer> {

}
