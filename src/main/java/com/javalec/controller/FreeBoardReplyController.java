package com.javalec.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.javalec.service.freeBoard.FreeBoardReplyService;
import com.javalec.vo.FreeBoardReplyPager;
import com.javalec.vo.MemberVO;
import com.javalec.vo.FreeBoardReplyVO;

@RestController
@RequestMapping("/reply/*")
public class FreeBoardReplyController {
	@Inject
	FreeBoardReplyService replyService; 
	
	@RequestMapping("freeReplyInsert")
	public void insert(@ModelAttribute FreeBoardReplyVO vo,HttpSession session) {
		MemberVO nickname = (MemberVO)session.getAttribute("loginUser");
		String userName=nickname.getNickname();	
		vo.setReplyer(userName);
		replyService.create(vo); 
	}
	@RequestMapping(value="freeReplyInsertRest",method=RequestMethod.POST)
	public ResponseEntity<String>insertRest(@RequestBody FreeBoardReplyVO vo,HttpSession session){
		ResponseEntity<String>entity=null;
		try {
			MemberVO nickname= (MemberVO)session.getAttribute("loginUser");
			String userName=nickname.getNickname();
			vo.setReplyer(userName);
			replyService.create(vo);
			entity=new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping("freeReplyList")
	public ModelAndView list(@RequestParam int bno, ModelAndView mav,
							@RequestParam(defaultValue="1")int curPage,
							HttpSession session) {
		int count=replyService.count(bno);
		FreeBoardReplyPager replyPager= new FreeBoardReplyPager(count,curPage);
		int start = replyPager.getPageBegin();
		int end = replyPager.getPageEnd();
		List<FreeBoardReplyVO>list=replyService.list(bno,start,end,session);
		mav.setViewName("/freeBoardReplyList");
		mav.addObject("list",list);
		mav.addObject("replyPager",replyPager);
		return mav;
	}
	@RequestMapping("listJson.do")
	@ResponseBody
	public List<FreeBoardReplyVO>listJson(@RequestParam int bno,@RequestParam(defaultValue="1")int curPage,HttpSession session){
		int count=replyService.count(bno);
		FreeBoardReplyPager pager= new FreeBoardReplyPager(count,curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		List<FreeBoardReplyVO>list=replyService.list(bno, start, end, session);
		return list;

	}

	@RequestMapping(value="/freeReplyList/{bno}/{curPage}",method=RequestMethod.GET)
	public ModelAndView replyList(@PathVariable("bno") int bno,@PathVariable int curPage,ModelAndView mav,HttpSession session) {
		int count=replyService.count(bno);
		FreeBoardReplyPager replyPager= new FreeBoardReplyPager(count,curPage);
		int start = replyPager.getPageBegin();
		int end=replyPager.getPageEnd();
		List<FreeBoardReplyVO>list=replyService.list(bno,start,end,session);
		mav.setViewName("/freeBoardReplyList");
		mav.addObject("list",list);
		mav.addObject("replyPager",replyPager);
		return mav;
	}
	@RequestMapping(value="/freeReplyDetail/{rno}",method=RequestMethod.GET)
	public ModelAndView replyDetail(@PathVariable("rno")Integer rno,ModelAndView mav) {
		FreeBoardReplyVO vo=replyService.detail(rno);
		mav.setViewName("/freeBoardReplyDetail");
		mav.addObject("vo",vo);
		return mav;
	}
	@RequestMapping(value="/freeReplyUpdate/{rno}",method= {RequestMethod.PUT,RequestMethod.PATCH})
	public ResponseEntity<String> replyUpdate(@PathVariable("rno")Integer rno,@RequestBody FreeBoardReplyVO vo){
		ResponseEntity<String> entity=null;
		try {
			vo.setRno(rno);
			replyService.update(vo);
			entity=new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value="/freeReplyDelete/{rno}")
	public ResponseEntity<String>replyDelete(@PathVariable("rno")Integer rno){
		ResponseEntity<String>entity=null;
		try {
			replyService.delete(rno);
			entity=new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}
