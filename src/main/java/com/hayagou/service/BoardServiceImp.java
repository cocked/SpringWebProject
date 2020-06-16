package com.hayagou.service;

import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.hayagou.dao.BoardDAO;
import com.hayagou.domain.BoardVO;

@Service
public class BoardServiceImp implements BoardService {

	@Inject
	private BoardDAO dao;

	@Override
	public void write(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.write(vo);
	}

	@Override
	public List<BoardVO> list() throws Exception {
		return dao.list();
	}

	@Override
	public BoardVO read(int num) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(num);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.update(vo);
	}

	@Override
	public void delete(int num) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(num);
	}

	// 게시물 총 갯수
	@Override
	public int count() throws Exception {
		return dao.count();
	}

	// 게시물 목록 + 페이징
	@Override
	public List listPage(int displayPost, int postNum) throws Exception {
		return dao.listPage(displayPost, postNum);
	}

	// 게시물 목록 + 페이징 + 검색
	@Override
	public List<BoardVO> listPageSearch(
			int displayPost, int postNum, String searchType, String keyword) throws Exception {
		return  dao.listPageSearch(displayPost, postNum, searchType, keyword);
	}
}
