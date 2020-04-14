package com.javalec.service.serviceCenter;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.dao.ServiceCenterDao;

@Service
public class ServiceDeleteImpl implements ServiceCenterService{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idStr = request.getParameter("serviceId");
		int serviceId = Integer.parseInt(idStr);
		ServiceCenterDao dao = sqlSession.getMapper(ServiceCenterDao.class);
		dao.deleteService(serviceId);
		return null;
	}
	
}
