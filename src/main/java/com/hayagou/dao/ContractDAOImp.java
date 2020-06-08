package com.hayagou.dao;

import com.hayagou.domain.ContractVO;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository //DAO라고 명시 (DAO를 스프링에서 인식시켜줌)
public class ContractDAOImp implements ContractDAO {

    @Inject // 의존관계를 자동으로 연결(JAVA에서 제공) ==@autowired (Spring에서 제공)
    private SqlSession sqlSession;
      
    private static final String namespace = "com.hayagou.mapper.contractMapper";
                                            //memberMapper.xml의 namespace값
    
    @Override
    public List<ContractVO> sellList(String user_hashcode) throws Exception {
    	return sqlSession.selectList(namespace+".listSellContract", user_hashcode);
    }
    
    @Override
    public List<ContractVO> buyList(String user_hashcode) throws Exception {
    	return sqlSession.selectList(namespace+".listBuyContract", user_hashcode);
    }    
}  

