package com.javalec.service.serviceCenter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.dao.DiscussionBoardDao;
import com.javalec.dao.DiscussionReplyDao;
import com.javalec.dao.LiveChatDao;
import com.javalec.dao.MatchingBoardDao;
import com.javalec.vo.DiscussionBoardVO;
import com.javalec.vo.DiscussionReplyVO;
import com.javalec.vo.MatchingBoardVO;

@Service
public class ServiceDetailImpl implements ServiceCenterService {

	@Autowired
	DiscussionBoardDao discDao;
	@Autowired
	DiscussionReplyDao discReplyDao;
	@Autowired
	MatchingBoardDao matchingDao;
	@Autowired
	LiveChatDao chatDao;
	
	//freeDao
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type = request.getParameter("type");
		String targetId = request.getParameter("targetId");
		
		//
		System.out.println("type"+type);
		System.out.println("targetId"+targetId);
		//
		
		PrintWriter pw = response.getWriter();
		StringBuilder result = new StringBuilder();
		
		//TODO reportType : discReply,freeReply,free,disc,chat,matching
		if(targetId==null) return null;
		
		if("discReply".equals(type)) {	
			DiscussionReplyVO discReply = discReplyDao.getReplyByRId(Integer.parseInt(targetId));
			
			result.append(discReply.getEmail());
			result.append(",");
			result.append(discReply.getContent());
			
		}else if("freeReply".equals(type)) {
			
		}else if("free".equals(type)) {
			
		}else if("disc".equals(type)) {
			DiscussionBoardVO disc = discDao.getDiscBoardById(Integer.parseInt(targetId));
			
			result.append(disc.getEmail());
			result.append(",");
			result.append(disc.getContent());
			
		}else if("chat".equals(type)) {
			//새로운 방법으로 전송
		}else if("matching".equals(type)) {
			MatchingBoardVO matching = matchingDao.getMatchingBoardById(Integer.parseInt(targetId));
			result.append(matching.getEmail());
			result.append(",");
			result.append(matching.getContent());
		}
		
		pw.write(result.toString());
		if(pw!=null) pw.close();
		
		return null;
	}

}
