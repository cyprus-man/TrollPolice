package com.javalec.vo;

import java.util.Date;

public class FreeBoardReplyVO {
	private Integer rno;
	private Integer bno;
	private String replytext;
	private String replyer;
	private String userName;
	private Date regdate;
	
	
	public Integer getRno() {
		return rno; 
	}
	public void setRno(Integer rno) { 
		this.rno = rno;
	}
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public String getReplytext() {
		return replytext;
	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "FreeBoardReplyVO [rno=" + rno + ", bno=" + bno + ", replytext=" + replytext + ", replyer=" + replyer
				+ ", userName=" + userName + ", regdate=" + regdate + "]";
	}
	
	
	
}
