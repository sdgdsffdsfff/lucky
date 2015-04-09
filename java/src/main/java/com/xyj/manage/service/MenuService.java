package com.xyj.manage.service;

import com.xyj.manage.dao.MenuDAO;
import com.xyj.manage.entity.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * @classDescription:菜单管理Service
 * @author:xiayingjie
 * @createTime:13-10-24 上午10:25
 */
@Service
@Transactional
public class MenuService {
    @Autowired
    private MenuDAO menuDAO;




    /**
     * 条件分页查询相关结果
     * @param specification
     * @param pageRequest
     * @return
     */
    public Page<Menu> findAllMenus(Specification specification, PageRequest pageRequest) {
        return this.menuDAO.findAll(specification,pageRequest);
    }
    /**
     * 查询所有的菜单
     * @return
     */
    public List<Menu> findAllMenus() {
        return (List<Menu>)this.menuDAO.findAll(new Sort(Sort.Direction.ASC, "orders"));
    }

    /**
     * 删除
     *
     * @param id
     * @return
     */
    public void deleteMenuById(int id) {
        this.menuDAO.delete(id);
    }

    /**
     * 根据id查找菜单对象
     *
     * @param id
     * @return
     */
    public Menu findMenuById(int id) {
        return this.menuDAO.findOne(id);
    }

    /**
     * 增加或修改
     *
     * @param menu
     * @return
     */
    public void saveMenu(Menu menu) {
        this.menuDAO.save(menu);
    }
}
