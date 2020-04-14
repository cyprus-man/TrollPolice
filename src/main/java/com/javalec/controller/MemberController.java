package com.javalec.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javalec.service.member.DeleteMemberServiceImpl;
import com.javalec.service.member.EmailValidationServiceImpl;
import com.javalec.service.member.LoginServiceImpl;
import com.javalec.service.member.MemberAjaxService;
import com.javalec.service.member.MemberService;
import com.javalec.service.member.NicknameRenewServiceImpl;
import com.javalec.service.member.ResendValidationImpl;
import com.javalec.service.member.SendNewPassword;
import com.javalec.service.member.SignupServiceImpl;
import com.javalec.service.member.UpdateNickServiceImpl;
import com.javalec.service.member.UpdatePwServiceImpl;
import com.javalec.service.member.ValidMemberServiceImpl;
import com.javalec.service.member.ValidationNicknameService;
import com.javalec.service.troller.GetTrollRankServiceImpl;
import com.javalec.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	ApplicationContext context;
	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpServletResponse response;

	MemberService service;

	MemberAjaxService ajaxService;

	@RequestMapping("/loginAccess")
	public String login() throws ServletException, IOException {
		service = (MemberService) context.getBean(LoginServiceImpl.class);
		return service.execute(request, response);
	}

	@RequestMapping(value = "/signupAccess", method = RequestMethod.POST)
	public String signMember(MemberVO member, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service = (MemberService) context.getBean(SignupServiceImpl.class);
		return service.execute(request, response);
	}

	@RequestMapping(value = "/emailValid", method = RequestMethod.POST)
	@ResponseBody
	public void validMember() throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		ajaxService = (MemberAjaxService) context.getBean(EmailValidationServiceImpl.class);
		ajaxService.send(request, response);
	}

	@RequestMapping("/searchNickname")
	public void serachNickname(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ajaxService = (MemberAjaxService) context.getBean(ValidationNicknameService.class);
		ajaxService.send(request, response);
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println("로그아웃");
		session.invalidate();
		return "redirect:main";
	}

	@RequestMapping(value = "validKey", method = RequestMethod.POST)
	public String valid() throws ServletException, IOException {
		service = (MemberService) context.getBean(ValidMemberServiceImpl.class);
		return service.execute(request, response);
	}

	@RequestMapping(value = "updatePw", method = RequestMethod.POST)
	public String updatePw(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service = (MemberService) context.getBean(UpdatePwServiceImpl.class);
		service.execute(request, response);

		return null;
	}

	@RequestMapping(value = "deleteMember", method = RequestMethod.POST)
	public String delectId(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service = (MemberService) context.getBean(DeleteMemberServiceImpl.class);
		return service.execute(request, response);
	}

	@RequestMapping(value = "updateNick", method = RequestMethod.POST)
	public String updateNick(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service = (MemberService) context.getBean(UpdateNickServiceImpl.class);
		return service.execute(request, response);
	}

	@RequestMapping(value = "renewMember", method = RequestMethod.POST)
	public String renewNick(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service = (MemberService) context.getBean(NicknameRenewServiceImpl.class);
		return service.execute(request, response);
	}
	@RequestMapping("resend")
	public String resend(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service = (MemberService) context.getBean(ResendValidationImpl.class);
		return service.execute(request, response); 
	}
	@RequestMapping("sendNewPassword")
	public void sendNewPassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service = context.getBean(SendNewPassword.class);
		service.execute(request, response);
	}
	@RequestMapping("ranking")
	public String ranking(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return context.getBean(GetTrollRankServiceImpl.class).execute(request, response);
	}

}
