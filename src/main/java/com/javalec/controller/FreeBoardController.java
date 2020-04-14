package com.javalec.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.javalec.service.freeBoard.FreeBoardServiceImpl;
import com.javalec.vo.FreeBoardPager;
import com.javalec.vo.FreeBoardVO;
import com.javalec.vo.MemberVO;

@Controller
public class FreeBoardController {
	@Inject
	FreeBoardServiceImpl boardService;  
	
	@RequestMapping("/freeBoardList" )
	public ModelAndView list(@RequestParam(defaultValue="title")String searchOption,
							@RequestParam(defaultValue="")String keyword,
							@RequestParam(defaultValue="1")int curPage) throws Exception{
		int count = boardService.countArticle(searchOption,keyword);	
		FreeBoardPager boardPager = new FreeBoardPager(count,curPage);
		int start = boardPager.getPageBegin();
		int end=boardPager.getPageEnd();	
		List<FreeBoardVO>list = boardService.listAll(start,end,searchOption,keyword);
		ModelAndView mav=new ModelAndView();
		Map<String,Object>map=new HashMap<String,Object>();
		map.put("list",list);
		map.put("count",count);
		map.put("searchOption",searchOption);
		map.put("keyword",keyword);
		map.put("boardPager",boardPager);
		mav.addObject("map",map);
		mav.setViewName("freeBoardList");
		return mav;  
	}
	@RequestMapping(value="freeBoardWrite",method=RequestMethod.GET)
	public String write() {
		return "freeBoardWrite";
	}                 
	@RequestMapping(value="freeBoardUpdateBoard",method= RequestMethod.POST)
	public ModelAndView updateboard(@RequestParam int bno,HttpSession session)throws Exception {
		boardService.increaseViewcnt(bno, session);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("freeBoardWriteUpdate");
		mav.addObject("dto",boardService.read(bno));
		return mav;
	}
	
	@RequestMapping(value="freeBoardInsert",method= RequestMethod.POST)
	public String insert(@ModelAttribute FreeBoardVO vo, HttpSession session) throws Exception{
		MemberVO email = (MemberVO)session.getAttribute("loginUser");
		String writer =email.getEmail();
		vo.setWriter(writer);
		boardService.create(vo);
		return "redirect:freeBoardList";
	} 
	
	@RequestMapping(value="freeBoardView",method=RequestMethod.GET)
	public ModelAndView view(@RequestParam int bno,HttpSession session,@ModelAttribute FreeBoardVO vo) throws Exception{
		boardService.increaseViewcnt(bno,session);
		MemberVO nickname = (MemberVO)session.getAttribute("loginUser");
		String writer =nickname.getNickname();
		vo.setWriter(writer);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("freeBoardView");
		mav.addObject("VO",vo);
		mav.addObject("dto",boardService.read(bno));
		return mav;
	} 
	
	@RequestMapping(value="freeBoardUpdate",method=RequestMethod.POST)
	public String update(@ModelAttribute FreeBoardVO vo) throws Exception{
		boardService.update(vo);
		return "redirect:freeBoardList";
	}
	
	@RequestMapping(value="freeBoardDelete" , method=RequestMethod.POST)
	public String delete(@RequestParam int bno,HttpServletRequest request) throws Exception{
		boardService.delete(request,bno);
		return "redirect:freeBoardList"; 
	}
	
}
