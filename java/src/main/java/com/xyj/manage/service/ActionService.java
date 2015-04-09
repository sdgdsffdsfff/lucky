package com.xyj.manage.service;

import com.xyj.manage.dao.ActionDAO;
import com.xyj.manage.entity.Action;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @classDescription:权限管理Service
 * @author:xiayingjie
 * @createTime:13-10-24 上午10:25
 */
@Service
@Transactional
public class ActionService {
    @Autowired
    private ActionDAO actionDAO;




    /**
     * 条件分页查询相关结果
     * @param specification
     * @param pageRequest
     * @return
     */
    public Page<Action> findAllActions(Specification specification, PageRequest pageRequest) {
        return this.actionDAO.findAll(specification,pageRequest);
    }

    /**
     * 删除
     *
     * @param id
     * @return
     */
    public void deleteActionById(int id) {
        this.actionDAO.delete(id);
    }

    /**
     * 根据id查找权限对象
     *
     * @param id
     * @return
     */
    public Action findActionById(int id) {
        return this.actionDAO.findOne(id);
    }

    /**
     * 增加或修改
     *
     * @param action
     * @return
     */
    public void saveAction(Action action) {
        this.actionDAO.save(action);
    }
}
