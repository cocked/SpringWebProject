package com.hayagou.dao;

import java.util.List;
import com.hayagou.domain.ContractVO;

public interface ContractDAO {
	
	public List<ContractVO> sellList(String user_hashcode) throws Exception;
	
	public List<ContractVO> buyList(String user_hashcode) throws Exception;
}
