package com.hayagou.dao;

import javax.inject.Inject;
import javax.xml.stream.events.Namespace;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.hayagou.domain.UserVO;

@Repository //DAO라고 명시 (DAO를 스프링에서 인식시켜줌)
public class UserDAOImp implements UserDAO {

	@Inject // 의존관계를 자동으로 연결(JAVA에서 제공) ==@autowired (Spring에서 제공)
	private SqlSession sqlSession;
	
	private static final String Namespace = "com.hayagou.mapper.UserMapper";

	@Override
	public void signUp(UserVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert(Namespace + ".signUp", vo);
	}

	@Override
	public UserVO login(UserVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace + ".login", vo);
	}
		
	
}