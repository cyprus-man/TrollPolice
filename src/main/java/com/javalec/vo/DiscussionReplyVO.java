package com.javalec.vo;

import java.util.Date;

public class DiscussionReplyVO {
	private String email;
	private String nickname;
	private Date writeDate;
	private String content;
	private int discBoardId;
	private int parentId;
	private int replyId;
	private int childCount;
	private int up;
	private int down;
	private int isVote; //0: notVoted, 1:up, -1:down
	private Tier tier;
	
	
	public Tier getTier() {
		return tier;
	}
	public void setTier(Tier tier) {
		this.tier = tier;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	public int getReplyId() {
		return replyId;
	}
	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getDiscBoardId() {
		return discBoardId;
	}
	public void setDiscBoardId(int discBoardId) {
		this.discBoardId = discBoardId;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getChildCount() {
		return childCount;
	}
	public void setChildCount(int childCount) {
		this.childCount = childCount;
	}
	public int getUp() {
		return up;
	}
	public void setUp(int up) {
		this.up = up;
	}
	public int getDown() {
		return down;
	}
	public void setDown(int down) {
		this.down = down;
	}
	public int getIsVote() {
		return isVote;
	}
	public void setIsVote(int isVote) {
		this.isVote = isVote;
	}
	@Override
	public String toString() {
		return "DiscussionReplyVO [email=" + email + ", nickname=" + nickname + ", writeDate=" + writeDate
				+ ", content=" + content + ", discBoardId=" + discBoardId + ", parentId=" + parentId + ", replyId="
				+ replyId + ", childCount=" + childCount + ", up=" + up + ", down=" + down + ", isVote=" + isVote
				+ ", tier=" + tier + "]";
	}
	

	
}
