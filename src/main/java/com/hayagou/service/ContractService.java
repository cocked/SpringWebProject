package com.hayagou.service;

import java.util.List;

import com.hayagou.domain.ContractVO;

public interface ContractService {
	
	//계약정보 조회
	public List<ContractVO> sellList(String user_hashcode) throws Exception;
	
	public List<ContractVO> buyList(String user_hashcode) throws Exception;
	
}
