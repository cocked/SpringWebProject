package com.hayagou.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.hayagou.domain.UserVO;

public interface UserService {
	
	//회원가입
	public void signUp(UserVO vo) throws Exception;
	
	public UserVO login(UserVO vo) throws Exception;

	public void logout(HttpSession session) throws Exception;	
	
	public void userUpdate(UserVO vo) throws Exception;
	
	public void userDelete(UserVO vo) throws Exception;
	
	public int passChk(UserVO vo) throws Exception;
}
