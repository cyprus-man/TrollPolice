package com.javalec.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javalec.vo.Lane;
import com.javalec.vo.MatchingBoardVO;
import com.javalec.vo.MatchingReplyVO;

@Repository
public class MatchingBoardDaoImpl implements MatchingBoardDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<MatchingBoardVO> list(Map<String, Object> param) {
		List<MatchingBoardVO> boards = null;
		Lane lane = (Lane) param.get("lane");

		if (lane != Lane.NONE)
			boards = sqlSession.selectList("MatchingBoardNS.list", param);
		else
			boards = sqlSession.selectList("MatchingBoardNS.listNone", param);

		return boards;
	}

	@Override
	public int countBoard(String tier) {
		int dataCount = (int) sqlSession.selectOne("MatchingBoardNS.count", tier);
		return dataCount;
	}

	@Override
	public int maxId() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MatchingBoardVO getMatchingBoardById(int matchingBoardId) {
		MatchingBoardVO board = sqlSession.selectOne("MatchingBoardNS.getMatchingBoardById", matchingBoardId);
		return board;
	}

	@Override
	public int maxReplyId() {
		Integer replyId = sqlSession.selectOne("MatchingBoardNS.maxReplyId");
		return replyId==null ? 1: replyId;
	}

	@Override
	public List<MatchingReplyVO> getMatchingReplyById(int matchingBoardId) {
		List<MatchingReplyVO> replies = sqlSession.selectList("MatchingBoardNS.getMatchingReplyById", matchingBoardId);
		return replies;
	}

	@Override
	public void updateExpired(int matchingBoardId) {
		sqlSession.update("MatchingBoardNS.updateExpired", matchingBoardId);
	}

	@Override
	public void insertBoard(HashMap<String, String> param) {
		sqlSession.insert("MatchingBoardNS.insertBoard", param);
	}

	@Override
	public void insertReply(HashMap<String, Object> param) {
		sqlSession.insert("MatchingBoardNS.insertReply", param);
	}

	@Override
	public void updateBoard(HashMap<String, Object> param) {
		sqlSession.update("MatchingBoardNS.updateBoard", param);
	}

	@Override
	public void deleteBoard(int boardId) {
		sqlSession.delete("MatchingBoardNS.deleteBoard", boardId);
	}

	@Override
	public String getEmailByNickname(String nickname) {
		String email = sqlSession.selectOne("MatchingBoardNS.getEmailByNickname", nickname);
		return email;
	}

	@Override
	public void insertLiveChatRoom(HashMap<String, Object> param) {
		sqlSession.insert("MatchingBoardNS.insertLiveChatRoom", param);
	}

	// 검색기능 0402 추가
	/* 소환사 이름으로 검색 */
	@Override
	public List<MatchingBoardVO> searchList(String nickname, int page) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("page", page);
		param.put("nickname", nickname);
		List<MatchingBoardVO> boards = sqlSession.selectList("MatchingBoardNS.searchNickname", param);
		return boards;
	}

	@Override
	public int countByNickname(String nickname) {
		return sqlSession.selectOne("MatchingBoardNS.countByNickname", nickname);
	}
	
	

}
