package com.javalec.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javalec.vo.DiscussionBoardVO;
import com.javalec.vo.MatchVO;

@Repository
public class DiscussionBoardDaoImpl implements DiscussionBoardDao {


	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<DiscussionBoardVO> list(int page) {
		List<DiscussionBoardVO> boards=null;
		boards= sqlSession.selectList("DiscBoardNS.list",page);
		
		return boards;
	}
	
	@Override
	public List<DiscussionBoardVO> hotDealList(int page) {
		List<DiscussionBoardVO> boards=null;
		boards= sqlSession.selectList("DiscBoardNS.hotDealList",page);
		return boards;
	}

	public int countBoard() {
		int dataCount = (int)sqlSession.selectOne("DiscBoardNS.count");
		return dataCount;		
	}
	
	
	@Override
	public int maxId() {
		Integer maxId = sqlSession.selectOne("DiscBoardNS.maxDiscId");
		maxId = maxId == null ? 1 : maxId;
		return maxId;
	}

	@Override
	public void insertBoard(DiscussionBoardVO discussionBoard) {
		sqlSession.insert("DiscBoardNS.insertBoard",discussionBoard);
	}

	@Override
	public void insertMatch(MatchVO match) {
		sqlSession.insert("DiscBoardNS.insertMatch",match);
		for(int i=0;i<match.getParticipantsVOList().size();i++)
			sqlSession.insert("DiscBoardNS.insertParticipant",match.getParticipantsVOList().get(i));
		for(int i=0;i<match.getTeamStatsVOList().size();i++)
			sqlSession.insert("DiscBoardNS.insertTeamstats",match.getTeamStatsVOList().get(i));
	}
	
	@Override
	public MatchVO getMatchById(long matchId) {
		MatchVO match = sqlSession.selectOne("DiscBoardNS.getMatchById",matchId);
		return match;
	}
	
	@Override
	public long getMatchIdByDisc(int discId) {
		Long matchId = sqlSession.selectOne("DiscBoardNS.getMatchIdByDisc",discId);
		 matchId = matchId==null ? -1 : matchId;
		return matchId;
	}
	
	@Override
	public DiscussionBoardVO getDiscBoardById(int discBoardId) {
		// TODO get discBoard
		DiscussionBoardVO board = sqlSession.selectOne("DiscBoardNS.getDiscBoardById",discBoardId);  
		return board;
	}
	
	@Override
	public boolean isInserted(long matchId) {
		//매치가 등록된 것인지 판단하는 메소드.
		Integer matchCount = sqlSession.selectOne("DiscBoardNS.isInsertMatch",matchId);
		return (matchCount==0 || matchCount == null) ? false : true;
	}

	@Override
	public void upRC(DiscussionBoardVO discussionBoard) {
		sqlSession.update("DiscBoardNS.upRC",discussionBoard);
	}

	@Override
	public List<DiscussionBoardVO> getListByTroll(Map<String, String> troll) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("DiscBoardNS.getListByTroll",troll);
	}

	@Override
	public int countByTroller(String troller) {
		int result = sqlSession.selectOne("DiscBoardNS.countByTroller",troller);
		return result;
	};
	
	@Override
	public void updateDiscBoard(DiscussionBoardVO discussionBoard) {
		sqlSession.update("DiscBoardNS.updateDiscBoard",discussionBoard);
	}

	@Override
	public Integer isDiscuss(Map<String, String> trollerNmatchId) {
		Integer discBoardId = sqlSession.selectOne("DiscBoardNS.isDiscuss", trollerNmatchId);
		return discBoardId;
	}

	@Override
	public int countByNickname(String nickname) {
		int count = sqlSession.selectOne("DiscBoardNS.countByNickname",nickname);
		return count;
	}

	@Override
	public List<DiscussionBoardVO> getListByNickname(Map<String, String> nick) {
		List<DiscussionBoardVO> list = sqlSession.selectList("DiscBoardNS.getListByNickname",nick);
		return list;
	}

	@Override
	public List<DiscussionBoardVO> getMyReportListByTroller(Map<String, String> search) {
		List<DiscussionBoardVO> list = sqlSession.selectList("DiscBoardNS.getMyReportListByTroller",search);
		return list;
	}
	@Override
	public List<DiscussionBoardVO> getMyTrollListByTroller(Map<String, String> search) {
		List<DiscussionBoardVO> list = sqlSession.selectList("DiscBoardNS.getMyTrollListByTroller",search);
		return list;
	}
	@Override
	public int countMySearch(Map<String, String> search) {
		int dataCount = (int)sqlSession.selectOne("DiscBoardNS.countMySearch",search);
		return dataCount;
	}
}
