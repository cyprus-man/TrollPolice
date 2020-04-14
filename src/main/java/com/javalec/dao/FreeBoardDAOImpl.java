package com.javalec.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import org.springframework.stereotype.Repository;

import com.javalec.vo.FreeBoardVO;

@Repository
public class FreeBoardDAOImpl implements FreeBoardDAO {
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public void create(FreeBoardVO vo) {
		sqlSession.insert("freeNS.insert",vo);
	}
	@Override
	public FreeBoardVO read(int bno) {
		return sqlSession.selectOne("freeNS.view",bno); 
	}
	@Override
	public void update(FreeBoardVO vo) {
		sqlSession.update("freeNS.updateArticle",vo);
	}
	@Override
	public void delete(int bno,String email) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("bno",bno);
		map.put("writer",email);
		sqlSession.delete("freeNS.deleteArticle",map);	
	}
	@Override 
	public List<FreeBoardVO> listAll(int start,int end,String searchOption,String keyword)   {
		Map<String,Object>map=new HashMap<String,Object>();
		map.put("searchOption",searchOption);
		map.put("keyword",keyword);
		map.put("start",start); 
		map.put("end",end);
		return sqlSession.selectList("freeNS.listAll",map);
	}
	
	@Override
	public int countArticle(String searchOption,String keyword)  {
		Map<String,String>map=new HashMap<String,String>();
		map.put("searchOption",searchOption);
		map.put("keyword",keyword);
		return sqlSession.selectOne("freeNS.countArticle",map);
	}

	@Override
	public void increaseViewcnt(int bno)   {
		sqlSession.update("freeNS.increaseViewcnt",bno);
	}
	
	
	
	
	
}
