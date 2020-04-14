package com.javalec.vo;

public class NoticeVO {
	
	
	private int targetId;
	private String sender;
	private String receiver;
	private String type;
	
	public int getTargetId() {
		return targetId;
	}
	public void setTargetId(int targetId) {
		this.targetId = targetId;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	@Override
	public String toString() {
		return "NoticeVO [targetId=" + targetId + ", sender=" + sender + ", receiver=" + receiver + ", type=" + type
				+ "]";
	}
	
	
	
	
}
