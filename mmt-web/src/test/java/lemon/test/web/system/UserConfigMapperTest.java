package lemon.test.web.system;

import static org.junit.Assert.*;

import java.util.List;

import lemon.web.system.bean.UserConfig;
import lemon.web.system.mapper.UserConfigMapper;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

@RunWith(JUnit4.class)
public class UserConfigMapperTest {
	private AbstractApplicationContext acx;
	private UserConfigMapper userConfigMapper;
	private final int user_id = 11;
	
	@Before
	public void init(){
		String[] resource = { "classpath:spring-db.xml",
				"classpath:spring-dao.xml", "classpath:spring-service.xml" };
		acx = new ClassPathXmlApplicationContext(resource);
		userConfigMapper = acx.getBean(UserConfigMapper.class);
		assertNotNull(userConfigMapper);
	}
	
	@Test
	public void deleteItem(){
		UserConfig item = addItem(user_id,"testkey", "testvalue");
		userConfigMapper.deleteItem(user_id, item.getKey());
		item = userConfigMapper.getItem(user_id, item.getKey());
		assertNull(item);
	}
	
	@Test
	public void deleteItems(){
		UserConfig item1 = addItem(user_id,"testkey1", "testvalue1");
		UserConfig item2 = addItem(user_id,"testkey2", "testvalue2");
		userConfigMapper.deleteItems(user_id);
		item1 = userConfigMapper.getItem(user_id, item1.getKey());
		assertNull(item1);
		item2 = userConfigMapper.getItem(user_id, item2.getKey());
		assertNull(item2);
	}
	
	@Test
	public void getItems(){
		userConfigMapper.deleteItems(user_id);
		addItem(user_id,"testkey1", "testvalue1");
		addItem(user_id,"testkey2", "testvalue2");
		List<UserConfig> list = userConfigMapper.getItems(user_id);
		assertEquals(2, list.size());
		userConfigMapper.deleteItems(user_id);
	}
	
	@After
	public void destory(){
		acx.close();
	}
	
	private UserConfig addItem(int user_id,String key,String value){
		UserConfig item = new UserConfig();
		item.setUser_id(user_id);
		item.setKey(key);
		item.setValue(value);
		userConfigMapper.addItem(item);
		return item;
	}
}
