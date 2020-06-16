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
	
	// 게시물 총 갯수
	public int count() throws Exception;
	
	// 게시물 목록 + 페이징
	public List listPage(int displayPost, int postNum) throws Exception;
	
	// 게시물 목록 + 페이징 + 검색
	public List<BoardVO> listPageSearch(
	  int displayPost, int postNum, String searchType, String keyword) throws Exception;
}
