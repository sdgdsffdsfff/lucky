//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//import java.util.Map.Entry;
//
//import com.xyj.manage.tool.redis.spring.RedisSpringUtil;
//import org.junit.Before;
//import org.junit.Test;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.context.ApplicationContext;
//import org.springframework.context.support.ClassPathXmlApplicationContext;
//import org.springframework.context.support.FileSystemXmlApplicationContext;
//
//
//public class RedisSpringTest {
//
//	private final static Logger LOG = LoggerFactory.getLogger(RedisSpringTest.class);
//
//	ApplicationContext context = null;
//	RedisSpringUtil springProxy = null;
//
//	@Before
//	public void init() {
//        String []cons={"classpath:spring/applicationContext.xml"}   ;
//         context=new FileSystemXmlApplicationContext(cons);
//
//		springProxy = context.getBean(RedisSpringUtil.class);
//	}
//
//	public void save() {
//
//		springProxy.set("hello", "world");
//
//		LOG.debug(springProxy.get("hello").toString());
//
//	}
//
//	@Test
//	public void map() {
//		Map<Object, Object> map = new HashMap<Object, Object>();
//		map.put("1", "lea");
//		map.put("2", "beer");
//		map.put("3", "baby");
//		map.put("4", "hello");
//
//		springProxy.hmSet("name", map);
//
//		map = springProxy.hGetAll("name");
//		for (Entry<Object, Object> entry : map.entrySet()) {
//			LOG.debug(entry.getKey() + ", " + entry.getValue());
//		}
//
//		List<Object> retLst = springProxy.hmGet("name", "1", "2", "3");
//		for (Object object : retLst) {
//			LOG.debug(object.toString());
//		}
//
//	}
//
//	@Test
//	public void list() {
//		List<Object> retLst = springProxy.hmGet("name", "1", "2", "3");
//
//		long count = 0;
//		if (null != retLst) {
//			for (Object object : retLst) {
//				count = springProxy.lPush("namelist", object);
//			}
//		}
//
//		LOG.debug("����list��Ԫ�ظ��� {}", count);
//
//		String lpop = (String) springProxy.lPop("namelist");
//		LOG.debug("ͷԪ��{}", lpop);
//
//		String rpop = (String) springProxy.rPop("namelist");
//		LOG.debug("ͷԪ��{}", rpop);
//	}
//
//}
