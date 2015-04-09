package com.xyj.manage.dao;


import com.xyj.manage.entity.Menu;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;


/**
 * @classDescription:菜单操作DAO
 * @author:xiayingjie
 * @createTime:2013-9-13
 */
public interface MenuDAO extends JpaSpecificationExecutor<Menu>, PagingAndSortingRepository<Menu, Integer> {


}
