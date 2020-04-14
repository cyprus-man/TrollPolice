package com.javalec.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javalec.service.discussionBoard.DiscDeleteVoteServiceImpl;
import com.javalec.service.discussionBoard.DiscDetailServiceImpl;
import com.javalec.service.discussionBoard.DiscUpateVoteServiceImpl;
import com.javalec.service.discussionBoard.DiscVoteServiceImpl;
import com.javalec.service.discussionBoard.DiscussionBoardService;
import com.javalec.service.discussionBoard.InsertDiscImpl;
import com.javalec.service.discussionBoard.ListServiceImpl;
import com.javalec.service.discussionBoard.MyTrollListImpl;
import com.javalec.service.discussionBoard.ReportListImpl;
import com.javalec.service.discussionBoard.SearchMyTrollImpl;
import com.javalec.service.discussionBoard.SearchTrollAJAX;
import com.javalec.service.discussionBoard.SearchTrollImpl;
import com.javalec.service.discussionBoard.SendMatchImpl;

@Controller
public class DiscussionBoardController {

	@Autowired
	ApplicationContext context;

	DiscussionBoardService service;

	@RequestMapping("/discussionBoard")
	public String discussionBoard(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		service = (DiscussionBoardService) context.getBean(ListServiceImpl.class);
		return service.execute(request, response);
	}

	@RequestMapping("/insertDisc")
	public String insertBoard(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service = context.getBean(InsertDiscImpl.class);
		return service.execute(request, response);
	}

	@RequestMapping(value = { "/discDetail", "/discussionBoard/discDetail" })
	public String discDetail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		service = (DiscussionBoardService) context.getBean(DiscDetailServiceImpl.class);

		return service.execute(request, response);
	}
	
	@RequestMapping("/getMatchByBoard")
	public void sendMatch(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		service =  context.getBean(SendMatchImpl.class);
		service.execute(request, response);
	}
	
	@RequestMapping("/srcTroll")
	public String srcTroll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		service = (DiscussionBoardService) context.getBean(SearchTrollImpl.class);
		
		return service.execute(request, response);
	}
	@RequestMapping("/srcTrollAjax")
	public String srcTrollAjax(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		service = (DiscussionBoardService) context.getBean(SearchTrollAJAX.class);
		return service.execute(request, response);
	}
	@RequestMapping("/insertTrollVote")
	public String trollVote(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		service = (DiscussionBoardService) context.getBean(DiscVoteServiceImpl.class);
		return service.execute(request, response);
	}
	
	@RequestMapping("/updateTrollVote")
	public String switchVote(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		service = (DiscussionBoardService) context.getBean(DiscUpateVoteServiceImpl.class);
		return service.execute(request, response);
			
	}
	
	@RequestMapping("/deleteTrollVote")
	public String cancelTroll(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		service = (DiscussionBoardService) context.getBean(DiscDeleteVoteServiceImpl.class);
		return service.execute(request, response);
	}
	
	
	
	/*reportList */
	@RequestMapping("/getReportList")
	public String Report_List(HttpServletRequest request, HttpServletResponse response) throws Exception {
		service = context.getBean(ReportListImpl.class);
		return service.execute(request, response);
	}
	@RequestMapping("/getTrollList")
	public String trollList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		service = context.getBean(MyTrollListImpl.class);
		return service.execute(request, response);
	}
	
	@RequestMapping("/searchMyTroll")
	public String searchMyTroll(HttpServletRequest request, HttpServletResponse response) throws Exception {
		service = context.getBean(SearchMyTrollImpl.class);
		return service.execute(request, response);
	}
}
