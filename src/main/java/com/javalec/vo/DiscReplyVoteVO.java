package com.javalec.vo;

public class DiscReplyVoteVO {
	private String email;
	private int replyId;
	private int up; //0 : down 1 : up  none : delete
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getReplyId() {
		return replyId;
	}
	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}
	public int getUp() {
		return up;
	}
	public void setUp(int up) {
		this.up = up;
	}
	
	@Override
	public String toString() {
		return "DiscReplyVoteVO [email=" + email + ", replyId=" + replyId + ", up=" + up + "]";
	}
	
}
