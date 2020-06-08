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

import com.hayagou.domain.BoardVO;
import com.hayagou.service.BoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService service;
	
	//게시판 글 작성 화면
	@RequestMapping(value = "/board/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception{
		logger.info("writeView");
	}
	
	//게시판 글 작성
	@RequestMapping(value = "/board/write", method = RequestMethod.POST)
	public String write(BoardVO vo) throws Exception{
		logger.info("write");
		
		service.write(vo);
		
		return "redirect:/board/list";
	}
	
	@RequestMapping(value = "/board/list", method = RequestMethod.GET)
	public String list(Model model) throws Exception{
		logger.info("list");
		
		model.addAttribute("list", service.list());
		logger.info(model.toString());
		
		return "board/list";
	}
	
	@RequestMapping(value ="/board/readView", method = RequestMethod.GET)//, RequestMethod.POST})
	public String read(BoardVO vo, Model model) throws Exception{
		logger.info("read");
		
		model.addAttribute("read", service.read(vo.getNum()));
		
		return "board/readView";
	}
	
	@RequestMapping(value = "/board/updateView", method = RequestMethod.GET)
	public String updateView(BoardVO vo, Model model) throws Exception{
		logger.info("updateView");
		
		model.addAttribute("update", service.read(vo.getNum()));
		
		return "board/updateView";
	}
	
	@RequestMapping(value = "/board/update", method = RequestMethod.POST)
	public String update(BoardVO vo) throws Exception{
		logger.info("update");
		
		service.update(vo);
		
		return "redirect:/board/list";
	}
	
	@RequestMapping(value = "board/delete", method = RequestMethod.POST)
	public String delete(BoardVO vo) throws Exception{
		logger.info("delete");
		
		service.delete(vo.getNum());
		
		return "redirect:/board/list";
	}
}






