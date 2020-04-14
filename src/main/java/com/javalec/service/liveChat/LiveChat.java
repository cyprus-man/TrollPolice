package com.javalec.service.liveChat;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.google.gson.Gson;
import com.javalec.dao.LiveChatDao;
import com.javalec.vo.LiveChatContentVO;
import com.javalec.vo.MemberVO;

@Component
@ServerEndpoint(value = "/chat.do", configurator = HttpSessionConfigurator.class)
public class LiveChat {

	private  final Logger logger = LoggerFactory.getLogger(LiveChat.class);
	private  static final Map<Session, EndpointConfig> configs = Collections.synchronizedMap(new HashMap<>());

	private static LiveChatDao dao;
	
	@Autowired 
	private LiveChatDao injectedDao;
	
	@PostConstruct
	public void postInit() {
		dao=this.injectedDao;
	}
	
	@OnOpen
	public  void onOpen(Session session, EndpointConfig config) {
		logger.info("Open Session Id : " + session.getId());
		
		HttpSession httpSession = (HttpSession)config.getUserProperties().get(HttpSession.class.getName());
		httpSession.removeAttribute("refresh");
		System.out.println("onopen");
		if (!configs.containsKey(session)) {
			// cofing Map 에다가 session을 키로 해서 config 값을 넣는다 .
			// config 는 내가 먼저 설정한 configurator
			configs.put(session, config);
		}
	}

	@OnMessage
	public  void onMessage(String message, Session session) {
		logger.info("message from : " + session.getId());
		
		//PROTOCOL : 1.command ,{2. chatId}   OR 1. message
		String[] messages = message.split(":");
		//방 나가기, 
		
		if(messages.length==2) {
			
			if("exit".equals(messages[0])) {
				System.out.println("start_exit");
				int chatId = Integer.parseInt(messages[1]);
				
				//방 내보내기
				exitRoom(session,chatId);
			}
			
		}
		//소켓 연결중에 만료된 경우... 
		else if ("expired".equals(messages[0])){
			System.out.println("start_expired");
			int chatId = Integer.parseInt(messages[1]);
			
			//세션에서만 삭제
			exitRoom(session,chatId);
			//채팅 내용 삭제
			dao.deleteChatContent(chatId);
			Map<String,Object> chatIdAndConfirmExit = new HashMap<String,Object>();
			chatIdAndConfirmExit.put("chatId",chatId);
			chatIdAndConfirmExit.put("confirmExit",0);
			//채팅 만료
			dao.expireChatRoom(chatIdAndConfirmExit);
		}
		else {
			Gson gson = new Gson();
			LiveChatContentVO chat = gson.fromJson(message, LiveChatContentVO.class);
			SimpleDateFormat sdf = (SimpleDateFormat) SimpleDateFormat.getInstance();
			chat.setDateFormat(sdf.format(chat.getSendDate()));
			System.out.println(chat.toString());
	
			sendToDuo(session, gson.toJson(chat), chat.getChatId());
		}
		// logic 수정...
		// System.out.println(chat.toString());
	}

	@OnError
	public  void onError(Throwable e, Session session) {
		System.out.println(e.getMessage());
	}

	@OnClose
	public  void onClose(Session session) {
		logger.info("Session " + session.getId() + " has ended");
		System.out.println("onClose");
		
		// TO DELETE REMOVE CHAT ID LIST
		HttpSession httpSession = (HttpSession) configs.get(session).getUserProperties()
				.get(HttpSession.class.getName());
		Boolean refresh = (Boolean)httpSession.getAttribute("refresh");
		
		//보완이 필요하다 ... 새로고침시 채팅기능 고장남 .. .아마도 이부분 때문
		if(refresh==null) {
			httpSession.removeAttribute("chatIdList");
			httpSession.removeAttribute("chatId");
			
		}else if(refresh==true){
			System.out.println("새로고침");
			httpSession.removeAttribute("refresh");
		}
		configs.remove(session);
	}
	
	public void exitRoom(Session sender, int chatId) {
		for(Session session : configs.keySet()) {
			if(session==sender) {
				continue;
			}
			HttpSession httpSession = (HttpSession) configs.get(session).getUserProperties().get(HttpSession.class.getName());
			List<Integer> chatIdList = (List<Integer>) httpSession.getAttribute("chatIdList");
			for(int i=0;i<chatIdList.size();i++) {
				if(chatId==chatIdList.get(i)) {
					chatIdList.remove(i);
					Integer joinChatId = (Integer)httpSession.getAttribute("chatId");
					
					if(joinChatId!=null) {
						if(joinChatId == chatId) {
							httpSession.removeAttribute("chatId");
						}
					}
					//PROTOCOL : command:message
					session.getAsyncRemote().sendText("alert:"+chatId);
					break;
				}
			}
		}
	}
	private  void sendToDuo(Session self, String message, int senderChatId) {
		try {
			for (Session session : configs.keySet()) {
				// configs 에 담긴 websocket session 을 키로해서 userProperties 를 갖고온후 거기서 Http세션을 갖고온다.
				HttpSession userSession = (HttpSession) configs.get(session).getUserProperties()
						.get(HttpSession.class.getName());
				
				System.out.println(userSession.getId());
				
				// 방에 참가중이면...
				List<Integer> chatIdList = (List<Integer>) userSession.getAttribute("chatIdList");
				
				for (Integer chatId : chatIdList) {
					System.out.println("chatId : " + chatId);
					if (chatId == senderChatId) {
						if ((Integer) userSession.getAttribute("chatId") == chatId) {
							//isInRoom Confirm Message
							Map<String,Object> map = new HashMap<String,Object>();
							MemberVO loginUser = (MemberVO) userSession.getAttribute("loginUser");
							
							map.put("email",loginUser.getEmail());
							map.put("chatId",chatId);
							System.out.println(map.toString());
							
							if(self!=session) {
								//방에 참가중일때 확인개수 감소.
								System.out.println(dao);
								dao.updateConfirm(map);
							}
						}
						
						session.getAsyncRemote().sendText(message);
						break;
					}
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
