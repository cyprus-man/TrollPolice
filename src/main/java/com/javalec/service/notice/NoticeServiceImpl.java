package com.javalec.service.notice;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.dao.NoticeDao;
import com.javalec.service.member.MemberService;
import com.javalec.vo.MemberVO;
import com.javalec.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	SqlSession sqlSession;
	
	NoticeDao dao;
	
	@PostConstruct
	public void postInit() {
		this.dao= sqlSession.getMapper(NoticeDao.class);
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("NoticeServiceImpl");
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if(loginUser==null) {
			return "main";
		}
		
		String email = loginUser.getEmail();
		String nickname = loginUser.getNickname();
		List<NoticeVO> noticeVO = dao.selectNoticeForDisc(nickname);
		List<NoticeVO> noticeVOList = dao.selectNoticeForMatching(email);		
		List<NoticeVO> noticeVOList2 = dao.selectNoticeForReply(nickname);
		//dao에서 넣을때 ArrayList로 안넣어져서 여기서 합침		
		ArrayList<NoticeVO> noticeList=(ArrayList<NoticeVO>) noticeVOList;		
		
		if(noticeVOList2 != null) noticeList.addAll(noticeVOList2);
		if(noticeVO != null) noticeList.addAll(noticeVO);
		
		
		session.setAttribute("noticeList", noticeList);		
		
		System.out.println("noticeList:"+noticeList);
		
		return "main";
	}
}
