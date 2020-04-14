package com.javalec.dao;

import java.util.Map;

import com.javalec.vo.DiscReplyVoteVO;

public interface DiscReplyVoteDao {
	public int isVoted(Map<String,String> voteMap);
	public void insertVote(DiscReplyVoteVO replyVote);
	public void deleteVote(DiscReplyVoteVO replyVote);
	public void deleteVoteByReply(int replyId);
	public void updateVote(DiscReplyVoteVO replyVote);
}
