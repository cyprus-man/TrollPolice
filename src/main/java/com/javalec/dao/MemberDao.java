package com.javalec.dao;


import com.javalec.vo.MemberVO;

public interface MemberDao {
	public MemberVO getMemberByEmail(String email);
	public MemberVO getMemberByEmailPw(String email,String pwd);
	public MemberVO getMemberByNickname(String nickname);
	public void deleteMember(MemberVO member);
	public void insertMember(MemberVO member);
	public void updateMember(MemberVO member);
}
