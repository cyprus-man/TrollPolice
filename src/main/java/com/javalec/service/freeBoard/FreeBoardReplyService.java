package com.javalec.service.freeBoard;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.javalec.vo.FreeBoardReplyVO;

public interface FreeBoardReplyService {
	public List<FreeBoardReplyVO> list(Integer bno,int start,int end,HttpSession session);
	public void create(FreeBoardReplyVO vo);
	public FreeBoardReplyVO detail(Integer rno);
	public void update(FreeBoardReplyVO vo);
	public void delete(Integer rno);
	public int count(Integer bno);
}
