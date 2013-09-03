package lemon.weixin.xmlconvert;

import lemon.weixin.xstream.annotations.XStreamCDATA;

import com.thoughtworks.xstream.annotations.XStreamAlias;

@XStreamAlias("xml")
public class Bean {
	@XStreamAlias("Name")
	@XStreamCDATA
	private String name;
	@XStreamCDATA
	@XStreamAlias("Address")
	private String address;
	
	public Bean(String name, String address){
		this.name=name;
		this.address = address;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
}
