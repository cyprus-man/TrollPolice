package com.javalec.service.serviceCenter;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.dao.ServiceCenterDao;
import com.javalec.vo.ServiceCenterVO;

@Service
public class ServiceCenterBoardImpl implements ServiceCenterService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ServiceCenterDao servicecenterdao = sqlSession.getMapper(ServiceCenterDao.class);
		List<ServiceCenterVO> serviceBoardList = servicecenterdao.serviceCenterBoard();
		System.out.println(serviceBoardList.toString());
		request.setAttribute("serviceBoardList", serviceBoardList);
		
		
		return "serviceCenter";
	}

}
