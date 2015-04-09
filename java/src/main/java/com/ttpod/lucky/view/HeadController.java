package com.ttpod.lucky.view;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.ttpod.lucky.entity.Winprize;
import com.ttpod.lucky.service.HeadService;
import com.ttpod.lucky.view.dto.Global;
import com.ttpod.lucky.view.dto.User;
import com.ttpod.lucky.view.dto.WinUser;
import com.xyj.manage.tool.EHCacheUtil;
import com.xyj.manage.tool.redis.spring.RedisSpringUtil;
import com.xyj.manage.view.dto.QueryDTO;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

/**
 * @classDescription:前端开放接口
 * @author:xiayingjie
 * @createTime:14-4-3
 */
@Controller
@RequestMapping()
public class HeadController extends BaseController {

    @Autowired
    HeadService headService;

    @Autowired
    RedisSpringUtil redisDAO;

    Gson gson = new GsonBuilder()
            .excludeFieldsWithoutExposeAnnotation() //不导出实体中没有用@Expose注解的属性
            .enableComplexMapKeySerialization() //支持Map的key为复杂对象的形式
            .serializeNulls()
            .setDateFormat("yyyy-MM-dd HH:mm:ss")//时间转化为特定格式
//             .setDateFormat(DateFormat.LONG)
                    // .setFieldNamingPolicy(FieldNamingPolicy.UPPER_CAMEL_CASE)//会把字段首字母大写,注:对于实体上使用了@SerializedName注解的不会生效.
            .setPrettyPrinting() //对json结果格式化.
            .setVersion(1.0)    //有的字段不是一开始就有的,会随着版本的升级添加进来,那么在进行序列化和返序列化的时候就会根据版本号来选择是否要序列化.
                    //@Since(版本号)能完美地实现这个功能.还的字段可能,随着版本的升级而删除,那么
                    //@Until(版本号)也能实现这个功能,GsonBuilder.setVersion(double)方法需要调用.
            .create();

    //抽奖
    @RequestMapping(value = {"draw"})
    public void draw(HttpServletRequest request, HttpServletResponse response, String taid, String callback) {

        if(StringUtils.isBlank(taid)){
            this.out(response, "{\"code\": 0,\"msg\": \"参数出错\"}", callback);
            return;
        }


        Global g = initGlobal();
        Map map = new HashMap<String, Object>();
        User user = headService.draw(taid, g.getDrawBase());
        Map userMap = new HashMap();


        userMap.put("count", user.getCount());
        userMap.put("all_count", user.getAllCount());
        userMap.put("status", user.getStatus());
        map.put("code", 1);
        if (user.getPrize() != null) {

            map.put("msg", "恭喜中了" + user.getPrize().getPrizeName() + "一台");
            userMap.put("product_name", user.getPrize().getPrizeName());
            userMap.put("product_pic", user.getPrize().getPic());
            userMap.put("type", user.getPrize().getType());

        } else {
            if (user.isGetPrize()) {
                map.put("msg", "赶快去领取奖品吧");

            } else {
                map.put("msg", "未中奖");
            }

        }

        map.put("data", userMap);
        String json = gson.toJson(map);

        this.out(response, json, callback);

    }


    //首页
    @RequestMapping(value = {"index"})
    public void index(HttpServletRequest request, HttpServletResponse response, String callback) {
        //初始化首页信息
        Map map = new HashMap<String, Object>();
        initEcache();
        Object obj = EHCacheUtil.get("index");
        List<Winprize> winprizes = null;
        if (obj == null) {
            winprizes = headService.getIndex();
            EHCacheUtil.put("index", winprizes);
        } else {
            winprizes = (List<Winprize>) obj;
        }

        map.put("code", 1);
        map.put("msg", "ok");
        List list = new ArrayList();
        for (Winprize winprize : winprizes) {
            if (!StringUtils.isBlank(winprize.getUserName())) {
                HashMap dataMap = new HashMap();
                dataMap.put("user_name", winprize.getUserName());
                dataMap.put("product", winprize.getPrize().getPrizeName());
                dataMap.put("date", winprize.getCreateTime());
                dataMap.put("phone", winprize.getPhone());
                list.add(dataMap);
            }
        }
        //获取其他中奖信息
        Map omap = redisDAO.hGetAll("lk_otherUsers");

        if (null != omap) {
            Set set = omap.entrySet();

            Iterator iterator = set.iterator();

            while (iterator.hasNext()) {
                Map.Entry mapentry = (Map.Entry) iterator.next();
                WinUser winUser = (WinUser) mapentry.getValue();

                HashMap dataMap = new HashMap();
                dataMap.put("user_name", winUser.getUserName());
                dataMap.put("product", winUser.getProduct());
                dataMap.put("date", winUser.getDate());
                dataMap.put("phone",winUser.getPhone());
                list.add(dataMap);

            }
        }


        map.put("data", list);

        redisDAO.getRedisTemplate().hasKey("");


        String json = gson.toJson(map);

        this.out(response, json, callback);
    }

    //增加抽奖次数
    @RequestMapping(value = {"addDraw"})
    public void addDraw(HttpServletRequest request, HttpServletResponse response, String taid, String callback) {
        Map map = new HashMap<String, Object>();
        User user = headService.addDraw(taid);

        Map dataMap = new HashMap();
        if (user != null) {
            if (user.getAllCount() < 7) {
                map.put("code", 1);
                map.put("msg", "ok");
            } else {
                user.setAllCount(6);
                map.put("code", 70102);
                map.put("msg", "增加抽奖次数已达到上限");
            }

            dataMap.put("count", user.getCount());
            dataMap.put("all_count", user.getAllCount());
        }
        map.put("data", dataMap);
        String json = gson.toJson(map);

        this.out(response, json, callback);
    }

    //增加抽奖用户
    @RequestMapping(value = {"addWinUser"})
    public void addWinUser(HttpServletRequest request, HttpServletResponse response, String taid,String user_name,String phone ,String content, String callback) {
        Map map = new HashMap<String, Object>();

        boolean flag = this.headService.addWinUser(taid, user_name,phone,content);
        if (flag) {
            map.put("code", 1);
            map.put("msg", "ok");
            //同步中奖信息到首页
            this.initEcache();
            EHCacheUtil.remove("index");
        } else {
            map.put("code", 70103);
            map.put("msg", "领奖失败");
        }
        String json = gson.toJson(map);

        this.out(response, json, callback);
    }




    //输出
    private void out(HttpServletResponse response, String str, String callback) {
        try {
            if (!StringUtils.isBlank(callback)) {
                str = callback + "(" + str + ")";
            }
            response.setHeader("Content-Type", "application/json");
            response.getWriter().write(str);

        } catch (IOException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }

    }
}
