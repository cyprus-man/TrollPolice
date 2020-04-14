package com.javalec.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.javalec.vo.MatchingBoardVO;
import com.javalec.vo.MatchingReplyVO;

public interface MatchingBoardDao {
	
	public List<MatchingBoardVO> list(Map<String, Object> param);
	public int countBoard(String tier);
	public int maxId();
	public int maxReplyId();
	public MatchingBoardVO getMatchingBoardById(int matchingBoardId);
	public List<MatchingReplyVO> getMatchingReplyById(int matchingBoardId);
	public void updateExpired(int matchingBoardId);
	public void insertBoard(HashMap<String,String>param);
	public void insertReply(HashMap<String,Object>param);
	public void updateBoard(HashMap<String,Object>param);
	public void deleteBoard(int boardId);
	public String getEmailByNickname(String nickname);
	public void insertLiveChatRoom(HashMap<String, Object> param);
	//검색기능 
	public List<MatchingBoardVO> searchList(String nickname,int page);
	public int countByNickname(String nickname);
	
}
