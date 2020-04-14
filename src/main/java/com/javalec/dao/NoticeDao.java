package com.javalec.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.javalec.vo.NoticeVO;

public interface NoticeDao {
	public void insertNotice(Map<String, Object> param);
	public ArrayList<NoticeVO> selectNotice(String nickname);
	public void confirmNotice(Map<String, Object> param);
	public void confirmNoticeForReply(int id);
	public void confirmNoticeForMatching(String partner);
	public List<NoticeVO> selectNoticeForDisc(String nickname);
	public List<NoticeVO> selectNoticeForMatching(String nickname);
	public List<NoticeVO> selectNoticeForReply(String nickname);
}
