package com.javalec.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.javalec.vo.FreeBoardReplyVO;

@Repository
public class FreeBoardReplyDAOImpl implements FreeBoardReplyDAO{
	@Inject
	SqlSession sqlsession;
	
	@Override
	public List<FreeBoardReplyVO>list(Integer bno,int start,int end){
		Map<String,Object>map=new HashMap<String,Object>();
		map.put("bno",bno);
		map.put("start",start);
		map.put("end",end);
		return sqlsession.selectList("freeReplyNS.listReply",map);
	}

	@Override
	public void create(FreeBoardReplyVO vo) {
		sqlsession.insert("freeReplyNS.insertReply",vo);
		
	} 

	@Override
	public void update(FreeBoardReplyVO vo) {
		sqlsession.update("freeReplyNS.updateReply",vo);
	}

	@Override
	public void delete(Integer rno) {
		sqlsession.delete("freeReplyNS.deleteReply",rno);
		
	}
	@Override
	public int count(Integer bno) {
		return sqlsession.selectOne("freeReplyNS.countReply",bno);
	}

	@Override
	public FreeBoardReplyVO detail(Integer rno) {
		return sqlsession.selectOne("freeReplyNS.detailReply",rno);
	}
	
}
