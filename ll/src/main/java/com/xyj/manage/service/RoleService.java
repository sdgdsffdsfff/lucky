package com.xyj.manage.service;

import com.xyj.manage.dao.RoleDAO;
import com.xyj.manage.entity.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @classDescription:角色管理Service
 * @author:xiayingjie
 * @createTime:13-10-24 上午10:25
 */
@Service
@Transactional
public class RoleService {
    @Autowired
    private RoleDAO roleDAO;


    /**
     * 查询所有的角色
     * @return
     */
    public List<Role> findAllRoles() {
        return (List<Role>) this.roleDAO.findAll();
    }

    /**
     * 条件分页查询相关结果
     * @param specification
     * @param pageRequest
     * @return
     */
    public Page<Role> findAllRoles(Specification specification, PageRequest pageRequest) {
        return this.roleDAO.findAll(specification,pageRequest);
    }

    /**
     * 删除
     *
     * @param id
     * @return
     */
    public void deleteRoleById(int id) {
        this.roleDAO.delete(id);
    }

    /**
     * 根据id查找角色对象
     *
     * @param id
     * @return
     */
    public Role findRoleById(int id) {
        return this.roleDAO.findOne(id);
    }

    /**
     * 增加或修改
     *
     * @param role
     * @return
     */
    public void saveRole(Role role) {
        this.roleDAO.save(role);
    }
}
