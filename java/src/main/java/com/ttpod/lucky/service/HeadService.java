package com.ttpod.lucky.service;

import com.ttpod.lucky.dao.PrizeDAO;
import com.ttpod.lucky.dao.WinprizeDAO;
import com.ttpod.lucky.entity.Prize;
import com.ttpod.lucky.entity.Winprize;
import com.ttpod.lucky.view.dto.Global;
import com.ttpod.lucky.view.dto.User;
import com.xyj.manage.tool.EHCacheUtil;
import com.xyj.manage.tool.LotteryUtil;
import com.xyj.manage.tool.query.SpecificationUtil;
import com.xyj.manage.tool.redis.spring.RedisSpringUtil;
import com.xyj.manage.view.dto.QueryDTO;
import org.apache.commons.lang.math.RandomUtils;
import org.apache.commons.lang.time.DateUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * @classDescription:对外业务类
 * @author:xiayingjie
 * @createTime:14-4-3
 */
@Service
@Transactional
public class HeadService {

    @Autowired
    private WinprizeDAO winprizeDAO;

    @Autowired
    private PrizeDAO prizeDAO;

    @Autowired
    private RedisSpringUtil redisDAO;




    /**
     * 抽奖
     * lk_win_users taid:winprize
     * lk_users     taid:user
     * lk_win_numbers number:prizeid
     *
     * @return
     */
    public User draw(String taid,int drawBase) {

        boolean flag = false;
        User user = null;
        //初始化用户信息
        if (redisDAO.getRedisTemplate().hasKey("lk_users") == false) {
            Map usersMap = new HashMap();
            redisDAO.hmSet("lk_users", usersMap);
        }


        // (初始化中奖用户信息)
        if (redisDAO.getRedisTemplate().hasKey("lk_win_users") == false) {
            List<Winprize> winprizeList = (List<Winprize>) this.winprizeDAO.findAll();
            Map winprizeMap = new HashMap();
            for (Winprize winprize : winprizeList) {
                winprizeMap.put(winprize.getTaid(), winprize);
            }
            redisDAO.hmSet("lk_win_users", winprizeMap);

        }



        //判断用户的抽奖次数是否合乎标准，默认最大抽奖次数为3次
        if (redisDAO.hHasKey("lk_users", taid) == false) {
            user = new User(taid, 1, 3);
            redisDAO.hSet("lk_users", taid, user);
        } else {
            user = (User) redisDAO.hGet("lk_users", taid);
            //查询用户是否中过奖
            if (redisDAO.hHasKey("lk_win_users", taid)) {
                Winprize win= (Winprize) redisDAO.hGet("lk_win_users", taid);
                if(StringUtils.isBlank(win.getUserName())){
                    user.setStatus(2);
                }else{

                    if (user.getCount() < user.getAllCount()) {
                        user.setCount(user.getCount() + 1);
                        redisDAO.hSet("lk_users", taid, user);
                        user.setStatus(0);
                    } else {
                        user.setStatus(3);
                        return user;
                    }
                }
                return user;
            }
            //如果用户的最大抽奖次数大于已抽次数，则让其抽奖，否则直接返回失败
            if (user.getCount() < user.getAllCount()) {
                user.setCount(user.getCount() + 1);
                redisDAO.hSet("lk_users", taid, user);
            } else {
                user.setStatus(3);
                return user;
            }
        }

        //正式获取奖品
        return getPrize(user,drawBase);

    }


