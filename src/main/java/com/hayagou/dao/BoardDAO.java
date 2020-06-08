package com.hayagou.dao;

import java.util.List;
import com.hayagou.domain.BoardVO;

public interface BoardDAO {
	public void write(BoardVO vo);
	
	public List<BoardVO> list() throws Exception;
	
	public BoardVO read(int num) throws Exception;
	
	public void update(BoardVO vo) throws Exception;
	
	public void delete(int num) throws Exception;
}
