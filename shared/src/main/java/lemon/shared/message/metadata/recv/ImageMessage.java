package lemon.shared.message.metadata.recv;

import lemon.shared.message.metadata.MsgType;
import lemon.shared.message.metadata.specific.weixin.MediaMessage;
import lemon.shared.toolkit.xstream.annotations.XStreamCDATA;
import lemon.shared.toolkit.xstream.annotations.XStreamProcessCDATA;

import com.thoughtworks.xstream.annotations.XStreamAlias;

/**
 * Image message
 * @author lemon
 * @version 1.0
 *
 */
@XStreamAlias("xml")
@XStreamProcessCDATA
public class ImageMessage extends MediaMessage {
	/** PicUrl */
	@XStreamAlias("PicUrl")
	@XStreamCDATA
	private String picUrl;

	public ImageMessage(){
		super(MsgType.IMAGE);
	}
	
	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

}
