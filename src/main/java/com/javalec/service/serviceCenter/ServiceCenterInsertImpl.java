package com.javalec.service.serviceCenter;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.dao.ServiceCenterDao;
import com.javalec.vo.MemberVO;
import com.javalec.vo.ServiceCenterVO;

@Service
public class ServiceCenterInsertImpl implements ServiceCenterService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ServiceCenterDao serviceCenterDao =sqlSession.getMapper(ServiceCenterDao.class);
		
		String type=request.getParameter("type");
		String targetId=request.getParameter("targetId");
		String email=((MemberVO) request.getSession().getAttribute("loginUser")).getEmail();
		String value=request.getParameter("value");
		String content = null;
		
		if(value.equals("0")) {
			content = "원치 않는 상업적 콘텐츠 또는 스팸";
		}else if(value.equals("1")) {
			content = "포르노 또는 음란물";
		}else if(value.equals("2")) {
			content = "아동 학대";
		}else if(value.equals("3")) {
			content = "증오심표현 또는 노골적인 폭력";
		}else if(value.equals("4")) {
			content = "희롱 또는 괴롭힘";
		}
		
		Integer serviceId = serviceCenterDao.getMaxId();
		serviceId = serviceId == null ? 1 : serviceId;
		
		ServiceCenterVO serviceCenterVO  = new ServiceCenterVO();
		serviceCenterVO.setContent(content);
		serviceCenterVO.setEmail(email);
		serviceCenterVO.setType(type);
		serviceCenterVO.setTargetId(Integer.parseInt(targetId));
		serviceCenterVO.setwriteDate(new Date());
		serviceCenterVO.setServiceId(serviceId);
		
		System.out.println(serviceCenterVO.toString());
		
		serviceCenterDao.serviceCenterInsert(serviceCenterVO);
		
		return "success";
	}

}
