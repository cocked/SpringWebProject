package com.hayagou.dao;

import java.util.List;

import javax.inject.Inject;
import javax.xml.stream.events.Namespace;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.hayagou.domain.RawImgVO;

@Repository //DAO라고 명시 (DAO를 스프링에서 인식시켜줌)
public class RawImgDAOImp implements RawImgDAO {

	@Inject // 의존관계를 자동으로 연결(JAVA에서 제공) ==@autowired (Spring에서 제공)
	private SqlSession sqlSession;
	
	private static final String Namespace = "com.hayagou.mapper.ImageMapper";
	
	@Override
	public void insertRawImg(RawImgVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert(Namespace + ".insertRawImg", vo);
	}

	@Override
	public List<RawImgVO> listImg() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace + ".listImg");
	}

	@Override
	public List<RawImgVO> listTopImg() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace + ".listTopImg");
	}

}