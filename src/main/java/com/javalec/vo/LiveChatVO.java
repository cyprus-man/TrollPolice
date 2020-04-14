package com.javalec.vo;

import java.util.Date;

public class LiveChatVO {
	
	private int chatId;
	private Date createDate;
	private String email1;
	private String email2;
	private String nickname;
	private Tier tier;
	private Lane lane1;
	private Lane lane2;
	private int mostChamp1;
	private int mostChamp2;
	private long chatExpired;
	private String isEnd;
	private int confirmCount;
	private LiveChatContentVO liveChatContent;	
	private int confirmExit;
	
	
	public int getConfirmExit() {
		return confirmExit;
	}
	public void setConfirmExit(int confirmExit) {
		this.confirmExit = confirmExit;
	}
	@Override
	public String toString() {
		return "LiveChatVO [chatId=" + chatId + ", createDate=" + createDate + ", email1=" + email1 + ", email2="
				+ email2 + ", nickname=" + nickname + ", tier=" + tier + ", lane1=" + lane1 + ", lane2=" + lane2
				+ ", mostChamp1=" + mostChamp1 + ", mostChamp2=" + mostChamp2 + ", chatExpired=" + chatExpired
				+ ", isEnd=" + isEnd + ", confirmCount=" + confirmCount + ", liveChatContent=" + liveChatContent + "]";
	}
	public int getConfirmCount() {
		return confirmCount;
	}
	public void setConfirmCount(int confirmCount) {
		this.confirmCount = confirmCount;
	}
	public LiveChatContentVO getLiveChatContent() {
		return liveChatContent;
	}
	public void setLiveChatContent(LiveChatContentVO liveChatContent) {
		this.liveChatContent = liveChatContent;
	}
	public int getChatId() {
		return chatId;
	}
	public void setChatId(int chatId) {
		this.chatId = chatId;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public int getMostChamp1() {
		return mostChamp1;
	}
	public void setMostChamp1(int mostChamp1) {
		this.mostChamp1 = mostChamp1;
	}
	public int getMostChamp2() {
		return mostChamp2;
	}
	public void setMostChamp2(int mostChamp2) {
		this.mostChamp2 = mostChamp2;
	}
	public long getChatExpired() {
		return chatExpired;
	}
	public void setChatExpired(long chatExpired) {
		this.chatExpired = chatExpired;
	}
	public String getIsEnd() {
		return isEnd;
	}
	public void setIsEnd(String isEnd) {
		this.isEnd = isEnd;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Tier getTier() {
		return tier;
	}
	public void setTier(Tier tier) {
		this.tier = tier;
	}
	public Lane getLane1() {
		return lane1;
	}
	public void setLane1(Lane lane1) {
		this.lane1 = lane1;
	}
	public Lane getLane2() {
		return lane2;
	}
	public void setLane2(Lane lane2) {
		this.lane2 = lane2;
	}
	
	
}
