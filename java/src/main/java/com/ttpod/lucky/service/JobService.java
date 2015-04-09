package com.ttpod.lucky.service;

import com.ttpod.lucky.dao.PrizeDAO;
import com.ttpod.lucky.dao.WinprizeDAO;
import com.ttpod.lucky.entity.Prize;
import com.ttpod.lucky.entity.Winprize;
import com.xyj.manage.tool.redis.spring.RedisSpringUtil;
import org.apache.commons.lang.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * @classDescription:
 * @author:xiayingjie
 * @createTime:14-4-11
 */
@Service
@Transactional
public class JobService {
    @Autowired
    private WinprizeDAO winprizeDAO;

    @Autowired
    private PrizeDAO prizeDAO;

    @Autowired
    private RedisSpringUtil redisDAO;

    /**
     * 初始化用户信息
     */
    private void initUser(){
        redisDAO.delete("lk_users");
    }

    /**
     * 清理用户
     */
    private  void clearWinprize(){
        List<Winprize> winprizeList=this.winprizeDAO.findByUserName("");
        //如果超过3天未领奖的用户则清理
       for(Winprize winprize:winprizeList){
           Date date=DateUtils.addDays(winprize.getCreateTime(),3);
           Date today=new Date();
           if(today.getTime()>date.getTime()){
                Prize prize=winprize.getPrize();
                prize.setRemainCount(prize.getRemainCount()+1);
                winprizeDAO.delete(winprize.getId());
                prizeDAO.save(prize);
                redisDAO.delete("lk_win_users");
                redisDAO.delete("lk_win_numbers");
           }
       }
    }


    /**
     * 执行任务
     */
    public void job(){
        initUser();
        clearWinprize();
    }

    public WinprizeDAO getWinprizeDAO() {
        return winprizeDAO;
    }

    public void setWinprizeDAO(WinprizeDAO winprizeDAO) {
        this.winprizeDAO = winprizeDAO;
    }

    public PrizeDAO getPrizeDAO() {
        return prizeDAO;
    }

    public void setPrizeDAO(PrizeDAO prizeDAO) {
        this.prizeDAO = prizeDAO;
    }

    public RedisSpringUtil getRedisDAO() {
        return redisDAO;
    }

    public void setRedisDAO(RedisSpringUtil redisDAO) {
        this.redisDAO = redisDAO;
    }

}
