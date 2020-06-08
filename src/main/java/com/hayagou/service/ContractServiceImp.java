package com.hayagou.service;

import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.hayagou.dao.ContractDAO;
import com.hayagou.domain.ContractVO;

@Service
public class ContractServiceImp implements ContractService {
	
	@Inject
	private ContractDAO dao;
	
	@Override
	public List<ContractVO> sellList(String user_hashcode) throws Exception {
		return dao.sellList(user_hashcode);
	}
	
	@Override
	public List<ContractVO> buyList(String user_hashcode) throws Exception {
		return dao.buyList(user_hashcode);
	}

}
