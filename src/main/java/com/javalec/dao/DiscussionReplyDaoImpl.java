package com.javalec.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javalec.vo.DiscussionReplyVO;

@Repository
public class DiscussionReplyDaoImpl implements DiscussionReplyDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<DiscussionReplyVO> getReplyByDisc(Map<String, Integer> replyPair) {
		// TODO 리플을 얻어옴 리리플 까지.map에는 rid 와 pid가 있어야한다 .
		List<DiscussionReplyVO> reply = sqlSession.selectList("ReplyNS.getReplyByDisc", replyPair);
		return reply;
	}

	@Override
	public DiscussionReplyVO getReplyByRId(int replyId) {
		return sqlSession.selectOne("ReplyNS.getReplyByRId", replyId);
	}

	@Override
	public int getMax(int discId) {
		Integer nowId = sqlSession.selectOne("ReplyNS.getMax", discId);
		nowId = nowId == null ? 1 : nowId;
		return nowId;
	}

	@Override
	public Integer getReplyCount(int discId) {
		Integer replyCount = sqlSession.selectOne("ReplyNS.getReplyCount", discId);
		return replyCount;
	}

	@Override
	public void insertReply(DiscussionReplyVO reply) {
		sqlSession.insert("ReplyNS.insertReply", reply);
	}

	@Override
	public void updateReply(DiscussionReplyVO reply) {
		sqlSession.update("ReplyNS.updateReplyContent", reply);
	}

	@Override
	public void deleteReply(int replyId) {
		// child vote delete -> child delete -> vote delete -> reply Delete ...
		sqlSession.selectOne("ReplyNS.deleteReply", replyId);
	}

	@Override
	public void updateUp(Map<String, Integer> upMap) {
		sqlSession.update("ReplyNS.updateUp", upMap);

	}

	@Override
	public void updateDown(Map<String, Integer> downMap) {
		sqlSession.update("ReplyNS.updateDown", downMap);
	}

	@Override
	public void updateReply(Map<String, Integer> upDown) {
		// TODO Auto-generated method stub
		sqlSession.update("ReplyNS.updateUpDown", upDown);
	}
	/*
	 * DELETE PROCEDURE create or replace procedure delete_disc_reply_proc
	 * (p_reply_id IN discussion_reply.disc_reply_id % TYPE) IS child_count number
	 * := 0; vote_count number :=0; BEGIN SELECT count(*) INTO child_count FROM
	 * discussion_reply WHERE disc_parent_id = p_reply_id;
	 * 
	 * SELECT count(*) INTO vote_count FROM (SELECT * from discussion_reply WHERE
	 * disc_parent_id = p_reply_id);
	 * 
	 * IF child_count != 0 THEN delete child_vote delete from disc_reply_vote where
	 * disc_reply_id in (select disc_reply_id from discussion_reply where
	 * disc_parent_id = p_reply_id);
	 * 
	 * --delete child delete from discussion_reply where disc_parent_id =
	 * p_reply_id; END IF;
	 * 
	 * IF vote_count != 0 THEN --delete vote delete from disc_reply_vote vote where
	 * vote.disc_reply_id = p_reply_id; END IF;
	 * 
	 * delete from discussion_reply where disc_reply_id = p_reply_id; commit; end;
	 */
}
