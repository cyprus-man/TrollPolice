package com.javalec.vo;

public class MatchingReplyVO {
	
	private int replyId;
	private int parentId;
	private String email;
	private String nickname;
	private String content;
	private String tier;
	private String writeDate;
	private Lane lane;
	
	public Lane getLane() {
		return lane;
	}
	public void setLane(Lane lane) {
		this.lane = lane;
	}
	public int getReplyId() {
		return replyId;
	}
	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTier() {
		return tier;
	}
	public void setTier(String tier) {
		this.tier = tier;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	@Override
	public String toString() {
		return "MatchingReplyVO [replyId=" + replyId + ", parentId=" + parentId + ", email=" + email + ", nickname="
				+ nickname + ", content=" + content + ", tier=" + tier + ", writeDate=" + writeDate + ", lane=" + lane
				+ "]";
	}
	
	
	

}
