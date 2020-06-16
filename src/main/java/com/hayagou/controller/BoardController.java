package com.hayagou.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hayagou.domain.BoardVO;
import com.hayagou.domain.UserVO;
import com.hayagou.service.BoardService;
import com.hayagou.utils.Page;

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
	public String write(BoardVO vo, HttpSession session) throws Exception{
		logger.info("write");
		
		UserVO user = (UserVO)session.getAttribute("user");
		vo.setWriter(user.getUser_name());
		service.write(vo);

		return "redirect:/board/listPageSearch?num=1";
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

	// 게시물 목록 + 페이징 
	@RequestMapping(value = "/board/listpage", method = RequestMethod.GET)
	public void getListPage(Model model) throws Exception {

		List list = service.list();
		model.addAttribute("list", list);   
	}

	// 게시물 목록 + 페이징 추가
	@RequestMapping(value = "/board/listPage", method = RequestMethod.GET)
	public void getListPage(Model model, @RequestParam(value="num", required = false) int num) throws Exception {
		Page page = new Page();

		page.setNum(num);
		page.setCount(service.count());  

		List list = service.listPage(page.getDisplayPost(), page.getPostNum());

		model.addAttribute("list", list);   

		model.addAttribute("page", page);
		model.addAttribute("select", num);
	}

	// 게시물 목록 + 페이징 추가 + 검색
	@RequestMapping(value = "board/listPageSearch", method = RequestMethod.GET)
	public void getListPageSearch(Model model, @RequestParam("num") int num, 
			@RequestParam(value = "searchType", required = false, defaultValue = "title") String searchType,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) throws Exception {
		Page page = new Page();

		page.setNum(num);
		page.setCount(service.count());  

		List list = service.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);

		model.addAttribute("list", list);			
		model.addAttribute("page", page);
		model.addAttribute("select", num);
	}
}






