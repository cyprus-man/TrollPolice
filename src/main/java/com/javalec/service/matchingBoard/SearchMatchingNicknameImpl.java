package com.javalec.service.matchingBoard;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.dao.MatchingBoardDao;
import com.javalec.vo.MatchingBoardVO;
@Service
public class SearchMatchingNicknameImpl implements MatchingBoardService {
   @Autowired
   public MatchingBoardDao dao;
   
   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      String nickname = request.getParameter("nickname");
      String page = request.getParameter("page");
      if(nickname == null) return "matchingBoard";
      if(page==null) page = "1";
      int pageNum = Integer.parseInt(page);
       
      List<MatchingBoardVO> boards = (List<MatchingBoardVO>)dao.searchList(nickname, pageNum);
      
      //PAGING
      int cnt = dao.countByNickname(nickname);
      int lastPage = cnt/15;
      lastPage += cnt%15 > 0 ? 1 : 0;
      int pageStart = ((pageNum-1)/5)*5+1;
      int pageEnd = pageStart+4;
      pageEnd = pageEnd>lastPage ? lastPage : pageEnd;
      
      request.setAttribute("boards", boards);
      request.setAttribute("nickname",nickname);
      request.setAttribute("page", page);            
      
      /* page Start + pageEnd  COUNT 쿼리 작성*/ 
      request.setAttribute("pageStart", pageStart);
      request.setAttribute("pageEnd", pageEnd);
      request.setAttribute("lastPage", lastPage);
      
      return "searchMatching";
      
      
   }

}