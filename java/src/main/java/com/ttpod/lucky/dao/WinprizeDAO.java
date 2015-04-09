package com.ttpod.lucky.dao;

import com.ttpod.lucky.entity.Winprize;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

/**
 * @classDescription:
 * @author:xiayingjie
 * @createTime:14-4-2
 */
public interface WinprizeDAO extends JpaSpecificationExecutor<Winprize>, PagingAndSortingRepository<Winprize, Integer> {

    public Winprize findByTaid(String taid);

    public List<Winprize> findByUserName(String userName);

}
