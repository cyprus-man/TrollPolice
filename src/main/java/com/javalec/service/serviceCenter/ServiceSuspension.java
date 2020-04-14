package com.javalec.service.serviceCenter;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.dao.DiscussionReplyDao;
import com.javalec.dao.MemberDao;
import com.javalec.dao.ServiceCenterDao;
import com.javalec.vo.DiscussionReplyVO;
import com.javalec.vo.MemberVO;

@Service
public class ServiceSuspension implements ServiceCenterService{
	@Autowired
	SqlSession sqlSession;
	@Autowired 
	DiscussionReplyDao discReplyDao;
	@Autowired
	MemberDao memberDao;
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//1. serviceBoard delete
		ServiceCenterDao svDao = sqlSession.getMapper(ServiceCenterDao.class);
		String serviceId = request.getParameter("serviceId");
		String email = request.getParameter("email");
		String serviceType = request.getParameter("serviceType");
		String suspensionType = request.getParameter("suspensionType");
		String dStr = request.getParameter("duration");
		int duration = Integer.parseInt(dStr);
		int susType = Integer.parseInt(suspensionType);
		String targetId = request.getParameter("targetId");
		
		
		//2. reported board delete
		//3. member -> suspension
		//4. member _suspension 구현
		//5. member_suspension_ 정지 기록 저장
		MemberVO member = memberDao.getMemberByEmail(email);
		System.out.println(member);
		boolean updateFlag = true;
		//duration = day
		int day = 24*60*60*1000;
		long now = new Date().getTime();
		
		switch(susType) {
		case 1:
			//계정정지
			System.out.println(member.toString());
			member.setSuspensionType("ACCOUNT");
			break;
		case 2:
			//채팅정지 추후구현
			member.setSuspensionType("CHAT");
			break;
		case 3:
			//트롤정지
			member.setSuspensionType("TROLL");
			break;
		default:
			//게시글 삭제
			updateFlag = false;
			break;
		}
		
		if(updateFlag) {
			member.setSuspensionExpired(now+day*duration);
			memberDao.updateMember(member);
		}
		
		//모든경우에 신고글을 삭제한다
		//모든 경우에 타겟 게시글을 삭제한다.
		if("discReply".equals(serviceType)) {	
			discReplyDao.deleteReply(Integer.parseInt(targetId));
		}else if("freeReply".equals(serviceType)) {
			//TODO 추가후 구현
		}else if("free".equals(serviceType)) {
			
		}else if("disc".equals(serviceType)) {
			//TODO 신고게시판 추가후 구현 
			//TODO procedure 만들어야함
			
		}else if("matching".equals(serviceType)) {
			//TODO procedure 만들기.	
		}
		svDao.deleteService(Integer.parseInt(serviceId));
		return null;
	}
	
}
