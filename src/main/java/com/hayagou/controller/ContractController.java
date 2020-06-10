package com.hayagou.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hayagou.domain.UserVO;
import com.hayagou.service.ContractService;

@Controller
public class ContractController {
	private static final Logger logger = LoggerFactory.getLogger(ContractController.class);

	@Inject
	ContractService service;

	//수정
	String user_hashcode = "0x2f81c59fb4f0c3146483e72c1315833af79b6ea9323";


	@RequestMapping(value = "/myPage/contractManage", method = RequestMethod.GET)
	public String contractManageGET() {
		logger.info("contractManage");

		return "myPage/contractManage";
	}

	//계약 조회
	@RequestMapping(value = "/myPage/sellContractManage", method = RequestMethod.GET)
	public String sellList(UserVO vo,Model model) throws Exception{
		logger.info("contractManage1");

		//수정
		vo.setUser_hashcode(user_hashcode);
		model.addAttribute("sellList", service.sellList(vo.getUser_hashcode()));
	
		return "myPage/contractManage";
	}

	@RequestMapping(value = "/myPage/buyContractManage", method = RequestMethod.GET)
	public String buyList(UserVO vo,Model model) throws Exception{
		logger.info("contractManage2");

		//수정
		vo.setUser_hashcode(user_hashcode);
		model.addAttribute("buyList", service.buyList(vo.getUser_hashcode()));

		return "myPage/contractManage";
	}
}
