package com.hayagou.dao;

import java.util.List;

import com.hayagou.domain.RawImgVO;

public interface RawImgDAO {
	public void insertRawImg(RawImgVO vo);
	
	public List<RawImgVO> listImg();
}
