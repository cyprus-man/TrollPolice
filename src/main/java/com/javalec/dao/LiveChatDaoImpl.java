package com.javalec.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javalec.vo.LiveChatContentVO;
import com.javalec.vo.LiveChatVO;

@Repository
public class LiveChatDaoImpl implements LiveChatDao {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<LiveChatVO> getRoomList(String email){
		List<LiveChatVO> rooms=null;
		rooms=sqlSession.selectList("LiveChatNS.list", email);
		return rooms;
	}
	
	@Override
	public int countMyChat(String email) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("LiveChatNS.countMyChat",email);
	}
	@Override
	public int isExists(String email1,String email2) {
		Map<String,String> param = new HashMap<String, String>();
		param.put("email1",email1);
		param.put("email2",email2);
		return sqlSession.selectOne("LiveChatNS.isExists",param);
	}
	@Override
	public void deleteChatContent(int chatId) {
		sqlSession.delete("LiveChatNS.deleteChatContent", chatId);
	}
	
	@Override
	public void updateConfirm(Map<String,Object> map) {
		sqlSession.update("LiveChatNS.confirmContent",map);
	}

	
	
	@Override
	public void expireChatRoom(Map<String, Object> chatIdAndConfirmExit) {
		sqlSession.update("LiveChatNS.expireChatRoom",chatIdAndConfirmExit);
	}

	@Override
	public int getConfirmCount(Map<String, String> confirmMap) {
		return sqlSession.selectOne("LiveChatNS.getConfirmCount",confirmMap);
	}
	
	@Override
	public void insertChatContent(LiveChatContentVO chatContent) {
		sqlSession.insert("LiveChatNS.insertChatContent",chatContent);
		
	}
	@Override
	public List<LiveChatContentVO> getContentList(int chatId) {
		List<LiveChatContentVO> contents = sqlSession.selectList("LiveChatNS.getContentListById",chatId);
		return contents;
	}
}
