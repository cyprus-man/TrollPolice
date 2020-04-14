package com.javalec.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javalec.vo.DiscReplyVoteVO;

@Repository
public class DiscReplyVoteDaoImpl implements DiscReplyVoteDao {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int isVoted(Map<String,String> voteMap) {
		// TODO return VoteVO up value 0 is none 1 is upVote -1 is downVote   
		Integer isVote = sqlSession.selectOne("DiscReplyVoteNS.isVoted",voteMap);
		isVote = isVote==null ? 0 : isVote;
		
		return isVote;
	}

	@Override
	public void insertVote(DiscReplyVoteVO replyVote) {
		sqlSession.insert("DiscReplyVoteNS.insertReplyVote",replyVote);
		
	}

	@Override
	public void deleteVote(DiscReplyVoteVO replyVote) {
		sqlSession.delete("DiscReplyVoteNS.deleteReplyVote",replyVote);
		
	}

	@Override
	public void updateVote(DiscReplyVoteVO replyVote) {
		sqlSession.update("DiscReplyVoteNS.updateReplyVote",replyVote);
		
	}

	@Override
	public void deleteVoteByReply(int replyId) {
		sqlSession.delete("DiscReplyVoteNS.deleteVoteByReply",replyId);
		
	}
	
}
