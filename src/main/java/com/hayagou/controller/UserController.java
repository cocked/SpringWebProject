package com.hayagou.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hayagou.domain.UserVO;
import com.hayagou.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	UserService service;
	
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public void signUpGET() throws Exception{
		logger.info("signUpGET");
	}
	
	@RequestMapping(value = "/signUp", method = RequestMethod.POST)
	public String signUpPOST(UserVO vo) throws Exception{
		logger.info("signUpPOST");
		
		String inputPass = vo.getUser_password();
		String pass = passEncoder.encode(inputPass);
		vo.setUser_password(pass);
		
		service.signUp(vo);
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET() throws Exception{
		logger.info("loginGET");
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST(UserVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		logger.info("loginPOST");
		
		UserVO login = service.login(vo);
		HttpSession session = req.getSession();
		
		boolean passMatch = passEncoder.matches(vo.getUser_password(), login.getUser_password());
		
		if(login != null && passMatch) {
			session.setAttribute("user", login);
		}else {
			session.setAttribute("user", null);
			rttr.addFlashAttribute("msg",false);
			return "redirect:/user/login";
		}
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		logger.info("logout");
		
		service.logout(session);
		
		return "redirect:/";
	}
	
}
