package com.javalec.dao;

import java.util.List;

import com.javalec.vo.FreeBoardVO;
import com.javalec.vo.FreeBoardCriteria;


public interface FreeBoardDAO {
	public void create(FreeBoardVO vo);
	public FreeBoardVO read(int bno);
	public void update(FreeBoardVO vo);
	public void delete(int bno,String email);
	public List<FreeBoardVO> listAll(int start,int end,String searchOption,String keyword);
	public void increaseViewcnt(int bno);
	public int countArticle(String searchOption,String keyword);
	
}
