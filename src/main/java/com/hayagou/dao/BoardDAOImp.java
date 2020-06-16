package com.hayagou.dao;

import com.hayagou.domain.BoardVO;

import java.util.HashMap;
import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository //DAO라고 명시 (DAO를 스프링에서 인식시켜줌)
public class BoardDAOImp implements BoardDAO {

	@Inject // 의존관계를 자동으로 연결(JAVA에서 제공) ==@autowired (Spring에서 제공)
	private SqlSession sqlSession;

	private static final String namespace = "com.hayagou.mapper.BoardMapper";
	//memberMapper.xml의 namespace값

	@Override
	public void write(BoardVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".insertBoard", vo);
	}   

	@Override
	public List<BoardVO> list() throws Exception {
		return sqlSession.selectList(namespace+".listBoard");
	}

	@Override
	public BoardVO read(int num) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".read", num);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".update", vo);
	}

	@Override
	public void delete(int num) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace+".delete", num);
	}

	// 게시물 총 갯수
	@Override
	public int count() throws Exception {
		return sqlSession.selectOne(namespace + ".count"); 
	}
	
	// 게시물 목록 + 페이징
	@Override
	public List listPage(int displayPost, int postNum) throws Exception {

		HashMap data = new HashMap();

		data.put("displayPost", displayPost);
		data.put("postNum", postNum);

		return sqlSession.selectList(namespace + ".listPage", data);
	}
	
	// 게시물 목록 + 페이징 + 검색
	 @Override
	 public List<BoardVO> listPageSearch(
	   int displayPost, int postNum, String searchType, String keyword) throws Exception {

	  HashMap<String, Object> data = new HashMap<String, Object>();
	  
	  data.put("displayPost", displayPost);
	  data.put("postNum", postNum);
	  
	  data.put("searchType", searchType);
	  data.put("keyword", keyword);
	  
	  return sqlSession.selectList(namespace + ".listPageSearch", data);
	 }
}  

