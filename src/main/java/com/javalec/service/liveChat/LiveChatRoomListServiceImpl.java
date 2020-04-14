package com.javalec.service.liveChat;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.dao.LiveChatDao;
import com.javalec.dao.NoticeDao;
import com.javalec.vo.LiveChatVO;
import com.javalec.vo.MemberVO;

@Service
public class LiveChatRoomListServiceImpl implements LiveChatService {
	
	@Autowired
	public LiveChatDao dao;
	@Autowired
	SqlSession sqlSession;
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("LiveChatRoomListServiceImpl");
		
		
		HttpSession session = request.getSession();
		session.setAttribute("refresh", true);
		MemberVO loginUser=(MemberVO)session.getAttribute("loginUser");
		
		
		if(loginUser==null) return "redirect:login";
		
		String email=loginUser.getEmail();	
		System.out.println("session email:"+email);
		
		List<LiveChatVO> rooms = dao.getRoomList(email);
		
		
		if(rooms.size()==0) return "liveChat";
		
		//TO GET USERS CHAT ID LIST
		List<Integer> chatIdList = new ArrayList<Integer>();
		
		
		long now = new Date().getTime();
		
		for(int i=0;i< rooms.size();i++){
			System.out.println(rooms.get(i).getConfirmExit());
			
			if(rooms.get(i).getIsEnd().equals("N")) {
				//아직 끝나지 않은 채팅
				if(rooms.get(i).getChatExpired() <= now) {
					//TODO 기간 만료된 채팅
					Map<String,Object> chatIdAndConfirmExit = new HashMap<String, Object>();
					chatIdAndConfirmExit.put("chatId",rooms.get(i).getChatId());
					chatIdAndConfirmExit.put("confirmExit",0);
					dao.expireChatRoom(chatIdAndConfirmExit);
					
					rooms.get(i).setIsEnd("Y");
					rooms.get(i).setConfirmExit(0);
					rooms.get(i).setLiveChatContent(null);
					dao.deleteChatContent(rooms.get(i).getChatId());
					
				}else {
					Map<String,String> confirmMap = new HashMap<String,String>();
					confirmMap.put("chatId", Integer.toString(rooms.get(i).getChatId()));
					confirmMap.put("email",email);
					rooms.get(i).setConfirmCount(dao.getConfirmCount(confirmMap));
					chatIdList.add(rooms.get(i).getChatId());
				}
			}else {
				if(rooms.get(i).getConfirmExit()==0) {
					//아직 확인 안함
					System.out.println("confirm--");
					//update room -> NOT CONFIRM TO CONFIRM
					Map<String,Object> chatIdAndConfirmExit = new HashMap<String, Object>();
					chatIdAndConfirmExit.put("chatId",rooms.get(i).getChatId());
					chatIdAndConfirmExit.put("confirmExit",1);
					dao.expireChatRoom(chatIdAndConfirmExit);
				}
			}
		}
		
		if(chatIdList.size()>0)
			session.setAttribute("chatIdList", chatIdList);
		
		//TO GET NOT CHECKED COUNT 
		request.setAttribute("rooms", rooms);
		//notice 지우는 부분
		NoticeDao dao = sqlSession.getMapper(NoticeDao.class);			
		dao.confirmNoticeForMatching(loginUser.getEmail());
		return "liveChat";	

	}

}
