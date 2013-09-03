package lemon.weixin.xmlconvert;

import lemon.weixin.util.WXXStreamHelper;

import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;

import com.thoughtworks.xstream.XStream;

public class BeanTest {
	private XStream xStream;
	@Before
	public void init() {
		xStream = WXXStreamHelper.createXstream();
	}
	
	@Test
	public void test(){
		xStream.processAnnotations(Bean.class);
		Bean b = new Bean("lemon","Hangzhou");
		//System.out.println(xStream.toXML(b));
		b = (Bean) xStream.fromXML(xStream.toXML(b));
		assertEquals(b.getName(), "lemon");
	}
}
