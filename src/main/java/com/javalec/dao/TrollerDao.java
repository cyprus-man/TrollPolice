package com.javalec.dao;

import java.util.List;
import java.util.Map;

import com.javalec.vo.Tier;
import com.javalec.vo.TrollerVO;

public interface TrollerDao {
	
	public List<TrollerVO> getTrollRank(Tier tier);
	public void insertTroller(TrollerVO troller);
	public int isTroller(String nickname);
	public int getMostTrollChamp(String nickname);
	public List<Map<String,Integer>> getTrollValue(String nickname);
}
