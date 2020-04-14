package com.javalec.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javalec.vo.DiscJudgeVO;

@Repository
public class DiscJudgeDaoImpl implements DiscJudgeDao{
	@Autowired
	SqlSession sqlSession;

	@Override
	public Integer getDecision(Map<String,String> judgeMap) {
		// TODO GET VOTED TO SHOW
		Integer isVoted = sqlSession.selectOne("getDecision", judgeMap);
		
		if(isVoted==null) isVoted = 0;
		return isVoted;
	}

	@Override
	public void updateJudge(DiscJudgeVO judge) {
		// TODO SWITCH
		sqlSession.update("updateJudge",judge);
	}

	@Override
	public void insertJudge(DiscJudgeVO judge) {
		// TODO JUDGE
		sqlSession.insert("insertJudge",judge);
	}

	@Override
	public void deleteJudge(DiscJudgeVO judge) {
		// TODO CANCEL
		sqlSession.delete("deleteJudge",judge);
	}	
}
