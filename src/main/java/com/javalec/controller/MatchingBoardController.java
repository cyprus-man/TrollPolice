package com.javalec.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javalec.service.matchingBoard.MatchingBoardService;
import com.javalec.service.matchingBoard.MatchingDeleteServiceImpl;
import com.javalec.service.matchingBoard.MatchingDetailServiceImpl;
import com.javalec.service.matchingBoard.MatchingListServiceImpl;
import com.javalec.service.matchingBoard.MatchingReplyListImpl;
import com.javalec.service.matchingBoard.MatchingReplyListServiceImpl;
import com.javalec.service.matchingBoard.MatchingReplyWriteServiceImpl;
import com.javalec.service.matchingBoard.MatchingUpdateActionServiceImpl;
import com.javalec.service.matchingBoard.MatchingUpdateServiceImpl;
import com.javalec.service.matchingBoard.MatchingWriteServiceImpl;
import com.javalec.service.matchingBoard.SearchMatchingNicknameImpl;
import com.javalec.service.matchingBoard.UpdatePartnerServiceImpl;
import com.javalec.service.matchingBoard.ValidDuoServiceImpl;

@Controller
public class MatchingBoardController {

	@Autowired
	ApplicationContext context;

	MatchingBoardService service;

	@RequestMapping("/matchingBoard")
	public String matching(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service = (MatchingBoardService) context.getBean(MatchingListServiceImpl.class);
		return service.execute(request, response);
	}

	@RequestMapping("/matchingDetail")
	public String detail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		service = (MatchingBoardService) context.getBean(MatchingDetailServiceImpl.class);
		return service.execute(request, response);
	}

	@RequestMapping("/choice")
	public String choice(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		service = (MatchingBoardService) context.getBean(UpdatePartnerServiceImpl.class);
		return service.execute(request, response);
	}

	@RequestMapping("/matchingWrite")
	public String write(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "matchingWrite";
	}

	@RequestMapping("/matchingAction")
	public String writeAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service = (MatchingBoardService) context.getBean(MatchingWriteServiceImpl.class);
		return service.execute(request, response);
	}

	@RequestMapping("/matchingReplyAction")
	public String replyWriteAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service = (MatchingBoardService) context.getBean(MatchingReplyWriteServiceImpl.class);
		return service.execute(request, response);
	}

	@RequestMapping("/validDuo")
	public String validDuo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service = context.getBean(ValidDuoServiceImpl.class);
		return service.execute(request, response);
	}

	@RequestMapping(value = "/matchingReplyList", method = RequestMethod.GET)
	@ResponseBody
	public String replyList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service = (MatchingBoardService) context.getBean(MatchingReplyListServiceImpl.class);
		return service.execute(request, response);
	}

	@RequestMapping("/matchingUpdate")
	public String matchingUpdate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service = (MatchingBoardService) context.getBean(MatchingUpdateServiceImpl.class);
		return service.execute(request, response);
	}

	@RequestMapping("/matchingUpdateAction")
	public String matchingUpdateAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service = (MatchingBoardService) context.getBean(MatchingUpdateActionServiceImpl.class);
		return service.execute(request, response);
	}

	@RequestMapping("/matchingDelete")
	public String matchingDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service = (MatchingBoardService) context.getBean(MatchingDeleteServiceImpl.class);
		return service.execute(request, response);
	}

	@RequestMapping("/getReplys")
	public void getReplys(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service = (MatchingBoardService) context.getBean(MatchingReplyListImpl.class);
		service.execute(request, response);
	}
	//듀오게시판 검색기능 
	@RequestMapping("/searchMatchingNickname")
	public String srcTroll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		service = (MatchingBoardService) context.getBean(SearchMatchingNicknameImpl.class);
		return service.execute(request, response);
	}
}
