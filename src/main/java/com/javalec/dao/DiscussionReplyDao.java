package com.javalec.dao;

import java.util.List;
import java.util.Map;

import com.javalec.vo.DiscussionReplyVO;

public interface DiscussionReplyDao {
	public List<DiscussionReplyVO> getReplyByDisc(Map<String,Integer> replyPair);
	public Integer getReplyCount(int discId);
	public int getMax(int discId);
	public void insertReply(DiscussionReplyVO reply);
	public void updateReply(DiscussionReplyVO reply);
	public void deleteReply(int replyId);
	public void updateUp(Map<String,Integer> upMap);
	public void updateDown(Map<String, Integer> downMap);
	public void updateReply(Map<String,Integer> upDown);
	public DiscussionReplyVO getReplyByRId(int replyId);
}
