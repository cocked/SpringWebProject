package com.hayagou.dao;

import com.hayagou.domain.UserVO;

public interface UserDAO {
	public void signUp(UserVO vo);
	
	public UserVO login(UserVO vo);
	
	public void userUpdate(UserVO vo)throws Exception;
	
	public void userDelete(UserVO vo)throws Exception;
	
	// 패스워드 체크
	public int passChk(UserVO vo) throws Exception;
}
