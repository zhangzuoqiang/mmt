package lemon.web;

import lemon.web.base.MMTAction;
import lemon.web.system.mapper.UserMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Home page
 * @author lemon
 * @version 1.0
 *
 */
@Controller
public class HomeAction extends MMTAction {
	@Autowired
	private UserMapper userMapper;
	
	/**
	 * show home page
	 * @return
	 */
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public ModelAndView index(){
		return new ModelAndView(VIEW_HOME_PAGE,"",null);
	}
	
}
