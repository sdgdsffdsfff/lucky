package com.ttpod.lucky.service;

import com.ttpod.lucky.dao.WinprizeDAO;
import com.ttpod.lucky.entity.Winprize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @classDescription:
 * @author:xiayingjie
 * @createTime:13-10-29 下午3:09
 */
@Service
@Transactional
public class WinprizeService {


    @Autowired
    private WinprizeDAO winprizeDAO;


    /**
     * 查询所有的文章
     *
     * @return
     */
    public List<Winprize> findAllWinprizes() {
        return (List<Winprize>) this.winprizeDAO.findAll();
    }

    /**
     * 条件分页查询相关结果
     *
     * @return
     */
    public Page<Winprize> findAllWinprizes(Specification specification, PageRequest pageRequest) {
        return this.winprizeDAO.findAll(specification, pageRequest);
    }

    /**
     * 条件分页查询相关结果
     *
     * @return
     */
    public Page<Winprize> findAllWinprizes(int page, int size) {
        Sort sort = new Sort(Sort.Direction.DESC, "orders");
        PageRequest pageRequest = new PageRequest(page, size, sort);
        return this.winprizeDAO.findAll(pageRequest);

    }

    /**
     * 删除
     *
     * @return
     */
    public void deleteWinprizeById(int id) {
        this.winprizeDAO.delete(id);
    }

    /**
     * 根据id查找文章对象
     *
     * @return
     */
    public Winprize findWinprizeById(int id) {
        return this.winprizeDAO.findOne(id);
    }

    /**
     * 增加或修改
     *
     * @return
     */
    public void saveWinprize(Winprize Winprize) {
        this.winprizeDAO.save(Winprize);
    }


    public WinprizeDAO getWinprizeDAO() {
        return winprizeDAO;
    }

    public void setWinprizeDAO(WinprizeDAO WinprizeDAO) {
        this.winprizeDAO = WinprizeDAO;
    }

}
