package com.javalec.service.matchingBoard;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.dao.LiveChatDao;
import com.javalec.dao.MatchingBoardDao;
import com.javalec.dao.MemberDao;
import com.javalec.dao.NoticeDao;
import com.javalec.rest.APIConnection;
import com.javalec.vo.MemberVO;

@Service
public class UpdatePartnerServiceImpl implements MatchingBoardService {

	@Autowired
	public MatchingBoardDao dao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private LiveChatDao chatDao;
	@Autowired
	SqlSession sqlSession;

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("UpdatePartnerServiceImpl");
		// 채팅방이 열림과 동시에 매칭-게시판이 닫힘
		String id = request.getParameter("matchingBoardId");

		// id==null인경우는 없어야한다
		if (id == null)
			return null;

		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		String nickname1 = loginUser.getNickname();
		String nickname2 = request.getParameter("nickname");

		String email1 = loginUser.getEmail();
		String email2 = request.getParameter("email2");

		PrintWriter pw = response.getWriter();

		if (chatDao.countMyChat(email1) >= 3) {
			pw.write("fail");
			if (pw != null)
				pw.close();
			return null;
		} else if (chatDao.countMyChat(email2) >= 3) {
			pw.write("fail");
			if (pw != null)
				pw.close();
			return null;
		} else if (chatDao.isExists(email1, email2) >= 1) {
			pw.write("exists");
			if (pw != null)
				pw.close();
			return null;
		}
		String lane1 = request.getParameter("lane1");
		String lane2 = request.getParameter("lane2");

		System.out.println(nickname1);
		System.out.println(nickname2);
		System.out.println(email1);
		System.out.println(email2);

		// Matching -> Expired
		dao.updateExpired(Integer.parseInt(id));

		MemberVO partner = memberDao.getMemberByEmail(email2);
		System.out.println("partner:" + partner);

		String mostChamp1Str = request.getParameter("mostChamp1");
		int mostChamp1 = Integer.parseInt(mostChamp1Str);

		Map<String, Object> summonerInfo2 = APIConnection.getMostChampByName(partner.getNameId(),
				partner.getEncrypedID());
		int mostChamp2 = (int) summonerInfo2.get("mostChamp");

		HashMap<String, Object> param2 = new HashMap<String, Object>();
		param2.put("chatId",id);
		param2.put("email1", email1);
		param2.put("email2", email2);
		param2.put("mostChamp1", mostChamp1);
		param2.put("mostChamp2", mostChamp2);
		param2.put("lane1", lane1);
		param2.put("lane2", lane2);
		int day = 24 * 60 * 60 * 1000;
		param2.put("chatExpired", new java.util.Date().getTime() + day);

		System.out.println(param2.toString());

		// notice에 insert
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("type", "matching");
		param.put("targetId", id);
		noticeDao.insertNotice(param);
		
		dao.insertLiveChatRoom(param2);

		pw.write("open");
		if (pw != null)
			pw.close();

		return null;
	}

}
