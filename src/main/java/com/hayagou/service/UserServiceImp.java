package com.hayagou.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import com.hayagou.dao.UserDAO;
import com.hayagou.domain.UserVO;

@Service
public class UserServiceImp implements UserService {
	
	@Inject
	private UserDAO dao;
	
	@Override
	public void signUp(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.signUp(vo);
	}

	@Override
	public UserVO login(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.login(vo);
	}

	@Override
	public void logout(HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		session.invalidate();
	}

	@Override
	public void userUpdate(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.userUpdate(vo);
	}

	@Override
	public void userDelete(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.userDelete(vo);
	}

	@Override
	public int passChk(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		int result = dao.passChk(vo);
		return result;
	}
}
