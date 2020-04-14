package com.javalec.service.freeBoard;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.javalec.dao.FreeBoardDAO;
import com.javalec.vo.FreeBoardVO;
import com.javalec.vo.MemberVO;


@Service
public class FreeBoardServiceImpl {
	
	@Inject 
	FreeBoardDAO boardDao;
	
	
	public void create(FreeBoardVO vo) throws Exception {
		System.out.println(this.getClass().getName());
		boardDao.create(vo);
	}

	
	public FreeBoardVO read(int bno) throws Exception {
		return boardDao.read(bno);
	}

	
	public void update(FreeBoardVO vo) throws Exception {
		boardDao.update(vo);
	} 

	
	public void delete(HttpServletRequest request,int bno) throws Exception {
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
//		String email = loginUser.getNickname();
		String writer = loginUser.getEmail();
		boardDao.delete(bno,writer);
	}

	
	public List<FreeBoardVO> listAll(int start,int end,String searchOption,String keyword) throws Exception {
		return boardDao.listAll(start,end,searchOption,keyword);
	}
	
	
	public int countArticle(String searchOption,String keyword)throws Exception{
		return boardDao.countArticle(searchOption,keyword);
	}

	
	public void increaseViewcnt(int bno, HttpSession session) throws Exception {
		long update_time=0;
		if(session.getAttribute("update_time_"+bno)!=null) {
			update_time=(long)session.getAttribute("update_time_"+bno);
		}
		long current_time = System.currentTimeMillis();
		if(current_time - update_time > 5*1000) {
			boardDao.increaseViewcnt(bno);
			session.setAttribute("update_time_"+bno, current_time);
		}
		
	}
	
	
	

}
