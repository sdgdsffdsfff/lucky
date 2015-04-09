import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.ttpod.lucky.dao.PrizeDAO;
import com.ttpod.lucky.dao.WinprizeDAO;
import com.ttpod.lucky.entity.Prize;
import com.ttpod.lucky.entity.Winprize;
import com.ttpod.lucky.service.HeadService;
import com.xyj.manage.dao.UserInfoDAO;
import com.xyj.manage.entity.UserInfo;
import com.xyj.manage.tool.LotteryUtil;
import com.xyj.manage.tool.query.SpecificationUtil;
import com.xyj.manage.tool.redis.spring.RedisSpringUtil;
import com.xyj.manage.view.dto.QueryDTO;
import org.apache.commons.lang.math.RandomUtils;
import org.apache.commons.lang.time.DateUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created with IntelliJ IDEA.
 * User: xiayingjie
 * Date: 13-9-17
 * Time: 下午3:29
 * To change this template use File | Settings | File Templates.
 */
public class Test {
    public static void main(String[] args) {

        // Print out the dates
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//        System.out.println("Date 1: " + sdf.format(DateUtils.addDays(DateUtils.truncate(new Date(),Calendar.DATE), 1).getTime()));
//
//        System.out.println("Date 2: " + sdf.format(DateUtils.truncate(new Date(), Calendar.DATE)));


 //       System.out.println("Date 2: " + sdf.format(c2.getTime()));
        // 设定Spring的profile

        System.setProperty("spring.profiles.active", "props_dev");
        String []cons={"classpath:spring/applicationContext.xml"}   ;
        ApplicationContext contex=new FileSystemXmlApplicationContext(cons);

//       HeadService hs= (HeadService) contex.getBean("headService");

//        //获取首页
// //     hs.getIndex();
//  //      hs.addWinUser("23","asdf","asdf","asdf");
//        hs.draw("456456");


//
//        PrizeDAO prizeDAO= (PrizeDAO) contex.getBean("prizeDAO");
//        long s=prizeDAO.getWinNumbers();
//        System.out.println(s);

//

      System.out.println("hello");
       WinprizeDAO winprizeDAO = (WinprizeDAO) contex.getBean("winprizeDAO");
     //  List<Winprize> winprizes= winprizeDAO.findByUserName("123");
        List<Winprize> list= (List<Winprize>) winprizeDAO.findAll();
//        QueryDTO queryDTO=new QueryDTO();
//        queryDTO.setOrder("-createTime");
//        queryDTO.setSize(5);
//        queryDTO.setPage(1);
//        Map map=new HashMap<String, String>();

//        PageRequest pageRequest = SpecificationUtil.getPageRequest(queryDTO);
        PageRequest pr=new PageRequest(1,5,new Sort(Sort.Direction.DESC,"createTime"));
        Page<Winprize> winprizePage = winprizeDAO.findAll(pr);

        System.out.println("222");

 //      RedisSpringUtil redisDAO= (RedisSpringUtil) contex.getBean("redisDAO");
//        Winprize winprize=new Winprize();
//        Prize p=new Prize();
//        p.setId(1);
//        winprize.setPrize(p);
//        winprize.setCreateTime(new Date());
//        winprize.setTaid("234");
//        winprize.setLuckyNumber("23423");


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

//        String s=gson.toJson(winprizeDAO.findOne(8));
 //       System.out.println(s);
//          Map<Object, Object> hmap=redisDAO.hGetAll("lk_win_numbers");
//          for(Object k:hmap.keySet()){
//              System.out.println(k);
//              System.out.println(hmap.get(k));
//          }


     //   winprizeDAO.save(winprize);
 //       System.out.println(redisDAO.hHasKey("lk_win_numbers", "761801"));
//
//        System.out.println(redisDAO.getRedisTemplate().hasKey("lk_users"));
//        System.out.println(redisDAO.delete("lk_win_numbers"));
//        System.out.println(redisDAO.getRedisTemplate().hasKey("lk_win_numbers"));
//       System.out.println(redisDAO.hHasKey("lk_win_numbers", 33));
 //       System.out.println(redisDAO.get("lk_win_numbers"));
//        HashMap hm=new HashMap();
 //       hm.put(11,"bb");
  //      redisDAO.hmSet("fxm", hm);
 //       System.out.println(redisDAO.hHasKey("fxm",22));
//        redisDAO.hSet("lk_win_numbers","6648047","heelo");
//        System.out.println("kk");
//        System.out.println(redisDAO.hHasKey("lk_win_numbers", 664804));
 //       HashMap hm=new HashMap();
   //     hm.put("abc",123);
   //     redisDAO.hmSet("good", hm);
   //     boolean flag=redisDAO.hHasKey("se","3d");
   //     redisDAO.hSet("se","3d","asdf");
    //   System.out.println(redisDAO.hHasKey("se", "abc"));


//
////
////
////        System.out.println(redisDAO.get("hx_hello"));
//
//        Map<Object, Object> map = new HashMap<Object, Object>();
//		map.put("1", "lea");
//		map.put("2", "beer");
//		map.put("3", "baby");
//		map.put("4", "hello");
 //      redisDAO.hmSet("segrdgr",map);
 //       redisDAO.set("aa",123);
//        System.out.println(redisDAO.hHasKey("segrdgr", "2"))  ;

    //    redisDAO.getRedisTemplate().delete("aa");
 //       System.out.println(redisDAO.getRedisTemplate().hasKey("aa"));
        

//		redisDAO.hmSet("segrdgr", map);

//		List<Object> smap = redisDAO.hmGet("segrdgr", "7");
//        System.out.println(smap);
//        for (Map.Entry<Object, Object> entry : map.entrySet()) {
//			System.out.println(entry.getKey() + ", " + entry.getValue());
//		}

//        System.out.println(contex.getBean("accountService"));
//        AccountService as = (AccountService) contex.getBean("accountService");
//
//        UserInfo us=as.login("admin","admin");
//        System.out.println(us.getCreateTime());
//         MongoOperations mongoOperation = (MongoOperations)contex.getBean("mongoTemplate");
//
//        User user = new User();
//        user.setAge(10);
//        user.setFirstname("hello");
//        user.setLastname("123");
//        Map map =new HashMap();
//        map.put("hello","hello world") ;
//        map.put("key",11);
//
//        //save
//        mongoOperation.save(map,"bady");
//
//
//
//        Map map1=mongoOperation.findOne(new Query(Criteria.where("key").is(11)), Map.class,"bady");
//
//        System.out.println(map1.get("hello"));

    }
}
