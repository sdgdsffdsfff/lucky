package com.ttpod.lucky.dao;

import com.ttpod.lucky.entity.Prize;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * @classDescription:
 * @author:xiayingjie
 * @createTime:14-4-2
 */
public interface PrizeDAO extends JpaSpecificationExecutor<Prize>, PagingAndSortingRepository<Prize, Integer> {


    @Query("select sum(p.allCount)-sum(p.remainCount) from Prize p")
    public long getWinNumbers();

    @Query("select sum(p.remainCount) from Prize p")
    public long getRemainNumbers();

    @Modifying
    @Query("update Prize p set p.remainCount=p.remainCount-1 where p.id=?1")
    public int reducePrize(int id);


}
