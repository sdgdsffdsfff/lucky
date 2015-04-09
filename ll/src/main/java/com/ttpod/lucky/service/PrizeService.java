package com.ttpod.lucky.service;

import com.ttpod.lucky.dao.PrizeDAO;
import com.ttpod.lucky.entity.Prize;
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
public class PrizeService {


    @Autowired
    private PrizeDAO prizeDAO;


    /**
     * 查询所有的文章
     *
     * @return
     */
    public List<Prize> finAllPrizes() {
        return (List<Prize>) this.prizeDAO.findAll();
    }

    /**
     * 条件分页查询相关结果
     *
     * @return
     */
    public Page<Prize> findAllPrizes(Specification specification, PageRequest pageRequest) {
        return this.prizeDAO.findAll(specification, pageRequest);
    }

    /**
     * 条件分页查询相关结果
     *
     * @return
     */
    public Page<Prize> findAllPrizes(int page, int size) {
        Sort sort = new Sort(Sort.Direction.DESC, "orders");
        PageRequest pageRequest = new PageRequest(page, size, sort);
        return this.prizeDAO.findAll(pageRequest);

    }

    /**
     * 删除
     *
     * @return
     */
    public void deletePrizeById(int id) {
        this.prizeDAO.delete(id);
    }

    /**
     * 根据id查找文章对象
     *
     * @return
     */
    public Prize findPrizeById(int id) {
        return this.prizeDAO.findOne(id);
    }

    /**
     * 增加或修改
     *
     * @return
     */
    public void savePrize(Prize prize) {
        this.prizeDAO.save(prize);
    }


    public PrizeDAO getPrizeDAO() {
        return prizeDAO;
    }

    public void setPrizeDAO(PrizeDAO PrizeDAO) {
        this.prizeDAO = PrizeDAO;
    }

}
