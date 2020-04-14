package com.javalec.service.freeBoard;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.javalec.vo.FreeBoardVO;


public interface FreeBoardService {
	public void create(FreeBoardVO vo) throws Exception;
	public FreeBoardVO read(int bno) throws Exception;
	public void update(FreeBoardVO vo) throws Exception;
	public void delete(int bno) throws Exception;
	public List<FreeBoardVO> listAll(int start,int end,String searchOption,String keyword) throws Exception;
	public void increaseViewcnt(int bno,HttpSession session) throws Exception;
	public int countArticle(String cearchOption,String keword) throws Exception;

}