    /**
     * 生成随机中奖号码
     * @param drawBase
     */
    public void randomWinNum(int drawBase ){
        //中奖个数
        int nCount = (int) this.prizeDAO.getRemainNumbers();

        //生成中奖号码放入redis中
        int[] rNum = LotteryUtil.getRandomArray(0, drawBase, nCount);

        Map winNumberMap = new HashMap();
        List<Prize> prizeList = (List<Prize>) this.prizeDAO.findAll();
        int j = 0;
        for (Prize pr : prizeList) {
            for (int i = 0; i < pr.getRemainCount(); i++) {
                winNumberMap.put(rNum[j], pr.getId());
                j++;
            }
        }

        if(redisDAO.getRedisTemplate().hasKey("lk_win_numbers")==true){
            redisDAO.delete("lk_win_numbers");
        }
        redisDAO.hmSet("lk_win_numbers", winNumberMap);
    }
    /**
     * 获取奖品
     *
     * @param user 用户信息
     * @return
     */
    public User getPrize(User user,int drawBase) {

        //初始化中奖列表
        if (redisDAO.getRedisTemplate().hasKey("lk_win_numbers") == false) {

            randomWinNum(drawBase);
            //      select sum(tt.sy) from ( select a.prizeid ,b.count-a.remain sy  from (select prizeid, count(*) remain from winprize group by prizeId) a,prize b where a.prizeid=b.id ) tt

        }
        //随机生成中奖号码
        int winNumber = RandomUtils.nextInt(drawBase);

        //如果中奖，则往中奖表中添加一条数据，然后清除中奖号码缓存，否则直接提示没抽中
        if (redisDAO.hHasKey("lk_win_numbers", winNumber)) {
            Object obj=redisDAO.hGet("lk_win_numbers", winNumber);
            int prizeId =  Integer.parseInt(obj.toString());
            //删除中奖号码缓存
            redisDAO.hDelKey("lk_win_numbers",winNumber);
            Prize prize=this.getPrizeDAO().findOne(prizeId);

            //保存中奖号码
            Winprize winprize = new Winprize();
            winprize.setTaid(user.getTaid());
            winprize.setCreateTime(new Date());

            winprize.setPrize(prize);
            winprizeDAO.save(winprize);
            //减少奖品数量
            prizeDAO.reducePrize(prizeId);
            //给用户奖品
            user.setPrize(prize);
            user.setStatus(1);
            //同步到缓存中
            redisDAO.hSet("lk_win_users", user.getTaid(), winprize);


        }else{
            user.setStatus(0);
        }
        return user;
    }

    /**
     * 增加中奖人信息
     *
     * @return
     */
    public boolean addWinUser(String taid,String userName,String phone, String content) {
        boolean flag = false;
        Winprize winprize=null;
        try{
            winprize = this.winprizeDAO.findByTaid(taid);
        }catch(Exception e){}

        if (winprize != null) {
            //如果用户领过奖不能重复提交
            if (StringUtils.isBlank(winprize.getContent())) {
                winprize.setContent(content);
                winprize.setUserName(userName);
                winprize.setPhone(phone);
                this.winprizeDAO.save(winprize);
                flag = true;
                redisDAO.hSet("lk_win_users", taid, winprize);
                EHCacheUtil.remove("index");
            }
        }
        return flag;

    }

    /**
     * 获取首页 最多5条
     *
     * @return
     */
    public List<Winprize> getIndex() {

//        QueryDTO queryDTO=new QueryDTO();
//        queryDTO.setOrder("-createTime");
//        queryDTO.setSize(5);
//        queryDTO.setPage(1);
//       Specification specification = SpecificationUtil.bySearchFilter(new Map<String,String>(), Winprize.class);
//        PageRequest pageRequest = SpecificationUtil.getPageRequest(queryDTO);
//        Page<Winprize> winprizePage = winprizeDAO.findAll(specification,pageRequest);
        List<Winprize>winprizeList= (List<Winprize>) this.winprizeDAO.findAll();

        //获取中奖信息
        return winprizeList;
    }

    /**
     * 增加最大次数
     *
     * @return
     */
    public User addDraw(String taid) {
        User user = null;
        //给用户添加最大抽奖数，最大不能超过6次
        if (redisDAO.hHasKey("lk_users", taid) == true) {
            user = (User) redisDAO.hGet("lk_users", taid);
            if (user.getAllCount() < 6) {
                user.setAllCount(user.getAllCount() + 3);
                redisDAO.hSet("lk_users", taid, user);
            }else{
                user.setAllCount(7);
            }
        } else {
            user = new User(taid, 0, 4);
            redisDAO.hSet("lk_users", taid, user);
        }
        return user;
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

    public HeadService() {
    }
}
