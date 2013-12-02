package lemon.shared.message.metadata.specific.yixin;

import lemon.shared.message.metadata.Message;
import lemon.shared.toolkit.xstream.annotations.XStreamProcessCDATA;

/**
 * media message<br>
 * such as: audio, video
 * @author lemon
 * @version 1.0
 *
 */
@XStreamProcessCDATA
public class MediaMessage extends Message {
	protected String url;
	protected String name;
	protected String mimeType;
	
	public MediaMessage(String msgType, String mimeType) {
		super(msgType);
		this.mimeType = mimeType;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMimeType() {
		return mimeType;
	}

	protected void setMimeType(String mimeType) {
		this.mimeType = mimeType;
	}
	
}
