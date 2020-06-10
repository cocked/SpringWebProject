package com.hayagou.dao;

import com.hayagou.domain.UserVO;

public interface UserDAO {
	public void signUp(UserVO vo);
	
	public UserVO login(UserVO vo);
}
