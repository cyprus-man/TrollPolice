package com.javalec.dao;


import java.util.List;
import java.util.Map;

import com.javalec.vo.DiscussionBoardVO;
import com.javalec.vo.MatchVO;


public interface DiscussionBoardDao {

	public List<DiscussionBoardVO> list(int page);
	public List<DiscussionBoardVO> hotDealList(int page);
	public List<DiscussionBoardVO> getListByTroll(Map<String,String> nick);
	public List<DiscussionBoardVO> getListByNickname(Map<String, String> nick);
	public List<DiscussionBoardVO> getMyReportListByTroller(Map<String,String> search);
	public List<DiscussionBoardVO> getMyTrollListByTroller(Map<String,String> search);
	public int countMySearch(Map<String,String> search);
	public int countBoard(); 
	public int maxId();
	public MatchVO getMatchById(long matchId);
	public DiscussionBoardVO getDiscBoardById(int discBoardId);	
	public void insertBoard(DiscussionBoardVO discussionBoard);
	public void insertMatch(MatchVO match);
	public boolean isInserted(long matchId);
	public Integer isDiscuss(Map<String,String> trollerNmatchId);
	public void upRC(DiscussionBoardVO discussionBoard);
	public void updateDiscBoard(DiscussionBoardVO discussionBoard);
	public int countByTroller(String troller);
	public long getMatchIdByDisc(int discId);
	public int countByNickname(String nickname);
	
}
