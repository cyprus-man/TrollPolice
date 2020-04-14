package com.javalec.dao;

import java.util.Map;

import com.javalec.vo.DiscJudgeVO;

public interface DiscJudgeDao {
	public Integer getDecision(Map<String,String> judgeMap);
	public void updateJudge(DiscJudgeVO judge);
	public void insertJudge(DiscJudgeVO judge);
	public void deleteJudge(DiscJudgeVO judge);
}
