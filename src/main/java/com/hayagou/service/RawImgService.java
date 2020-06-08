package com.hayagou.service;

import java.util.List;

import com.hayagou.domain.RawImgVO;

public interface RawImgService {

	//RawImage 등록
	public void insert(RawImgVO vo) throws Exception;

	//
	public List<RawImgVO> list() throws Exception;

	public RawImgVO read(int num) throws Exception;

	public void update(RawImgVO vo) throws Exception;

	public void delete(int num) throws Exception;
}
