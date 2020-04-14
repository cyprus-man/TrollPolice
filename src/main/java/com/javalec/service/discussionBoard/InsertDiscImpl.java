package com.javalec.service.discussionBoard;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.javalec.dao.DiscussionBoardDao;
import com.javalec.dao.NoticeDao;
import com.javalec.dao.TrollerDao;
import com.javalec.rest.APIConnection;
import com.javalec.vo.DiscussionBoardVO;
import com.javalec.vo.MatchVO;
import com.javalec.vo.MemberVO;
import com.javalec.vo.TrollerVO;

@Service
public class InsertDiscImpl implements DiscussionBoardService {

	@Autowired
	DiscussionBoardDao dao;
	@Autowired
	ApplicationContext context;
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		// Cache 삭제 추가...
		if (loginUser == null) {
			request.setAttribute("message", "로그인 후 이용 가능합니다.");
			return "redirect:login";
		}

		// TODO 2.parameter 가공
		// discboard matchId = fk
		String matchString = request.getParameter("match");

		// json to VO ---- Mapping is successful
		Gson gson = new Gson();
		MatchVO match = gson.fromJson(matchString, MatchVO.class);

		// get login user to insert discussion board

		DiscussionBoardVO board = new DiscussionBoardVO();
		long weekTime = 1000 * 60 * 60 * 24 * 7;
		Date now = new Date();

		
		// boardVO setting
		String troller = request.getParameter("troller");
		board.setContent(request.getParameter("content"));
		board.setDiscBoardId(dao.maxId());
		board.setEmail(loginUser.getEmail());
		board.setExpired(now.getTime() + weekTime);
		board.setMatchVO(match);
		board.setNickname(loginUser.getNickname());
		board.setTroller(troller);
		board.setWriteDate(now);
		
		
		if (!dao.isInserted(match.getMatchId())) {
			dao.insertMatch(match);
		}
		else {
			Map<String,String> trollerNmatchId = new HashMap<String,String>();
			
			trollerNmatchId.put("troller",board.getTroller());
			trollerNmatchId.put("matchId",Long.toString(board.getMatchVO().getMatchId()));
			Integer discBoardId = dao.isDiscuss(trollerNmatchId); 
			System.out.println("discBoardId : "+discBoardId);
			
			if(discBoardId != null){
				//이미 토론중임
				request.setAttribute("message","이미 등록된 게임의 트롤러입니다.");
				request.setAttribute("discBoardId", discBoardId);
				
				return "report";
			}
		}
		
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);
		
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("type","disc");
		param.put("targetId",board.getDiscBoardId());
		
		noticeDao.insertNotice(param);
		dao.insertBoard(board);
		TrollerDao trollerDao = sqlSession.getMapper(TrollerDao.class);
		
		
		if(trollerDao.isTroller(troller) == 0) {
			TrollerVO trollerVO = new TrollerVO();
			trollerVO.setNickname(troller);
			Map<String,String> memberId = APIConnection.getMemberIdByName(troller);
			trollerVO.setNameId(memberId.get("nameId"));
			trollerVO.setEncrypedID(memberId.get("eId"));
			trollerVO.setTier(APIConnection.getTierByNameId(memberId.get("nameId")));
			trollerDao.insertTroller(trollerVO);
		}
		
		return "redirect:discussionBoard";
	}
}
