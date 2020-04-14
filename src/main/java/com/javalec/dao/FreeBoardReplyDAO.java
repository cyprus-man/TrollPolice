package com.javalec.dao;

import java.util.List;

import com.javalec.vo.FreeBoardReplyVO;

public interface FreeBoardReplyDAO {
	public List<FreeBoardReplyVO>list(Integer bno,int start,int end);
	public void create(FreeBoardReplyVO vo);
	public void update(FreeBoardReplyVO vo);
	public void delete(Integer rno);
	public int count(Integer bno);
	public FreeBoardReplyVO detail(Integer rno);
}
