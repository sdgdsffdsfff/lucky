package com.xyj.manage.service;

import com.xyj.manage.dao.ModuleDAO;
import com.xyj.manage.entity.Module;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @classDescription:模块管理Service
 * @author:xiayingjie
 * @createTime:13-10-24 上午10:25
 */
@Service
@Transactional
public class ModuleService {
    @Autowired
    private ModuleDAO moduleDAO;


    /**
     *查询所有结果
     * @return
     */
    public List<Module> findAllModules() {
        return (List<Module>) this.moduleDAO.findAll();
    }

    /**
     * 条件分页查询相关结果
     * @param specification
     * @param pageRequest
     * @return
     */
    public Page<Module> findAllModules(Specification specification, PageRequest pageRequest) {
        return this.moduleDAO.findAll(specification,pageRequest);
    }

    /**
     * 删除
     *
     * @param id
     * @return
     */
    public void deleteModuleById(int id) {
        this.moduleDAO.delete(id);
    }

    /**
     * 根据id查找模块对象
     *
     * @param id
     * @return
     */
    public Module findModuleById(int id) {
        return this.moduleDAO.findOne(id);
    }

    /**
     * 增加或修改
     *
     * @param module
     * @return
     */
    public void saveModule(Module module) {
        this.moduleDAO.save(module);
    }
}
