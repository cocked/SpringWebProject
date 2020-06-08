package com.hayagou.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hayagou.service.RawImgService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	RawImgService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getImgList(Model model) throws Exception {
		logger.info("Get ImageList");
				
		model.addAttribute("imgList", service.list() );
		
		return "home";
	}
	
		
}
