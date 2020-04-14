package com.javalec.dao;

import java.util.List;
import java.util.Map;

import com.javalec.vo.LiveChatContentVO;
import com.javalec.vo.LiveChatVO;

public interface LiveChatDao {
	
	public List<LiveChatVO> getRoomList(String email);
	public List<LiveChatContentVO> getContentList(int chatId);
	public int countMyChat(String email);
	public int isExists(String email1,String email2);
	public int getConfirmCount(Map<String,String> confirmMap);
	public void deleteChatContent(int chatId);
	public void updateConfirm(Map<String,Object> map);
	public void expireChatRoom(Map<String,Object> chatIdAndConfirmExit);
	public void insertChatContent(LiveChatContentVO chatContent);
}
