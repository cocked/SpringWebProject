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
}
