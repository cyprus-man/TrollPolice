package com.javalec.vo;

import java.util.Date;

public class ServiceCenterVO {
	private int serviceId; //신고게시판 id
	private String content; //신고사유
	private String email;  //신고자 email
	private Date writeDate;  //신고일
	private String type;  //신고타입 (리플신고,게시글신고,기타사유..등등),
	private int targetId;  //신고한 게시글또는 리플의 id
	
	
	public int getServiceId() {
		return serviceId;
	}
	public void setServiceId(int serviceId) {
		this.serviceId = serviceId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getwriteDate() {
		return writeDate;
	}
	public void setwriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getTargetId() {
		return targetId;
	}
	public void setTargetId(int targetId) {
		this.targetId = targetId;
	}
	
	
	@Override
	public String toString() {
		return "ServiceCenterVO [serviceId=" + serviceId + ", content=" + content + ", email=" + email + ", writeDate="
				+ writeDate + ", type=" + type + ", targetId=" + targetId + "]";
	}
	
	
}
