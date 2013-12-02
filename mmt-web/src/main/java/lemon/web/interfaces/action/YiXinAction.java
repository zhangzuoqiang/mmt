package lemon.web.interfaces.action;

import lemon.shared.config.MMTConfig;
import lemon.shared.service.ServiceType;
import lemon.web.system.bean.User;
import lemon.yixin.config.YiXin;
import lemon.yixin.config.bean.YiXinConfig;
import lemon.yixin.config.mapper.YXConfigMapper;
import lemon.yixin.message.processor.SimpleYiXinMsgProcessor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 易信接口配置
 * 
 * @author lemon
 * @version 1.0
 * 
 */
@Controller
@RequestMapping("/interface/yixinconfig")
public class YiXinAction extends APIConfigAction {
	@Autowired
	private YXConfigMapper yxConfigMapper;

	/**
	 * 保存易信配置信息
	 * @param cfg
	 * @param apiStatus
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "save", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String save(YiXinConfig cfg, boolean apiStatus, ModelMap model){
		User user = (User) model.get(TOKEN);
		return processSave(user, cfg, apiStatus);
	}
	
	@Override
	protected ServiceType getServiceType() {
		return ServiceType.YIXIN;
	}

	@Override
	protected String getMainViewName() {
		return "interface/yixin-config";
	}

	@Override
	protected MMTConfig getConfig(int cust_id) {
		return yxConfigMapper.get(cust_id);
	}

	@Override
	protected String getFilterURL() {
		return "echat/";
	}

	@Override
	protected boolean isConfigExists(String api_url) {
		return yxConfigMapper.checkConfig(api_url) > 0;
	}

	@Override
	protected String getSimpleAPI() {
		return SimpleYiXinMsgProcessor.class.getName();
	}

	@Override
	protected String getAPIAccount(MMTConfig cfg) {
		YiXinConfig config = (YiXinConfig) cfg;
		return config.getYx_account();
	}

	@Override
	protected int saveConfig(MMTConfig cfg) {
		YiXinConfig config = (YiXinConfig) cfg;
		return yxConfigMapper.save(config);
	}

	@Override
	protected int updateConfig(MMTConfig cfg) {
		YiXinConfig config = (YiXinConfig) cfg;
		return yxConfigMapper.update(config);
	}

	@Override
	protected void flushCache(MMTConfig cfg) {
		YiXinConfig config = (YiXinConfig) cfg;
		YiXin.setConfig(config);
	}

	@Override
	protected String getAPIDisplayName() {
		return "易信";
	}

	@Override
	protected String getMenuURL() {
		return "interface/yixinconfig";
	}

}
