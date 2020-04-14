package com.javalec.service.freeBoard;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.javalec.dao.FreeBoardReplyDAO;
import com.javalec.vo.MemberVO;
import com.javalec.vo.FreeBoardReplyVO;

@Service
public class FreeBoardReplyServiceImpl implements FreeBoardReplyService{
	@Inject
	FreeBoardReplyDAO replyDao;
	
	@Override
	public List<FreeBoardReplyVO> list(Integer bno,int start,int end,HttpSession session){
		return replyDao.list(bno, start, end);
	}
	@Override
	public FreeBoardReplyVO detail(Integer rno) {
		return replyDao.detail(rno);
	}
	@Override
	public void create(FreeBoardReplyVO vo) {
		replyDao.create(vo);
	}
	@Override
	public void update(FreeBoardReplyVO vo) {
		replyDao.update(vo);
	}
	@Override
	public void delete(Integer rno) {
			replyDao.delete(rno);
	}
	public int count(Integer bno) {
		return replyDao.count(bno);
	}
}
