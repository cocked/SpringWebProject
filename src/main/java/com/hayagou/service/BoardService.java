package com.hayagou.service;

import java.util.List;

import com.hayagou.domain.BoardVO;

public interface BoardService {
	
	//게시글 작성
	public void write(BoardVO vo) throws Exception;
	
	//게시글 조회
	public List<BoardVO> list() throws Exception;
	
	public BoardVO read(int num) throws Exception;
	
	public void update(BoardVO vo) throws Exception;
	
	public void delete(int num) throws Exception;
}
