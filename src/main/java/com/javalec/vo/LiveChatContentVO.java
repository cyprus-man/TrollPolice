package com.javalec.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class LiveChatContentVO {
	private int chatId;
	private String sender;
	private String content;
	private Date sendDate;
	private int mostChamp;
	private String dateFormat;
	
	
	public String getDateFormat() {
		return dateFormat;
	}
	public void setDateFormat(String dateFormat) {
		this.dateFormat = dateFormat;
	}
	public int getMostChamp() {
		return mostChamp;
	}
	public void setMostChamp(int mostChamp) {
		this.mostChamp = mostChamp;
	}
	public int getChatId() {
		return chatId;
	}
	public void setChatId(int chatId) {
		this.chatId = chatId;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getSendDate() {
		return sendDate;
	}
	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
		SimpleDateFormat sdf = (SimpleDateFormat)SimpleDateFormat.getInstance();
		this.dateFormat = sdf.format(sendDate);
	}
	@Override
	public String toString() {
		return "LiveChatContentVO [chatId=" + chatId + ", sender=" + sender + ", content=" + content + ", sendDate="
				+ sendDate + ", mostChamp=" + mostChamp + ", dateFormat=" + dateFormat + "]";
	}
	
}
