package com.javalec.dao;


import java.util.ArrayList;

import com.javalec.vo.ServiceCenterVO;


public interface ServiceCenterDao {
   public void serviceCenterInsert(ServiceCenterVO serviceCenterVO);
   public void deleteService(int serviceId);
   public Integer getMaxId();
   public ArrayList<ServiceCenterVO> serviceCenterBoard();
}