package com.hayagou.service;

import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.hayagou.dao.RawImgDAO;
import com.hayagou.domain.RawImgVO;

@Service
public class RawImgServiceImp implements RawImgService {
	
	@Inject
	private RawImgDAO dao;

	@Override
	public void insert(RawImgVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.insertRawImg(vo);
	}

	@Override
	public List<RawImgVO> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.listImg();
	}

	@Override
	public List<RawImgVO> topList() throws Exception {
		// TODO Auto-generated method stub
		return dao.listTopImg();
	}
	
	@Override
	public RawImgVO read(int num) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(RawImgVO vo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int num) throws Exception {
		// TODO Auto-generated method stub
		
	}

	
}
